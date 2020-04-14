// print name
<<< "Reneald Tehevran" >>>;

// setup audio chain
SinOsc sine => dac;

// play/mute variables for readability
.2 => float play;
0 => int mute;

// set volume
play => sine.gain;

// define tempo
0.67::second => dur quarter;
0.5::quarter => dur eighth;
0.5::eighth => dur sixteenth;

// This piece will consist of multiple movements
// Each movement is stored in its own two Arrays:
// one for melody, one for rhythm
// Mvt A will be legato notes of the same length
// Mvt B will be legato notes of varying length
int AMelody[16];
dur ARhythm[16];
int BMelody[16];
dur BRhythm[16];

// fill array AMelody with random notes, all in the octave A3 - A4
// simultaneously, fill ARhythm with eighth notes
for (0 => int i; i < AMelody.cap(); i++)
{
    Math.random2(57, 69) => AMelody[i];
    1::eighth => ARhythm[i];
}

// fill array BMelody with random notes, all in the octave C4 - C5
// simultaneously, fill BRhythm with random note durations
for (0 => int i; i < BMelody.cap(); i++)
{
    Math.random2(57, 69) => BMelody[i];
    Math.random2(1,3) => int noteLength;
    noteLength::eighth => BRhythm[i];
}

// play movement A
for (0 => int i; i < AMelody.cap(); i++)
{
    Std.mtof(AMelody[i]) => sine.freq;
    ARhythm[i] => now;

}

// short rest
mute => sine.gain;
1::quarter => now;

// play movement B
play => sine.gain;
for (0 => int i; i < BMelody.cap(); i++)
{
    Std.mtof(BMelody[i]) => sine.freq;
    BRhythm[i] => now;

}