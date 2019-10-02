#!/bin/bash
# clear local input and output  directories in preparation for import
rm -rv input/*
rm -rv output/*
# copy basicSR resultant model if present
cp -v ../basicSR/experiments/TRAINED/models/latest_G.pth ./models/
# copy input files for testing
cp -vr /volume1/transfer/Optometer/ESRGAN-Input/* ./input
# run the test program
python3 test.py
# copy output files
cp -vr ./output/* /volume1/transfer/Optometer/ESRGAN-Output
