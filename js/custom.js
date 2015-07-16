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

    //Prevent user from removing the userblockplugin from the sidebar because it will break the navbar
    $('[value="userblockplugin"]').css('display', 'none');
    $('[value="←"]').click(function() {
      if ($('[name=blockUnselectedWidget]').has('[value=userblockplugin]').length) {
        $('#journalLayout').notify("You cannot remove the User block from the sidebar. It will break the theme. Please refresh the page.", {position: 'top center'}, "warn");
        $('[value="Save and continue"').prop('disabled', true);
      }
    });
    //hide sidebar if nothing is inside it
    if ($('#rightSidebar').has('div.block').length === 1) {
      $('.sidebar__tray').css('display', 'none');
    }
    console.log($('#rightSidebar').has('div.block').length);
});
