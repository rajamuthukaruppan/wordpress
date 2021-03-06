var Pong = (function () {
    function Pong() {
        this.gameCanvas = document.getElementById("game-canvas");
        this.gameContext = this.gameCanvas.getContext("2d");
        this.gameContext.font = "30px Orbitron";
    }
    Pong.prototype.drawBoardDetails = function () {
        this.gameContext.strokeStyle = "green";
        this.gameContext.lineWidth = 5;
        var CANVAS_MARGIN = 10;
        // draw outer border
        this.gameContext.strokeRect(CANVAS_MARGIN, CANVAS_MARGIN, this.gameCanvas.width - 2 * CANVAS_MARGIN, this.gameCanvas.height - 2 * CANVAS_MARGIN);
        //draw center lines
        for (var i = 0; i + 30 < this.gameCanvas.height; i += 30) {
            this.gameContext.fillStyle = "green";
            this.gameContext.fillRect(this.gameCanvas.width / 2 - CANVAS_MARGIN, i + CANVAS_MARGIN, 15, 20);
        }
    };
    Pong.prototype.draw = function () {
        this.gameContext.fillStyle = "white";
        this.gameContext.fillRect(0, 0, this.gameCanvas.width, this.gameCanvas.height);
        this.drawBoardDetails();
    };
    Pong.prototype.gameLoop = function () {
        pong.draw();
        requestAnimationFrame(pong.gameLoop);
    };
    return Pong;
}());
var pong = new Pong();
requestAnimationFrame(pong.gameLoop);
