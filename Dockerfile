from ubuntu:latest

ENV TZ=Europe/Bratislava
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update \
    && apt-get -y install texlive-xetex wget unzip texlive-fonts-extra texlive-luatex \
    && mkdir -p /usr/local/share/texmf/tex/latex/moderncv \
    && wget https://github.com/moderncv/moderncv/archive/refs/tags/v2.1.0.zip \
    && unzip -j v2.1.0.zip -d /usr/local/share/texmf/tex/latex/moderncv \
    && mktexlsr \
    && luaotfload-tool -u

VOLUME "/data"
WORKDIR "/data"

ENTRYPOINT ["/usr/bin/lualatex"]
