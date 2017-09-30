SndBuf click => dac;

me.dir() + "audio/stereo_fx_01.wav" => click.read;

//10::second => now;

click.samples() => click.pos;

fun void granularize(int steps){
    // Samples/steps == grain size
    click.samples()/steps => int grain;
    // randomly set grain position
    Math.random2(0, click.samples()-grain) => click.pos;
    //advance time
    grain::samp => now;
    
}

//Main Program
while(true){
    
  granularize(150);   
}