import { Component, OnInit } from '@angular/core';
import { InvoiceService } from './invoice.service';
import { DatePickerOptions, DateModel } from 'ng2-datepicker';
import * as moment from 'moment/moment';

@Component({
  selector: 'app-invoices',
  templateUrl: './invoices.component.html',
  styleUrls: ['./invoices.component.css']
})
export class InvoicesComponent implements OnInit {

  invoices = [];
  errorText : string;

  map = new Map<any, any>();
  editDate = false;
  invoiceToEdit;

  constructor(private invoiceService : InvoiceService) {     
    //this.date.momentObj = momentObj;
  }

  onChange(ev : DateModel) {
//    console.log(ev);
    if(this.invoiceToEdit) {
      console.log("setting time:", ev.momentObj.valueOf());
      console.log("setting time utc:", ev.momentObj.valueOf());
      this.invoiceToEdit.invoiceDate = ev.momentObj.valueOf();
    }
      
    //this.invoiceToEdit = null;
  }
  check() {
    console.log("check map: ", this.map);
  }
  getOptions(unixTime) : DatePickerOptions {
    return new DatePickerOptions({"format" : "YYYY-MM-DD", "autoApply" : true, "initialDate" : new Date(unixTime)});    
  }

  ngOnInit() {
    this.invoiceService.getInvoices().subscribe((invoices) => {
      this.invoices = invoices;
    }, (error) => {
      this.errorText = error;
    });

  }

}
