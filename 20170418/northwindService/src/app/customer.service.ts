import { Injectable } from '@angular/core';
import { Customer } from './shared/customer';
import { Observable } from 'rxjs/Rx';
import { Http, Response } from '@angular/http';
import { Headers, RequestOptions } from '@angular/http';


@Injectable()
export class CustomerService {

  constructor(private http: Http) { }

  getCustomers(): Observable<Customer[]> {
    return this.http
      .get('v1/customers')
      .map((resp: Response) => {
        const customers = resp.json();
        return customers.map((customer) => new Customer(customer));
      })
      .catch(this.handleError);
  }
  getCustomerById(id: number): Observable<Customer> {
    return this.http
    .get(`v1/customers/${id}`)
    .map((resp: Response) => {
      return new Customer(resp.json());
    })
    .catch(this.handleError);
  }
  saveCustomer(c : Customer): Observable<Customer> {
    console.log(c);
    return this.http
    .put(`v1/customers/${c.id}`, c)
    .map((resp: Response) => {
      return new Customer(resp.json());
    })
    .catch(this.handleError);
    //return customer;
  }

  private handleError (error: Response | any) {
    console.error('ApiService::handleError', error);
    return Observable.throw(error);
  }  
}
