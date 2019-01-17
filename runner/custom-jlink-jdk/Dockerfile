# #####################################################################
# Build stage for running the Executable SpringBoot WAR files
#
# 1. Use a FROM gradle:4.10.2-jdk10 as unmazedboot-builder-artifacts
# 2. Build your steps needed
# 3. For runtime image use FROM marcellodesales/spring-boot-package-runner
#    - It will copy the generate WAR and resources properly
# * Look at background info https://spring.io/guides/gs/spring-boot-docker/
# * https://github.com/moby/moby/issues/15025#issuecomment-371466934
# #####################################################################
ARG UNMAZEDBOOT_INTERNAL_BASE_IMAGE
FROM ${UNMAZEDBOOT_INTERNAL_BASE_IMAGE}

ARG UNMAZEDBOOT_INTERNAL_DEPENDENCIES
RUN sh -c "${UNMAZEDBOOT_INTERNAL_DEPENDENCIES}"

USER root

ENV JAVA_HOME=/opt/jdk-custom/jre
ENV PATH="$PATH:$JAVA_HOME/bin"

# https://dev.to/gimlet2/dockerizing-java-10-spring-boot-app-3b4c
# Similar setup for 11 Copying the custom JRE created by the Builder
ONBUILD RUN echo "Copying custom JRE /opt/jdk-custom /opt/jdk-custom/jre"
# hadolint ignore=DL3022
ONBUILD COPY --from=unmazedboot-jdk-linker /opt/jdk-custom /opt/jdk-custom/jre

# libapr: to support Tomcat production http://tomcat.apache.org/native-doc/
# https://stackoverflow.com/questions/4278047/apr-based-apache-tomcat-native-library-was-not-found-on-the-java-library-path
# RUN apt-get install -y add-apt-repository
# RUN add-apt-repository ppa:ondrej/apache2 && apt-get update && apt-get install -y libapr1.0-dev libssl-dev
# https://stackoverflow.com/questions/40319869/spring-boot-embedded-tomcat-performance/40446766#40446766
# Change SpringBoot App to use APR: https://gist.github.com/andreldm/7f89a3279438467a0bd41e6c1249d014#file-aprconfiguration-java

WORKDIR /runtime

ONBUILD ARG UNMAZEDBOOT_RUNNER_PORT
ONBUILD ENV UNMAZEDBOOT_RUNNER_PORT=${UNMAZEDBOOT_RUNNER_PORT}

# All files under UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES will be sourced
ONBUILD ARG UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES
ONBUILD ENV UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES=${UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES:-/runtime/sources}
ONBUILD RUN mkdir ${UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES}
# Creating the hook for environments to be sourced
ONBUILD RUN echo "export SPRINGBOOT_RUNNER_JRE_VERSION=\"openjdk:custom\"" >> ${UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES}/springboot.sh && \
            echo "export BUILDER_SPRINGBOOT_BUILD_TIME=\"$(date)\"" >> ${UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES}/springboot.sh

ONBUILD RUN echo "Sources hooks dir during build" && ls -la ${UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES}

# All files under UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR will be concatenated with JAVA_OPTS
ONBUILD ARG UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR
ONBUILD ENV UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR=${UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR:-/runtime/java-opts}
ONBUILD RUN echo "Creating java-opts hooks dir ${UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR} for JAVA_OPTS creation"

ONBUILD RUN mkdir ${UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR}
# Creating the hook for springboot to to be appended by entry.sh
ONBUILD RUN echo "-Djava.security.egd=file:/dev/./urandom" > ${UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR}/springboot.opt
ONBUILD RUN echo "--show-module-resolution" > ${UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR}/jdk-custom-debug.opt

