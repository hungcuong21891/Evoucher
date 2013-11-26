// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require_tree .

//= require bootstrap

// jQuery('ul.nav li.dropdown').hover(function() {
//   jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn();
// }, function() {
//   jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut();
// });



$(document).ready(function(){
//click on button instead of typing in search input
  $("input.key").click(function(){
  	q = $(this).val();
   	$("input.search-form").attr("value", q);
  });

  //change status of input signin form
  $("input#email-signin")
  	.focus(function(){
  		$(this).removeClass("notactive");
  		$("img#email-image").attr("src","/assets/sign-in.png");

  	})
  	.focusout(function(){
  		$(this).addClass("notactive");
  		$("img#email-image").attr("src","/assets/sign-in-notactive.png");


  	});

  $("input#password-signin")
  	.focus(function(){
  		$(this).removeClass("notactive");
  		$("img#password-image").attr("src","/assets/password.png");
  		$("input#email-signin").addClass("notactive")
  	})
  	.focusout(function(){
  		$(this).addClass("notactive");
  		$("img#password-image").attr("src","/assets/password-notactive.png");
  	});  

   
  	
  	
});