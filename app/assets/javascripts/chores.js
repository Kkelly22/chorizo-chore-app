$(document).ready(function() {
   attachListeners();
});


function attachListeners () {
 	$('#myTab li:nth-child(2) a').on('click', function (e) {
  		e.preventDefault()
  		alert("My Chores clicked!");
	})

	$('#myTab li:nth-child(3) a').on('click', function (e) {
  		e.preventDefault()
  		alert("All Chores clicked!");
	})

	$('#myTab li:nth-child(4) a').on('click', function (e) {
  		e.preventDefault()
  		alert("Manage Households clicked!");
	})
}