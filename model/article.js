var mongoose = require('mongoose');

var schema =  mongoose.Schema({
	title: {type: String, unique: true, required: true},
	content: {type: String, required: true}
});

module.exports = mongoose.model('Article', schema);