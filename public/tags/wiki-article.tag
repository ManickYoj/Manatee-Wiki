<wiki-article>
	<div if={ newMode && !editMode } class="row">
		<div class="col-md-12 md-padding center-text">
			<h3> New Page Request Deleted. </h3>
		</div>
	</div>

	<!-- Article Header -->
	<div if={ title } if={ !(newMode && !editMode) } id="articleHeader" class="row full-width">

		<!-- Title -->
		<div class="col-md-6">
			<h4 if={ !editMode } id='articleTitle'>{ title }</h4>

			<input if={ editMode } id='titleField' value={ title } />
		</div>

		<!-- Toolbar -->
		<div id="toolbar" class="col-md-2 col-md-offset-4">
			<button if={ !editMode } class='waves-effect waves-button pull-right md-padding' onclick={ toggleEdit }>edit
			</button>

			<button if={ editMode } class='waves-effect waves-button pull-right md-padding' onclick={ toggleEdit }>
				discard
			</button>
			<button if={ editMode } class='waves-effect waves-button pull-right md-padding' onclick={ save }>
				save
			</button>
		</div>

	</div>

	<!-- Content -->
	<div if={ !(newMode && !editMode) } class="row full-height col-md-12 full-height">
		<div if={ !editMode } id='articleContent' class="col-md-12 full-height md-padding">
			{ content }
		</div>

		<textarea if={ editMode } id='contentField' class='col-md-12 full-height md-padding'>
			{ content }
		</textarea>
	</div>

	var self = this;

	toggleEdit (e) {
		this.editMode = !this.editMode;
	}

	save (e) {
		riot.update();

		var postURI = 'article/' + self.title;
		if (self.newMode) postURI = 'article';

		$.post(postURI, {
			title: self.titleField.value,
			content: self.contentField.value
		}).done(function () {
			riot.route('article/' + self.titleField.value);
		});		

		self.title = self.titleField.value;
		self.content = self.contentField.value;
	}
	
	// ----- Route Handling
	function getArticle (id) {
		$.get('article/' + id)
		.done(function(res, status) { self.update(res); })
		.error(function(res, status) {/*serve 500*/});
	}

	var route = function (collection, id, action) {
		if (collection == 'new') {
			self.update({
				title: 'New Page',
				content: 'Content goes here.'
			})
			self.newMode = true;
			self.editMode = true;
		} 
		else getArticle(id);
	}

	// Listen for route changes
	riot.route.exec(route);
	riot.route(route);
	
</wiki-article>