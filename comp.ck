Gain master => dac;
SinOsc melody => master;
SndBuf kick => master;
SndBuf snare => master;
SndBuf hiHat => master;

me.dir() + "/audio/kick_04.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/hiHat_01.wav" => hiHat.read;



//kick.samples() => kick.pos;
//snare.samples() => snare.pos;
//hiHat.samples() => hiHat.pos;

//0 => snare.pos;
