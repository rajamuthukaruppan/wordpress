## Template based forms

## Forms in app.module.ts

Add the below 2 lines.
```typescript
import { FormsModule } from "@angular/forms";
...
imports : [FormsModule]
```

Turn off browser validation by putting novalidate on the form.

Make sure each field has a name.


Place ngModel attribute to each input element
```html
<input type="text" placeholder="Invoice Id" name="id" ngModel>
```
