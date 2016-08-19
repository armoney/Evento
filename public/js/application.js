$(document).ready(function() {
	bindListeners()	

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});


var bindListeners = function(){
	showEventFormListener();
	submitEventFormListener();
	addContactFormListener();
	submitContactFormListener()
}


function showEventFormListener(){
	$('.new-event').children('a').on('click', function(event){
		event.preventDefault();
		
		var that = 	this;
		var address = $(this).attr('href')
		
		var request = $.ajax({
			url: address,
		});

		request.done(function(response_data){
			$('.new-event').append(response_data);
			$(that).remove();
		});

	});
}

function submitEventFormListener(){
	$('.new-event').on('submit', '.register', function(event){
		event.preventDefault();

		var that = this;
		var method = 'POST';
		var address = $(that).attr('action')

		var request = $.ajax({
			url: address,
			type: method,
			data: $(that).serialize()
		});

		request.done(function(response_data){
			$('.user-events').append(response_data);
			$(that).remove();
		});


	});
}

function addContactFormListener(){
	$('.add-contacts').children('a').on('click', function(event){
		event.preventDefault();
		
		var that = 	this;
		var address = $(this).attr('href')
		
		var request = $.ajax({
			url: address,
		});

		request.done(function(response_data){
			$('.add-contacts').append(response_data);
		});

	});
}

function submitContactFormListener(){
	$('.add-contacts').on('submit', '.new-contact', function(event){
		event.preventDefault();

		var that = this;
		var method = 'POST';
		var address = $(that).attr('action')

		var request = $.ajax({
			url: address,
			type: method,
			data: $(that).serialize()
		});

		request.done(function(response_data){
			$('.contacts').append(response_data);
			$(that).remove();
		});


	});
}

