$(document).ready(function() {
	attachListeners();   
});


function Chore(attributes) {
	this.description = attributes.description;
	this.point_value = attributes.point_value;
	this.household_id = attributes.household_id;
	this.id = attributes.id;
}

function attachListeners () {
	$('.js-more').on('click', function (e) {
 		e.preventDefault();
 		var id = $(this).data("id");

   		$.get("/chores/" + id + ".json", function(data) {
   			var chore = new Chore(data);
	   		var descriptionText = "<p>Point Value: " + chore.point_value + "</p>"
   			$("#chore-" + id).html(descriptionText);
   		});
	})
}



