module.exports.index = function (req, res) {
	res.render('index', {
		sidebarArticles: [
			{title: "Manatees", url: "#manatees"},
			{title: "Porpoises", url: "#porpoises"}
		]
	});
}

module.exports.list = function (req, res) {
	
}

module.exports.article = function (req, res) {
	var rq = req.params;
	info = res.json({
		   articleTitle: rq.name + "!",
		   articleContent: rq.name +
		   " is/are a sublime aquatic mammal of great size."
	       });
	res.send("index",{info: info});
};

module.exports.edit = function (req, res) {
	console.log('editing: ' + req.params.article);
}

