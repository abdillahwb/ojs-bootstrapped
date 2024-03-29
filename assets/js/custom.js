// actions to close and open offcanvas menu
$(document).ready(function() {

    $('[data-toggle=offcanvas]').click(function() {
        $('.row-offcanvas-left').toggleClass('active');
    });

    $('[data-toggle=offcanvasright]').click(function() {
        $('.row-offcanvas-right').toggleClass('active');
    });

    // Replace the no-js <a> with the buttons they wrap to enable native Bootstrap functionality
    $('#no-js-home').replaceWith($('#navbarToggle'));
    $('#no-js-search').replaceWith($('#searchBtn'));
    $('#no-js-notify').replaceWith($('#notifyBtn'));
    $('#no-js-sub').replaceWith($('#subscribeBtn'));

    //Add in the classes to display the off-canvas menu
    $('#canvas-sidebar').removeClass('col-md-12').addClass('col-xs-6 col-sm-3 sidebar-offcanvas showhide navbar-collapse');
});