# https://hub.docker.com/_/openjdk/, section "Make JVM respect CPU and RAM limits"
# On startup JVM tries to detect the number of available CPU cores and the amount of RAM
# to adjust its internal parameters (like the number of garbage collector threads to
# spawn) accordingly. When container is run with limited CPU/RAM, standard system API,
# used by JVM for probing, will return host-wide values. This can cause excessive CPU
# usage and memory allocation errors with older versions of JVM.
# Inside Linux containers, recent versions of OpenJDK 8 can correctly detect
# container-limited number of CPU cores by default. To enable the detection of
# container-limited amount of RAM the following options can be used:
# Removed deprecated -XX:+UseCGroupMemoryLimitForHeap
ONBUILD RUN echo "-XX:+UnlockExperimentalVMOptions" > ${UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR}/docker.opt
ONBUILD RUN echo "-showversion -XshowSettings:vm" > ${UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR}/vminfo.opt

# start.sh will execute CMD_ENV after processing the hooks dir and creating JAVA_OPTS
ONBUILD RUN echo "JAVA_OPTS hooks during build" && ls -la ${UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR}

ONBUILD ARG UNMAZEDBOOT_RUNNER_INIT_SCRIPTS_DIR
ONBUILD ENV UNMAZEDBOOT_RUNNER_INIT_SCRIPTS_DIR=${UNMAZEDBOOT_RUNNER_INIT_SCRIPTS_DIR:-/runtime/init}
ONBUILD RUN echo "Creating init scripts dir ${UNMAZEDBOOT_RUNNER_INIT_SCRIPTS_DIR} to execute before the app"
ONBUILD RUN mkdir ${UNMAZEDBOOT_RUNNER_INIT_SCRIPTS_DIR}

# Copy from the previous stage
ONBUILD RUN echo "Will copy from unmazedboot-builder-artifacts /runtime /runtime"
# hadolint ignore=DL3022
ONBUILD COPY --from=unmazedboot-builder-artifacts /runtime /runtime
ONBUILD RUN ls -la /runtime

ONBUILD RUN echo "Will copy from /app/src/main/resources /runtime/resources"
# hadolint ignore=DL3022
ONBUILD COPY --from=unmazedboot-builder-artifacts /app/src/main/resources /runtime/resources
ONBUILD RUN ls -la /runtime/resources

ONBUILD EXPOSE ${UNMAZEDBOOT_RUNNER_PORT}

# The CMD exec can be provided by users as well, so users can change what is executed
ONBUILD ARG UNMAZEDBOOT_RUNNER_CMD_EXEC
ONBUILD ENV UNMAZEDBOOT_RUNNER_CMD_EXEC=${UNMAZEDBOOT_RUNNER_CMD_EXEC:-"java \$JAVA_OPTS -jar /runtime/server.jar \$JAR_OPTS"}
ONBUILD RUN echo "Defining the UNMAZEDBOOT_RUNNER_CMD_EXEC=${UNMAZEDBOOT_RUNNER_CMD_EXEC}. Override if needed."
ONBUILD RUN echo "Entrypoint will execute UNMAZEDBOOT_RUNNER_CMD_EXEC from /runtime/start.bash"

COPY start.bash /runtime/start.bash
COPY collate.bash /runtime/collate.bash

# The builder Git SHA and Branch
ONBUILD ARG UNMAZEDBOOT_BUILDER_GIT_SHA
ONBUILD ARG UNMAZEDBOOT_BUILDER_GIT_BRANCH
ONBUILD ENV BUILD_TAG=sha=${UNMAZEDBOOT_BUILDER_GIT_SHA},build=${UNMAZEDBOOT_BUILDER_GIT_BRANCH}
ONBUILD ENV BUILD_COMMIT=${UNMAZEDBOOT_BUILDER_GIT_SHA}
ONBUILD ENV BUILD_BRANCH=${UNMAZEDBOOT_BUILDER_GIT_BRANCH}
ONBUILD RUN echo "Finished preparing image with env vars BUILD_COMMIT=${BUILD_COMMIT} from BUILD_BRANCH=${BUILD_BRANCH}"

# Start will call the UNMAZEDBOOT_RUNNER_CMD_EXEC value from the image after processing
# All the env hooks and JAVA_OPTS
ENTRYPOINT ["/bin/bash", "/runtime/start.bash"]
