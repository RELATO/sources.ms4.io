# FeathersJS

https://feathersjs.com/

## Install cli
```
npm install -g @feathersjs/cli
```
> You should see this kind of output
```
npm WARN deprecated babel-preset-es2015@6.24.1: 🙌  Thanks for using Babel: we recommend using babel-preset-env now: please read babeljs.io/env to update!
npm WARN deprecated nomnom@1.8.1: Package no longer supported. Contact support@npmjs.com for more info.
/root/.nvm/versions/node/v11.14.0/bin/feathers -> /root/.nvm/versions/node/v11.14.0/lib/node_modules/@feathersjs/cli/bin/feathers.js
+ @feathersjs/cli@3.9.0
added 566 packages from 274 contributors in 59.454s
```

## Create an app
Issue the following commands:
```
 mkdir my-app
 cd my-app
 feathers generate app
 ```
 > Answer all the questions with default values (accept the suggestions)
 You should see something like this
 ```
 ? Project name my-app
? Description
? What folder should the source files live in? src
? Which package manager are you using (has to be installed globally)? npm
? What type of API are you making? (Press <space> to select, <a> to toggle all, <i> to invert selection)REST, Real
time via Socket.io
? Which testing framework do you prefer? Mocha + assert
   create package.json
   create config/default.json
   create LICENSE
   create public/favicon.ico
   create public/index.html
   create .editorconfig
   create src/app.hooks.js
   create src/channels.js
   create src/index.js
   create src/logger.js
   create src/hooks/log.js
   create src/middleware/index.js
   create src/services/index.js
   create .gitignore
   create README.md
   create src/app.js
   create test/app.test.js
   create .eslintrc.json
   create config/production.json
No locked version found for winston@^3.0.0, installing latest.
No locked version found for nodemon@^1.18.7, installing latest.
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN my-app@0.0.0 No repository field.
npm WARN my-app@0.0.0 No license field.

+ serve-favicon@2.5.0
+ helmet@3.16.0
+ cors@2.8.5
+ winston@3.2.1
+ compression@1.7.4
+ @feathersjs/express@1.3.1
+ @feathersjs/express@1.3.1
+ @feathersjs/configuration@2.0.6
+ @feathersjs/feathers@3.3.1
+ @feathersjs/errors@3.3.6
+ @feathersjs/socketio@3.2.9
added 170 packages from 103 contributors and audited 320 packages in 18.703s
found 0 vulnerabilities


> nodemon@1.18.11 postinstall /root/my-app/node_modules/nodemon
> node bin/postinstall || exit 0

Love nodemon? You can now support the project via the open collective:
 > https://opencollective.com/nodemon/donate

npm WARN my-app@0.0.0 No repository field.
npm WARN my-app@0.0.0 No license field.
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.8 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.8: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

+ eslint@5.16.0
+ request-promise@4.2.4
+ nodemon@1.18.11
+ mocha@5.2.0
+ request@2.88.0
added 351 packages from 650 contributors and audited 2842 packages in 38.369s
found 0 vulnerabilities
```
## Running your brand new app
```
npm start

> my-app@0.0.0 start /root/my-app
> node src/

info: Feathers application started on http://localhost:3030

```
> Now test your app opening the browser at http://localhost:3030
