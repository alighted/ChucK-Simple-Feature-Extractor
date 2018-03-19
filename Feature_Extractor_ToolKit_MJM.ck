// Feature Extractor ToolKit
// Machine Learning for Musicians and Artists
// MJM - March 6, 2018
// +====+====+====+====+====+====+====+====+====+


/*
Description of data:
RMS                 => Average loudness over time. Converted to dB
Spectral Centroid   => Frequency timbre of incoming audio signal
Flux                => Change in magnitude of each bin
Rolloff 85          => Rolloff from a magnitude spectrum starting at 85%
*/


// Setup OSC
OscOut osc_send;
osc_send.dest("localhost", 6448);


// Setup feature collector sound chain
adc => FFT fft =^ RMS rms =^ FeatureCollector FC => blackhole;
fft =^ Centroid centroid =^ FC;
fft =^ Flux flux =^ FC;
fft =^ RollOff roll85 =^ FC;

// Configure FFT window parameters
1024 => fft.size;
1024 => int WinSize;
0.85 => roll85.percent;

// Set windowing (Hann, BlackmanHarris, Hamming)
Windowing.hann(WinSize) => fft.window;
/*
Windowing.blackmanHarris(WinSize) => fft.window;
Windowing.hamming(WinSize) => fft.window;
*/

// Declare variables
100 => int multiplier;
44.0 => float threshold;
second / samp => float srate;
srate / 2 => float freq_range;


// Main program
while (true)
{
    FC.upchuck() @=> UAnaBlob feature_data;
    
    Std.rmstodb(feature_data.fval(0)) => float rms_data;
    feature_data.fval(1) * freq_range => float centroid_data;
    feature_data.fval(2) * multiplier => float flux_data;
    feature_data.fval(3) * freq_range => float roll85_data;
    
    SendOscMsg(rms_data, centroid_data, flux_data, roll85_data);
    
    <<< rms_data + "     ", centroid_data + "     ", 
    flux_data + "     ", roll85_data >>>;
    
    fft.size()::samp => now;
}


// Send OSC message function
fun void SendOscMsg(float rms, float c, float flux, float r85)
{
    osc_send.start("/wek/inputs");
    osc_send.add(rms);
    osc_send.add(c);
    osc_send.add(flux);
    osc_send.add(r85);
    osc_send.send();
}
