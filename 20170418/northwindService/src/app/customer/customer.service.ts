import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Rx';
import { Http, Response } from '@angular/http';
import { Headers, RequestOptions } from '@angular/http';

@Injectable()
export class CustomerService {
  constructor(private http: Http) { }
  getCustomers(): Promise<any[]> {
    let h = new Headers();
    h.append("remote_user", "readUser");
    let options = new RequestOptions({headers: h});
    return this.http
      .get('v1/customers', options)
      .toPromise()
      .then((resp: Response) => {
        const appResponse = resp.json();
        if(appResponse.status === 'success')
          return appResponse.data;
        else
          throw appResponse;        
      })      
      .catch(error => Promise.reject(error));
  }
  getCustomerById(id: number): Promise<any> {
    return this.http
    .get(`v1/customers/${id}`)
    .toPromise()
    .then((resp: Response) => {
      const appResponse = resp.json();      
      if(appResponse.status === 'success')
        return appResponse.data;     
      else
        throw appResponse;
    })
    .catch(error => Promise.reject(error));
  }
  saveCustomer(c): Promise<any> {
    console.log(c);
    return this.http
    .put(`v1/customers/${c.id}`, c)
    .toPromise()
    .then((resp: Response) => {
      const appResponse = resp.json();      
      if(appResponse.status === 'success')
        return appResponse.data;
      else
        throw appResponse;
    })
    .catch(error => Promise.reject(error));
  }
}
