$(document).ready(function() {
	attachListeners();   
});


function Chore(attributes) {
	this.description = attributes.description;
	this.point_value = attributes.point_value;
	this.household_name = attributes.household_name;
	this.id = attributes.id;
}

Chore.prototype.formatDescription = function() {
	pointString = "<p>Point Value: " + this.point_value + ", "
	homeString = "Belongs to Household: " + this.household_name + "</p>"
	descriptionString = pointString + homeString
	return descriptionString
}

function attachListeners () {
	$('.js-more').on('click', function (e) {
 		e.preventDefault();
 		var id = $(this).data("id");

   		$.get("/chores/" + id + ".json", function(data) {
   			var chore = new Chore(data);
   			descriptionText = chore.formatDescription()
   			$("#chore-" + id).html(descriptionText);
   		});
	})
}



