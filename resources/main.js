/**
 * 
 */
$(document).ready(function(){
      $('.parallax').parallax();
    });
   

function showDishes(data) {
    $.each(data.dishes, function (idx, obj) {
        $('#dishes').append('<div class="col s12 m7">\n\
							    <h2 class="header">Horizontal Card</h2>\n\
							    <div class="card horizontal">\n\
							      <div class="card-image">\n\
							        <img src="">\n\
							      </div>\n\
							      <div class="card-stacked">\n\
							        <div class="card-content">\n\
							          <h4>'+obj.dish_name+'</h4>\n\
							          <p>'+obj.details+'</p>\n\
							          <p> Dish For ='+obj.dish_for+', type ='+obj.type+' , Price ='+obj.price+' </p>\n\
							        </div>\n\
							        <div class="card-action">\n\
							          <a href="checkout.cfm?id='+obj.dish_id+'">This is a link</a>\n\
							        </div>\n\
							      </div>\n\
							    </div>\n\
							  </div>');
							});
		}

function showOrderedDish(data){
	$('#selected_dish').empty();
	$('#selected_dish').append('<div class="col s4 m4 l4 center">\n\
                    <div class="card z-depth-5" style="margin:10px">\n\
                        <div class="card-image " style="height : 300px;">\n\
                            <img src="resources/images/dish1.jpg" style="height : 300px">\n\
                        </div>\n\
                    </div>\n\
			</div>\n\
			<div class="col s8">\n\
                    <div class="card z-depth-5" style="margin:10px ;height : 300px;">\n\
						<div class="card-content">\n\
							<span class="card-title activator grey-text text-darken-4">'+data.dish_name+'</span>\n\
							<p id="description">'+data.details+'</p>\n\
							<p id="price" style="font-size: 25px;">'+data.price+' <span class="unit" style="font-size: 12px;"> RS</span>\n\
							<span id="type">'+data.type+'</span>\n\
							<p id="dish_for" style="font-size: 25px;">'+data.dish_for+'</p><span class="unit" style="font-size: 12px;"> People</span>\n\
						</div>\n\
                    </div>\n\
		</div>');
}

$('#get_details').click(function (event) {
	var email = $('#gemail').val();
	$.ajax({
	      type:"GET",
	      dataType:"json",
	      url:"main.cfc?method=getUserByEmail",
	      data:{
	      	email: email
	      },
	      success: function(data) {
	    	  $('#user_modal').modal('close');
	    	  $('#gemail').val("");
	    	  if(data.status === "successful"){
	    		  Materialize.toast(data.message, 4000);
	    		  setData(data);
	    	  }else{
	    		  Materialize.toast(data.message, 4000);
	    	  }
	      }
	  });

});

function setData(data){
	$('#name').val(data.name);
	$('#email').val(data.email);
	$('#contact').val(data.contact);
	$('#address').val(data.address);
	$('#user_id').val(data.user_id);
	$('#email').prop("disabled", true);
	$('#contact').prop("disabled", true);
}



$('#confirm').click(function (event) {
	debugger;
	var name = $('#name').val();
	var email = $('#email').val();
	var contact = $('#contact').val();
	var address = $('#address').val();
	$.ajax({
	      type:"GET",
	      dataType:"json",
	      url:"main.cfc?method=userCheck",
	      data:{
	    	name: name,
	    	email:email,
	    	contact:contact,
	    	address:address
	      },
	      success: function(data) {
	    	  alert("in"+data.message);
	    		  Materialize.toast(data.message, 4000);
	    		  placeOrder(data.user_id);
	      }
	  });

});

function placeOrder(id){
	debugger;
	var user_id= id;
	var dish_id= $('#dish_id').val();
	$.ajax({
	      type:"GET",
	      dataType:"json",
	      url:"main.cfc?method=placeOrder",
	      data:{
	    	user_id: user_id,
	    	dish_id: dish_id,
	      },
	      success: function(data) {
	    	  alert("id"+data.message);
	    	 $('#parent').empty();
	    	 $('#parent').append('<h3> Successfully Placed Order. Your Order ID is : '+data.order_id+' </h3>');
	      }
	  });
}

function getDish(){
	var dish_id = $('#dish_id').val();
		$('.modal').modal();
	$.ajax({
	      type:"GET",
	      dataType:"json",
	      url:"main.cfc?method=getDishById",
	      data:{
	      	id:dish_id
	      },
	      success: function(data) {
	      	showOrderedDish(data);
	      }
	  });
}









