// print name
<<< "Reneald Tehevran" >>>;

// setup audio chain
SinOsc sine => Pan2 pan => dac;

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
// Mvt C will be staccato notes of varying length
int AMelody[16];
dur ARhythm[16];
int BMelody[16];
dur BRhythm[16];
int CMelody[16];
dur CRhythm[16];

// fill array AMelody with random notes, all in the octave A3 - A4
// simultaneously, fill ARhythm with eighth notes
for (0 => int i; i < AMelody.cap(); i++)
{
    Math.random2(57, 69) => AMelody[i];
    1::eighth => ARhythm[i];
}

// fill array BMelody with random notes, all in the octave D4 - D5
// simultaneously, fill BRhythm with random note durations
for (0 => int i; i < BMelody.cap(); i++)
{
    Math.random2(62, 74) => BMelody[i];
    Math.random2(1,3) => int noteLength;
    noteLength::eighth => BRhythm[i];
}

// Let's make sure we have some A's in movement B though
69 => BMelody[3];
69 => BMelody[10];

// fill array CMelody with random notes, all in the octave E3 - E4
// simultaneously, fill CRhythm with random note durations
for (0 => int i; i < CMelody.cap(); i++)
{
    Math.random2(52, 64) => CMelody[i];
    Math.random2(1,3) => int noteLength;
    noteLength::eighth => CRhythm[i];
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

// short rest
mute => sine.gain;
1::quarter => now;

// play movement C
play => sine.gain;
for (0 => int i; i < CMelody.cap(); i++)
{
    Std.mtof(CMelody[i]) => sine.freq;

    // simulate staccato: play a sixteenth note
    1::sixteenth => now;

    // now mute for the remainder of the note's duration
    CRhythm[i] - 1::sixteenth => dur restLength;
    mute => sine.gain;
    restLength => now;
    play => sine.gain;
}

// play movement B, but pan every A to the right
for (0 => int i; i < BMelody.cap(); i++)
 {
     Std.mtof(BMelody[i]) => sine.freq;
     if (BMelody[i] == 69)
     {
         1 => pan.pan;
     }
     BRhythm[i] => now;
     0 => pan.pan;
 }