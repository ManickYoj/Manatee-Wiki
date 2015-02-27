<article-header>
	<div class="row full-width md-padding">
		<div class="col-md-6">
			<h4>{opts.header.title}</h3>
		</div>
		<div class="col-md-1 col-md-offset-5">
			<button class="waves-effect waves-button full-width" onclick={ edit }>
				edit
			</button>
		</div>
	</div>



	edit(e) {
		$.get(window.location.href+'/edit')
	}

</article-header>