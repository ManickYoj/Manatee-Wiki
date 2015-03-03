var Article = require("../model/article");

/*
On page load, send the index page, along with a listing
of article titles to display in the sidebar.
*/
module.exports.index = function (req, res) {
	Article
	.find()
	.select('title')
	.sort({title: -1})
	.exec(function (err, articles) {
		if (err) return res.sendStatus(500);
		res.render('index', {articles: articles})
	})
}

/*
API path for getting article contents.
Sends a JSON representation of the requested
article data.
*/
module.exports.article = function (req, res) {
	Article.findOne({title: req.params.title}, function (err,article) {
	   if (err) return res.sendStatus(500);
	   res.json(article);
	});
};

/*
API path for editing an article title or content.
Note that if the title is changed, the URI will change
as well. This is expected behavior.
*/
module.exports.edit = function (req, res) {
	Article.findOneAndUpdate({title: req.params.title}, req.body, function (err, article){
		if (err) return res.sendStatus(500);
		res.sendStatus(200);
	});
};