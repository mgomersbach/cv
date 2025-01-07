FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Amsterdam
ENV PATH="/root/.local/bin:$PATH"

RUN apt-get update && apt-get install -y \
    git \
    make \
    texlive \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-xetex \
    pandoc \
    pandoc-plantuml-filter \
    && apt-get clean

WORKDIR /app

COPY . .

CMD ["make", "all"]