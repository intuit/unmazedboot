### Builder Arguments
ARG UNMAZEDBOOT_BUILDER_GIT_SHA=${UNMAZEDBOOT_BUILDER_GIT_SHA:-000000}
ARG UNMAZEDBOOT_BUILDER_GIT_BRANCH=${UNMAZEDBOOT_BUILDER_GIT_BRANCH:-master}
ARG UNMAZEDBOOT_BUILDER_GRADLE_BUILD_CMD="gradle build -x test"
ARG UNMAZEDBOOT_BUILDER_DIR="build/libs"
ARG UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION="jar"
ARG UNMAZEDBOOT_BUILDER_GRADLE_VERSION=${UNMAZEDBOOT_BUILDER_GRADLE_VERSION:--latest}

### Linker Argumentss
ARG UNMAZEDBOOT_LINKER_VERSION=${UNMAZEDBOOT_LINKER_VERSION:--latest}

### Runner Arguments
ARG UNMAZEDBOOT_RUNNER_PORT="8080"
ARG UNMAZEDBOOT_RUNNER_VERSION=${UNMAZEDBOOT_RUNNER_VERSION:--latest}

# #####################################################################
# Build stage for building the target directory before running tests
# #####################################################################
FROM intuit/unmazedboot-builder-gradle:4.10.2-jdk8-alpine${UNMAZEDBOOT_BUILDER_GRADLE_VERSION} as unmazedboot-builder-artifacts

# #####################################################################
# Build stage for making a jlink specific for the app
# #####################################################################
FROM intuit/unmazedboot-linker:jdk11-alpine${UNMAZEDBOOT_LINKER_VERSION} as unmazedboot-jdk-linker

# #####################################################################
# Build stage for running the runtime image (MUST MATCH LINKER TYPE)
# #####################################################################
FROM intuit/unmazedboot-runner:custom-jdk-alpine3.8${UNMAZEDBOOT_RUNNER_VERSION}
