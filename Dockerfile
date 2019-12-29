#========================================base========================================#

FROM ubuntu
MAINTAINER Misaki Yukiasuna <misakisuna705@gmail.com>

#========================================root========================================#

#setup env
RUN \
        apt-get update && \
        apt-get install -y locales && \
        localedef -i en_US -f UTF-8 en_US.UTF-8

#setup user
RUN \
        apt-get install -y sudo && \
        groupadd admin && \
        useradd -m -g admin linuxbrew && \
        echo "linuxbrew ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
        groupadd user && \
        useradd -m -s /bin/zsh -g user vimer && \
        echo "vimer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#========================================linuxbrew========================================#

USER linuxbrew
ENV USER linuxbrew

#install zsh
RUN sudo apt-get install -y zsh

#install brew
RUN sudo apt-get install -y linuxbrew-wrapper && \
        brew

#========================================vimer========================================#

USER vimer
ENV USER vimer

#setup zsh
RUN \
        echo "export PATH='/home/linuxbrew/.linuxbrew/bin:$PATH'" >> ~/.zshrc && \
        echo "export MANPATH='/home/linuxbrew/.linuxbrew/share/man:$MANPATH'" >> ~/.zshrc && \
        echo "export INFOPATH='/home/linuxbrew/.linuxbrew/share/info:$INFOPATH'" >> ~/.zshrc

#setup brew
RUN \
        sudo chown -R vimer: /home/linuxbrew/.linuxbrew && \
        sudo chmod -R g+w,o-w /home/linuxbrew/.linuxbrew

#setup Vimsual_Studio
RUN \
        git clone https://github.com/misakisuna705/Vimsual_Studio.git ~/.dotfiles && \
        ~/.dotfiles/setup.sh && \
        ~/.dotfiles/setup.sh

#run docker
ENV LANG C.UTF-8
ENV TERM xterm-256color
WORKDIR /home/vimer
ENTRYPOINT ["/bin/zsh"]
