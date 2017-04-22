import { Component, OnInit } from '@angular/core';
import { Customer } from '../customer';
import { ActivatedRoute } from '@angular/router';
import { CustomerService } from '../customer.service';
import 'rxjs/Rx';

@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.css']
})
export class CustomerComponent implements OnInit {

  customer : Customer;
  customerId = '';  
  errorText = '';
  loaded = false;
  firstName = 'test';

  constructor(private route : ActivatedRoute, private customerService : CustomerService) { }

  ngOnInit() {
  this.route.params.map(params => params['customerId']).subscribe((customerId) => {
    this.customerService.getCustomerById(customerId).subscribe((customer) => {
      this.customer = customer;
      console.log(this.customer);
    }, (error) => {
      this.errorText = error;
    }, () => {
      this.loaded = true;
    });
  });
  }

  public onSubmit(form) {    
    this.customerService.saveCustomer(form.value).subscribe((customer) => {
      console.log("put completed", customer);
    });
  }
}
