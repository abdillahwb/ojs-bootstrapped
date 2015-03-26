// actions to close and open offcanvas menu
$(document).ready(function() {
  $('[data-toggle=offcanvas]').click(function() {
    $('.row-offcanvas').toggleClass('active');
    $('.showhide').toggle();
    $('#main, #breadcrumb').toggleClass('transparent');
  });
  $('html').click( function(e) {
	    if ($(e.target).closest('.mobile').length === 0 && $('.row-offcanvas').hasClass('active') && !$(e.target).closest('div').hasClass('sidebar-nav')) {
	    	$('.row-offcanvas').toggleClass('active');
			$('.showhide').toggle();
			$('#main, #breadcrumb').toggleClass('transparent');
	    }
	});
});
