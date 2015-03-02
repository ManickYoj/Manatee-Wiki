<wiki-article>
	<div id="articleHeader" class="row full-width md-padding">
		<div class="col-md-6">
			<h4>{ title }</h3>
		</div>
		<div class="col-md-2 col-md-offset-4">
			<button class='waves-effect waves-button pull-right' each={ buttonSet } onclick={ clickFunction }>{name}</button>
		</div>
	</div>

	<div id="articleContent" class="row md-padding">
		<div class="col-md-12">
			{ content }
		</div>
	</div>

	var self = this;

	var edit = function(e) {
		self.buttonSet = [buttons.discard, buttons.save];
		self.articleContent.innerHTML = "<form class='full-height full-width'><textarea class='full-width full-height'>"+self.content+"</textarea></form>";
	}

	var discard = function (e) {
		self.buttonSet = [buttons.edit];
		self.articleContent.innerHTML = self.content;
	}

	var save = function(e) {
		self.buttonSet = [buttons.edit];
		discard(e);
		/*$.post(collection + '/' + id, {
			article: $('#contentForm').val();
		});*/
	}

	var buttons = {
		edit: {clickFunction: edit, name: 'edit'},
		discard: {clickFunction: discard, name: 'discard'},
		save: {clickFunction: discard, name: 'save'}
	}
	
	var updatePage = function (collection, id, action) {
		if (collection == 'new') {

		} else {
			$.get(collection + '/' + id)
			.done(function(res, status) { self.update(res); })
			.error(function(res, status) {/*serve 500*/});
		}
	};
	
	this.buttonSet = [buttons.edit];
	riot.route.exec(updatePage);
	riot.route(updatePage);
	
</wiki-article>