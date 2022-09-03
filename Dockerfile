FROM alpine:latest as builder

RUN \
  echo "###### INSTALLING DEPENDENCIES ##################" && \
  apk --no-cache add curl g++ gcc git make sdl2-dev && \
  mkdir -p  /tmp/quake && \
  echo "###### FETCHING DEPENDENCIES ##################" && \
  git clone https://github.com/ioquake/ioq3 && \
  curl https://files.ioquake3.org/quake3-latest-pk3s.zip -o /tmp/quake/quake3-latest-pk3s.zip && \
  echo "###### BUILDING ##################" && \
  cd ioq3 && make && \
  echo "###### FINISHING STEPS ##################" && \
  unzip /tmp/quake/quake3-latest-pk3s.zip -d /tmp/quake && \
  cp -r /tmp/quake/quake3-latest-pk3s/* /ioq3/build/release-linux-x86_64/ && \
  echo "###### FINISHED BUILDING ##################" 

FROM alpine:latest
LABEL org.opencontainers.image.source="https://github.com/HeyyMrDJ/docker-k8s-quake3-server"
RUN adduser ioq3srv -D
RUN echo "test6"
COPY --from=builder /ioq3/build/release-linux-x86_64 /home/ioq3srv
COPY ./docker-quake3.sh /home/ioq3srv/baseq3/docker-quake3.sh
COPY ./docker-quake3.cfg /home/ioq3srv/baseq3/docker-quake3.cfg
USER ioq3srv
EXPOSE 27960/udp
ENTRYPOINT ["/home/ioq3srv/baseq3/docker-quake3.sh"]