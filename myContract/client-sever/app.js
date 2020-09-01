const express = require("express");
const app = express();
const port = 9999;

app.get("/", (req, res) => {
    res.send("hello world!");
});

app.listen(port, function() {
    console.log("Sever listening on port ${port}");
})