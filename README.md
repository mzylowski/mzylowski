### mzylowsk CV and portfolio

CV bases on sidebar template from https://github.com/jankapunkt/latexcv project


#### Build CV from source:
```
docker build . -t cv_builder && docker rm -f cv && docker run -d -p 8080:80 --name cv cv_builder
```

