Title: Simple Audio Feature Extractor
Author: McLean Macionis
For: Machine Learning for Musicians and Artists - Session 5 Assignment
Date: March 18, 2018
+====+====+====+====+====+====+====+====+

Zip file includes:
1. ChucK file - “Feature_Extractor_ToolKit_MJM”
2. Input Helper file - “InputHelper_FE_MJM.inputproj”
3. README

GitHub URL: 
https://github.com/mjmmusique/ChucK-Simple-Feature-Extractor

Description:
This is a simple audio feature extractor created in ChucK. The only software requirement is that you have ChucK and the WekiInputHelper installed on your computer.

The ChucK program extracts data from an incoming audio signal (default laptop microphone) and forwards the data readings to the Input Helper via OSC. The data includes RMS, spectral centroid, flux and spectral rolloff with a modifiable percent. The RMS data is converted into dB, centroid and rolloff data is scaled to cover the entire frequency range at a sample rate of 44100 and the flux is scaled using the multiplier variable to be in a larger value range. All the data is stored in ChucK’s FeatureCollector unit analyzer and grabbed using one of the index values between 0 and 3.

To run this program, open the ChucK file and Input Helper file. In ChucK, add the shred to the virtual machine. The helper file should immediately pick up the data and store it in the appropriate input. You can now forward the data Wekinator for training.

Experiment using all the data simultaneously to identify the quality and loudness of an input sound. Try isolating the RMS using the constraint option under the “When to send” tab and setting a certain dB value to act as a threshold. In this way, a loud sound might be used to send a reading out with all other sounds being ignored.

Adding averaging will help smooth out any of the values. I have included a 10 sample averaging for each of the values to start.

Descriptions of each of the data types is included in the ChucK file.

Enjoy! Feel free to message me with any questions or suggestions.

MJM
