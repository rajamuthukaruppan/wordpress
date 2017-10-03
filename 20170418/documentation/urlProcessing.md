

## Example of reading a value from the path.
```
import { ActivatedRoute } from '@angular/router';

constructor (provate route : ActivatedRoute) {}


this.route && this.route.url["value"][1])
  this.x = this.route.url["value"][1].path;
```

## Reading values from query string

```
import {Router, ActivatedRoute, Params} from '@angular/router';
import {OnInit, Component} from '@angular/core';

@Component({...})
export class MyComponent implements OnInit {

  constructor(private activatedRoute: ActivatedRoute) {}

  ngOnInit() {
    // subscribe to router event
    this.activatedRoute.params.subscribe((params: Params) => {
        let userId = params['userId'];
        console.log(userId);
      });
  }

}
```
