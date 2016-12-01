jQuery(document).ready(function($) {

    $('.level-bar-inner').css('width', '0');

    $(window).on('load', function() {
        $('.level-bar-inner').each(function() {
            var itemWidth = $(this).data('level');
            $(this).animate({
                width: itemWidth
            }, 800);
        });
    });

  	var code = '';
  	$(window).keydown( function (e) {
    	key = e.keyCode || e.which;
		  code += key.toString();
		  code = code.substr(-20,20);
			if(code == '38384040373937396665') {
				$.ajax({type: 'GET', url: '/assets/pig/spiderpig.js', cache: true, dataType: 'script'});
				code = '';
      }
	  });

});
