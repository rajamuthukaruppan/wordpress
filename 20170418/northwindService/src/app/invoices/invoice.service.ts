import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Rx';
import { Http, Response } from '@angular/http';
import { Headers, RequestOptions } from '@angular/http';

@Injectable()
export class InvoiceService {

  constructor(private http: Http) { }

  getInvoices(): Observable<any[]> {
    return this.http
      .get('v1/invoices')
      .map((resp: Response) => {
        const invoices = resp.json();
        return invoices.map((invoice) => invoice);
      })
      .catch(this.handleError);
  }

  private handleError (error) {
    console.error('ApiService::handleError', error);
    return Observable.throw(error);
  }  
  
}
