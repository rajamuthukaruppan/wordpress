var HelloWorld = (function () {
    function HelloWorld() {
        this.jsOutput = document.getElementById("jsOutput");
        this.jsOutput.innerHTML = "Hello World from Typescript!";
    }
    return HelloWorld;
}());
var helloWorld = new HelloWorld();
