<sidebar-fixed>

	<div class="center md-padding">
	<img id="swimming-manatee" src="http://rs267.pbsrc.com/albums/ii293/lpscollect/manatee.gif~c200"></img>
</div>

	<h1 id="sidebar-title" class="center">Manatee Wiki!</h1>

	<div class="center md-padding">
		<form id="searchForm" onsubmit={ search }>
			<input type="text" id="searchBar" placeholder="Search articles..."></input>
			<input type="submit" id="search-button" value="->"></input>
		</form>
	</div>

	<hr class="h-line"></hr>
	<button class="waves-effect waves-button full-width">
		Write New Article
	</button>
	<hr class="h-line"></hr>

	var self = this;

	search(e) {
		console.log('test');
		riot.route('article/'+ self.searchBar.value);
	}

</sidebar-fixed>