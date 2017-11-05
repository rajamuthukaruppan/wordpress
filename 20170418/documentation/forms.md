## Template based forms

### Forms in app.module.ts

Add the below 2 lines.
```typescript
import { FormsModule } from "@angular/forms";
...
imports : [FormsModule]
```

### Form settings
* Turn off browser validation by putting novalidate on the form.
* Make sure each field has a name.
* Place ngModel attribute to each input element
```html
<form class="ui form" #form="ngForm" novalidate>
<input type="text" placeholder="Invoice Id" name="id" ngModel>
```

### Data Bindings to component attributes
```html
<!--no binding-->
<input name="firstname" ngModel> <!--will maintain info in its generated form object-->
<!--one way binding-->
<input name="firstname" [ngModel]="firstname" <!--will read from your bean into the element-->
<!--two way binding-->
<input name="firstname" [(ngModel)]="firstname"> <!--will read/write to and from the element-->
```

### Calling a function on change
```html
(ngModelChange)="firstNameToUpperCase($event)"
```

Create the function on the component
```typescript
firstNameToUpperCase(value: string) {
if(value.length>0) {
  this.model.firstName = value.charAt(0).toUpperCase() + value.slice(1);
  else
  this.model.firstName = value;
}  
```

### Validation

### CSS Classes for validation
The classes are saved in xxx.className
* ng-untouched - initial state
* ng-touched - when user tabs thru regardless if the user changed anything or not
* ng-pristine - left in initial state
* ng-dirty - changed
* ng-valid
* ng-invalid



* ngModel properties for validation
* Error messages and styling
* HTML 5 validation attributes
* Styling a select control
* ngForm properties for validation






