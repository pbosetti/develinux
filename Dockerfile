FROM alpine:latest

USER root

# These commands copy your files into the specified directory in the image
# and set that as the working location
COPY ./* /root/

WORKDIR /root

RUN apk add cmake clang make git zsh curl wget

RUN apk add zeromq-dev hdf5-dev gsl-dev lapack-dev

RUN apk add ruby lua5.3-dev

# RUN gem install gv_fsm

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

CMD ["/bin/zsh"]

LABEL Name=develinux Version=0.0.1
