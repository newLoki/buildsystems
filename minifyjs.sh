#!/bin/bash
for f in  $(find . -type f -iname '*.js' -and -not -name '*.min.js' | sed 's/\(.*\)\..*/\1/')
do
    if [ -e ${f}.min.js ]
    then
        if [ ${f}.min.js -ot ${f}.js ]
        then
            echo "minify ${f}.js, because ${f}.min.js is to old"
            #call minify command
            uglifyjs -nc ${f}.js > ${f}.min.js
        fi
    else
        echo "minify ${f}.js, because no one did it before"
        #call minify command
        uglifyjs -nc ${f}.js > ${f}.min.js
    fi
done
