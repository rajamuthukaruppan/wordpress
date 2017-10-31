import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Rx';
import { Http, Response } from '@angular/http';
import { Headers, RequestOptions } from '@angular/http';


@Injectable()
export class CustomerService {

  constructor(private http: Http) { }

  getCustomers(): Observable<any[]> {
    let h = new Headers();
    h.append("remote_user", "readUser");
    let options = new RequestOptions({headers: h});
    return this.http
      .get('v1/customers', options)
      .map((resp: Response) => {
        const customers = resp.json();
        return customers.data.map((customer) => customer);
      })
      .catch(this.handleError);
  }
  getCustomerById(id: number): Observable<any> {
    return this.http
    .get(`v1/customers/${id}`)
    .map((resp: Response) => {
      return resp.json().data;      
    })
    .catch(this.handleError);
  }
  saveCustomer(c): Observable<any> {
    console.log(c);
    return this.http
    .put(`v1/customers/${c.id}`, c)
    .map((resp: Response) => {
      return resp.json();
    })
    .catch(this.handleError);
    //return customer;
  }

  private handleError (error: Response | any) {
    console.error('ApiService::handleError', error);
    return Observable.throw(error);
  }  
}
