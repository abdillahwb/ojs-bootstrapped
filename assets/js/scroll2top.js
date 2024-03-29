// Show and hide the button
$(function(){

	$(document).on( 'scroll', function(){

		if ($(window).scrollTop() > 100) {
			$('.scroll-top__wrapper').addClass('show');
		} else {
			$('.scroll-top__wrapper').removeClass('show');
		}
	});
});
// Scroll to Top
$(function(){

	$(document).on( 'scroll', function(){

		if ($(window).scrollTop() > 100) {
			$('.scroll-top__wrapper').addClass('show');
		} else {
			$('.scroll-top__wrapper').removeClass('show');
		}
	});

	$('.scroll-top__wrapper').on('click', scrollToTop);
});

function scrollToTop() {
	verticalOffset = typeof(verticalOffset) != 'undefined' ? verticalOffset : 0;
	element = $('body');
	offset = element.offset();
	offsetTop = offset.top;
	$('html, body').animate({scrollTop: offsetTop}, 500, 'linear');
}
