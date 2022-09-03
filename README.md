# docker-k8s-quake3-server
Repo for building quake3 docker image along with docker, docker-compose, and kubernetes manifests.

I created everything myself, but the work of [jberrenberg](https://github.com/jberrenberg/docker-quake3) helped alot. Please see the offical software repo [ioquake](https://github.com/ioquake/ioq3) for more details around installing or licensing.  

**NOTE: You will need a pak0.pk3 file from your legally purchased copy of Quake3. You can find this on your Quake3 CD or wherever you purchased the game.**

# Quickstart - Docker

  ```
  export PAK0=/PATH/TO/YOUR/pak0.pk3
  docker run -it -p 27960:27960/udp -v ${PAK0}:/home/ioq3srv/baseq3/pak0.pk3 ghcr.io/heyymrdj/docker-k8s-quake3:latest 
  ```

# Quickstart - Docker-compose

  ```
  export PAK0=/PATH/TO/YOUR/pak0.pk3
  docker-compose up
  ```