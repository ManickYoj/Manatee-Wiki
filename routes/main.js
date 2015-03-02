var Article = require("../model/article")

module.exports.index = function (req, res) {
	res.render('index', {
		articles: [
			{title: "Manatees"},
			{title: "Porpoises"}
		]
	});
}

module.exports.list = function (req, res) {

}

module.exports.article = function (req, res) {
	var rq = req.params;
	Article.findOne({title: rq.title}, function (err,article) {
	   if (err) return res.sendStatus(500);
	   console.log(article);
	   res.json(article);
	});
};

module.exports.edit = function (req, res) {
	console.log('editing: ' + req.params.article);
}

