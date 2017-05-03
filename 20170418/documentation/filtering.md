# Instructions on Filtering

1. Insert a filter attribute in the component.ts
```typescript
  filter: Customer = new Customer();  
```
2. Insert text input boxes in column header. One for each field you want to filter by. You may put icons to turn on and off search by putting an *ngIf driven off of a flag in the component.ts
```html
<input *ngIf="searchCompanyStatus" type="text" [(ngModel)]="filter.company" name="company" placeholder="Company">
```

```html
<i (click)="searchEnable('searchCompanyStatus')" class="icon search"></i>          
```

Add attribute within the component
```typescript
  searchStatus = {
    searchCompanyStatus : false, 
    searchFirstNameStatus : false, 
    searchLastNameStatus : false
  }
```

3. Add method
```typescript
  searchEnable(searchStatusName) {
    this.searchStatus[searchStatusName] = !this.searchStatus[searchStatusName]
  }
```


4. Create the customer-filter.pipe.ts see file in this project for an example.


5. Modify the app.module.ts and insert filter in the Imports and declarations.

app.module.ts
```typescript
import { CustomerFilterPipe } from './shared/customer-filter.pipe';
...
declarations: [
    ...
    CustomerFilterPipe,
    ...
]
```

6. Finally insert the pipe into the ngFor

```html
      <tr *ngFor='let customer of customers | customerFilter:filter'>
```

7. For Each additional field just perform the actions in Step 2