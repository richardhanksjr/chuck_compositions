
Noise n => dac;




SinOsc c => Pan2 c_pan => dac;
SinOsc bass => Pan2 bass_pan => dac;
SinOsc bass2 => Pan2 bass2_pan => dac;

// TODO: Change this from fast to slow, to slow to fast
// Intro (Primitive, sparce sounds)
0 => n.gain;
0 => bass.gain;
0 => bass2.gain;
Std.mtof(28) => bass.freq;
Std.mtof(40) => bass2.freq;
for (250 => int i; i>10; i--){
    Std.rand2(40, 45) => int rand_int;
    Std.mtof(rand_int) => c.freq;
    Std.rand2f(-1.0, 1.0) => c_pan.pan;
    Std.rand2f(-1.0, 1.0) => bass_pan.pan;
    Std.rand2f(-1.0, 1.0) => bass2_pan.pan;
    if (i % 3 == 0){ 
        0 => c.gain;
        .5 => bass.gain;
        .5 => bass2.gain;
        i::ms => now;
        i::ms => now;
        .5 => c.gain;
        0.0 => bass.gain;
        0.0 => bass2.gain; 
    }
    if (i % 10 == 0 && i > 175){
        0 => c.gain;
        0 => bass.gain;
        0 => bass2.gain;
        2::second => now;
        
        
    }
    if (i % 7 == 0 && i > 175){
         0 => c.gain;
        0 => bass.gain;
        0 => bass2.gain;
        .75::second => now;
        
    }
    
    if (i % 23 == 0 && i > 175){
        90 => c.freq;
        0 => bass.gain;
        0 => bass2.gain;
        .5::second => now;
        
    }
    if (i == 100){
        .5 => c.gain;
        .5 => bass.gain;
        .5 => bass2.gain;
        int bass_pitch;
        for (0 => int j; j<200; j++){
            if (j < 100){
                j => bass_pitch;
                Std.mtof(bass_pitch) => bass.freq;
                Std.mtof(bass_pitch+12) => bass2.freq;
            }else{
                bass_pitch --;
                Std.mtof(bass_pitch) => bass.freq;
                Std.mtof(bass_pitch+12) => bass2.freq;
            }
            Std.rand2(40, 80) => int rand_int;
            Std.mtof(rand_int) => c.freq;
            100::ms => now;         
        }
         
    }
    i::ms => now;
    i::ms => now;
   
}


0 => c.gain;
for(0=> int i; i< 10; i++){
    for(1 => int j; j <10; j++){
     j*.1 => n.gain;   
   }
   for(10=> int k; k>1; k--){
       k*.1 => n.gain;   
   }
    
}
0.3 => n.gain;
5::second => now;

// A section (Folk Melody)
0 => n.gain;
.5 => c.gain;
.5 => bass.gain;
.5 => bass2.gain;
200 => int num_times;
0 => int num_counter;
[40, 42, 44, 47, 49, 52] @=> int A[];

while(num_counter < num_times){
    Std.rand2(0, (A.cap()-1)) => int num;
    Std.mtof(A[num]+12) => c.freq;
    Std.mtof(28) => bass.freq;
    Std.mtof(40) => bass2.freq;
    //std.rand2f(-1.0, 1.0) => pan.pan;
    num_counter + 1 => num_counter;
    Std.fabs(Std.randf())::second => now;
    
    
}