Minimal project to display hello world on webpage in typescript.

```
npm install concurrently -save-dev
npm install lite-server -save-dev
npm install typescript -save-dev
```

Add the following into the script section:
```
    "build": "tsc -p src/",
    "build:watch": "tsc -p src/ -w",
    "serve": "lite-server -c=bs-config.json",
    "start": "concurrently \"npm run build:watch\" \"npm run serve\""

```

Create helloWorld.ts as seen in src/helloWorld.ts
Create src/index.html
Create src/tsconfig.json
create bs-config.json

start the server:

npm start

