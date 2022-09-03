[![docker-k8s-quake3-server-ci](https://github.com/HeyyMrDJ/docker-k8s-quake3-server/actions/workflows/docker-image.yml/badge.svg)](https://github.com/HeyyMrDJ/docker-k8s-quake3-server/actions/workflows/docker-image.yml)


# docker-k8s-quake3-server
Repo for building quake3 docker image along with docker, docker-compose, and kubernetes manifests.

I created everything myself, but the work of [jberrenberg](https://github.com/jberrenberg/docker-quake3) helped alot. Please see the offical software repo for [ioquake](https://github.com/ioquake/ioq3) for more details around installing or licensing.  

**NOTE: You will need a pak0.pk3 file from your legally purchased copy of Quake3. You can find this on your Quake3 CD or wherever you purchased the game.**

# Quickstart - Docker

  ```Markdown
  # Deploy
  export PAK0=/PATH/TO/YOUR/pak0.pk3
  docker run -it -p 27960:27960/udp -v ${PAK0}:/home/ioq3srv/baseq3/pak0.pk3 --name quake3 ghcr.io/heyymrdj/docker-k8s-quake3:latest 

  # Teardown
  docker kill quake3
  docker rm quake3
  ```

# Quickstart - Docker-compose

  ```Markdown
  # Deploy
  git clone https://github.com/HeyyMrDJ/docker-k8s-quake3-server && cd docker-k8s-quake3-server
  export PAK0=/PATH/TO/YOUR/pak0.pk3
  docker-compose up

  # Teardown
  docker-compose down
  ```

# Quickstart - Kubernetes

  ```Markdown
  # Deploy
  git clone https://github.com/HeyyMrDJ/docker-k8s-quake3-server && cd docker-k8s-quake3-server
  export PAK0=/PATH/TO/YOUR/pak0.pk3
  cat k8s/quake_deployment.yaml| sed s+{{PAK0}}+$(echo $PAK0)+g | kubectl create -f -

  # Teardown
  cat k8s/quake_deployment.yaml| sed s+{{PAK0}}+$(echo $PAK0)+g | kubectl delete -f -
  ```
