### mzylowsk CV and portfolio

CV bases on sidebar template from https://github.com/jankapunkt/latexcv project. Boosted by mzylowski.

#### Latest version
Latest version of CV can be downloaded in releases section: https://github.com/mzylowski/mzylowski/releases


#### Working with source code and docker container
Build the container (all required latex dependencies will be installed):
```
git clone https://github.com/mzylowski/mzylowski.git && cd cv
docker build . -t cv_builder
```

Run container and build the CV:
```
cd cv
docker run -d -p 8080:80 --name cv -v $(pwd):/var/www/html cv_builder
docker exec cv pdflatex cv.tex
```

Go to browser and visit: http://127.0.0.1:8080/cv.pdf

Re-run docker exec every time when you want to test any CV changes.
