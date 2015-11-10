FROM niaquinto/gradle
MAINTAINER Reto Gmür <me@farewellutopia.com>

#Prepare
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Build
COPY ./ /usr/src/app

# Dockerhub seems to no longer clone with --recursive
RUN git submodule init && git submodule update

RUN gradle build export

ENTRYPOINT ["java"]
CMD ["-jar", "entry/generated/distributions/executable/launch.jar"]
