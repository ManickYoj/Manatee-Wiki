module.exports.index = function (req, res) {
	res.render('index', {
		articles: [
			{title: "Manatees"},
			{title: "Porpoises"}
		]
	});
}

module.exports.list = function (req, res) {
	articles.find()
}

module.exports.article = function (req, res) {
	var rq = req.params;
	res.json({
	   articleTitle: rq.name + "!",
	   articleContent: rq.name +
	   " is/are a sublime aquatic mammal of great size."
       });
};

module.exports.edit = function (req, res) {
	console.log('editing: ' + req.params.article);
}

