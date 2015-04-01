// Specific to VT OJS
$(function() {
	var oldUrl = "";
	var hrefKeyWord = "answers.html";
	var re = RegExp(hrefKeyWord, 'i');
	$('a[href]').filter(function(){
		return re.test(this.href);
	}).each(function() {
		oldUrl = $(this).attr('href');
	});
	
	if (oldUrl != "") {
		var currentUrl = $(location).attr('href'); // www.site.com/index.php/[journal]/article/view/[int1]/[int2]
		var tempUrlArray = currentUrl.split('view/'); // ['www.site.com/index.php/[journal]/article/', '[int1]/[int2]']
		var newInt1 = parseInt(tempUrlArray[1].split('/')[0]) + 1; // add one to link to next item in archives list, which is where the Answers.html is/should be
		newInt1 = newInt1.toString();
		var newInt2 = parseInt(tempUrlArray[1].split('/')[1]) + 1;
		newInt2 = newInt2.toString();
		var newUrl = tempUrlArray[0] + 'view/' + newInt1 + '/' + newInt2;
		newUrl = newUrl.toString();
		$('a[href="'+ oldUrl +'"]').attr('href', newUrl);
	}
	
});
