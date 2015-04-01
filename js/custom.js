// actions to close and open offcanvas menu
$(document).ready(function() {
  $('[data-toggle=offcanvas]').click(function() {
    $('.row-offcanvas').toggleClass('active');
    $('.showhide').toggle();
    $('#main, #breadcrumb').toggleClass('transparent');
  });
  $('html').click( function(e) {
	    if ($(e.target).closest('.visible-xs').length === 0 && $('.row-offcanvas').hasClass('active') && !$(e.target).closest('div').hasClass('sidebar-nav')) {
	    	$('.row-offcanvas').toggleClass('active');
			$('.showhide').toggle();
			$('#main, #breadcrumb').toggleClass('transparent');
	    }
	});
});

/* JavaScript Media Queries */
// $(document).ready(function() {
// 	if (matchMedia) {
// 		var mq = window.matchMedia("(max-width: 767px)");
// 		mq.addListener(WidthChange);
// 		WidthChange(mq);
// 	}


	// media query change
// 	function WidthChange(mq) {
// 		if (mq.matches) {
// 			$('#copySubmissionEmail').removeClass('input-group-addon');
// 		}
// 		else {
// 			if (!$('#copySubmissionEmail').hasClass('input-group-addon')) {
// 				$('#copySubmissionEmail').addClass('input-group-addon');
// 			}
// 		}
// 
// 	}
// });

