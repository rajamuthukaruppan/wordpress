import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CustomersComponent } from './customers/customers.component';
import { CustomerComponent } from './customer/customer.component';
import { EmployeesComponent } from './employees/employees.component';
import { OrdersComponent } from './orders/orders.component';
import { MainComponent } from './main/main.component';
import { InvoicesComponent } from './invoices/invoices.component';
import { ProductsComponent } from './products/products.component';
import { ShippersComponent } from './shippers/shippers.component';
import { SuppliersComponent } from './suppliers/suppliers.component';
import { PurchaseordersComponent } from './purchaseorders/purchaseorders.component';

const appRoutes: Routes = [
  { path: '',  redirectTo: '/main',  pathMatch: 'full'},
  { path: 'customers', component: CustomersComponent },
  { path: 'employees', component: EmployeesComponent },
  { path: 'orders', component: OrdersComponent },
  { path: 'invoices', component: InvoicesComponent },
  { path: 'products', component: ProductsComponent },
  { path: 'shippers', component: ShippersComponent },
  { path: 'suppliers', component: SuppliersComponent },
  { path: 'purchaseorders', component: PurchaseordersComponent },
  { path: 'main', component: MainComponent },
  { path: 'customers/:customerId', component: CustomerComponent },
];

export const appRoutingProviders: any[] = [

];

export const routing : ModuleWithProviders = RouterModule.forRoot(appRoutes); 