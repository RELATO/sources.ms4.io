# Java

## sdkman installation
You should use this manager at all
```
curl -s "https://get.sdkman.io" | bash
```
You should see this output
```

                                -+syyyyyyys:
                            `/yho:`       -yd.
                         `/yh/`             +m.
                       .oho.                 hy                          .`
                     .sh/`                   :N`                `-/o`  `+dyyo:.
                   .yh:`                     `M-          `-/osysoym  :hs` `-+sys:      hhyssssssssy+
                 .sh:`                       `N:          ms/-``  yy.yh-      -hy.    `.N-````````+N.
               `od/`                         `N-       -/oM-      ddd+`     `sd:     hNNm        -N:
              :do`                           .M.       dMMM-     `ms.      /d+`     `NMMs       `do
            .yy-                             :N`    ```mMMM.      -      -hy.       /MMM:       yh
          `+d+`           `:/oo/`       `-/osyh/ossssssdNMM`           .sh:         yMMN`      /m.
         -dh-           :ymNMMMMy  `-/shmNm-`:N/-.``   `.sN            /N-         `NMMy      .m/
       `oNs`          -hysosmMMMMydmNmds+-.:ohm           :             sd`        :MMM/      yy
      .hN+           /d:    -MMMmhs/-.`   .MMMh   .ss+-                 `yy`       sMMN`     :N.
     :mN/           `N/     `o/-`         :MMMo   +MMMN-         .`      `ds       mMMh      do
    /NN/            `N+....--:/+oooosooo+:sMMM:   hMMMM:        `my       .m+     -MMM+     :N.
   /NMo              -+ooooo+/:-....`...:+hNMN.  `NMMMd`        .MM/       -m:    oMMN.     hs
  -NMd`                                    :mm   -MMMm- .s/     -MMm.       /m-   mMMd     -N.
 `mMM/                                      .-   /MMh. -dMo     -MMMy        od. .MMMs..---yh
 +MMM.                                           sNo`.sNMM+     :MMMM/        sh`+MMMNmNm+++-
 mMMM-                                           /--ohmMMM+     :MMMMm.       `hyymmmdddo
 MMMMh.                  ````                  `-+yy/`yMMM/     :MMMMMy       -sm:.``..-:-.`
 dMMMMmo-.``````..-:/osyhddddho.           `+shdh+.   hMMM:     :MmMMMM/   ./yy/` `:sys+/+sh/
 .dMMMMMMmdddddmmNMMMNNNNNMMMMMs           sNdo-      dMMM-  `-/yd/MMMMm-:sy+.   :hs-      /N`
  `/ymNNNNNNNmmdys+/::----/dMMm:          +m-         mMMM+ohmo/.` sMMMMdo-    .om:       `sh
     `.-----+/.`       `.-+hh/`         `od.          NMMNmds/     `mmy:`     +mMy      `:yy.
           /moyso+//+ossso:.           .yy`          `dy+:`         ..       :MMMN+---/oys:
         /+m:  `.-:::-`               /d+                                    +MMMMMMMNh:`
        +MN/                        -yh.                                     `+hddhy+.
       /MM+                       .sh:
      :NMo                      -sh/
     -NMs                    `/yy:
    .NMy                  `:sh+.
   `mMm`               ./yds-
  `dMMMmyo:-.````.-:oymNy:`
  +NMMMMMMMMMMMMMMMMms:`
    -+shmNMMMNmdy+:`


                                                                 Now attempting installation...


Looking for a previous installation of SDKMAN...
Looking for unzip...
Looking for zip...
Looking for curl...
Looking for sed...
Installing SDKMAN scripts...
Create distribution directories...
Getting available candidates...
Prime the config file...
Download script archive...
######################################################################## 100.0%
Extract script archive...
Install scripts...
Set version to 5.7.3+337 ...
Attempt update of interactive bash profile on regular UNIX...
Added sdkman init snippet to /root/.bashrc
Attempt update of zsh profile...
Updated existing /root/.zshrc



All done!


Please open a new terminal, or run the following in the existing one:

    source "/root/.sdkman/bin/sdkman-init.sh"

Then issue the following command:

    sdk help

Enjoy!!!
```
## Now you can install default Java and friends using sdk manager
```
sdk install java
```
> You should see something like this
```

Downloading: java 11.0.3-open

In progress...

########################################################################################################### 100.0%

Repackaging Java 11.0.3-open...

Done repackaging...

Installing: java 11.0.3-open
Done installing!


Setting java 11.0.3-open as default.
```

## Install a specific version of Java
> See available versions of Java
````
sdk list java
================================================================================
Available Java Versions
================================================================================
     13.ea.17-open       9.0.7-zulu          1.0.0-rc-10-grl
     12.0.1-sapmchn      9.0.4-open          1.0.0-rc-9-grl
     12.0.1-zulu         8.0.212-zulu        1.0.0-rc-8-grl
     12.0.1-open         8.0.212-amzn
     12.0.0-librca       8.0.202.j9-adpt
     11.0.3-sapmchn      8.0.202.hs-adpt
     11.0.3-zulu         8.0.202-zulufx
 > * 11.0.3-open         8.0.202-librca
     11.0.3-amzn         7.0.222-zulu
     11.0.2.j9-adpt      6.0.119-zulu
     11.0.2.hs-adpt      1.0.0-rc-15-grl
     11.0.2-zulufx       1.0.0-rc-14-grl
     11.0.2-librca       1.0.0-rc-13-grl
     10.0.2-zulu         1.0.0-rc-12-grl
     10.0.2-open         1.0.0-rc-11-grl

================================================================================
+ - local version
* - installed
> - currently in use
================================================================================
```
> Install one of the above list
```
sdk install java 8.0.212-amzn
```
> You should see
```

Downloading: java 8.0.212-amzn

In progress...

########################################################################################################### 100.0%

Repackaging Java 8.0.212-amzn...

Done repackaging...

Installing: java 8.0.212-amzn
Done installing!

Do you want java 8.0.212-amzn to be set as default? (Y/n): Y

Setting java 8.0.212-amzn as default.
```
> As you see above I chose Y to set this version as default

## Test your java installation
Issue the command
```
java -version
openjdk version "1.8.0_212"
OpenJDK Runtime Environment Corretto-8.212.04.1 (build 1.8.0_212-b04)
OpenJDK 64-Bit Server VM Corretto-8.212.04.1 (build 25.212-b04, mixed mode)
```
## Install Maven (optional)
> Issue the following command if you want to have maven support 
```
root@development:~# sdk install maven

Downloading: maven 3.6.1

In progress...

########################################################################################################### 100.0%

Installing: maven 3.6.1
Done installing!


Setting maven 3.6.1 as default.
```
> Test your maven installation
```
root@development:~# mvn -version
Apache Maven 3.6.1 (d66c9c0b3152b2e69ee9bac180bb8fcc8e6af555; 2019-04-04T19:00:29Z)
Maven home: /root/.sdkman/candidates/maven/current
Java version: 1.8.0_212, vendor: Amazon.com Inc., runtime: /root/.sdkman/candidates/java/8.0.212-amzn/jre
Default locale: en, platform encoding: UTF-8
OS name: "linux", version: "4.15.0-47-generic", arch: "amd64", family: "unix"
```


Enjoy
