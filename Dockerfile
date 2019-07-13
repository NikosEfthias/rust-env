FROM rust
RUN apt-get update -y && apt-get dist-upgrade -y &&\ 
		apt-get install -y neovim rsync stow tmux && \
		rustup toolchain add nightly &&\
		rustup component add rls &&\ 
		cargo +nightly install racer rustfmt &&\ 
		git clone https://github.com/nikosEfthias/dotfiles /root/dotfiles &&\ 
		cd /root/dotfiles && stow config &&\ 
		mkdir /root/app
VOLUME /root/app 
VOLUME /usr/local/cargo/registry
VOLUME /usr/local/cargo/git
VOLUME /root/.ssh
VOLUME /root/plugged
WORKDIR /app
CMD cargo build --production 

