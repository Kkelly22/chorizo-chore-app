$(document).ready(function() {
   attachListeners();

   
});


function Chore(attributes) {
	this.description = attributes.description;
	this.point_value = attributes.point_value;
	this.household_name = attributes.household_name;
	this.id = attributes.id;
	debugger;
}


$(function() {
	Chore.templateSource = $("#chores-template").html();
	Chore.template = Handlebars.compile(Chore.templateSource);
})



Chore.prototype.renderIndex = function () {
	debugger;
	return Chore.template(this)
}



function attachListeners () {
	$('#myTab li:nth-child(3) a').on('click', function (e) {
  		e.preventDefault();
    	$.get("/chores" + ".json", function(data) {
    		var chore = new Chore(data[0]);
    		debugger;
    		var choreIndex = chore.renderIndex();
    		debugger;
    		$("ul.chore-list").append(choreIndex);
    	});
	})

}


