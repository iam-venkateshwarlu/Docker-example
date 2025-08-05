var express = require('express');
var app = express();
//configure express app
const PORT = process.env.PORT || 3000;
const env = process.env.APP_ENV || 'development';
const message = process.env.MESSAGE || 'Hello World!';

//root endpoint
app.get('/',  (req, res) => {
    res.send('<h2> Sample Node JS App </h2><p>Environment: ' + env + '</p><p>Message: ' + message + '</p>');
});
//Health check endpoint
app.get('/ready', (req, res) => {
    res.send('{ "response": " Great!, It works!" }');
});
// start server
app.listen(PORT, () => {
    console.log('Server is running on port ' + PORT + ' in ' + env + ' mode. Message: ' + message);
});
// module.exports = app;

/*
app.get('/will', function (req, res) {
    res.send('{ "response": "Hello World" }');
});

app.listen(process.env.PORT || 3000);
module.exports = app;*/