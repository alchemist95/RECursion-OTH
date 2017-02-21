// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require toastr_rails


$(document).ready(function() {

	$("#myAnswer").click(function(){
		event.preventDefault();
	 	$.ajax({
	 		type: 'POST',
	 		url: '/abdv',
	 		dataType: "json",
	 		data: {"myAnswer" : $("#myAnswerText").val()},
	 		success: function(data){
				if (data["Score"] == -1){
					$("#myResult").html("Incorrect");
				}
				else if(data["Statement"] == "XXX"){
					var myScore = data["Score"];
					var myLevel = myScore/10 + 1;
					$("#userPro").find("#myScore").text(myScore);
					$("#userPro").find("#myLevel").text(myLevel);
					$("#hunt").hide();				
					$("#myResult").html("Correct!! Wait for further questions!!");
				}
				else{
					var statement = data["Statement"];
					var image = data["Image"];
					var myScore = data["Score"];
					var myLevel = myScore/10 + 1;
					var h2 = $("#myQuestion").find("h2");
					$("#myQuestion").find("span").hide();
					$(h2).text(statement);
					$("#myQuestion").append('<span><img src=\"/images/'+image+'\"></span>');
					$("#userPro").find("#myScore").text(myScore);
					$("#userPro").find("#myLevel").text(myLevel);
					$("#myResult").html("Correct");
				}
				document.getElementById("answerForm").reset();
	 		},
	 		error: function(){
	 			alert("Failure!");
	 		}
	 	})
	 });
});
