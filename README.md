# Supported tags and respective Dockerfile links
* `latest`, `master` [(master/Dockerfile)](https://github.com/process-engine/bpmn_docker_full_image/blob/master/Dockerfile)
* `develop` [(develop/Dockerfile)](https://github.com/process-engine/bpmn_docker_full_image/blob/develop/Dockerfile)

# BPMN Docker Fullimage

Dieses Projekt beinhaltet eine Dockerfile um ein vollfunktionierendes 
BPMN-Studio mit Webinterface und API zu starten.
Es werden die NPM packages von bpmn-studio und process-engine verwendet 
und alle Abhängigkeiten installiert

## Was sind die Ziele dieses Projekts?

Ziel dieses Projektes ist es, ein vollumfängliches Docker image zur Benutzung 
des BPMN-Studios zu erzeugen.

## Relevante URLs

### Website

Weitere Informationen befinden sich auf der process-engine Website:
https://www.process-engine.io

### Docker Hub

https://hub.docker.com/r/5minds/bpmn-studio-bundle/

### GitHub

https://github.com/process-engine/bpmn_docker_full_image

## Wie kann ich das Projekt aufsetzen?

Der Container lässt sich mit folgendem Befehl starten:

```shell
docker run -p 8000:8000 -p 9000:9000 5minds/bpmn-studio-bundle:latest
```

Anschließend lässt sich das BPMN-Studio unter URL `http://localhost:9000` aufrufen.

Die ProcessEngine API ist unter `http://localhost:8000` erreichbar.

### Voraussetzungen

* Docker `>= 17.05`

### Build

Das Image lässt sich wie folgt bauen:

```shell
docker build -t 5minds/bpmn-studio-bundle:latest .
```

Es ist möglich, das base image, sowie die Paketversionen anzupassen:

* `NODE_IMAGE_VERSION`: Base image version mit NodeJS und Alpine Linux
* `PROCESS_ENGINE_VERSION`: NPM Version der ProcessEngine
* `BPMN_STUDIO_VERSION`: NPM Version des BPMN Studios

```shell
docker build --build-arg NODE_IMAGE_VERSION=10-alpine \
             --build-arg PROCESS_ENGINE_VERSION=latest \
             --build-arg BPMN_STUDIO_VERSION=latest \
             --tag 5minds/bpmn-studio-bundle:latest .
```


### Wen kann ich auf das Projekt ansprechen?
* [Christoph Gnip](mailto:christoph.gnip@5minds.de)
* [Dominik Kaminski](mailto:dominik.kaminski@5minds.de)
