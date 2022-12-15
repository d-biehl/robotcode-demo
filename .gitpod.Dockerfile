FROM	 archlinux:latest

# Update the repositories
RUN	 pacman -Syy

RUN /bin/sh -c echo '[multilib]' >> /etc/pacman.conf && \
    pacman --noconfirm -Syyu && \
    pacman --noconfirm -S base-devel git git-lfs && \
    useradd -m -r -s /bin/bash aur && \
    passwd -d aur && \
    echo 'aur ALL=(ALL) ALL' > /etc/sudoers.d/aur && \
    mkdir -p /home/aur/.gnupg && \
    echo 'standard-resolver' > /home/aur/.gnupg/dirmngr.conf && \
    chown -R aur:aur /home/aur && \
    mkdir /build && \
    chown -R aur:aur /build && \
    cd /build && \
    sudo -u aur git clone --depth 1 https://aur.archlinux.org/yay.git && \
    cd yay && \
    sudo -u aur makepkg --noconfirm -si

RUN sudo -u aur yay -S --needed --noconfirm zsh easy-zsh-config

RUN sed -i -r "s/^(PATH_OF_THE_THEME=).*/\1\/usr\/share\/oh-my-posh\/themes\/stelbent\.minimal\.omp\.json/" /etc/skel/.zshrc

RUN sudo -u aur yay -S --needed --noconfirm python python-pip python-setuptools python-poetry python-pipenv pyenv

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /etc/skel/.zshrc
RUN echo 'command -v pyenv >/dev/null || export PATH="$PATH:$PYENV_ROOT/bin"' >> /etc/skel/.zshrc
RUN echo 'eval "$(pyenv init -)"' >> /etc/skel/.zshrc

RUN sudo -u aur yay --cleanafter --removemake --save && \
    pacman -Qtdq | xargs -r pacman --noconfirm -Rcns && \
    rm -rf /home/aur/.cache && \
    rm -rf /build

RUN useradd -l -u 33333 -G wheel -md /home/gitpod -s /bin/zsh -p gitpod gitpod
USER gitpod

ENV SHELL=/usr/bin/zsh
