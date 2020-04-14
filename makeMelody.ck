// print name
<<< "Reneald Tehevran" >>>;

// setup audio chain
SinOsc sine => dac;
.2 => sine.gain;

// define tempo
0.67::second => dur quarter;
0.5::quarter => dur eighth;
0.5::eighth => dur sixteenth;

// This piece will consist of multiple movements
// Each movement is stored in its own two Arrays:
// one for melody, one for rhythm
int AMelody[16];
dur ARhythm[16];
int B[16];
dur BRhythm[16];

// fill array AMelody with random notes, all in the octave A3 - A4
// simultaneously, fill ARhythm with eighth notes
for (0 => int i; i < AMelody.cap(); i++)
{
    Math.random2(57, 69) => AMelody[i];
    1::eighth => ARhythm[i];
}

// play movement A
for (0 => int i; i < AMelody.cap(); i++)
{
    Std.mtof(AMelody[i]) => sine.freq;
    ARhythm[i] => now;

}