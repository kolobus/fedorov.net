if (window.HTMLAudioElement) {
	var snd = new Audio('');
	var afile = '/assets/pig/spiderpig.';

	if(snd.canPlayType('audio/ogg')) {
		snd = new Audio(afile+'ogg');
	} else if (snd.canPlayType('audio/mp3')) {
        snd = new Audio(afile+'mp3');
	}
	snd.play();
}
