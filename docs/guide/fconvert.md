# fconvert

## Formats
- [video](#video-ffmpeg)
- [image](#image-imagemagick)
- [sound](#sound-mpg123)

Every service supports passing an URL directly.
More to come later, feel free to contribute, I will add an automated build system at some point.

## Demonstration
![fconvert](https://s3.eu-west-3.amazonaws.com/juke-github/fconvert1.gif)

## Testing
`test.sh` runs the built docker images against a test image (found in `test.csv`). It's pretty basic for now.
```bash
$ ./test.sh
Testing service image format png to jpg with url http://www.pngmart.com/files/1/Cat-PNG-H...
tmp.png (1859294) is now tmp.jpg (405329).
Testing service sound format mp3 to wav with url https://archive.org/download/testmp3test...
tmp.mp3 (198658) is now tmp.wav (1094444).
Testing service video format mp4 to mkv with url https://archive.org/download/CatDoesYipp...
tmp.mp4 (484460) is now tmp.mkv (448110).
```


## video (ffmpeg)

1. takes an input.ext
2. spits out output.ext in the same folder

```bash
$ docker run -v $(pwd):/d/ fconvert/video input.ext1 output.ext2
$ docker run -v $(pwd):/d/ fconvert/video "https://...ext1" output.ext2

$ docker run -v $(pwd):/d/ fconvert/video demo.mp4 demo.gif 
$ docker run -v $(pwd):/d/ fconvert/video demo.mkv demo.flv
# ...
```

### Supported formats
Some more formats are supported, but were not listed in the documentation of ffmpeg,
you can use any format you want with any docker image, or directly use `fconvert/video`
```
3dostr          3DO STR
3g2             3GP2 (3GPP2 file format)
3gp             3GP (3GPP file format)
4xm             4X Technologies
a64             a64 - video for Commodore 64
aa              Audible AA format files
aac             raw ADTS AAC (Advanced Audio Coding)
ac3             raw AC-3
acm             Interplay ACM
act             ACT Voice file format
adf             Artworx Data Format
adp             ADP
ads             Sony PS2 ADS
adts            ADTS AAC (Advanced Audio Coding)
adx             CRI ADX
aea             MD STUDIO audio
afc             AFC
aiff            Audio IFF
aix             CRI AIX
alaw            PCM A-law
alias_pix       Alias/Wavefront PIX image
alsa            ALSA audio output
amr             3GPP AMR
anm             Deluxe Paint Animation
apc             CRYO APC
ape             Monkey's Audio
apng            Animated Portable Network Graphics
aqtitle         AQTitle subtitles
asf             ASF (Advanced / Active Streaming Format)
asf_o           ASF (Advanced / Active Streaming Format)
asf_stream      ASF (Advanced / Active Streaming Format)
ass             SSA (SubStation Alpha) subtitle
ast             AST (Audio Stream)
au              Sun AU
avi             AVI (Audio Video Interleaved)
avm2            SWF (ShockWave Flash) (AVM2)
avr             AVR (Audio Visual Research)
avs             AVS
bethsoftvid     Bethesda Softworks VID
bfi             Brute Force & Ignorance
bfstm           BFSTM (Binary Cafe Stream)
bin             Binary text
bink            Bink
bit             G.729 BIT file format
bmp_pipe        piped bmp sequence
bmv             Discworld II BMV
boa             Black Ops Audio
brender_pix     BRender PIX image
brstm           BRSTM (Binary Revolution Stream)
c93             Interplay C93
caf             Apple CAF (Core Audio Format)
cavsvideo       raw Chinese AVS (Audio Video Standard) video
cdg             CD Graphics
cdxl            Commodore CDXL video
cine            Phantom Cine
concat          Virtual concatenation script
crc             CRC testing
dash            DASH Muxer
data            raw data
daud            D-Cinema audio
dcstr           Sega DC STR
dds_pipe        piped dds sequence
dfa             Chronomaster DFA
dirac           raw Dirac
dnxhd           raw DNxHD (SMPTE VC-3)
dpx_pipe        piped dpx sequence
dsf             DSD Stream File (DSF)
dsicin          Delphine Software International CIN
dss             Digital Speech Standard (DSS)
dts             raw DTS
dtshd           raw DTS-HD
dv              DV (Digital Video)
dvbsub          raw dvbsub
dvbtxt          dvbtxt
dvd             MPEG-2 PS (DVD VOB)
dxa             DXA
ea              Electronic Arts Multimedia
ea_cdata        Electronic Arts cdata
eac3            raw E-AC-3
epaf            Ensoniq Paris Audio File
exr_pipe        piped exr sequence
f32be           PCM 32-bit floating-point big-endian
f32le           PCM 32-bit floating-point little-endian
f4v             F4V Adobe Flash Video
f64be           PCM 64-bit floating-point big-endian
f64le           PCM 64-bit floating-point little-endian
fbdev           Linux framebuffer
ffm             FFM (FFserver live feed)
ffmetadata      FFmpeg metadata in text
fifo            FIFO queue pseudo-muxer
film_cpk        Sega FILM / CPK
filmstrip       Adobe Filmstrip
fits            Flexible Image Transport System
flac            raw FLAC
flic            FLI/FLC/FLX animation
flv             FLV (Flash Video)
framecrc        framecrc testing
framehash       Per-frame hash testing
framemd5        Per-frame MD5 testing
frm             Megalux Frame
fsb             FMOD Sample Bank
g722            raw G.722
g723_1          raw G.723.1
g726            raw big-endian G.726 ("left-justified")
g726le          raw little-endian G.726 ("right-justified")
g729            G.729 raw format demuxer
gdv             Gremlin Digital Video
genh            GENeric Header
gif             GIF Animation
gsm             raw GSM
gxf             GXF (General eXchange Format)
h261            raw H.261
h263            raw H.263
h264            raw H.264 video
hash            Hash testing
hds             HDS Muxer
hevc            raw HEVC video
hls             Apple HTTP Live Streaming
hls,applehttp   Apple HTTP Live Streaming
hnm             Cryo HNM v4
ico             Microsoft Windows ICO
idcin           id Cinematic
idf             iCE Draw File
iff             IFF (Interchange File Format)
ilbc            iLBC storage
image2          image2 sequence
image2pipe      piped image2 sequence
ingenient       raw Ingenient MJPEG
ipmovie         Interplay MVE
ipod            iPod H.264 MP4 (MPEG-4 Part 14)
ircam           Berkeley/IRCAM/CARL Sound Format
ismv            ISMV/ISMA (Smooth Streaming)
iss             Funcom ISS
iv8             IndigoVision 8000 video
ivf             On2 IVF
ivr             IVR (Internet Video Recording)
j2k_pipe        piped j2k sequence
jacosub         JACOsub subtitle format
jpeg_pipe       piped jpeg sequence
jpegls_pipe     piped jpegls sequence
jv              Bitmap Brothers JV
latm            LOAS/LATM
lavfi           Libavfilter virtual input device
live_flv        live RTMP FLV (Flash Video)
lmlm4           raw lmlm4
loas            LOAS AudioSyncStream
lrc             LRC lyrics
lvf             LVF
lxf             VR native stream (LXF)
m4v             raw MPEG-4 video
matroska        Matroska
matroska,webm   Matroska / WebM
md5             MD5 testing
mgsts           Metal Gear Solid: The Twin Snakes
microdvd        MicroDVD subtitle format
mjpeg           raw MJPEG video
mjpeg_2000      raw MJPEG 2000 video
mkv             Matroshka
mkvtimestamp_v2 extract pts as timecode v2 format, as defined by mkvtoolnix
mlp             raw MLP
mlv             Magic Lantern Video (MLV)
mm              American Laser Games MM
mmf             Yamaha SMAF
mov             QuickTime / MOV
mov,mp4,m4a,3gp,3g2,mj2 QuickTime / MOV
mp2             MP2 (MPEG audio layer 2)
mp3             MP3 (MPEG audio layer 3)
mp4             MP4 (MPEG-4 Part 14)
mpc             Musepack
mpc8            Musepack SV8
mpeg            MPEG-1 Systems / MPEG program stream
mpeg1video      raw MPEG-1 video
mpeg2video      raw MPEG-2 video
mpegts          MPEG-TS (MPEG-2 Transport Stream)
mpegtsraw       raw MPEG-TS (MPEG-2 Transport Stream)
mpegvideo       raw MPEG video
mpjpeg          MIME multipart JPEG
mpl2            MPL2 subtitles
mpsub           MPlayer subtitles
msf             Sony PS3 MSF
msnwctcp        MSN TCP Webcam stream
mtaf            Konami PS2 MTAF
mtv             MTV
mulaw           PCM mu-law
musx            Eurocom MUSX
mv              Silicon Graphics Movie
mvi             Motion Pixels MVI
mxf             MXF (Material eXchange Format)
mxf_d10         MXF (Material eXchange Format) D-10 Mapping
mxf_opatom      MXF (Material eXchange Format) Operational Pattern Atom
mxg             MxPEG clip
nc              NC camera feed
nistsphere      NIST SPeech HEader REsources
nsv             Nullsoft Streaming Video
null            raw null video
nut             NUT
nuv             NuppelVideo
oga             Ogg Audio
ogg             Ogg
ogv             Ogg Video
oma             Sony OpenMG audio
opus            Ogg Opus
oss             OSS (Open Sound System) playback
paf             Amazing Studio Packed Animation File
pam_pipe        piped pam sequence
pbm_pipe        piped pbm sequence
pcx_pipe        piped pcx sequence
pgm_pipe        piped pgm sequence
pgmyuv_pipe     piped pgmyuv sequence
pictor_pipe     piped pictor sequence
pjs             PJS (Phoenix Japanimation Society) subtitles
pmp             Playstation Portable PMP
png_pipe        piped png sequence
ppm_pipe        piped ppm sequence
psd_pipe        piped psd sequence
psp             PSP MP4 (MPEG-4 Part 14)
psxstr          Sony Playstation STR
pva             TechnoTrend PVA
pvf             PVF (Portable Voice Format)
qcp             QCP
qdraw_pipe      piped qdraw sequence
r3d             REDCODE R3D
rawvideo        raw video
realtext        RealText subtitle format
redspark        RedSpark
rl2             RL2
rm              RealMedia
roq             raw id RoQ
rpl             RPL / ARMovie
rsd             GameCube RSD
rso             Lego Mindstorms RSO
rtp             RTP output
rtp_mpegts      RTP/mpegts output format
rtsp            RTSP output
s16be           PCM signed 16-bit big-endian
s16le           PCM signed 16-bit little-endian
s24be           PCM signed 24-bit big-endian
s24le           PCM signed 24-bit little-endian
s32be           PCM signed 32-bit big-endian
s32le           PCM signed 32-bit little-endian
s337m           SMPTE 337M
s8              PCM signed 8-bit
sami            SAMI subtitle format
sap             SAP output
sbg             SBaGen binaural beats script
scc             Scenarist Closed Captions
sdl,sdl2        SDL2 output device
sdp             SDP
sdr2            SDR2
sds             MIDI Sample Dump Standard
sdx             Sample Dump eXchange
segment         segment
sgi_pipe        piped sgi sequence
shn             raw Shorten
siff            Beam Software SIFF
singlejpeg      JPEG single image
sln             Asterisk raw pcm
smjpeg          Loki SDL MJPEG
smk             Smacker
smoothstreaming Smooth Streaming Muxer
smush           LucasArts Smush
sol             Sierra SOL
sox             SoX native
spdif           IEC 61937 (used on S/PDIF - IEC958)
spx             Ogg Speex
srt             SubRip subtitle
stl             Spruce subtitle format
stream_segment,ssegment streaming segment muxer
subviewer       SubViewer subtitle format
subviewer1      SubViewer v1 subtitle format
sunrast_pipe    piped sunrast sequence
sup             raw HDMV Presentation Graphic Stream subtitles
svag            Konami PS2 SVAG
svcd            MPEG-2 PS (SVCD)
svg_pipe        piped svg sequence
swf             SWF (ShockWave Flash)
tak             raw TAK
tedcaptions     TED Talks captions
tee             Multiple muxer tee
thp             THP
tiertexseq      Tiertex Limited SEQ
tiff_pipe       piped tiff sequence
tmv             8088flex TMV
truehd          raw TrueHD
tta             TTA (True Audio)
tty             Tele-typewriter
txd             Renderware TeXture Dictionary
u16be           PCM unsigned 16-bit big-endian
u16le           PCM unsigned 16-bit little-endian
u24be           PCM unsigned 24-bit big-endian
u24le           PCM unsigned 24-bit little-endian
u32be           PCM unsigned 32-bit big-endian
u32le           PCM unsigned 32-bit little-endian
u8              PCM unsigned 8-bit
uncodedframecrc uncoded framecrc testing
v210            Uncompressed 4:2:2 10-bit
v210x           Uncompressed 4:2:2 10-bit
v4l2            Video4Linux2 output device
vag             Sony PS2 VAG
vc1             raw VC-1 video
vc1test         VC-1 test bitstream
vcd             MPEG-1 Systems / MPEG program stream (VCD)
video4linux2,v4l2 Video4Linux2 device grab
vivo            Vivo
vmd             Sierra VMD
vob             MPEG-2 PS (VOB)
vobsub          VobSub subtitle format
voc             Creative Voice
vpk             Sony PS2 VPK
vplayer         VPlayer subtitles
vqf             Nippon Telegraph and Telephone Corporation (NTT) TwinVQ
w64             Sony Wave64
wav             WAV / WAVE (Waveform Audio)
wc3movie        Wing Commander III movie
webm            WebM
webm_chunk      WebM Chunk Muxer
webm_dash_manifest WebM DASH Manifest
webp            WebP
webp_pipe       piped webp sequence
webvtt          WebVTT subtitle
wsaud           Westwood Studios audio
wsd             Wideband Single-bit Data (WSD)
wsvqa           Westwood Studios VQA
wtv             Windows Television (WTV)
wv              raw WavPack
wve             Psion 3 audio
x11grab         X11 screen capture, using XCB
xa              Maxis XA
xbin            eXtended BINary text (XBIN)
xmv             Microsoft XMV
xpm_pipe        piped xpm sequence
xvag            Sony PS3 XVAG
xwma            Microsoft xWMA
yop             Psygnosis YOP
yuv4mpegpipe    YUV4MPEG pipe
``` 

## image (imagemagick)

1. takes an input.ext
2. spits out output.ext in the same folder

```bash
$ docker run -v $(pwd):/d/ fconvert/image input.ext1 output.ext2
$ docker run -v $(pwd):/d/ fconvert/image "https://...ext1" output.ext2 

$ docker run -v $(pwd):/d/ fconvert/image demo.png demo.jpg
$ docker run -v $(pwd):/d/ fconvert/image demo.pdf demo.jpg
# ...
```

### Supported formats
```
   Format  Module    Mode  Description
-------------------------------------------------------------------------------
      3FR  DNG       r--   Hasselblad CFV/H3D39II
      3G2  MPEG      r--   Media Container
      3GP  MPEG      r--   Media Container
      AAI* AAI       rw+   AAI Dune image
       AI  PDF       rw-   Adobe Illustrator CS2
      ART* ART       rw-   PFS: 1st Publisher Clip Art
      ARW  DNG       r--   Sony Alpha Raw Image Format
      AVI  MPEG      r--   Microsoft Audio/Visual Interleaved
      AVS* AVS       rw+   AVS X image
      BGR* BGR       rw+   Raw blue, green, and red samples
     BGRA* BGR       rw+   Raw blue, green, red, and alpha samples
     BGRO* BGR       rw+   Raw blue, green, red, and opacity samples
      BMP* BMP       rw-   Microsoft Windows bitmap image
     BMP2* BMP       rw-   Microsoft Windows bitmap image (V2)
     BMP3* BMP       rw-   Microsoft Windows bitmap image (V3)
      BRF* BRAILLE   -w-   BRF ASCII Braille format
      CAL* CALS      rw-   Continuous Acquisition and Life-cycle Support Type 1
           Specified in MIL-R-28002 and MIL-PRF-28002
     CALS* CALS      rw-   Continuous Acquisition and Life-cycle Support Type 1
           Specified in MIL-R-28002 and MIL-PRF-28002
   CANVAS* XC        r--   Constant image uniform color
  CAPTION* CAPTION   r--   Caption
      CIN* CIN       rw-   Cineon Image File
      CIP* CIP       -w-   Cisco IP phone image format
     CLIP* CLIP      rw+   Image Clip Mask
     CMYK* CMYK      rw+   Raw cyan, magenta, yellow, and black samples
    CMYKA* CMYK      rw+   Raw cyan, magenta, yellow, black, and alpha samples
      CR2  DNG       r--   Canon Digital Camera Raw Image Format
      CRW  DNG       r--   Canon Digital Camera Raw Image Format
      CUR* ICON      rw-   Microsoft icon
      CUT* CUT       r--   DR Halo
      DCM* DCM       r--   Digital Imaging and Communications in Medicine image
           DICOM is used by the medical community for images like X-rays.  The
           specification, "Digital Imaging and Communications in Medicine
           (DICOM)", is available at http://medical.nema.org/.  In particular,
           see part 5 which describes the image encoding (RLE, JPEG, JPEG-LS),
           and supplement 61 which adds JPEG-2000 encoding.
      DCR  DNG       r--   Kodak Digital Camera Raw Image File
      DCX* PCX       rw+   ZSoft IBM PC multi-page Paintbrush
      DDS* DDS       rw+   Microsoft DirectDraw Surface
    DFONT* TTF       r--   Multi-face font package (Freetype 2.9.0)
      DNG  DNG       r--   Digital Negative
      DOT  DOT       ---   Graphviz
      DPX* DPX       rw-   SMPTE 268M-2003 (DPX 2.0)
           Digital Moving Picture Exchange Bitmap, Version 2.0.
           See SMPTE 268M-2003 specification at http://www.smtpe.org

     DXT1* DDS       rw+   Microsoft DirectDraw Surface
     DXT5* DDS       rw+   Microsoft DirectDraw Surface
     EPDF  PDF       rw-   Encapsulated Portable Document Format
      EPI  PS        rw-   Encapsulated PostScript Interchange format
      EPS  PS        rw-   Encapsulated PostScript
     EPS2  PS2       -w-   Level II Encapsulated PostScript
     EPS3  PS3       -w+   Level III Encapsulated PostScript
     EPSF  PS        rw-   Encapsulated PostScript
     EPSI  PS        rw-   Encapsulated PostScript Interchange format
      EPT  EPT       rw-   Encapsulated PostScript with TIFF preview
     EPT2  EPT       rw-   Encapsulated PostScript Level II with TIFF preview
     EPT3  EPT       rw+   Encapsulated PostScript Level III with TIFF preview
      ERF  DNG       r--   Epson RAW Format
      FAX* FAX       rw+   Group 3 FAX
           FAX machines use non-square pixels which are 1.5 times wider than
           they are tall but computer displays use square pixels, therefore
           FAX images may appear to be narrow unless they are explicitly
           resized using a geometry of "150x100%".

     FILE* URL       r--   Uniform Resource Locator (file://)
     FITS* FITS      rw-   Flexible Image Transport System
  FRACTAL* PLASMA    r--   Plasma fractal image
      FTP* URL       r--   Uniform Resource Locator (ftp://)
      FTS* FITS      rw-   Flexible Image Transport System
       G3* FAX       rw-   Group 3 FAX
       G4* FAX       rw-   Group 4 FAX
      GIF* GIF       rw+   CompuServe graphics interchange format
    GIF87* GIF       rw-   CompuServe graphics interchange format (version 87a)
 GRADIENT* GRADIENT  r--   Gradual linear passing from one shade to another
     GRAY* GRAY      rw+   Raw gray samples
    GRAYA* GRAY      rw+   Raw gray and alpha samples
   GROUP4* TIFF      rw-   Raw CCITT Group4
       GV  DOT       ---   Graphviz
     HALD* HALD      r--   Identity Hald color lookup table image
      HDR* HDR       rw+   Radiance RGBE image format
HISTOGRAM* HISTOGRAM -w-   Histogram of the image
      HRZ* HRZ       rw-   Slow Scan TeleVision
      HTM* HTML      -w-   Hypertext Markup Language and a client-side image map
     HTML* HTML      -w-   Hypertext Markup Language and a client-side image map
     HTTP* URL       r--   Uniform Resource Locator (http://)
    HTTPS* URL       ---   Uniform Resource Locator (https://)
      ICB* TGA       rw-   Truevision Targa image
      ICO* ICON      rw+   Microsoft icon
     ICON* ICON      rw-   Microsoft icon
      IIQ  DNG       r--   Phase One Raw Image Format
     INFO  INFO      -w+   The image format and characteristics
   INLINE* INLINE    rw+   Base64-encoded inline images
      IPL* IPL       rw+   IPL Image Sequence
   ISOBRL* BRAILLE   -w-   ISO/TR 11548-1 format
  ISOBRL6* BRAILLE   -w-   ISO/TR 11548-1 format 6dot
      JNG* PNG       rw-   JPEG Network Graphics
           See http://www.libpng.org/pub/mng/ for details about the JNG
           format.
      JNX* JNX       r--   Garmin tile format
      JPE* JPEG      rw-   Joint Photographic Experts Group JFIF format (80)
     JPEG* JPEG      rw-   Joint Photographic Experts Group JFIF format (80)
      JPG* JPEG      rw-   Joint Photographic Experts Group JFIF format (80)
      JPS* JPEG      rw-   Joint Photographic Experts Group JFIF format (80)
     JSON  JSON      -w+   The image format and characteristics
      K25  DNG       r--   Kodak Digital Camera Raw Image Format
      KDC  DNG       r--   Kodak Digital Camera Raw Image Format
    LABEL* LABEL     r--   Image label
      M2V  MPEG      rw+   MPEG Video Stream
      M4V  MPEG      rw+   Raw MPEG-4 Video
      MAC* MAC       r--   MAC Paint
      MAP* MAP       rw-   Colormap intensities and indices
     MASK* MASK      rw+   Image Clip Mask
      MAT  MAT       rw+   MATLAB level 5 image format
    MATTE* MATTE     -w+   MATTE format
      MEF  DNG       r--   Mamiya Raw Image File
     MIFF* MIFF      rw+   Magick Image File Format
      MKV  MPEG      rw+   Multimedia Container
      MNG* PNG       rw+   Multiple-image Network Graphics (libpng 1.6.34)
           See http://www.libpng.org/pub/mng/ for details about the MNG
           format.
     MONO* MONO      rw-   Raw bi-level bitmap
      MOV  MPEG      rw+   MPEG Video Stream
      MP4  MPEG      rw+   MPEG-4 Video Stream
      MPC* MPC       rw+   Magick Persistent Cache image format
     MPEG  MPEG      rw+   MPEG Video Stream
      MPG  MPEG      rw+   MPEG Video Stream
      MRW  DNG       r--   Sony (Minolta) Raw Image File
      MSL* MSL       rw+   Magick Scripting Language
     MSVG  SVG       rw+   ImageMagick's own SVG internal renderer
      MTV* MTV       rw+   MTV Raytracing image format
      MVG* MVG       rw-   Magick Vector Graphics
      NEF  DNG       r--   Nikon Digital SLR Camera Raw Image File
      NRW  DNG       r--   Nikon Digital SLR Camera Raw Image File
     NULL* NULL      rw-   Constant image of uniform color
      ORF  DNG       r--   Olympus Digital Camera Raw Image File
      OTB* OTB       rw-   On-the-air bitmap
      OTF* TTF       r--   Open Type font (Freetype 2.9.0)
      PAL* UYVY      rw-   16bit/pixel interleaved YUV
     PALM* PALM      rw+   Palm pixmap
      PAM* PNM       rw+   Common 2-dimensional bitmap format
    PANGO* PANGO     r--   Pango Markup Language (Pangocairo 1.40.14)
  PATTERN* PATTERN   r--   Predefined pattern
      PBM* PNM       rw+   Portable bitmap format (black and white)
      PCD* PCD       rw-   Photo CD
     PCDS* PCD       rw-   Photo CD
      PCL  PCL       rw+   Printer Control Language
      PCT* PICT      rw-   Apple Macintosh QuickDraw/PICT
      PCX* PCX       rw-   ZSoft IBM PC Paintbrush
      PDB* PDB       rw+   Palm Database ImageViewer Format
      PDF  PDF       rw+   Portable Document Format
     PDFA  PDF       rw+   Portable Document Archive Format
      PEF  DNG       r--   Pentax Electronic File
      PES* PES       r--   Embrid Embroidery Format
      PFA* TTF       r--   Postscript Type 1 font (ASCII) (Freetype 2.9.0)
      PFB* TTF       r--   Postscript Type 1 font (binary) (Freetype 2.9.0)
      PFM* PNM       rw+   Portable float format
      PGM* PNM       rw+   Portable graymap format (gray scale)
      PGX* PGX       rw-   JPEG 2000 uncompressed format
    PICON* XPM       rw-   Personal Icon
     PICT* PICT      rw-   Apple Macintosh QuickDraw/PICT
      PIX* PIX       r--   Alias/Wavefront RLE image format
    PJPEG* JPEG      rw-   Joint Photographic Experts Group JFIF format (80)
   PLASMA* PLASMA    r--   Plasma fractal image
      PNG* PNG       rw-   Portable Network Graphics (libpng 1.6.34)
           See http://www.libpng.org/ for details about the PNG format.
    PNG00* PNG       rw-   PNG inheriting bit-depth, color-type from original, if possible
    PNG24* PNG       rw-   opaque or binary transparent 24-bit RGB (zlib 1.2.11)
    PNG32* PNG       rw-   opaque or transparent 32-bit RGBA
    PNG48* PNG       rw-   opaque or binary transparent 48-bit RGB
    PNG64* PNG       rw-   opaque or transparent 64-bit RGBA
     PNG8* PNG       rw-   8-bit indexed with optional binary transparency
      PNM* PNM       rw+   Portable anymap
      PPM* PNM       rw+   Portable pixmap format (color)
       PS  PS        rw+   PostScript
      PS2  PS2       -w+   Level II PostScript
      PS3  PS3       -w+   Level III PostScript
      PSB* PSD       rw+   Adobe Large Document Format
      PSD* PSD       rw+   Adobe Photoshop bitmap
     PTIF* TIFF      rw+   Pyramid encoded TIFF
      PWP* PWP       r--   Seattle Film Works
RADIAL-GRADIENT* GRADIENT  r--   Gradual radial passing from one shade to another
      RAF  DNG       r--   Fuji CCD-RAW Graphic File
      RAS* SUN       rw+   SUN Rasterfile
      RAW  DNG       r--   Raw
      RGB* RGB       rw+   Raw red, green, and blue samples
     RGBA* RGB       rw+   Raw red, green, blue, and alpha samples
     RGBO* RGB       rw+   Raw red, green, blue, and opacity samples
      RGF* RGF       rw-   LEGO Mindstorms EV3 Robot Graphic Format (black and white)
      RLA* RLA       r--   Alias/Wavefront image
      RLE* RLE       r--   Utah Run length encoded image
      RMF  DNG       r--   Raw Media Format
      RW2  DNG       r--   Panasonic Lumix Raw Image
      SCR* SCR       r--   ZX-Spectrum SCREEN$
      SCT* SCT       r--   Scitex HandShake
      SFW* SFW       r--   Seattle Film Works
      SGI* SGI       rw+   Irix RGB image
    SHTML* HTML      -w-   Hypertext Markup Language and a client-side image map
      SIX* SIXEL     rw-   DEC SIXEL Graphics Format
    SIXEL* SIXEL     rw-   DEC SIXEL Graphics Format
SPARSE-COLOR* TXT       -w+   Sparse Color
      SR2  DNG       r--   Sony Raw Format 2
      SRF  DNG       r--   Sony Raw Format
  STEGANO* STEGANO   r--   Steganographic image
      SUN* SUN       rw+   SUN Rasterfile
      SVG  SVG       rw+   Scalable Vector Graphics (RSVG 2.40.20)
     SVGZ  SVG       rw+   Compressed Scalable Vector Graphics (RSVG 2.40.20)
     TEXT* TXT       r--   Text
      TGA* TGA       rw-   Truevision Targa image
THUMBNAIL* THUMBNAIL -w+   EXIF Profile Thumbnail
     TIFF* TIFF      rw+   Tagged Image File Format (LIBTIFF, Version 4.0.9)
   TIFF64* TIFF      rw-   Tagged Image File Format (64-bit) (LIBTIFF, Version 4.0.9)
     TILE* TILE      r--   Tile image with a texture
      TIM* TIM       r--   PSX TIM
      TTC* TTF       r--   TrueType font collection (Freetype 2.9.0)
      TTF* TTF       r--   TrueType font (Freetype 2.9.0)
      TXT* TXT       rw+   Text
     UBRL* BRAILLE   -w-   Unicode Text format
    UBRL6* BRAILLE   -w-   Unicode Text format 6dot
      UIL* UIL       -w-   X-Motif UIL table
     UYVY* UYVY      rw-   16bit/pixel interleaved YUV
      VDA* TGA       rw-   Truevision Targa image
    VICAR* VICAR     rw-   VICAR rasterfile format
      VID* VID       rw+   Visual Image Directory
     VIFF* VIFF      rw+   Khoros Visualization image
     VIPS* VIPS      rw+   VIPS image
      VST* TGA       rw-   Truevision Targa image
     WBMP* WBMP      rw-   Wireless Bitmap (level 0) image
     WEBP* WEBP      rw-   WebP Image Format (libwebp 1.0.0 [0208])
      WMV  MPEG      rw+   Windows Media Video
      WPG* WPG       r--   Word Perfect Graphics
        X* X         rw+   X Image
      X3F  DNG       r--   Sigma Camera RAW Picture File
      XBM* XBM       rw-   X Windows system bitmap (black and white)
       XC* XC        r--   Constant image uniform color
      XCF* XCF       r--   GIMP image
      XPM* XPM       rw-   X Windows system pixmap (color)
      XPS  XPS       r--   Microsoft XML Paper Specification
       XV* VIFF      rw+   Khoros Visualization image
      XWD* XWD       rw-   X Windows system window dump (color)
    YCbCr* YCbCr     rw+   Raw Y, Cb, and Cr samples
   YCbCrA* YCbCr     rw+   Raw Y, Cb, Cr, and alpha samples
      YUV* YUV       rw-   CCIR 601 4:1:1 or 4:2:2
```

## sound (mpg123)

1. takes an input.ext
2. spits out output.ext in the same folder

::: tip
If it does not work with your formats, try with `fconvert/video` instead.
:::

```bash
$ docker run -v $(pwd):/d/ fconvert/sound input.ext1 output.ext2
$ docker run -v $(pwd):/d/ fconvert/sound "https://...ext1" output.ext2

$ docker run -v $(pwd):/d/ fconvert/sound demo.mp3 demo.wav 
$ docker run -v $(pwd):/d/ fconvert/sound demo.flv demo.mp3 
# ...
```