# BPMN Docker Fullimage

Dieses Projekt beinhaltet eine Dockerfile um ein vollfunktionierendes 
BPMN-Studio mit Webinterface und API zu starten.
Es werden die NPM packages von bpmn-studio und process-engine verwendet 
und alle Abhängkeiten installiert

## Was sind die Ziele dieses Projekts?

Ziel dieses Projektes ist es, ein vollumfängliches docker image zur Benutzung 
des BPMN-Studios zu erzeugen.

## Relevante URLs

**TODO** Docker Hub Link angeben.

## Wie kann ich das Projekt aufsetzen?

Der Container lässt sich mit folgendem Befehl starten:

```shell
docker run -p 8000:8000 -p 9000:9000 bpmn-full:v0.1
```

Anschließend lässt sich das BPMN-Studio unter URL `http://localhost:9000` aufrufen.

Die ProcessEngine API ist unter `http://localhost:8000` erreichbar.

### Voraussetzungen

* Docker `>= 17.05`

### Build

Das Image lässt sich wie folgt bauen:

```shell
docker build -t bpmn-full:v0.1 .
```

Es ist möglich, das base image, sowie die Paketversionen anzupassen:

* `NODE_IMAGE_VERSION`: Base image version mit NodeJS und Alpine Linux
* `PROCESS_ENGINE_VERSION`: NPM Version der ProcessEngine
* `BPMN_STUDIO_VERSION`: NPM Version des BPMN Studios

```shell
docker build --build-arg NODE_IMAGE_VERSION=10-alpine \
             --build-arg PROCESS_ENGINE_VERSION=0.1.3 \
             --build-arg BPMN_STUDIO_VERSION=3.0.1 \
             -t bpmn-full:v0.1 .
```


### Wen kann ich auf das Projekt ansprechen?
* [Christoph Gnip](mailto:christoph.gnip@5minds.de)
* [Dominik Kaminski](mailto:dominik.kaminski@5minds.de)
