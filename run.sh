#!/bin/bash
echo
echo 'Clearing local input/ and output/ directories.'
rm -rv input/*
rm -rv output/*
echo
echo 'Copying model trained with basicSR if present'
cp -v ../basicSR/experiments/TRAINED/models/latest_G.pth ./models/
echo
echo 'Copying files to local input directory'
rsync -zvah --no-p --no-g /volume1/transfer/Optometer/ESRGAN-Input/ ./input
echo
echo 'Executing ESRGAN'
python3 test.py
echo
echo 'Copying output files back out from local directory'
rsync -zvah --no-p --no-g ./output/ /volume1/transfer/Optometer/ESRGAN-Output/
echo
python3 calculate_PSNR_SSIM.py
