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