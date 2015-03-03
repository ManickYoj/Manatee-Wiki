<sidebar-fixed>

	<div class="center md-padding">
	<img id="swimming-manatee" src="http://rs267.pbsrc.com/albums/ii293/lpscollect/manatee.gif~c200"></img>
</div>

	<h1 class="center">Articles: </h1>

	<div class="center">
		<form id="searchForm">
			<input type="text" id="searchBar" placeholder="Search articles..."></input>
			<input type="submit" class="waves-effect waves-button" onclick="riot.route('article/'+self.searchBar.value);" value="->"></input>
		</form>
	</div>

	<hr class="h-line"></hr>
	<button class="waves-effect waves-button full-width">
		Write New Article
	</button>
	<hr class="h-line"></hr>

	var self = this;

</sidebar-fixed>