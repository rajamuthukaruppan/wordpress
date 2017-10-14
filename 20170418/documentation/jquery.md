## JQuery setup within an Angular project

Install jQuery using NPM
```
npm install --save jquery
```

Install the jQuery declaration file
```
npm install -D @types/jquery
```

Import jQuery
```
import * as $ from 'jquery';
```

Within your component
```
  public ngAfterViewChecked() {
    $("#msgid").html("This is Hello World by JQuery");
  }
```

## Reference
<a href="https://angular.io/guide/lifecycle-hooks">https://angular.io/guide/lifecycle-hooks</a>
