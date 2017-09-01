export class Customer {
    public id: number;
    public company: string;
    public lastName: string;
    public firstName: string;
    public emailAddress: string;
    public jobTitle: string;
    public businessPhone: string;
    public homePhone: string;
    public mobilePhone: string;
    public faxNumber: string;
    public address: string;
    public city: string;
    public stateProvince: string;
    public zipPostalCode: string;
    public countryRegion: string;
    public webPage: string;
    public notes: string;
    public attachments: string

    constructor(values: Object = {}) {
        Object.assign(this, values);
    }
}
