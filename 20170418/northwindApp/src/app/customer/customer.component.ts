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

  constructor(private route : ActivatedRoute, private customerService : CustomerService) { }

  ngOnInit() {
  this.route.params.map(params => params['customerId']).subscribe((customerId) => {
    this.customer = new Customer(customerId, null, null, null);
    this.customer = this.customerService.getCustomerById(customerId);
    console.log(this.customer.id);
    console.log(this.customer.firstName);
  });
  }

}
