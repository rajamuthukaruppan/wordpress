class HelloWorld {
    private jsOutput;

    constructor() {
        this.jsOutput = document.getElementById("jsOutput");
        this.jsOutput.innerHTML = "Hello World from Typescript!";
    }
}

var helloWorld = new HelloWorld();