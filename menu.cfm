<!DOCTYPE html>
<html>
<head>
	<title>Foodelicious</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/style.css">
</head>
<body>
	<div class="navbar-fixed">
		<nav class="nav z-depth-0">
			<div class="nav-wrapper container">
				<a href="home" class="brand-logo "> 	Foodelicious </a>
				<ul id="nav-mobile" class="right hide-on-med-and-down">
					<li id="navSignup"><a class="modal-trigger" href="#modal1">Menu</a></li>
				</ul>
			</div>
		</nav>
	</div>
	<div id="dishes" class="container">
	</div>

	<p id="value"></p>



	<footer class="page-footer  blue-grey darken-4">
		<div class="container">
			<div class="row">
				<div class="col l6 s12">
					<h5 class="white-text">Footer Content</h5>
					<p class="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
				</div>
				<div class="col l4 offset-l2 s12">
					<h5 class="white-text">Links</h5>
					<ul>
						<li><a class="grey-text text-lighten-3" href="#!">Link 1</a></li>
						<li><a class="grey-text text-lighten-3" href="#!">Link 2</a></li>
						<li><a class="grey-text text-lighten-3" href="#!">Link 3</a></li>
						<li><a class="grey-text text-lighten-3" href="#!">Link 4</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="container">
				© 2014 Copyright Text
				<a class="grey-text text-lighten-4 right" href="#!">More Links</a>
			</div>
		</div>
	</footer>

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/1.1.1/typed.min.js"></script>
	<script src="resources/main.js"></script>
	<script type="text/javascript">
			$(document).ready(function(){
				debugger;
				$.ajax({
				      type:"GET",
				      url:"main.cfc?method=getDishes",
				      dataType:"json",
				      success: function(data) {
				      	//$('#value').html(JSON.stringify(data));
				      	showDishes(data);
				      }
				  });
			});
		</script>
</body>
</html>