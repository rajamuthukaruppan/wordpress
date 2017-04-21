import { Injectable } from '@angular/core';
import { Customer } from './customer';
import { Observable } from 'rxjs/Rx';
import { Http, Response } from '@angular/http';
import { Headers, RequestOptions } from '@angular/http';


@Injectable()
export class CustomerService {

  constructor(private http: Http) { }

  getCustomers() : Observable<Array<Customer>> {
    return this.http.get('http://localhost:8080/northwindService/northwind/customers').map((resp: Response) => {
      let fetchedCustomer : Array<Customer> = [];
      for (let json of resp.json()) {        
        fetchedCustomer.push(this.getCustomerFromJson(json));
      }
      return fetchedCustomer;
    });
  }

  getCustomerById(id : number) : Customer {
    return new Customer(id, "Fetched Customer", "Fetched Customer Last Name", null);
  }
  private getCustomerFromJson(json: Customer): Customer {
    return new Customer(json.id, json.lastName,json.firstName,json.company);
  }
}
