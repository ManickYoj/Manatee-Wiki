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
	var rq = req.params;
	Article.findOne({title: rq.title}, function (err,article) {
	   if (err) return res.sendStatus(500);
	   res.json(article);
	});
};

module.exports.list = function (req, res) {
	
}


/*
API path for editing an article title or content.
Note that if the title is changed, the URI will change
as well. This is expected behavior.
*/
module.exports.edit = function (req, res) {
	var rq = req.params;
	console.log(req.body);

	Article
	.findOneAndUpdate({title: rq.title}, req.body, function (err, article){
		if (err) return res.sendStatus(500);
		console.log('article updated: ' + article)
		res.sendStatus(200);
	})
}

