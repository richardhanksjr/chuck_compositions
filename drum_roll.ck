SndBuf snare => dac;

// load soundfile
me.dir() + "/audio/snare_01.wav" => snare.read;
snare.samples() => snare.pos;

fun int drumRoll(int index){   
    <<< index >>>;
    if( index >= 40){
        //play sound for duration of index
        0 => snare.pos;
        index::ms => now;
        return drumRoll(index-1);
    }else if(index == 0){
        
        return 0;   
    }   
}

//Main
drumRoll(100);