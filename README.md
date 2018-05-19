# SilencePlayer


## What it is
SilencePlayer is an application for macOS that will play silence continuously.  This may not sound useful, but it has one purpose: Keep the audio equipment inside and outside of your Mac primed and active.

![SilencePlayer Screenshot](SilencePlayer.png?raw=true "SilencePlayer's user interface")

SilencePlayer was developed for a specific use case: A NAD T 747 A/V amplifier connected to the optical output of a Mac.  The NAD amp will shut down its audio processing when the Mac is not sending audio.  This results in a noticable delay before anything can be heard when audio is again sent from the Mac.  The pause between songs in a Spotify playlist is enough for the NAD to shut down / fire up between tracks, making for an unpleasant listening experience.  With SilencePlayer running alongside Spotify, these problems with the NAD go away.

Hopefully, SilencePlayer can solve similar situations with other audio gear.


## How to install
1. Download SilencePlayer.zip from the latest [Release on Github](https://github.com/vidaren/SilencePlayer/releases).
1. Unpack the downloaded archive.
1. Drag the SilencePlayer app into your Applications folder.


## How to use
Start SilencePlayer.  In the dialog that appears, click **Play silence** to start audio playback.  Click **Stop it** if you need to stop it.  Hide the app if you don't want to see it (Press ⌘H or select Hide SilencePlayer in the SilencePlayer menu).

* Check **Play silence when app starts** to have SilencePlayer start audio playback automatically every time you start it.
* Check **Hide app when app starts** to have SilencePlayer hide its window automatically every time you start it. 
* Consider adding the app to your user's Login Items to have it run automatically when you log in to your Mac.


## What it does
Technically, SilencePlayer plays a 10-second mp3 file of silence, in a loop, forever or until you click **Stop it** or quit the application.  Playback is done by [AVAudioPlayer](https://developer.apple.com/documentation/avfoundation/avaudioplayer), with numberOfLoops = -1 to loop the mp3 file forever.
