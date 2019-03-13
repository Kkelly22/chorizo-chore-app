$(document).ready(function() {
	attachChoreListeners();   
});


function Chore(attributes) {
	this.description = attributes.description;
	this.point_value = attributes.point_value;
	this.household_name = attributes.household_name;
	this.id = attributes.id;
}

Chore.prototype.formatChore = function() {
	pointString = "<p>Point Value: " + this.point_value + ", "
	homeString = "Belongs to Household: " + this.household_name + "</p>"
	descriptionString = pointString + homeString
	return descriptionString
}

Chore.prototype.formatFullChore = function() {
	descrip = "<label>Description:</label> " + this.description + "<br>"
	value = "<label>Point Value:</label> " + this.point_value + "<br>"
	home = "<label>Household:</label> " + this.household_name + "<br>"
	return descrip + value + home
}

function attachChoreListeners () {
	$('.js-more').on('click', function (e) {
 		e.preventDefault();
 		var id = $(this).data("id");
   		$.get("/chores/" + id + ".json", function(data) {
   			var chore = new Chore(data);
   			descriptionText = chore.formatChore()
   			$("#chore-" + id).html(descriptionText);
   		});
	})


	$('#js-next').on('click', function (e) {
 		e.preventDefault();
 		//var nextId = $(this).data("id") + 1;
 		var nextId = parseInt($("#js-next").attr("data-id")) + 1;
   		$.get("/chores/" + nextId + ".json", function(data) {
   			var chore = new Chore(data);
   			descriptionText = chore.formatFullChore()
   			$("#chore-descrip").html(descriptionText);
   			$("#js-next").attr("data-id", nextId);
   		});
	})

}



