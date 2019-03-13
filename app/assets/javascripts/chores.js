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
	return "<p>Point Value: " + this.point_value + ", " +
			"Belongs to Household: " + this.household_name + "</p>" 
}


Chore.prototype.formatFullChore = function() {
	return "<label>Description:</label> " + this.description + "<br>" + 
		"<label>Point Value:</label> " + this.point_value + "<br>" +
		"<label>Household:</label> " + this.household_name + "<br>" 
}


function attachChoreListeners () {
	$('.js-more').on('click', function (e) {
 		e.preventDefault();
 		let id = $(this).data("id");
   		$.get("/chores/" + id + ".json", function(data) {
   			let chore = new Chore(data);
   			$("#chore-" + id).html(chore.formatChore());
   		});
	})


	$('#js-next').on('click', function (e) {
 		e.preventDefault();
 		let nextId = parseInt($("#js-next").attr("data-id")) + 1;
   		$.get("/chores/" + nextId + ".json", function(data) {
   			let chore = new Chore(data);
   			$("#chore-descrip").html(chore.formatFullChore());
   			$("#js-next").attr("data-id", nextId);
   		});
	})



   	$('form').submit(function(event) {
    	event.preventDefault();
      	var values = $(this).serialize();
      	var posting = $.post('/chores', values);
     	posting.done(function(data) {
        	var chore = data;
        	$("#choreDescription").text(chore["description"]);
        	$("#chorePointValue").text(chore["point_value"]);
       		$("#choreHousehold").text(chore["household_name"]);
      	});
    });

}



