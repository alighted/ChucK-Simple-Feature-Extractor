Author: McLean Macionis
For: Machine Learning for Musicians and Artists - Session 5 Assignment\
Date: March 18, 2018\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 +====+====+====+====+====+====+====+====+
\b0 \
\

\b Zip file includes:
\b0 \
1. ChucK file - \'93Feature_Extractor_ToolKit_MJM\'94\
2. Input Helper file - \'93InputHelper_FE_MJM.inputproj\'94\
3. README\
\

\b GitHub URL:
\b0  \
\
\

\b Description:
\b0 \
This is a simple audio feature extractor created in ChucK. The only software requirement is that you have ChucK and the WekiInputHelper installed on your computer.\
\
The ChucK program extracts data from an incoming audio signal (default laptop microphone) and forwards the data readings to the Input Helper via OSC. The data includes RMS, spectral centroid, flux and spectral rolloff with a modifiable percent. The RMS data is converted into dB, centroid and rolloff data is scaled to cover the entire frequency range at a sample rate of 44100 and the flux is scaled using the multiplier variable to be in a larger value range. All the data is stored in ChucK\'92s FeatureCollector unit analyzer and grabbed using one of the index values between 0 and 3.\
\
To run this program, open the ChucK file and Input Helper file. In ChucK, add the shred to the virtual machine. The helper file should immediately pick up the data and store it in the appropriate input. You can now forward the data Wekinator for training.\
\
Experiment using all the data simultaneously to identify the quality and loudness of an input sound. Try isolating the RMS using the constraint option under the \'93When to send\'94 tab and setting a certain dB value to act as a threshold. In this way, a loud sound might be used to send a reading out with all other sounds being ignored.\
\
Adding averaging will help smooth out any of the values. I have included a 10 sample averaging for each of the values to start.\
\
Descriptions of each of the data types is included in the ChucK file.\
\
Enjoy! Feel free to message me with any questions or suggestions.\
\
MJM}
