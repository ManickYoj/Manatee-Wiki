var mongoose = require('mongoose');

var schema =  mongoose.Schema({
	title: {type: String, unique: true},
	content: {type: String}
});

module.exports = mongoose.model('Article', schema)