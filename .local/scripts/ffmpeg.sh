#!/bin/bash 

function mkvideo(){
  if command -v ffmpeg &> /dev/null; then
    # Input is the path to markdown file
    local input="$1"
     echo 'Converting '$input' frames to video...'
    ffmpeg -framerate 24 -i $input%04d.png -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -c:v libx264 -pix_fmt yuv420p temp_video.mp4

    # Increase the video length with video duplication
    #
    # echo "file 'temp_video.mp4'" > filelist.txt
    # echo "file 'temp_video.mp4'" >> filelist.txt
    # echo "file 'temp_video.mp4'" >> filelist.txt
    #
    # ffmpeg -f concat -safe 0 -i filelist.txt -c copy final_video.mp4
  else
    sudo apt-get install ffmpeg
  fi
}
