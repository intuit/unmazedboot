### Builder Arguments
ARG UNMAZEDBOOT_BUILDER_GIT_SHA=${UNMAZEDBOOT_BUILDER_GIT_SHA:-000000}
ARG UNMAZEDBOOT_BUILDER_GIT_BRANCH=${UNMAZEDBOOT_BUILDER_GIT_BRANCH:-master}
ARG UNMAZEDBOOT_BUILDER_MAVEN_BUILD_CMD="mvn clean package"
ARG UNMAZEDBOOT_BUILDER_DIR="target"
ARG UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION="jar"
ARG UNMAZEDBOOT_BUILDER_MAVEN_VERSION=${UNMAZEDBOOT_BUILDER_MAVEN_VERSION:--latest}

### Linker Arguments
ARG UNMAZEDBOOT_LINKER_JDK_MODULES=jdk.jfr,jdk.management.agent,java.base,java.logging,java.xml,jdk.unsupported,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument
ARG UNMAZEDBOOT_LINKER_VERSION=${UNMAZEDBOOT_LINKER_VERSION:--latest}

### Runner Arguments
ARG UNMAZEDBOOT_RUNNER_PORT="8080"
ARG UNMAZEDBOOT_RUNNER_VERSION=${UNMAZEDBOOT_RUNNER_VERSION:--latest}

# #####################################################################
# Build stage for building the target directory before running tests
# #####################################################################
FROM intuit/unmazedboot-builder-maven:3.6.0-jdk11-slim${UNMAZEDBOOT_BUILDER_MAVEN_VERSION} as unmazedboot-builder-artifacts

# #####################################################################
# Build stage for making a jlink specific for the app
# #####################################################################
FROM intuit/unmazedboot-linker:jdk11-alpine${UNMAZEDBOOT_LINKER_VERSION} as unmazedboot-jdk-linker

# #####################################################################
# Build stage for running the runtime image
# #####################################################################
FROM intuit/unmazedboot-runner:custom-jdk-alpine3.8${UNMAZEDBOOT_RUNNER_VERSION}

# The image depends on the built artifacts by the stage

ENV JAVA_FLIGHT_RECORDER_DIR=/runtime/jfr
# hadolint ignore=SC2039
RUN echo "-XX:StartFlightRecording=name=sample,filename=${JAVA_FLIGHT_RECORDER_DIR}/sample.jfr,delay=30s,maxage=2h,maxsize=10m,dumponexit=true,settings=${JAVA_FLIGHT_RECORDER_DIR}/profile.jfc" > /runtime/java-opts/flight-recorder.opt

# hadolint ignore=SC2039
RUN echo $'-Dcom.sun.management.jmxremote.port=7199 \n\
      -Dcom.sun.management.jmxremote.rmi.port=7199 \n\
      -Dcom.sun.management.jmxremote.authenticate=false \n\
      -Dcom.sun.management.jmxremote.ssl=false' > /runtime/java-opts/jmx.opts

# JVM debugging port
EXPOSE 7199
