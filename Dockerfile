FROM hypriot/rpi-golang:1.4.2
MAINTAINER Lars Larsson "lars.martin.larsson@gmail.com"
RUN apt-get update

# Install Node
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN curl -sLS https://apt.adafruit.com/add | bash
RUN apt-get install -y node

# Install fpm and rpm
RUN apt-get install -y build-essential git ruby-dev
RUN gem install fpm
RUN apt-get install -y rpm

# Other installations
RUN apt-get install -y bzip2
RUN go get github.com/grafana/grafana
WORKDIR "/gopath/src/github.com/grafana/grafana"
RUN go run build.go setup
