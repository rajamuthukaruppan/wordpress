# NorthwindApp

Thia page describes how to code a simple Angular 2 application to perform CRUD operations on the northwind database using MariaDB.

https://semantic-ui.com
Put the following into the 
index.html
```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.9/semantic.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.9/semantic.min.js"></script>
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

@Injectable()
export class CustomerService {

  constructor() { }

  getCustomers() : Array<Customer> {
    return [
      new Customer(1, "smith", "john", "IBM"), 
      new Customer(2, "Still", "Ben", "AAA"), 
      new Customer(3, "Roland", "Doug", "888"), 
      new Customer(4, "doe", "john", "TXN")
    ];
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


# Setting up the Server Side
Northwind database:
https://github.com/dalers/mywind

Setting Datasource on the app server:
* https://numberformat.wordpress.com/2017/03/29/setting-up-a-datasource-in-jboss-eap-7/
* https://numberformat.wordpress.com/2017/03/29/jndi-lookup-for-a-datasource-in-jboss/

Setup the JAX-RS application using the following as an example:
https://github.com/numberformat/wordpress/tree/master/20170401/glensmith-twitter-service

Define the bean in the spring config class.
```java
	@Bean
	public DataSource getDataSource() throws Exception {
		return (DataSource) (new InitialContext()).lookup("northwind");
	}
```

# Enable the proxy otherwise enable CORS
Proxy all calls to the API to the app server.
create proxy.config.json at the root of the project
```json
{
    "/northwind/*" : {
        "target": "http://localhost:8080/northwindService/",
        "secure" : false,
        "logLevel": "debug"
    }
}
```

Specify the proxy config at startup
```
ng s --proxy-config proxy.config.json
```
Or specify it in package.json
```
    "start": "ng serve --proxy-config proxy.config.json",
```
You must use npm start if going the config route.


## Fetch the data from the service and convert to Customer objects
Modify the service to return an Observable
```typescript
  getCustomers() : Observable<Array<Customer>> {
    return this.http.get('northwind/customers').map((resp: Response) => {
      let fetchedCustomer : Array<Customer> = [];
      for (let json of resp.json()) {        
        fetchedCustomer.push(this.getCustomerFromJson(json));
      }
      return fetchedCustomer;
    });
  }

  private getCustomerFromJson(json: Customer): Customer {  // no better way...
    return new Customer(json.id, json.lastName,json.firstName,json.company);
  }
```

Subscribe to the observable in the component
```typescript
    this.customerService.getCustomers().subscribe((customers) => {
      this.customers = customers;
    });
```
Display the customers
```html
<table class="ui celled table" *ngIf='customers.length'>
  <thead>
    <tr><th>Id</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th></th>
  </tr></thead>
  <tbody>
    <tr *ngFor='let customer of customers'>
      <td>{{customer.id}}</td>
      <td>{{customer.firstName}}</td>
      <td>{{customer.lastName}}</td>
      <td><a routerLink="/customers/{{customer.id}}">Details</a></td>
    </tr>
  </tbody>
</table>

```

# Error handling

* No Data
* Pending
* Errors

```typescript
  loaded = false;
  errorText = '';
```

```html
<div *ngIf="errorText" class="ui negative message">
  <i class="close icon"></i>
  <div class="header">
    {{ errorText }}
  </div>
</div>
<div *ngIf="loaded">
  <!--table content goes here -->
  <div *ngIf='!customers.length'>
    <h2>There are not any customers here</h2>
  </div>
</div>
<div *ngIf='!loaded'>
  <h2>Loading...</h2>
</div>
```
Here is the template code to getch data from the observable.
```typescript
    this.customerService.getCustomers().subscribe((customers) => {
      this.customers = customers;
    }, (error) => {
      this.errorText = error;
    }, () => {
      this.loaded = true;
    });
```


## more generate commands
* ng g service
* ng g interface
* ng g directive
* ng g module


## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive/pipe/service/class/module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `-prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).
Before running the tests make sure you are serving the app via `ng serve`.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).
