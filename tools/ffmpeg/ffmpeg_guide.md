# FFmpeg Guide

FFmpeg is a powerful multimedia framework that can decode, encode, transcode, mux, demux, stream, filter, and play almost anything that humans and machines have created. It supports the most obscure ancient formats up to the cutting edge.

## Installation

To install FFmpeg, follow the installation instructions on the official [FFmpeg website](https://ffmpeg.org/download.html) for your operating system.

## Basic Commands

### Checking Version

To check the installed FFmpeg version:

```bash
ffmpeg -version
```

### Convert Video Formats

Convert a video file from one format to another. For example, to convert from `avi` to `mp4`:

```bash
ffmpeg -i input.avi output.mp4
```

### Extract Audio from Video

Extract the audio from a video file:

```bash
ffmpeg -i input.mp4 -q:a 0 -map a output.mp3
```

### Resize a Video

To resize a video to a specific width and height:

```bash
ffmpeg -i input.mp4 -vf scale=1280:720 output.mp4
```

You can also resize based on a percentage of the original size:

```bash
ffmpeg -i input.mp4 -vf scale=iw/2:ih/2 output.mp4
```

### Change Video Bitrate

To change the bitrate of a video:

```bash
ffmpeg -i input.mp4 -b:v 1000k output.mp4
```

### Trim Video

To extract a specific portion of a video, use the `-ss` (start time) and `-t` (duration) options:

```bash
ffmpeg -i input.mp4 -ss 00:01:00 -t 00:00:30 output.mp4
```

This example will extract the video starting at 1 minute (`00:01:00`) and will capture 30 seconds (`00:00:30`) of video.

### Add Watermark

To add a watermark to a video:

```bash
ffmpeg -i input.mp4 -i watermark.png -filter_complex "overlay=10:10" output.mp4
```

This will overlay the watermark at coordinates `(10,10)`.

### Combine Multiple Videos

To combine multiple videos into one:

1. Create a text file listing all video files to combine:
   ```txt
   file 'part1.mp4'
   file 'part2.mp4'
   file 'part3.mp4'
   ```
2. Run FFmpeg with the input list:

```bash
ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4
```

## Conclusion

FFmpeg is a versatile tool, and these are just a few of the many features it offers. To explore more commands, refer to the official [FFmpeg documentation](https://ffmpeg.org/documentation.html).
