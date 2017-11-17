/* Theme Name: Phozer
   Author:Harry
   Author e-mail: harrynworld@gmail.com
   Version: 1.0.0
   Created:February 2015
   File Description:Main JS file of the template
*/


/* ------------------------------------------------------------------------------
 This is jquery module for main app
 ------------------------------------------------------------------------------ */
//var $ = jQuery.noConflict(); //Relinquish jQuery's control of the $ variable. 

/* Global constants */

/*global jQuery */
jQuery(function ($) {
    'use strict';

    /**
     * Contact Form Application
     */
    var ContactFormApp = {
        $contactForm: $("#ajax-form"),
        $contactFormBtn: $("#send"),
        $contactFormName: $("#name2"),
        $contactFormEmail: $("#email2"),
        $contactFormMessage: $("#message2"),
        $confirmMessage: $("#ajaxsuccess"),
        $errorMessages: $(".error"),
        $errorName: $("#err-name"),
        $errorEmail: $("#err-emailvld"),
        $errorMessage: $("#err-message"),
        $errorForm: $("#err-form"),
        $errorTimeout: $("#err-timedout"),
        $errorState: $("#err-state"),

        //Validate Contact Us Data
        validate: function () {
            var error = false; // we will set this true if the form isn't valid

            var name = this.$contactFormName.val(); // get the value of the input field
            if(name == "" || name == " " || name == "Name") {
                this.$errorName.show(500);
                this.$errorName.delay(4000);
                this.$errorName.animate({
                    height: 'toggle'  
                }, 500, function() {
                    // Animation complete.
                }); 
                error = true; // change the error state to true
            }

            var email_compare = /^([a-z0-9_.-]+)@([da-z.-]+).([a-z.]{2,6})$/; // Syntax to compare against input
            var email = this.$contactFormEmail.val().toLowerCase(); // get the value of the input field

            if (email == "" || email == " " || email == "E-mail") { // check if the field is empty
                this.$contactFormEmail.fadeIn('slow'); // error - empty
                error = true;
            }
            else if (!email_compare.test(email)) { // if it's not empty check the format against our email_compare variable
                this.$errorEmail.show(500);
                this.$errorEmail.delay(4000);
                this.$errorEmail.animate({
                    height: 'toggle'  
                }, 500, function() {
                    // Animation complete.
                });         
                error = true;
            }

            var message = this.$contactFormMessage.val(); // get the value of the input field
            
            if(message == "" || message == " " || message == "Message") {              
                this.$errorMessage.show(500);
                this.$errorMessage.delay(4000);
                this.$errorMessage.animate({
                    height: 'toggle'  
                }, 500, function() {
                    // Animation complete.
                });            
                error = true; // change the error state to true
            }

            if(error == true) {
                this.$errorForm.show(500);
                this.$errorForm.delay(4000);
                this.$errorForm.animate({
                    height: 'toggle'  
                }, 500, function() {
                    // Animation complete.
                }); 
            }

            return error;
        },
        //contact form submit handler
        contactFormSubmit: function (obj) {
            this.$errorMessages.fadeOut('slow'); // reset the error messages (hides them)

            if(this.validate() == false) {

                var data_string = $('#ajax-form').serialize(); // Collect data from form

                var $this = this;
                $.ajax({
                    type: "POST",
                    url: $this.$contactForm.attr('action'),
                    data: data_string,
                    timeout: 6000,
                    error: function(request,error) {
                        if (error == "timeout") {
                            $this.$errorTimeout.slideDown('slow');
                        }
                        else {
                            $this.$errorState.slideDown('slow');
                            $this.$errorState.html('An error occurred: ' + error + '');
                        }
                    },
                    success: function() {
                        $this.$confirmMessage.show(500);
                        $this.$confirmMessage.delay(4000);
                        $this.$confirmMessage.animate({
                            height: 'toggle'  
                            }, 500, function() {
                        });    
                        
                        $this.$contactFormName.val('');
                        $this.$contactFormEmail.val('');
                        $this.$contactFormMessage.val('');
                    }
                });
            }
            return false;
        },
        bindEvents: function () {
            //binding submit event
            this.$contactFormBtn.on('click', this.contactFormSubmit.bind(this));
        },
        init: function () {
            //initializing the contact form
            console.log('Contact form is initialized');
            this.bindEvents();
            return this;
        }
    };

    /**
        Main application module
    */
    var App = {
        $options: {},
        $backToTop: $(".back-to-top"),
        $nav: $("nav"),
        $counterProject: $("#counter-pro"),
        $counterClient: $('#counter-client'),
        $counterWork: $('#counter-works'),
        $counterAward: $('#counter-award'),
        $loader: $(".loader"),
        $animationload: $(".animationload"),
        $navbarLink: $('.navbar-nav a'),
        $testiSlider: $("#testi-carousel"),
        $homeSlider: $("#main-home-carousel"),

        bindEvents: function () {
            //binding events
            $(window).on('scroll', this.scroll.bind(this));
            $(document).on('ready', this.docReady.bind(this));
        },
        //window scroll event
        scroll: function (event) {
            if ($(window).scrollTop() > 100) {
                this.$backToTop.fadeIn();
            } else {
                this.$backToTop.fadeOut();
            }

            if ($(window).scrollTop() > 80) {
                this.$nav.addClass('small');
            } else {
                this.$nav.removeClass('small'); 
            }
        },

        
        //document ready event
        docReady: function () {
            //contat form
            ContactFormApp.init();

            /*-------------------------------------------------*/
			/* =  portfolio isotope
			/*-------------------------------------------------*/

			var winDow = $(window);
			// Needed variables
			var $container=$('.portfolio-box');
			var $filter=$('.filter');

			try{
				$container.imagesLoaded( function(){
					$container.show();
					$container.isotope({
						filter:'*',
						layoutMode:'masonry',
						animationOptions:{
							duration:750,
							easing:'linear'
						}
					});
				});
			} catch(err) {
			}

			winDow.bind('resize', function(){
				var selector = $filter.find('a.active').attr('data-filter');

				try {
					$container.isotope({ 
						filter	: selector,
						animationOptions: {
							duration: 750,
							easing	: 'linear',
							queue	: false,
						}
					});
				} catch(err) {
				}
				return false;
			});
			
			// Isotope Filter 
			$filter.find('a').click(function(){
				var selector = $(this).attr('data-filter');

				try {
					$container.isotope({ 
						filter	: selector,
						animationOptions: {
							duration: 750,
							easing	: 'linear',
							queue	: false,
						}
					});
				} catch(err) {

				}
				return false;
			});


			var filterItemA	= $('.filter li a');

			filterItemA.on('click', function(){
				var $this = $(this);
				if ( !$this.hasClass('active')) {
					filterItemA.removeClass('active');
					$this.addClass('active');
				}
			});

			/*-------------------------------------------------*/
			/* =  preloader function
			/*-------------------------------------------------*/
			var body = $('body');
			body.addClass('active');

			winDow.load( function(){
				var mainDiv = $('#container'),
					preloader = $('.preloader');

					preloader.fadeOut(400, function(){
						mainDiv.delay(400).addClass('active');
						body.delay(400).css('background', '#b4b7b8');
					});
			});

			
			/*-------------------------------------------------*/
			/* =  header height fix
			/*-------------------------------------------------*/
			var content = $('#content');
			content.imagesLoaded( function(){
				var bodyHeight = $(window).outerHeight(),
				containerHeight = $('.inner-content').outerHeight(),
				headerHeight = $('header');

				if( bodyHeight > containerHeight ) {
					headerHeight.css('height',bodyHeight);
				} else {
					headerHeight.css('height',containerHeight);	
				}
			});

			winDow.bind('resize', function(){
				var bodyHeight = $(window).outerHeight(),
				containerHeight = $('.inner-content').outerHeight(),
				headerHeight = $('header');

				if( bodyHeight > containerHeight ) {
					headerHeight.css('height',bodyHeight);
				} else {
					headerHeight.css('height',containerHeight);	
				}
			});


			/* ---------------------------------------------------------------------- */
			/*	menu responsive
			/* ---------------------------------------------------------------------- */
			var menuClick = $('a.elemadded'),
				navbarVertical = $('.menu-box');
				
			menuClick.on('click', function(e){
				e.preventDefault();

				if( navbarVertical.hasClass('active') ){
					navbarVertical.slideUp(300).removeClass('active');
				} else {
					navbarVertical.slideDown(300).addClass('active');
				}
			});

			winDow.bind('resize', function(){
				if ( winDow.width() > 768 ) {
					navbarVertical.slideDown(300).removeClass('active');
				} else {
					navbarVertical.slideUp(300).removeClass('active');
				}
			});

		        },
		        init: function (_options) {
		            $.extend(this.$options, _options);
		            this.bindEvents();
		        }
		    };

		    //Initializing the app
		    App.init({});

});

