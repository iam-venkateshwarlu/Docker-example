const express = require('express');
const client = require('prom-client');

const app = express();
const collectDefaultMetrics = client.collectDefaultMetrics;
collectDefaultMetrics();

const httpRequestCounter = new client.Counter({
  name: 'http_requests_total',
  help: 'Total number of HTTP requests',
  labelNames: ['method', 'route', 'status_code'],
});

const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  httpRequestCounter.inc({ method: "GET", route: '/', status_code: 200 });
  res.send('Hello from Docker Best Practices Example 🚀 + ' + (process.env.APP_MESSAGE || 'Hello World!'));
  // res.send('Hello from Docker Best Practices Example 🚀 + ' + process.env.APP_MESSAGE || 'Hello World!');
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT} + ' + process.env.APP_MESSAGE || 'Hello World!'));`);
});


/*
var express = require('express');
var app = express();
//configure express app
const PORT = process.env.PORT || 3000;
// const env = process.env.APP_ENV || 'development';
const message = process.env.APP_MESSAGE || 'Hello !';

//root endpoint
app.get('/',  (req, res) => {
    res.send('<h2> Sample Node JS App </h2><p>Message: ' + message + '</p>');
});
//Health check endpoint
app.get('/ready', (req, res) => {
    res.send('{ "response": " Great!, It works!" }');
});
// start server
app.listen(PORT, () => {
    console.log('Server is running on port ' + PORT + ' in ' + message);
});
module.exports = app;
*/

/*
app.get('/will', function (req, res) {
    res.send('{ "response": "Hello World" }');
});

app.listen(process.env.PORT || 3000);
module.exports = app;*/