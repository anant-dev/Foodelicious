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
		<nav class="orange darken-4">
			<div class="nav-wrapper container">
				<a href="home" class="brand-logo "> 	Foodelicious </a>
				<ul id="nav-mobile" class="right hide-on-med-and-down">
					<li id="navSignup"><a class="modal-trigger" href="#modal1">Menu</a></li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="blue-grey lighten-2">
	 <div class="container" style="margin-bottom :20px">
		<div class="card center">
            <h4 class="pink-text text-darken-2" style="font-size: 30px"><b>Order Details :</b></h4>
		<div class="row" id="selected_dish">

		</div>
		</div>
	</div>
	<div id="parent">
	 <div class="container" style="margin-bottom :20px">
		<div class="card center">
            <h4 class="pink-text text-darken-2" style="font-size: 30px"><b>Personal Details :</b></h4>
			<div class="row">
            <form class="col s8 offset-s2">
                <div class="row">
                    <div class="input-field col s12">
                        <input id="name" type="text" class="validate " name='name'>
                        <label for="name">Name *</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="email" type="email" class="validate" name='email'>
                        <label for="email">Email *</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="contact" type="number" class="validate" name='contact'>
                        <label for="contact">Contact Number *</label>
                    </div>
                </div>
               <div class="row">
                    <div class="input-field col s12">
                        <input id="address" type="text" class="validate " name='address'>
                        <label for="address">Address *</label>
                    </div>
                </div>
                <br>
				<div class="row">
                    <div class="col s6">
                        <button class="btn waves-effect waves-light light-blue darken-4 z-depth-2 modal-trigger" data-target="user_modal" style="margin-left: 30px">Already a Member
                        	<i class="fa fa-fighter-jet right" aria-hidden="true"></i>
                    	</button>
                    </div>
					<div class="col s6">
                        <button class="btn waves-effect waves-light light-blue darken-4 z-depth-2"  id="confirm" style="margin-left: 30px"> Confirm Order
                        	<i class="fa fa-fighter-jet right" aria-hidden="true"></i>
                    	</button>
                    </div>
                </div>
                <br>
            </form>
			</div>
			</div>
       </div>
`</div>
 <input type="hidden" id="user_id" value="0">
 <div id="user_modal" class="modal" style=" padding :20px" >
            <h5 class="light-blue-text text-darken-4 center" style="font-size: 22px"><b> User Details </b></h5>
            <div class="row">
                <div class="input-field col s8 offset-s2">
                    <input id="gemail" type="text" class="validate" name="gemail" required>
                    <label for="gemail">Email Address :</label>
                </div>
            </div>
            <div class="row" >
                <div class="center col s12">
                    <button class="btn waves-effect waves-light light-blue darken-4 z-depth-2" id="get_details">Get My Details
                        <i class="fa fa-rocket right" aria-hidden="true"></i></button>
                </div>
            </div>
            <br>

  </div>

</div>
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

		<input type="hidden" id="dish_id" value="1">

	<script type="text/javascript">
	 			$(document).ready(function(){
	 			getDish();

			});
		</script>

</body>
</html>