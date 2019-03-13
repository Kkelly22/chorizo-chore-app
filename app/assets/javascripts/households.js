$(document).ready(function() {
	attachHouseholdListeners();   
});


function Household(attributes) {
	this.name = attributes.name;
	this.address = attributes.address;
	this.chores = attributes.chores;
	this.id = attributes.id;
}

Household.prototype.formatHousehold = function() {
}

function attachHouseholdListeners () {
	$('.js-chores').on('click', function (e) {
 		e.preventDefault();
 		var id = $(this).data("id");

   		$.get("/households/" + id + ".json", function(data) {
   			var household = new Household(data);
   			for (var i = 0; i < household.chores.length; i++) {
   				var nameString = "<p>Name: " + household.chores[i].description + ", "
  				var pointString = "<p>Point Value: " + household.chores[i].point_value + ", "
				var homeString = "Belongs to Household: " + household.chores[i].household_name + "</p>"
				var descriptionString = nameString + pointString + homeString + "</br>"
				$("#household-" + id + "-chores").append(descriptionString);
			}
   		});
	})
}