#!/usr/bin/env sh

video="2023-06-17_11-56-30.mp4"
bgm="../Documents/workspace/bgm/yuugurenomerrygoround.mp3"
output="output.mp4"

ffmpeg \
    -i $video \
    -stream_loop -1 -i $bgm \
    -filter_complex " \
        [1:a] volume=0.05 [music];
        [music][0:a] amix [audio_out] \
        " \
    -c:v copy \
    -shortest \
    -map 0:v -map "[audio_out]" \
    -y $output