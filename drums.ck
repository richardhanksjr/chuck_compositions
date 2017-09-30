Gain master => dac;
SndBuf kick => master;
me.dir() + "/audio/kick_01.wav" => kick.read;
1::second => now;
