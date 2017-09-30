SndBuf mySound => dac;
me.dir() + "/audio/snare_01.wav" => string filename;
filename => mySound.read;
mySound.samples() => int numSamples;

while(true){
    
    numSamples => mySound.pos;
    -1.0 => mySound.rate;
    1::second => now;
}