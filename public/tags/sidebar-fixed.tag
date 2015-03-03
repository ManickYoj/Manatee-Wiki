<sidebar-fixed>

	<div class="center md-padding">
	<img id="swimming-manatee" src="http://rs267.pbsrc.com/albums/ii293/lpscollect/manatee.gif~c200"></img>
</div>

	<h1 class="center">Articles: </h1>

	<div class="center">
		<form id="searchForm" onsubmit={ search }>
			<input type="text" id="searchBar" placeholder="Search articles..."></input>
			<input type="submit" class="waves-effect waves-button" id="search-button" value="->"></input>
		</form>
	</div>

	<hr class="h-line"></hr>
	<a class="waves-effect waves-button full-width" href="#new">
		Write New Article
	</a>
	<hr class="h-line"></hr>

	var self = this;

	search(e) {
		console.log('test');
		riot.route('article/'+ self.searchBar.value);
	}

</sidebar-fixed>