// print name
<<< "Reneald Tehevran" >>>;

// setup audio environment
SinOsc sine => dac;
SqrOsc square => dac;

//define tempo
0.67::second => dur quarter;
0.5::quarter => dur eighth;
0.5::eighth => dur sixteenth;

//define notes
440 => int a;
466.16 => float aSharp;
493.88 => float b;
523.25 => float c;
554.37 => float cSharp;
587.33 => float d;
622.25 => float dSharp;
659.25 => float e;
698.46 => float f;
739.99 => float fSharp;
783.99 => float g;
830.61 => float gSharp;


// use only sine for now
0 => float mute;
0.20 => float play;

mute => square.gain;
play => sine.gain;

// let's do an octave slide
for ((a / 2) => int i; i <= a; i++)
{
    i => sine.freq;
    if (i == a) {
        a => square.freq;
    }
    0.125::sixteenth => now;
}

// slowly replace sine with square
mute => float currentGainSquare;
play => float currentGainSine;
0.001 => float gainDifference;
for (1 => int j; j <= 200; j++)
{
    currentGainSine - gainDifference => currentGainSine;
    currentGainSine => sine.gain;
    
    //Square wave is inherently louder than sine wave so we need lower numbers
    currentGainSquare + ( gainDifference / 2 ) => currentGainSquare;
    currentGainSquare => square.gain;
   
    
    0.125::sixteenth => now;
}    

// back to the sine or my ears start to bleed
for (1 => int j; j <= 200; j++)
{
    currentGainSquare - ( gainDifference / 2 ) => currentGainSquare;
    currentGainSquare => square.gain;
    
    currentGainSine + gainDifference => currentGainSine;
    currentGainSine => sine.gain;
   
    
    0.0625::sixteenth => now;
}   

1::quarter => now;

// a simple melody
play => sine.gain;

1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
(g / 2) => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
(fSharp / 2) => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
(g / 2) => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
a => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
(1::sixteenth + 1::eighth) => now;
b => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
(1::sixteenth + 1::eighth) => now;
a => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
(1::sixteenth + 1::eighth) => now;

play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
(g / 2) => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
(fSharp / 2) => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
(g / 2) => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
a => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
b => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
a => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
(g / 2) => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
1::sixteenth => now;
(fSharp / 2) => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
(1::sixteenth + 1::eighth) => now;
(e / 2) => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
(1::sixteenth + 1::eighth) => now;
(d / 2) => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
(1::sixteenth + 1::eighth) => now;

a => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
(1::sixteenth + 1::eighth) => now;
d => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
(1::sixteenth + 1::eighth + 1::quarter) => now;
a => sine.freq;
play => sine.gain;
1::sixteenth => now;
mute => sine.gain;
(1::sixteenth + 1::eighth + 1::quarter) => now;
(d / 2) => sine.freq;
play => sine.gain;
2::quarter => now;