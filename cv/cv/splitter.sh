#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

pdfseparate cv.pdf %d.pdf
mv cv.pdf cv_portfolio.pdf
pdfunite 1.pdf 2.pdf cv.pdf
pdfunite 3.pdf 4.pdf portfolio.pdf
