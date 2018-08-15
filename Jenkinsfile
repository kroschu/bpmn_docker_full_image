node {
    checkout scm
    def bpmn-docker = docker.build("bpmn-full:${env.BUILD_ID}",  "--build-arg NODE_IMAGE_VERSION=10-alpine \
                                                                  --build-arg PROCESS_ENGINE_VERSION=0.1.3 \
                                                                  --build-arg BPMN_STUDIO_VERSION=develop .")
}