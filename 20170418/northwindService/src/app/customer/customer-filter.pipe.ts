import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
    name: 'customerFilter',
    pure: false
})
export class CustomerFilterPipe implements PipeTransform {
  transform(items, filter) {
    if (!items || !filter) {
      return items;
    }
    // filter items array, items which match and return true will be kept, false will be filtered out
    return items.filter((item) => this.applyFilter(item, filter));
  }

  /**
   * Perform the filtering.
   * 
   * @param {Customer} customer The customer to compare to the filter.
   * @param {Customer} filter The filter to apply.
   * @return {boolean} True if customer satisfies filters, false if not.
   */
  applyFilter(customer, filter): boolean {
    for (let field in filter) {
      if (filter[field]) {
        if (typeof filter[field] === 'string' && typeof customer[field] === 'string') {
          if (customer[field].toLowerCase().indexOf(filter[field].toLowerCase()) === -1) {
            return false;
          }
        } else if (typeof filter[field] === 'number' || typeof customer[field] === 'number') {
          if (String(customer[field]).indexOf(String(filter[field])) === -1) {
            return false;
          }
        }
      }
    }
    return true;
  }
}