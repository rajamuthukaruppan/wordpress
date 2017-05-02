# Error Handling

* No Data
* Pending
* Errors

```typescript
  loaded = false;
  errorText = '';
```

```html
<div *ngIf="errorText" class="ui negative message">
  <i class="close icon"></i>
  <div class="header">
    {{ errorText }}
  </div>
</div>
<div *ngIf="loaded">
  <!--table content goes here -->
  <div *ngIf='!customers.length'>
    <h2>There are not any customers here</h2>
  </div>
</div>
<div *ngIf='!loaded'>
  <h2>Loading...</h2>
</div>
```
Here is the template code to getch data from the observable.
```typescript
    this.customerService.getCustomers().subscribe((customers) => {
      this.customers = customers;
    }, (error) => {
      this.errorText = error;
    }, () => {
      this.loaded = true;
    });
```