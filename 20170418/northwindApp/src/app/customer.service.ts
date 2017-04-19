import { Injectable } from '@angular/core';
import { Customer } from './customer';

@Injectable()
export class CustomerService {

  constructor() { }

  getCustomers() : Array<Customer> {
    return [
      new Customer(1, "smith", "john", "IBM"), 
      new Customer(2, "Still", "Ben", "AAA"), 
      new Customer(3, "Roland", "Doug", "888"), 
      new Customer(4, "doe", "john", "TXN")
    ];
  }

  getCustomerById(id : number) : Customer {
    return new Customer(id, "Fetched Customer", "Fetched Customer Last Name", null);
  }
}
