// print name
<<< "Reneald Tehevran" >>>;

// setup audio chain
SinOsc sine => dac;

// define tempo
0.67::second => dur quarter;
0.5::quarter => dur eighth;
0.5::eighth => dur sixteenth;

// This piece will consist of multiple movements
// Each movement is stored in its own Array
int A[16];

// fill array A with random notes, all in the octave A3 - A4
for (0 => int i; i < A.cap(); i++)
{
    Math.random2(57, 69) => A[i];
}

// play movement A
for (0 => int i; i < A.cap(); i++)
{
    Std.mtof(A[i]) => sine.freq;
    1::eighth => now;

}