jQuery(document).ready(function($) {

    // Design
    $('.level-bar-inner').css('width', '0');

    // Design
    $(window).on('load', function() {
        $('.level-bar-inner').each(function() {
            var itemWidth = $(this).data('level');
            $(this).animate({
                width: itemWidth
            }, 800);
        });
    });

    // Konami
  	var code = '';
  	$(window).keydown( function (e) {
    	key = e.keyCode || e.which;
		  code += key.toString();
		  code = code.substr(-20,20);
			if(code == '38384040373937396665') {
				$.ajax({type: 'GET', url: '/assets/konami/konami.js', cache: true, dataType: 'script'});
				code = '';
      }
	  });

    // Lightbox
    $('.lightbox').magnificPopup({type:'image'});

    // Comments
    if ( $( "#add-comments" ).length ) {
      	$( "#add-comments" ).append('<div/>').attr('id', 'disqus_thread');
        $.ajax({type: 'GET', url: '//fedorovnet.disqus.com/embed.js', cache: true, dataType: 'script'});
    }

});
