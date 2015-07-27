// actions to close and open offcanvas menu
$(document).ready(function() {

  $('#main').css('width', '90%');
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

  $('.sidebar__tray').click(function(){
      var sidebar_width = $('#rightSidebar').width();
      var main_width = $('#main').width();
    $('#sidebar').toggleClass('content--hide');
    if ($('#sidebar').hasClass('content--hide')) {
      $('#main').css('width', '90%');
    }
    else {
      $('#main').css('width', '58%');
    }
  });

    // Replace the no-js <a> with the buttons they wrap to enable native Bootstrap functionality
    $('#no-js-home').replaceWith($('#navbarToggle'));
    $('#no-js-search').replaceWith($('#searchBtn'));
    $('#no-js-notify').replaceWith($('#notifyBtn'));
    $('#no-js-sub').replaceWith($('#subscribeBtn'));

    //Add in the classes to display the off-canvas menu
    $('#canvas-sidebar').removeClass('col-md-12').addClass('col-xs-6 col-sm-3 sidebar-offcanvas showhide navbar-collapse');

    //hide sidebar if nothing is inside it but user block
    if ($('#rightSidebar').has('div.block').length === 1) {
      $('.sidebar__tray').css('display', 'none');
    }
});
