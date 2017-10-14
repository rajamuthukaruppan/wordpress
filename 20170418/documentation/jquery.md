## JQuery setup within an Angular project

Install jQuery using NPM
```shell
npm install --save jquery
```

Import jQuery
```typescript
import * as $ from 'jquery';
```
Within your HTML
```html
<div id="msgid"></div>
```
Within your component
```typescript
  public ngAfterViewChecked() {
    $("#msgid").html("This is Hello World by JQuery");
  }
```

## Reference
<a href="https://angular.io/guide/lifecycle-hooks">https://angular.io/guide/lifecycle-hooks</a>
