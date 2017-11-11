import { Component, OnInit } from '@angular/core'
import { InvoiceService } from '../invoices/invoice.service'
import { ActivatedRoute } from '@angular/router'
import { HostListener } from '@angular/core'
import { NgForm } from '@angular/forms';

import * as sortFunc from '../shared/sortFunc'
import * as handleErrorFunc from "../shared/handleErrorFunc"
declare var $: any;

@Component({
  selector: 'app-invoice',
  templateUrl: './invoice.component.html',
  styleUrls: ['./invoice.component.css']
})

export class InvoiceComponent implements OnInit {
    constructor(private invoiceService: InvoiceService, private route : ActivatedRoute) {}

    invoice
    errorList = []
    handleError = handleErrorFunc.handleError  

    ngOnInit() {
      this.route.params.map(params => params['invoiceId'])
      .subscribe(invoiceId => {
        this.invoice = this.invoiceService.getInvoice(invoiceId).then(invoice => {
          this.invoice = invoice;
        })
        .catch(error => this.handleError(error))
      })
    }

    submitForm(form: NgForm) {
      console.log(form.value);
      this.invoiceService.updateInvoice(form.value)
    }

}