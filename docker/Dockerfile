FROM ubuntu:noble

RUN apt update && apt upgrade -y && apt update && apt install -y apt-utils build-essential vim git curl wget

ENV ACCESS_WS=/home/accessibility_ws
RUN mkdir -p $ACCESS_WS/src 

RUN curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN zcat < install-tl-unx.tar.gz | tar xf - 
RUN cd install-tl-2* && perl ./install-tl --no-interaction

COPY ./entrypoint.sh /
COPY ./.vimrc /home/ubuntu/

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bash"] 
