FROM ekidd/rust-musl-builder:nightly-2021-01-01
COPY ./bash_profile ~/.bash_profile
RUN sudo apt-get update && \
  sudo apt-get install -y --no-install-recommends \
  zip \
  && sudo rm -rf /var/lib/apt/lists/*
SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
RUN source ~/.bashrc && nvm install --lts && nvm alias default "lts/*"
SHELL ["/bin/bash", "--login", "-c"]

