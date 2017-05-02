import { Component, OnInit } from '@angular/core';
import { Customer } from '../shared/customer';
import { ActivatedRoute } from '@angular/router';
import { CustomerService } from '../customer.service';
import { Location } from '@angular/common';
import 'rxjs/Rx';

@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.css']
})
export class CustomerComponent implements OnInit {

  customer : Customer;
  customerOrig : Customer;
  customerId = '';  
  errorText = '';
  loaded = false;
  firstName = 'test';
  message = "";
  saved = false;

  constructor(private route : ActivatedRoute, private customerService : CustomerService,
  private location: Location) { }

  ngOnInit() {
  this.route.params.map(params => params['customerId']).subscribe((customerId) => {
    this.customerService.getCustomerById(customerId).subscribe((customer) => {
      this.customer = customer;
      this.customerOrig = JSON.parse(JSON.stringify(customer));
      console.log(this.customer);
    }, (error) => {
      this.errorText = error;
    }, () => {
      this.loaded = true;
    });
  });
  }

  public onSubmit(form) {
    if(!form.dirty) {
      this.message = "Nothing to save";
      return;
    }
    let c = JSON.parse(form.value);
    this.customerService.saveCustomer(c).subscribe((customer) => {
      this.message="Changes saved";
      this.saved=true;
    }, (error) => {
      this.errorText = error;
    }, () => {
      this.loaded = true;
    });
  }

  
}
