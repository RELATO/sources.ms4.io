# Angular
https://angular.io

## Install angular cli

You need to have nodejs installed before proceed. See [NodeJS](https://github.com/RELATO/sources.ms4.io/blob/master/NodeJS.md) if you want to have NodeJS installation instructions.

https://cli.angular.io/

Issue the command in your terminal
```
npm install -g @angular/cli
```
> You should see something like this
``` 
/root/.nvm/versions/node/v11.14.0/bin/ng -> /root/.nvm/versions/node/v11.14.0/lib/node_modules/@angular/cli/bin/ng
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.8 (node_modules/@angular/cli/node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.8: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

+ @angular/cli@7.3.8
added 295 packages from 180 contributors in 38.72s
```
> Now you can create a new project like this
```
ng new my-dream-app
cd my-dream-app
ng serve
```
> You should see something like this output
```
? Would you like to add Angular routing? No
? Which stylesheet format would you like to use? CSS
CREATE my-dream-app/README.md (1027 bytes)
CREATE my-dream-app/.editorconfig (246 bytes)
CREATE my-dream-app/.gitignore (629 bytes)
CREATE my-dream-app/angular.json (3861 bytes)
CREATE my-dream-app/package.json (1311 bytes)
CREATE my-dream-app/tsconfig.json (435 bytes)
CREATE my-dream-app/tslint.json (1621 bytes)
CREATE my-dream-app/src/favicon.ico (5430 bytes)
CREATE my-dream-app/src/index.html (297 bytes)
CREATE my-dream-app/src/main.ts (372 bytes)
CREATE my-dream-app/src/polyfills.ts (2841 bytes)
CREATE my-dream-app/src/styles.css (80 bytes)
CREATE my-dream-app/src/test.ts (642 bytes)
CREATE my-dream-app/src/browserslist (388 bytes)
CREATE my-dream-app/src/karma.conf.js (1025 bytes)
CREATE my-dream-app/src/tsconfig.app.json (166 bytes)
CREATE my-dream-app/src/tsconfig.spec.json (256 bytes)
CREATE my-dream-app/src/tslint.json (244 bytes)
CREATE my-dream-app/src/assets/.gitkeep (0 bytes)
CREATE my-dream-app/src/environments/environment.prod.ts (51 bytes)
CREATE my-dream-app/src/environments/environment.ts (662 bytes)
CREATE my-dream-app/src/app/app.module.ts (314 bytes)
CREATE my-dream-app/src/app/app.component.css (0 bytes)
CREATE my-dream-app/src/app/app.component.html (1120 bytes)
CREATE my-dream-app/src/app/app.component.spec.ts (996 bytes)
CREATE my-dream-app/src/app/app.component.ts (216 bytes)
CREATE my-dream-app/e2e/protractor.conf.js (752 bytes)
CREATE my-dream-app/e2e/tsconfig.e2e.json (213 bytes)
CREATE my-dream-app/e2e/src/app.e2e-spec.ts (641 bytes)
CREATE my-dream-app/e2e/src/app.po.ts (251 bytes)

> node-sass@4.11.0 install /root/my-dream-app/node_modules/node-sass
> node scripts/install.js

Downloading binary from https://github.com/sass/node-sass/releases/download/v4.11.0/linux-x64-67_binding.node
Download complete..] - :
Binary saved to /root/my-dream-app/node_modules/node-sass/vendor/linux-x64-67/binding.node
Caching binary to /root/.npm/node-sass/4.11.0/linux-x64-67_binding.node

> node-sass@4.11.0 postinstall /root/my-dream-app/node_modules/node-sass
> node scripts/build.js

Binary found at /root/my-dream-app/node_modules/node-sass/vendor/linux-x64-67/binding.node
Testing binary
Binary is fine
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.8 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.8: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

added 1086 packages from 1026 contributors and audited 42611 packages in 123.434s
found 1 high severity vulnerability
  run `npm audit fix` to fix them, or `npm audit` for details

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.
```
