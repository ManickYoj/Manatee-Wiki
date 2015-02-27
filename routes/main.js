module.exports.index = function (req, res) {
	res.render('index');
}

module.exports.list = function (req, res) {
	
}

module.exports.article = function (req, res) {
	res.render('article', {
		riot: {
			header: {
				title: req.params.article
			}
		},
		content : "<strong>Manatees</strong> are a graceful, aquatic variety of bovine."
	});
}

module.exports.edit = function (req, res) {
	console.log('editing: ' + req.params.article);
}

