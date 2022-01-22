


There was a commit introduced in 5.7.10 that changed ASUS default headphone model to headset mode with microphone.

To use headphones without microphone you need to change the HD-Audio Codec-Specific model.
See Correctly detect microphone plugged in a 4-pin 3.5mm (TRRS) jack

Create /etc/modprobe.d/alsa-base.conf with:

```
options snd_hda_intel index=0 model=headset-mode-no-hp-mic
```

You may need to fully power off your computer for the change to take effect.
