# Angular Setup

```shell
npm install --save jquery
npm install --save semantic-ui
```
https://semantic-ui.com
Put the following into the 
index.html
```html
<link rel="stylesheet" href="../node_modules/semantic-ui/dist/semantic.min.css">
<script src="../node_modules/jquery/dist/jquery.js"></script>
<script src="../node_modules/semantic-ui/dist/semantic.min.js"></script>
```

https://cli.angular.io/
* ng new -- create a new app
* ng g component - create a new component

Run the app:
* ng s

navigate to: http://localhost:4200/

We will create an app with the following menu
* customers
* employees
* orders
* invoices
* products
* shippers
* suppliers
* purchase orders

# Create a components

## First create the menu component
```
ng g component menu
```
## Then the Main
This will will serve as the landing page for the application
```
ng g component main
```
## Setup the pages for the customers employees etc...
```
ng g component customers
ng g component employees
ng g component orders
```

Paste menu html into menu.component.html and modify the following file to show the menu.

app.component.html
```html
<app-menu></app-menu>
```

# Setup the router 
One time setup to tell our module about this new routes in app.module.ts

```typescript
import { routing,
     appRoutingProviders } from './app.routing';


providers: [ ... appRoutingProviders ],
imports: [ ... routing ],
```

Then update our app component html in app.component.html
```xml
<router-outlet></router-outlet>
```

# Maintain the routing when new pages are added
Every time a new page is introduced the app.routing.ts must be updated.
```typescript
import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CustomersComponent } from './customers/customers.component';
import { EmployeesComponent } from './employees/employees.component';
import { OrdersComponent } from './orders/orders.component';
import { MainComponent } from './main/main.component';

const appRoutes: Routes = [
  { path: '',  redirectTo: '/main',  pathMatch: 'full'},
  { path: 'customers', component: CustomersComponent },
  { path: 'employees', component: EmployeesComponent },
  { path: 'orders', component: OrdersComponent },
  { path: 'main', component: MainComponent },
];

export const appRoutingProviders: any[] = [

];

export const routing : ModuleWithProviders = RouterModule.forRoot(appRoutes); 
```

## Setup the menu links to the individual pages
Then we’ll need to update our menu to link to these new routes in menu.componont.html

```html
<div class="ui secondary pointing menu">
  <a class="item active" routerLink="/main" routerLinkActive="active">
    Home
  </a>
  <a class="item" routerLink="/customers" routerLinkActive="active">
    Customers
  </a>
  <a class="item" routerLink="/employees" routerLinkActive="active">
    Employees
  </a>
  <a class="item" routerLink="/orders" routerLinkActive="active">
    Orders
  </a>
  <div class="right menu">
    <a class="ui item">
      Logout
    </a>
  </div>
</div>
<div class="ui segment">
  <p></p>
</div>
```

Test the routing to all the pages work.
http://localhost:4200/

# Create the Services

```
ng g s customer
ng g s employee
ng g s order
ng g s invoice
ng g s product
ng g s shipper
ng g s supplier
ng g s purchaseorder
```

## Modify app.modules.ts
Unlike adding components you still need to modify the file manually every time a new service is added.
1. Specify it in the imports
2. Update the providers line

# Implement Services to fetch records
## Create the DTO Objects
ng g class Customer

Define the Customer
```typescript
export class Customer {
    constructor(
        public id: number, 
        public lastName: string, 
        public firstName: string, 
        public company: string) {
    };
}
```

# modify the service
```typescript
import { Injectable } from '@angular/core';
import { Customer } from './customer';
import { Observable } from 'rxjs/Rx';
import { Http, Response } from '@angular/http';
import { Headers, RequestOptions } from '@angular/http';

@Injectable()
export class CustomerService {

  constructor(private http: Http) { }

  getCustomers(): Observable<Customer[]> {
    return this.http
      .get('v1/customers')
      .map((resp: Response) => {
        const customers = resp.json();
        return customers.map((customer) => new Customer(customer));
      })
      .catch(this.handleError);
  }
  
  private handleError (error: Response | any) {
    console.error('ApiService::handleError', error);
    return Observable.throw(error);
  }    
}
```

# Inject the Service into the component
```typescript
  constructor(private customerService: CustomerService) { }
```


# Deep linking into individual Customer or Employee records

Deep linking allows users to see individual records from a list and provides options to further edit the record.

```html
      <td><a routerLink="/customers/{{customer.id}}">Details</a></td>
```
## Create a customer component
```
ng g c customer
```

```typescript
import { Component, OnInit } from '@angular/core';
import { Customer } from '../customer';
import { ActivatedRoute } from '@angular/router';
import 'rxjs/Rx';

@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.css']
})
export class CustomerComponent implements OnInit {

  customer : Customer;
  customerId = '';

  constructor(private route : ActivatedRoute) { }

  ngOnInit() {
  this.route.params.map(params => params['customerId']).subscribe((customerId) => {
    this.customer = new Customer(customerId, null, null, null);
    console.log(this.customer.id);
  });
  }

}
```

Modify the app routing
```javascript
import { CustomerComponent } from './customer/customer.component';
...
  { path: 'customers/:customerId', component: CustomerComponent },
```


Modify the link to the customer page:
```
<td><a routerLink="/customers/{{customer.id}}">Details</a></td>
```
