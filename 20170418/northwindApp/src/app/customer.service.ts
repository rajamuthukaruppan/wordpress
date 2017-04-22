import { Injectable } from '@angular/core';
import { Customer } from './customer';
import { Observable } from 'rxjs/Rx';
import { Http, Response } from '@angular/http';
import { Headers, RequestOptions } from '@angular/http';


@Injectable()
export class CustomerService {

  constructor(private http: Http) { }

  getCustomers(): Observable<Array<Customer>> {
    return this.http.get('northwind/customers').map((resp: Response) => {
      let fetchedCustomer: Array<Customer> = [];
      for (let json of resp.json()) {
        fetchedCustomer.push(this.getCustomerFromJson(json));
      }
      return fetchedCustomer;
    });
  }
  getCustomerById(id: number): Observable<Customer> {
    return this.http.get(`northwind/customers/${id}`).map((resp: Response) => {
      return this.getCustomerFromJson(resp.json());
    });
  }
  saveCustomer(formValue): Observable<Customer> {
    let c: Customer = this.getCustomerFromJson(formValue);
    console.log(c);
    return this.http.put(`northwind/customers/${c.id}`, c).map((resp: Response) => {
      return this.getCustomerFromJson(resp.json());
    });
    //return customer;
  }
  private getCustomerFromJson(json: Customer): Customer {
    return new Customer(JSON.stringify(json));
  }
}
