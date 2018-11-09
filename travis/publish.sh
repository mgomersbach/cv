#!/bin/bash

cd /tmp
git clone https://${GH_OAUTH_TOKEN}@github.com/${GH_USER_NAME}/${GH_PROJECT_NAME} gh-pages 2>&1
cd gh-pages
git checkout gh-pages
mkdir -p dist/feature dist/hotfix dist/release
cp $RESULT_MD_PATH ./dist/${TRAVIS_BRANCH}-cv.md
cp $RESULT_PDF_PATH ./dist/${TRAVIS_BRANCH}-cv.pdf
cp $RESULT_HTML_PATH ./dist/${TRAVIS_BRANCH}-cv.html
cp $RESULT_DOCX_PATH ./dist/${TRAVIS_BRANCH}-cv.docx
git config --global user.name $GIT_AUTHOR_NAME
git config --global user.email $GIT_AUTHOR_EMAIL
git config --global push.default matching
git add -A
git commit -m "Adding latest build of docs to gh-pages"
git push https://${GH_OAUTH_TOKEN}@github.com/${GH_USER_NAME}/${GH_PROJECT_NAME} 2>&1
