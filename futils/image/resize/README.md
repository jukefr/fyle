# resize (imagemagick)

## Usage
```bash
$ docker run -v $(pwd):/d/ -e size="50%" futils/resize file.ext
$ docker run -v $(pwd):/d/ -e size="50%" futils/resize "https://...ext"
$ docker run -v $(pwd):/d/ -e size="300px" futils/resize file.ext
```
