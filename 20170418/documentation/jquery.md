## JQuery setup within an Angular project

Install jQuery using NPM if not done already
```shell
npm install --save jquery
npm install --save jquery-ui-dist
```

Include the jquery css and scripts in index.html
```html
  <link rel="stylesheet" href="../node_modules/jquery-ui-dist/jquery-ui.min.css">  
  <script src="../node_modules/jquery/dist/jquery.js"></script>
  <script src="../node_modules/jquery-ui-dist/jquery-ui.min.js"></script>  
```

Import jQuery
```typescript
declare var $:any;
```
Within your HTML
```html
<div title="This is a tooltip." id="msgid"></div>
```
Within your component
```typescript
  public ngAfterViewChecked() {
    $("#msgid").html("This is Hello World by JQuery");
    if(typeof $(document).tooltip === "function") $(document).tooltip();    
  }
```

## Reference
<a href="https://angular.io/guide/lifecycle-hooks">https://angular.io/guide/lifecycle-hooks</a>
