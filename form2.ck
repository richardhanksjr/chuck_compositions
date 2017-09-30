SndBuf click => dac;
SndBuf kick => dac;

//open sound files
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_03.wav" => click.read;
// Take away playback at initialization
click.samples() => click.pos;
kick.samples() => kick.pos;

// global variables
[1, 0, 0, 0, 1, 0, 0, 0] @=> int kick_patrn_1[];
[0,0,1, 0, 0, 0, 1, 0] @=> int kick_patrn_2[];
[1,0,1,0,1,0,1,0] @=> int click_patrn_1[];
[1,1,1,1,1,1,1,1] @=> int click_patrn_2[];

fun void section(int kickArray[], int clickArray[], float beatTime){
    
    //sequencer: for bass drum and snare drum beats
    for(0 => int i; i< kickArray.cap(); i++){
        // if 1 in array, then play kcik
        if (kickArray[i] == 1){
            0 => kick.pos;   
        }
        if (clickArray[i] == 1){
            0 => click.pos;   
        }
        beatTime::second => now; 
    }
    
}

//Main
while(true){
    
   // Procedural :: ABA form
   section(kick_patrn_1, click_patrn_1, .2); 
   section(kick_patrn_2, click_patrn_2, .2);
   section(kick_patrn_1, click_patrn_1, .4);
}  
    
    
    
    
    
    
    
    
    