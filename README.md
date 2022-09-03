# docker-k8s-quake3-server
Repo for building quake3 docker image along with docker, docker-compose, and kubernetes manifests

# Quickstart - Docker
**NOTE: You are required to pass in the pak0.pk3 file from your legally purchased copy of Quake3. You can find this on your Quake3 CD or wherever you purchased the game.**
  ```
  export PAK0=/PATH/TO/YOUR/pak0.pk3
  docker run -it -p 27960:27960/udp -v ${PAK0}://home/ioq3srv/baseq3/pak0.pk3 ghcr.io/heyymrdj/docker-k8s-quake3:latest 
  ```
