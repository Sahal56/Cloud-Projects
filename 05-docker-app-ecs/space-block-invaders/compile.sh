#!/bin/sh

mkdir -p dist
cd src
rollup i.js --format cjs --file ../dist/bundle.js
cp t-tinified.png ../dist/t.png
cd ..
cd dist


terser bundle.js -o i.js --compress --mangle --mangle-props --timings --toplevel --module
rm bundle.js
roadroller -O2 i.js -o ./o.js



echo "<meta charset="UTF-8"><style>" > index-template.html
cat ../src/i.css >> index-template.html
echo "</style>" >> index-template.html
echo "<canvas id=\"c\"></canvas><canvas id=\"u\"></canvas>" >> index-template.html
echo "<script>" >> index-template.html
cat  ../src/lib/z.js >> index-template.html
echo "</script>" >> index-template.html

echo "<script>" >> index-template.html
cat ../src/c.js >> index-template.html
echo "</script>" >> index-template.html
echo "<script charset=\"utf8\">" >> index-template.html

cat o.js >> index-template.html
echo "</script><div id="s">Press any key to start</div>" >> index-template.html

cat index-template.html | tr -d '\n' > index.html


rm i.js o.js index-template.html

