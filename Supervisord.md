# Supervisord

http://supervisord.org/

## Supervisor and Docker

Docker is a great way to componentize an app along different aspects. But I found that when I still need to start multiple programs in a single container, it is better to use supervisor instead of cron scripts.

Use supervisor if:

> You have multiple processes
> And need coordination between them

If you have a single process, use Docker to start it. If you don’t need coordination, then separate them to different containers. Also, if you only need coordination as a fixed startup order, Docker already provides that. For a database and an app, they can live inside different containers without problems. Or a monitoring script that runs independently. In those cases, don’t look at supervisor.

But if, for example, you use Apache with Let’s Encrypt, you need the webserver, the certificate issuance script, and the renewal script. And they require coordination, as they dynamically depend on each other. In this case, supervisor comes handy, and knowing how to configure it will be beneficial.
Usage

First, install it inside a Docker container:

```
RUN apt-get install -y supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
```

Then provide a configuration file, like this basic one:

```
[supervisord]
nodaemon=true

[program:app]
directory=/app
command=...start
``` 

The important part here is the nodaemon=true, which instructs supervisor to start in the foreground instead of as a service. This lets Docker to manage its lifecycle.
Logging

By default, supervisor logs into files, but that does not play well with Docker. It is better to use the standard output streams.
Scenario #1: Log to console, redirect stderr to stdout

If you just want to see all log messages, redirect stderr to stdout, and print that:
``` 
[program:app]
...
stdout_logfile=/dev/fd/1
stdout_logfile_maxbytes=0
redirect_stderr=true
```
Use this if you don’t need any special handling for the error messages.
Scenario #2: Log stdout and stderr separately

In this case, any logs, be it stdout or stderr, will be logged as-is.
```
[program:app]
...
stdout_logfile=/dev/fd/1
stdout_logfile_maxbytes=0
stderr_logfile=/dev/fd/2
stderr_logfile_maxbytes=0
``` 
Use supervisor with Apache

If you use Apache, you’ll soon find out that shutting it down with supervisor seems to have no effect. This is because in order to avoid using root for serving the content, Apache spawns child processes that supervisor has no knowledge about.

In effect, supervisor can start Apache, but can’t shut it down properly.

To make supervisor to kill the child processes too, use killasgroup and stopasgroup:
```
[program:apache]
command=apache2ctl -DFOREGROUND
...
killasgroup=true
stopasgroup=true
``` 
Also make sure you run Apache in the foreground with -DFOREGROUND
Autostart

The default behavior is that supervisor starts all programs during startup. To prevent this, use autostart=false:
```
[program:...]
...
autostart=false
```
Autorestart

Similarly, it tries to restart programs only if they exit with an error. You might want to change it to restart every time, and you can do that with autorestart=true:
``` 
[program:...]
...
autorestart=true
```

You can also combine the above two:
```
[program:...]
...
autostart=false
autorestart=true
```
It will not start the program, but will keep it running.
Start/stop/restart programs

To control the state of programs, use supervisorctl:
```
supervisorctl start <program>
supervisorctl stop <program>
supervisorctl restart <program>
```
Simple scheduling

If you need an easy scheduling without any hard guarantees, you can combine autorestart and sleep:
```
[program:...]
...
command=/bin/bash -c "sleep 1d && /program.sh"
autorestart=true
```
This will run the script roughly every day, but drifts slowly. If you need something more exact, use cron.
Orchestrate complex workflows

With these simple tools, you can define more complex flows.
Example #1: Init before startup

To start a program first and run another one after that, you can combine autostart with the && ... construct:
```
[program:init]
command=/bin/bash -c "/init.sh && supervisorctl start app"
autorestart=false

[program:app]
command=...
autostart=false
```
Example #2: Stop an app while another one is running

To stop an app during the time another one is running, use stop and start:
```
[program:app1]
command=/bin/bash -c "supervisorctl stop app2 && /app1.sh && supervisorctl start app2"

[program:app2]
command=...
``` 
This way, when app1 is running, app2 is shut down.
