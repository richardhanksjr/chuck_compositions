SinOsc s => dac;
SinOsc t => dac;
//A
500 => int init_pitch;
init_pitch + 3 => int upper_pitch;
init_pitch + 3 => int lower_pitch;
for(0=>int i; i<100; i++){
    for(0=> int j; j<30; j++){
        if(j%2 == 0){
            init_pitch => s.freq;
            init_pitch => t.freq;
            
        }else{
            if(upper_pitch < 5){
                upper_pitch => s.freq;
                upper_pitch ++;
            }else{
                upper_pitch --;
                upper_pitch => s.freq;
            }
            if(lower_pitch > 0){
                lower_pitch => t.freq;
                lower_pitch++;
            }else{
                lower_pitch ++;
                lower_pitch => t.freq;
            }
            
            
        }
        .01::second => now;
        
    }   
}


//B
30 => t.freq;
60 => s.freq;
10 => t.gain;
5=> s.gain;
10::second => now;


//C
.5 => t.gain;
.5 => s.gain;
1000 => int outside_counter;
for(0=>int j; j<10; j++){   
    for(30=>int i; i<1000; i++){
        if(i == outside_counter || i == outside_counter/2){
         i+3 => s.freq;
         outside_counter-3 => t.freq;
         4::second => now;   
         outside_counter * 2 => outside_counter;
         
     }else if(i == outside_counter * 2){
         i*3 => outside_counter;
         outside_counter * 2 => i;
         outside_counter => t.freq;
         i => s.freq;
         1::second => now;
     }
     else{
        i => s.freq;
        outside_counter => t.freq;
        outside_counter--;
        .01::second => now;
    }   
    }
    outside_counter/2 => outside_counter;
}

//A
for(0=>int i; i<100; i++){
    for(0=> int j; j<30; j++){
        if(j%2 == 0){
            init_pitch => s.freq;
            init_pitch => t.freq;
            
        }else{
            if(upper_pitch < 5){
                upper_pitch => s.freq;
                upper_pitch ++;
            }else{
                upper_pitch --;
                upper_pitch => s.freq;
            }
            if(lower_pitch > 0){
                lower_pitch => t.freq;
                lower_pitch++;
            }else{
                lower_pitch ++;
                lower_pitch => t.freq;
            }
            
            
        }
        .01::second => now;
        
    }   
}

//B
30 => t.freq;
60 => s.freq;
10 => t.gain;
5=> s.gain;
10::second => now;