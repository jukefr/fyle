![banner](https://s3.eu-west-3.amazonaws.com/juke-github/foptimize-b.png)
![foptimize](https://s3.eu-west-3.amazonaws.com/juke-github/foptimize1.gif)

## API (Services)
1. image
    - [gif](/image/gif/README.md)
    - [png](/image/png/README.md)
    - [jpg](/image/jpg/README.md)


Every service supports passing an URL directly.
More to come later, feel free to contribute, I will add an automated build system at some point.

## CLI
A command line interface utility is available in [futils](https://github.com/jukefr/futils#cli)

## Testing
`test.sh` runs the built docker images against a test image (found in `test.csv`). It's pretty basic for now.
```bash
$ ./test.sh
Testing service image format gif with url https://upload.wikimedia.org/wikipedia/c...
tmp.gif is now 34% of its original size.
Testing service image format png with url http://www.pngmart.com/files/1/Cat-PNG-H...
tmp.png is now 33% of its original size.
Testing service image format jpg with url https://img.webmd.com/dtmcms/live/webmd/...
tmp.jpg is now 75% of its original size.
```

## See also
- [fconvert](https://github.com/jukefr/fconvert) opinionated and easy file conversion
- [futils](https://github.com/jukefr/futils) opinionated and easy file utilities
