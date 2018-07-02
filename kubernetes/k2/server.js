var http = require('http');

var handleRequest = function(request, response) {
  console.log('Received request for URL: ' + request.url);
  response.writeHead(200);
  response.end("Hello World Again!\n");
};
var www = http.createServer(handleRequest);
www.listen(8080);


// node server.js 
// Received request for URL: /

// curl localhost:8080
// Hello World!
