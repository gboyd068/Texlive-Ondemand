FROM ubuntu:20.04
RUN   apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -q -y wget \
    texlive-full \
    python3 \
    python3-pip 
COPY . /app
RUN pip3 install -r /app/requirements.txt && echo "0.5"
RUN mkdir /usr/share/texlive/texmf-dist/tex/latex/yquant
RUN cp /app/yquant.sty /usr/share/texlive/texmf-dist/tex/latex/yquant
WORKDIR /app
CMD ["python3", "wsgi.py"]
