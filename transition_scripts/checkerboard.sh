#!/bin/bash
#
# ffmpeg video slideshow script with checkerboard transition v1 (01.10.2017)
#
# Copyright (c) 2017, Taner Sener (https://github.com/tanersener)
#
# This work is licensed under the terms of the MIT license. For a copy, see <https://opensource.org/licenses/MIT>.
#

START_TIME=$SECONDS

ffmpeg -y \
-loop 1 -i ../photos/1.jpg \
-loop 1 -i ../photos/2.jpg \
-loop 1 -i ../photos/3.jpg \
-loop 1 -i ../photos/4.jpg \
-loop 1 -i ../photos/5.jpg \
-f lavfi -i color=black:s=1280x720 \
-filter_complex "\
[0:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream1out1];\
[0:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream1out2];\
[1:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream2out1];\
[1:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream2out3];\
[1:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream2out2];\
[2:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream3out1];\
[2:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream3out3];\
[2:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream3out2];\
[3:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream4out1];\
[3:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream4out3];\
[3:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream4out2];\
[4:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream5out1];\
[4:v]setpts=PTS-STARTPTS,scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,format=rgba,scale=w='if(gte(iw/ih,1280/720),min(iw,1280),-1)':h='if(gte(iw/ih,1280/720),-1,min(ih,720))'[stream5out3];\
[5:v][stream1out1]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=3,select=lte(n\,90)[stream1overlaid];\
[5:v][stream2out1]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=2,select=lte(n\,60)[stream2overlaid];\
[5:v][stream1out2]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=1,select=lte(n\,30)[stream1ending];\
[5:v][stream2out3]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=1,select=lte(n\,30)[stream2starting];\
[5:v][stream3out1]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=2,select=lte(n\,60)[stream3overlaid];\
[5:v][stream2out2]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=1,select=lte(n\,30)[stream2ending];\
[5:v][stream3out3]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=1,select=lte(n\,30)[stream3starting];\
[5:v][stream4out1]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=2,select=lte(n\,60)[stream4overlaid];\
[5:v][stream3out2]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=1,select=lte(n\,30)[stream3ending];\
[5:v][stream4out3]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=1,select=lte(n\,30)[stream4starting];\
[5:v][stream5out1]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=2,select=lte(n\,60)[stream5overlaid];\
[5:v][stream4out2]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=1,select=lte(n\,30)[stream4ending];\
[5:v][stream5out3]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:format=rgb,trim=duration=1,select=lte(n\,30)[stream5starting];\
[stream2starting][stream1ending]blend=all_expr='if((lte(mod(X,128),128/2-(128/2)*T/1)+lte(mod(Y,128),128/2-(128/2)*T/1))+(gte(mod(X,128),(128/2)+(128/2)*T/1)+gte(mod(Y,128),(128/2)+(128/2)*T/1)),B,A)':shortest=1[stream2blended];\
[stream3starting][stream2ending]blend=all_expr='if((lte(mod(X,128),128/2-(128/2)*T/1)+lte(mod(Y,128),128/2-(128/2)*T/1))+(gte(mod(X,128),(128/2)+(128/2)*T/1)+gte(mod(Y,128),(128/2)+(128/2)*T/1)),B,A)':shortest=1[stream3blended];\
[stream4starting][stream3ending]blend=all_expr='if((lte(mod(X,128),128/2-(128/2)*T/1)+lte(mod(Y,128),128/2-(128/2)*T/1))+(gte(mod(X,128),(128/2)+(128/2)*T/1)+gte(mod(Y,128),(128/2)+(128/2)*T/1)),B,A)':shortest=1[stream4blended];\
[stream5starting][stream4ending]blend=all_expr='if((lte(mod(X,128),128/2-(128/2)*T/1)+lte(mod(Y,128),128/2-(128/2)*T/1))+(gte(mod(X,128),(128/2)+(128/2)*T/1)+gte(mod(Y,128),(128/2)+(128/2)*T/1)),B,A)':shortest=1[stream5blended];\
[stream1overlaid][stream2blended][stream2overlaid][stream3blended][stream3overlaid][stream4blended][stream4overlaid][stream5blended][stream5overlaid]concat=n=9:v=1:a=0,format=yuv420p[video]"\
 -map [video] -vsync 2 -async 1 -rc-lookahead 0 -g 0 -profile:v main -level 42 -c:v libx264 -r 30 ../transition_checkerboard.mp4

ELAPSED_TIME=$(($SECONDS - $START_TIME))

echo 'Slideshow created in '$ELAPSED_TIME' seconds'