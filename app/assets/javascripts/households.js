$(document).ready(function() {
	attachHouseholdListeners();   
});


function Household(attributes) {
	this.name = attributes.name;
	this.address = attributes.address;
	this.chores = attributes.chores;
	this.id = attributes.id;
}

function formatHousehold(householdChore) {
	return "<p>Name: " + householdChore.description + ", " + 
	"Point Value: " + householdChore.point_value + ", " +
	"Belongs to Household: " + householdChore.household_name + "</p>"
}

function formatHouse(household) {
	return '<li><a href="/households/' + household.id + '"">' + household.name + '</a><br>'
}

function attachHouseholdListeners () {
	$('.js-chores').on('click', function (e) {
 		e.preventDefault();
 		let id = $(this).data("id");

   		$.get("/households/" + id + ".json", function(data) {
   			let household = new Household(data);
   			$("#household-" + id + "-chores").html("");
   			for (let i = 0; i < household.chores.length; i++) {
				$("#household-" + id + "-chores").append(formatHousehold(household.chores[i]));
			}
   		});
	})


	$('#js-households').on('click', function (e) {
  		e.preventDefault()
  		$.get("/households" +  ".json", function(data) {
  			debugger;
  			$("#households").html("");
  			for (let i = 0; i < data.length; i++) {
  				let household = new Household(data[i]);
				$("#households").append(formatHouse(household));
			}
   		});
	})
}