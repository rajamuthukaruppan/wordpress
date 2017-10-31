export class AuthService {

    private userName : string;

    public setUserName(userName : string) {
        this.userName = userName;
    }
    public getUserName() : string {
        return this.userName;
    }
}