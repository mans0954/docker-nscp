FROM debian:sid

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y build-essential

RUN apt-get install -y cmake
RUN apt-get install -y python python-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y protobuf-compiler python-protobuf libprotobuf-dev
RUN apt-get install -y python-sphinx
RUN apt-get install -y libcrypto++-dev libcrypto++
RUN apt-get install -y liblua5.1-0-dev
RUN apt-get install -y libgtest-dev
RUN apt-get install -y git vim wget

RUN git clone https://github.com/mickem/nscp.git

WORKDIR nscp

RUN git checkout 0.5.2.22

#RUN git submodule update --init ext/cryptopp
#RUN git submodule update --init ext/gtest
RUN git submodule update --init ext/json-spirit
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
