export class Invoice {

    public id : number;
    public orderId : number;
    public invoiceDate : number;
    public dueDate : number;
    public tax : number;
    public shipping : number;
    public amountDue : number;
    
    constructor(values: Object = {}) {
        Object.assign(this, values);
    }    
}
