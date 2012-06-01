#!/bin/bash
for f in  $(find . -type f -iname '*.css' -and -not -name '*.min.css' | sed 's/\(.*\)\..*/\1/')
do
    if [ -e ${f}.min.css ]
    then
        if [ ${f}.min.css -ot ${f}.css ]
        then
            echo "minify ${f}.css, because ${f}.min.css is to old"
            #call minify command
            cleancss -o ${f}.min.css ${f}.css
        fi
    else
        echo "minify ${f}.css, because no one did it before"
        #call minify command
        cleancss -o ${f}.min.css ${f}.css
    fi
done
