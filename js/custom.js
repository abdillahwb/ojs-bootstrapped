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
  $('#sidebar-tab').click(function(){
    $('#sidebar').toggleClass('hide');
    var sidebar_width = $('#rightSidebar').width();
    var main_width = $('#main').width();
    if ($('#sidebar').hasClass('hide')) {
      $('#main').css('width', '90%');
    }
    else {
      $('#main').width(main_width - sidebar_width); 
    }
    // 
  });
    // Replace the no-js <a> with the buttons they wrap to enable native Bootstrap functionality
    $('#no-js-home').replaceWith($('#navbarToggle'));
    $('#no-js-search').replaceWith($('#searchBtn'));
    $('#no-js-notify').replaceWith($('#notifyBtn'));
    $('#no-js-sub').replaceWith($('#subscribeBtn'));

    //Add in the classes to display the off-canvas menu
    $('#canvas-sidebar').removeClass('col-md-12').addClass('col-xs-6 col-sm-3 sidebar-offcanvas showhide navbar-collapse');
});


/* JavaScript Media Queries */
// $(document).ready(function() {
//  if (matchMedia) {
//    var mq = window.matchMedia("(max-width: 767px)");
//    mq.addListener(WidthChange);
//    WidthChange(mq);
//  }


  // media query change
//  function WidthChange(mq) {
//    if (mq.matches) {
//      $('#copySubmissionEmail').removeClass('input-group-addon');
//    }
//    else {
//      if (!$('#copySubmissionEmail').hasClass('input-group-addon')) {
//        $('#copySubmissionEmail').addClass('input-group-addon');
//      }
//    }
// 
//  }
// });

