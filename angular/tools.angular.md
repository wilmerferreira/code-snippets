# Angular: Tools

## Angular CLI

- `ng`
  - `ng --help`
  - `ng --version`
- `ng add`: allows to add angular packages (e.g. `@angular/material`)
- `ng build`: will process the files and prepare them for production
- `ng doc`
- `ng e2e`
- `ng eject`
- `ng generate`: Creates a new angular item, this generates all the assets required for that component
  - `ng generate component`
  - `ng generate pipe`
- `ng get`
- `ng lint`
- `ng new`: allows to create/scaffold a new application
  - `ng new sampleapp --dry-run`
- `ng serve`: runs the application in the development mode
  - `ng serve --port 8000 --open`
  - `ng serve --host dev.fakedomain.com --open`
    > This needs to add the domain to your host file `C:\Windows\System32\drivers\etc`
- `ng set`
- `ng test`
  - `ng test --no-watch --code-coverage`
- `ng xil8n`

### Configuration

1. Install the Angular CLI in your local machine

   ```sh
   npm install -g @angular/cli
   ```

2. Create your application

   > This will create an angular app in the path you're in

   ```sh
   ng new learn-angular-12
   ```

   This will create a bunch of files and folders for your angular application, the most important ones are:

   - `dist/`
   - `e2e/`
   - `src/`
     - `app/`
     - `assets/`
     - `environments/`
       - `environment.prod.ts`: used by the Angular CLI on `ng build`
       - `environment.ts`: used by the Angular CLI on `ng serve`
     - `index.html`
     - `polyfills.ts`
     - `styles.css`
     - `test.ts`
     - `tsconfig.app.json`
     - `tsconfig.spec.json`
     - `typings.d.ts`
   - `.angular-cli.json`
   - `.editorconfig`
   - `.gitignore`
   - `karma.conf.js`
   - `package.json`
   - `protractor.conf`
   - `README.md`
   - `tsconfig.json`
   - `tslint.json`

3. Run the application

   ```sh
   # This will create and keep an development server instance while the browser is open
   ng serve -o
   ```

### Alternatives

- Gulp
- Grunt
- Yarn
- Webpack
