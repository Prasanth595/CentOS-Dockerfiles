# Building everything from centos:centos6 base image

export REPO_URL=prasanth595

for dir in ./*/centos6
do
    pushd $dir &> /dev/null
        # tmp var for short dirname
        tmp=$(dirname $dir)

        # strip all characters leading up to and including '/'
        appname=${tmp##*/}
        disttag=${dir##*/}

        docker build -t $REPO_URL/${appname}:${disttag} .
        docker push $REPO_URL/${appname}:${disttag}
    popd &> /dev/null;
done

# Building everything from centos:centos7 base image
for dir in ./*/centos7
do
    pushd $dir &> /dev/null
        # tmp var for short dirname
        tmp=$(dirname $dir)

        # strip all characters leading up to and including '/'
        appname=${tmp##*/}
        disttag=${dir##*/}

        docker build -t $REPO_URL/${appname}:${disttag} .
        docker push $REPO_URL/${appname}:${disttag}
    popd &> /dev/null
done
