const http = require("http");
http
    .createServer((request, response) => {
        response.writeHead(200, { "Content-Type": "text/plain" });
        response.write("this is sever !");
        response.end();
    })
    .listen(8888);
console.log("sever listening on port 8888");