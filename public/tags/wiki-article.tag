<wiki-article>
	<!-- Article Header -->
	<div if={ title } id="articleHeader" class="row full-width md-padding">

		<!-- Title -->
		<div class="col-md-6">
			<h4 if={ !editMode } id='articleTitle' class='md-padding'>{ title }</h4>

			<input if={ editMode } id='titleField' value={ title } />
		</div>

		<!-- Toolbar -->
		<div id="toolbar" class="col-md-2 col-md-offset-4">
			<button if={ !editMode } class='waves-effect waves-button pull-right' onclick={ toggleEdit }>edit
			</button>

			<button if={ editMode } class='waves-effect waves-button pull-right' onclick={ toggleEdit }>
				discard
			</button>
			<button if={ editMode } class='waves-effect waves-button pull-right' onclick={ save }>
				save
			</button>
			
		</div>

	</div>

	<!-- Content -->
	<div class="row md-padding full-height col-md-12 full-height">
		<div if={ !editMode } id='articleContent' class="col-md-12 full-height">
			{ content }
		</div>

		<textarea if={ editMode } id='contentField' class='col-md-12 full-height'>
			{ content }
		</textarea>
	</div>

	var self = this;

	toggleEdit (e) {
		this.editMode = !this.editMode;
	}

	save (e) {
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
	
	// ----- Route Handling
	function getArticle (id) {
		$.get('article/' + id)
		.done(function(res, status) { self.update(res); })
		.error(function(res, status) {/*serve 500*/});
	}

	var route = function (collection, id, action) {
		if (collection == 'new') {
			self.title = 'New Page';
			self.content = "Content goes here.";
		} 
		else getArticle(id);
	}

	// Listen for route changes
	riot.route.exec(route);
	riot.route(route);
	
</wiki-article>