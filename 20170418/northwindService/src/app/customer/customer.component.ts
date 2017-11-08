import { Component, OnInit } from '@angular/core'
import { ActivatedRoute } from '@angular/router'
import { CustomerService } from './customer.service'
import { Location } from '@angular/common'
import { NgForm } from '@angular/forms'

import 'rxjs/Rx'
import * as $ from 'jquery'
import * as handleErrorFunc from "../shared/handleErrorFunc"

@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.css']
})
export class CustomerComponent implements OnInit {

  customer
  customerOrig
  customerId = ''  
  errorText = ''
  errorList = []
  handleError = handleErrorFunc.handleError  
  loaded = false
  firstName = 'test'
  message = ""
  saved = false

  constructor(private route : ActivatedRoute, private customerService : CustomerService,
  private location: Location) { }

  ngOnInit() {
    this.route.params.map(params => params['customerId'])
    .subscribe((customerId) => {
      this.customerService.getCustomerById(customerId)
        .then(customer => {
          this.customer = customer
          this.customerOrig = JSON.parse(JSON.stringify(customer))
          console.log(this.customer)
          this.loaded = true              
        })
        .catch(error => this.handleError(error))
        
    })
  }

  public onSubmit(form: NgForm) {
    console.log(form.value)
    if(!form.dirty) {
      this.message = "Nothing to save"
      return
    }
    //let c = JSON.parse(form.value)
    // this.customerService.saveCustomer(c).then(customer => {
    //   this.message="Changes saved"
    //   this.saved=true
    //   this.loaded = true
    // })
  }
}
