<wiki-article>
	<!-- Article Header -->
	<div  if={ title && !(newMode && !editMode) } id="articleHeader" class="row full-width">

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
		<div if={ !editMode } class="col-md-12 full-height tr">
			{ content }
		</div>

		<textarea id='contentField' if={ editMode } class="col-md-12 full-height tr">
			{ content }
		</textarea>		
	</div>

	<!-- New Page Cancellation Notification -->
	<div if={ newMode && !editMode } class="row">
		<div class="col-md-12 md-padding center">
			<h3> New Page Request Deleted. </h3>
			<h3><small><a onclick={ toggleEdit }>Try Again?</a></small></h3>
		</div>
	</div>

	var self = this;

	toggleEdit (e) { self.editMode = !self.editMode; }

	save (e) {
		self.update();

		var postURI = 'article/' + self.title;
		if (self.newMode) postURI = 'article';

		$.post(postURI, {
			title: self.titleField.value,
			content: self.contentField.value
		}).done(function (data) {
			riot.route('article/' + self.titleField.value);
		});		
	}
	
	// ----- Route Handling
	function getArticle (id) {
		self.update({
			newMode: false,
			editMode: false
		});

		$.get('article/' + id)
		.done(function(res, status) { self.update(res); })
		.error(function(res, status) {/*serve 500*/});
	}

	var route = function (collection, id, action) {
		if (collection == 'new') newPage(); 
		else getArticle(id);
	}

	function newPage () {
		self.update({
			title: 'New Page',
			content: 'Content goes here.',
			newMode: true,
			editMode: true
		})
	}

	// Listen for route changes
	riot.route.exec(route);
	riot.route(route);
	
</wiki-article>