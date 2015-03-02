<wiki-article>
	<div id="article-header" class="row full-width md-padding">
		<div class="col-md-6">
			<h4>{ title }</h3>
		</div>
		<div class="col-md-2 col-md-offset-4">
			<button class='waves-effect waves-button pull-right' each={ buttonSet } onclick={ clickFunction }>{name}</button>
		</div>
	</div>
	<div id="article-content" class="full-width md-padding">
		{ content }
	</div>

	var self = this;
	$articleContent = $('#article-content');

	var edit = function(e) {
		self.buttonSet = [buttons.discard, buttons.save];
		$articleContent.html($articleContent.html());
	}

	var discard = function (e) {
		self.buttonSet = [buttons.edit];
	}

	var save = function(e) {
		self.buttonSet = [buttons.edit];
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
		$.get(collection + '/' + id)
		.done(function(res, status) { self.update(res); })
		.error(function(res, status) {/*serve 500*/});
	};
	
	this.buttonSet = [buttons.edit];
	riot.route.exec(updatePage);
	riot.route(updatePage);
	
</wiki-article>