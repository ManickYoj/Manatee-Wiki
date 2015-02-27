// Utility Imports
var express = require('express');
var mongoose = require('mongoose');
var hbs = require('express-handlebars');
var path = require('path');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

// Startup
var app = express();

// Config
var PORT = process.env.PORT || 3000;
var mongoURI = process.env.MONGOURI || "mongodb://localhost/test";
mongoose.connect(mongoURI);

var hbsOptions = {
	defaultLayout: 'main',
	extname: 'hbs'
};

app.engine('hbs', hbs(hbsOptions));
app.set('views', path.join(__dirname, 'views', 'pages'));
app.set('view engine', 'hbs');

// Middleware
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

// Routing Table
var main = require('./routes/main');
app.get('/', main.index);
app.get('/article/*', main.article);

// Listen
app.listen(PORT);
console.log("App running on port "+PORT+".");