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

One way data binding is the one to use to get your form initially populated from the database but still use the angular created form to pass data back to the server. This way you will be able to reuse your java entities and will not need to create any entity classes in typescript.

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

### Form Validation

The classes are saved in f.className when you put the #f in the input field.
* ng-untouched - initial state
* ng-touched - when user tabs thru regardless if the user changed anything or not
  * ng-pristine - left in initial state
  * ng-dirty - changed
  * ng-valid
  * ng-invalid
* ngModel properties for validation
  * If you want to read the attribute then you put #f="ngModel" and read from {{f.invalid}}
  * Its easier to do it this way since you dont need to pull classes from the components and see which one exists.
* Error messages and styling
  * Error classes can be enabled on component for example by "[class.error]="f.invalid && idd.touched" or idd.dirty 
* HTML 5 validation attributes
  * use regular expressions for field validation using "pattern" example pattern="...+" min three chars up to 4 character.
* Styling a select control
  * default attribute indicates which option is default.
  * Use (blur) event to bind to a validate function. Example: (blur)="validate...($event)"
  * Select elements are a bit more complex. You can add an component boolean flag to indicate selectElementValidationFailed and specify a css class change based on the value.
```html
<div [class.error]="selectElementValidationFailed">
```
  * however the above may not get updates right after user selected the new value. In order for this to work you need to use a template reference variable (#xxx) and add a (change) event and pass in the TRV as a parameter ex: (change)="validate(xxx.value)". We could have used the event to search for the new value but TRV is easier as we dont need to query the DOM.
```html
< #xxx name="selectElement" (blur)="validateSelect(xxx)" (change)="validateSelect(xxx)" [ngModel]="objectFromDB"
```
* ngForm properties for validation ( this is to control the overall form )
  * prestine, valid, must have "required" for valid to work when using pattern.
  * [disabled]="form.invalid"

### Types of validation
* based on min or max length
* non numeric or numeric fields
* min or max values or range of values or only specific values
* required based on value of another field
* date or min or max date or within range of dates
* email, url or regular expression mask

### Form Posting and Data Access

* Create a test server
* Angular 2 service
* Form Submit Event and validation
* Posting with an observable
* Handling errors
* Retrieving a server generated id
* Load form data dynamically







