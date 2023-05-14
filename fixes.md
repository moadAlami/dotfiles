# Fixes

## Arosics
A python package for co-registration

```
paru -S gcc
pip install --upgrade pip
pip install --upgrade wheel
pip install --upgrade setuptools
pip uninstall gensim
pip install arosics
```

## Audio - Headphones ASUS

There was a commit introduced in 5.7.10 that changed ASUS default headphone model to headset mode with microphone.

To use headphones without microphone you need to change the HD-Audio Codec-Specific model.
See Correctly detect microphone plugged in a 4-pin 3.5mm (TRRS) jack

Create /etc/modprobe.d/alsa-base.conf with:

```
options snd_hda_intel index=0 model=headset-mode-no-hp-mic
```

You may need to fully power off your computer for the change to take effect.

## Firefox / liberwolf slow to start
Never install gnome again. Never.

```
sudo pacman -Rnu xdg-desktop-portal-gnome
```

## qgi2web QGIS plugin
PyQt5.WebKitWidgets is deprecated. Should use python-pyqt5 5.15.7-2.
(Breaks python support for QGIS. Can't load SIP).
