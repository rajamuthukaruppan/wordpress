import { Component, OnInit } from '@angular/core';
import { CustomerService } from '../customer.service';
import { Customer } from '../shared/customer';
import * as sortFunc from '../shared/sortFunc';
import {HostListener} from '@angular/core';

@Component({
  selector: 'app-customers',
  templateUrl: './customers.component.html',
  styleUrls: ['./customers.component.css']
})
export class CustomersComponent implements OnInit {

  customers = [];
  loaded = false;
  errorText = '';
  customerLastNameEditFlag=false;
  customerToEdit:Customer;
  message='';
  saved=false;
  companySortStatus = {order : -1};
  firstNameSortStatus = {order : -1};
  lastNameSortStatus = {order : -1};
  filter: Customer = new Customer();  
  searchStatus = {
    searchCompanyStatus : false, 
    searchFirstNameStatus : false, 
    searchLastNameStatus : false
  }

  // imported functions
  sortString=sortFunc.sortString;
  sortNumber=sortFunc.sortNumber;

  constructor(private customerService: CustomerService) { }

  ngOnInit() {
    this.customerService.getCustomers().subscribe((customers) => {
      this.customers = customers;
    }, (error) => {
      this.errorText = error;
    }, () => {
      this.loaded = true;
    });
  }

  customerLastNameEdit(customer) {
    this.customerLastNameEditFlag=!this.customerLastNameEditFlag;
    this.customerToEdit = customer;
  }
  onSubmit(c, form, fieldName) {
    console.log("call to save customer: " , c, form.controls[fieldName].value);
    c[fieldName] = form.controls[fieldName].value;
    console.log("saved customer: " , c);

    this.customerService.saveCustomer(c).subscribe((customer) => {
      this.message="Changes saved";
      this.saved=true;
      this.customerExit(c);
    }, (error) => {
      this.errorText = error;
    }, () => {
      this.loaded = true;
    });
    
  }
  customerExit(customer) {
    this.customerToEdit=null;
  } 

  searchEnable(searchStatusName) {
    this.searchStatus[searchStatusName] = !this.searchStatus[searchStatusName]
  }

  
  escapePressed(key, field, statusVar) {
    if("Escape" === key.key) {
      this.filter[field] = "";
      this.searchEnable(statusVar);
    }
  }
}
