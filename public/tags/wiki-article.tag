<wiki-article>
		<div id="articleHeader" class="row full-width md-padding">
		<div class="col-md-6">
			<h4 id="articleTitle">{ title }</h3>
		</div>
		<div class="col-md-2 col-md-offset-4">
			<button class='waves-effect waves-button pull-right' each={ buttonSet } onclick={ clickFunction }>{name}</button>
		</div>
	</div>
	<div class="row md-padding full-height">
		<div id="articleContent" class="col-md-12 full-height">
			{ content }
		</div>
	</div>

	var self = this;

	var edit = function(e) {
		self.buttonSet = [buttons.discard, buttons.save];

		self.articleTitle.innerHTML = "<input id='titleField' value='" + self.title + "'/>";
		self.titleField = articleTitle.firstChild;

		self.articleContent.innerHTML = "<textarea id='contentField' class='full-width full-height md-padding'>"
			+ self.content + "</textarea>";
		self.contentField = articleContent.firstChild;
	}

	var discard = function (e) {
		self.buttonSet = [buttons.edit];
		self.articleTitle.innerHTML = self.title;
		self.articleContent.innerHTML = self.content;
	}

	var save = function(e) {
		riot.update();

		$.post('article/' + self.title, {
			title: self.titleField.value,
			content: self.contentField.value
		}).done(function () {
			riot.route('article/' + self.title);
		});

		self.title = self.titleField.value;
		self.content = self.contentField.value;
		discard();
	}

	var buttons = {
		edit: {clickFunction: edit, name: 'edit'},
		discard: {clickFunction: discard, name: 'discard'},
		save: {clickFunction: save, name: 'save'}
	}
	
	var updatePage = function (collection, id, action) {
<<<<<<< HEAD
		if (collection == 'new') {

		} else {
			$.get(collection + '/' + id)
			.done(function(res, status) { 
			console.log(res);
			self.update(res); })
			.error(function(res, status) {/*serve 500*/});
		}
=======
		$.get(collection + '/' + id)
		.done(function(res, status) { self.update(res); })
		.error(function(res, status) {/*serve 500*/});
>>>>>>> nick-branch
	};
	
	this.buttonSet = [buttons.edit];
	riot.route.exec(updatePage);
	riot.route(updatePage);
	
</wiki-article>