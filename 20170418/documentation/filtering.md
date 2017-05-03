# Instructions on Filtering

1. Insert a filter attribute in the component.ts
```typescript
  filter: Customer = new Customer();  
```
2. Insert text input boxes in column header. One for each field you want to filter by. You may put icons to turn on and off search by putting an *ngIf driven off of a flag in the component.ts
```html
<input *ngIf="searchCompanyStatus" type="text" [(ngModel)]="filter.company" name="company" placeholder="Company">
```
3. Create the customer-filter.pipe.ts see file in this project.

```typescript
import { Pipe, PipeTransform } from '@angular/core';

import { Customer } from './customer';

@Pipe({
    name: 'customerFilter',
    pure: false
})
export class CustomerFilterPipe implements PipeTransform {
  transform(items: Customer[], filter: Customer): Customer[] {
    if (!items || !filter) {
      return items;
    }
    // filter items array, items which match and return true will be kept, false will be filtered out
    return items.filter((item: Customer) => this.applyFilter(item, filter));
  }
  
  /**
   * Perform the filtering.
   * 
   * @param {Customer} customer The customer to compare to the filter.
   * @param {Customer} filter The filter to apply.
   * @return {boolean} True if customer satisfies filters, false if not.
   */
  applyFilter(customer: Customer, filter: Customer): boolean {
    for (let field in filter) {
      if (filter[field]) {
        if (typeof filter[field] === 'string') {
          if (customer[field].toLowerCase().indexOf(filter[field].toLowerCase()) === -1) {
            return false;
          }
        } else if (typeof filter[field] === 'number') {
          if (customer[field] !== filter[field]) {
            return false;
          }
        }
      }
    }
    return true;
  }
}
```
4. Modify the app.module.ts and insert filter in the Imports and declarations.