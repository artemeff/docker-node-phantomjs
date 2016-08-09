FROM node:6.3.1

ENV phantomjsVersion 2.1.1
ENV buildDeps build-essential
ENV phantomjsDeps libfontconfig1

RUN \
    apt-get update \
&&  apt-get install ${buildDeps} ${phantomjsDeps} -y \
&&  wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${phantomjsVersion}-linux-x86_64.tar.bz2 -O phantomjs.tar.bz2 \
&&  tar xjf phantomjs.tar.bz2 \
&&  rm -rf phantomjs.tar.bz2 \
&&  mv /phantomjs-${phantomjsVersion}-linux-x86_64 /phantomjs \
&&  ls -A /phantomjs | grep -v bin | xargs rm -rf \
&&  ln -s /phantomjs/bin/phantomjs /usr/local/share/phantomjs \
&&  ln -s /phantomjs/bin/phantomjs /usr/local/bin/phantomjs \
&&  ln -s /phantomjs/bin/phantomjs /usr/bin/phantomjs \
&&  phantomjs -v

CMD \
    echo "phantomjs binary is located at /phantomjs/phantomjs-${phantomjsVersion}/bin/phantomjs" \
&&  echo "just run 'phantomjs' (version `phantomjs -v`)"
