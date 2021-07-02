FROM alpine:latest

USER root

RUN apk add --no-cache --update cmake clang make git zsh curl wget sudo

RUN apk add --no-cache --update zeromq-dev hdf5-dev gsl-dev lapack-dev

RUN apk add --no-cache --update ruby lua5.3-dev

RUN adduser -S user -G wheel

# These commands copy your files into the specified directory in the image
# and set that as the working location
RUN mkdir -p /work
COPY ./* /work/
WORKDIR /work
RUN chmod a+rwx -R /work
RUN chmod a+rwx -R /root

# RUN sudo gem install gv_fsm

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

SHELL ["/bin/zsh", "-c"]

CMD ["/bin/zsh"]

LABEL Name=develinux Version=0.0.2
