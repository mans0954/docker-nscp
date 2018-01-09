FROM debian:sid

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y build-essential

RUN apt-get install -y cmake python python-dev libssl-dev libboost-all-dev protobuf-compiler python-protobuf libprotobuf-dev python-sphinx libcrypto++-dev libcrypto++ liblua5.1-0-dev libgtest-dev
RUN apt-get install -y git vim wget

RUN git clone https://github.com/mans0954/nscp.git

WORKDIR nscp

RUN git checkout fix-525

#RUN git config --global user.email "you@example.com"
#RUN git config --global user.name "Your Name" 
#RUN git cherry-pick -x 13c7d7d10da5654b539d86f6a554254aa5b3ae4a

#RUN git submodule update --init ext/cryptopp
#RUN git submodule update --init ext/gtest
#RUN git submodule update --init ext/json-spirit
#RUN git submodule update --init ext/md-protobuf
#RUN git submodule update --init ext/tinyxml2
#RUN git submodule update --init ext/google-breakpad
RUN git submodule update --init ext/json-protobuf
#RUN git submodule update --init ext/lua-protobuf
RUN git submodule update --init ext/miniz 

#RUN chmod u+x /nscp/ext/md-protobuf/protoc-gen-md

WORKDIR /nscp/build

RUN cmake ../

RUN make
