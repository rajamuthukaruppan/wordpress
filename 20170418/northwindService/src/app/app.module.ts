import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { CustomersComponent } from './customers/customers.component';
import { EmployeesComponent } from './employees/employees.component';
import { routing,
     appRoutingProviders } from './app.routing';
import { MenuComponent } from './menu/menu.component';
import { OrdersComponent } from './orders/orders.component';
import { MainComponent } from './main/main.component';
import { InvoicesComponent } from './invoices/invoices.component';
import { ProductsComponent } from './products/products.component';
import { ShippersComponent } from './shippers/shippers.component';
import { SuppliersComponent } from './suppliers/suppliers.component';
import { PurchaseordersComponent } from './purchaseorders/purchaseorders.component';
import { CustomerService } from './customer.service'
import { EmployeeService } from './employee.service';
import { InvoiceService } from './invoice.service';
import { OrderService } from './order.service';
import { ProductService } from './product.service';
import { PurchaseorderService } from './purchaseorder.service';
import { ShipperService } from './shipper.service';
import { SupplierService } from './supplier.service';
import { CustomerComponent } from './customer/customer.component';
import { CustomerFilterPipe } from './shared/customer-filter.pipe';

@NgModule({
  declarations: [
    AppComponent,
    CustomersComponent,
    EmployeesComponent,
    MenuComponent,
    OrdersComponent,
    MainComponent,
    InvoicesComponent,
    ProductsComponent,
    ShippersComponent,
    SuppliersComponent,
    PurchaseordersComponent,
    CustomerComponent,
    CustomerFilterPipe
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    routing
  ],
  providers: [
    appRoutingProviders, 
    CustomerService, 
    EmployeeService, 
    InvoiceService,
    OrderService,
    ProductService,
    PurchaseorderService,
    ShipperService,
    SupplierService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
