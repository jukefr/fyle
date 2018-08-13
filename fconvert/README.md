![banner](https://s3.eu-west-3.amazonaws.com/juke-github/fconvert-b.png)
![fconvert](https://s3.eu-west-3.amazonaws.com/juke-github/fconvert1.gif)

## API (Services)
- [video](/video/README.md)
- [image](/image/README.md)
- [sound](/sound/README.md)

Every service supports passing an URL directly.
More to come later, feel free to contribute, I will add an automated build system at some point.

## CLI
A command line interface utility is available in [futils](https://github.com/jukefr/fyle/tree/master/futils#cli)

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
