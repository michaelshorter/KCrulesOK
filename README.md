# KCrulesOK
An arduino script that can recognise a song by King Creosote instantly using TinyML


## SongSplitter.sh
This script slices .wav files into overlapping 3s segments.

To use this change to file path to the song in the script.

Give execution permission: 
```
chmod +x SongSplitter.sh
```

Run it: 
```
./SongSplitter.sh
```
## MultiSongSplitter.sh

This script does a similar thing but for all .wav files located in a directory. It will create a 'segment' folder for each .wav file and save all the segments in there.


## Uploading to Edge Impulse

You can simply choose a folder (this wil work even if there are folders within the folder). It is also possible to bulk label the data within this folder by filling out the feild near the bottom of the page.

