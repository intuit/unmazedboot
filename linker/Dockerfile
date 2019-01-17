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

# hadolint ignore=DL3006
FROM ${UNMAZEDBOOT_INTERNAL_BASE_IMAGE}

WORKDIR /opt

ARG UNMAZEDBOOT_INTERNAL_DEPENDENCIES
RUN sh -c "${UNMAZEDBOOT_INTERNAL_DEPENDENCIES}"

ENV JAVA_HOME=/opt/jdk
ENV PATH="$PATH:$JAVA_HOME/bin"

# Using Jlink to create a custom JRE for the user
# The user-selected list of JDK modules to JRE
# http://openjdk.java.net/jeps/220, http://openjdk.java.net/projects/jigsaw/doc/jdk-modularization.html
ONBUILD ARG UNMAZEDBOOT_LINKER_JDK_MODULES
ONBUILD ENV UNMAZEDBOOT_LINKER_JDK_MODULES=${UNMAZEDBOOT_LINKER_JDK_MODULES:-java.base,java.logging,java.xml,jdk.unsupported,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument}

# Using the JLink http://openjdk.java.net/jeps/282
ONBUILD RUN echo "Building custom JRE '/opt/jdk-custom' with UNMAZEDBOOT_LINKER_JDK_MODULES='${UNMAZEDBOOT_LINKER_JDK_MODULES}'"

# The UNMAZEDBOOT_LINKER_JDK_MODULES are passed as a param, so onbuild it too
ONBUILD ENV UNMAZEDBOOT_INTERNAL_JLINK_COMMAND_ARGS="--module-path /opt/jdk/jmods \
    --verbose \
    --add-modules ${UNMAZEDBOOT_LINKER_JDK_MODULES} \
    --output /opt/jdk-custom \
    --compress 2 \
    --no-header-files \
    --no-man-pages"

ARG UNMAZEDBOOT_CUSTOM_JLINK_PATH
ENV UNMAZEDBOOT_CUSTOM_JLINK_PATH=${UNMAZEDBOOT_CUSTOM_JLINK_PATH:-date}
# Some images have jlink in the path, others don't, so guaranteeing that we can provide during the build of this image
ONBUILD RUN echo "Linking jlink ${UNMAZEDBOOT_INTERNAL_JLINK_COMMAND_ARGS} || ${UNMAZEDBOOT_CUSTOM_JLINK_PATH} ${UNMAZEDBOOT_INTERNAL_JLINK_COMMAND_ARGS}"
ONBUILD RUN jlink ${UNMAZEDBOOT_INTERNAL_JLINK_COMMAND_ARGS} || ${UNMAZEDBOOT_CUSTOM_JLINK_PATH} ${UNMAZEDBOOT_INTERNAL_JLINK_COMMAND_ARGS}

# https://github.com/docker-library/openjdk/issues/217#issuecomment-436275472

ARG UNMAZEDBOOT_POST_JLINK_CMD
ENV UNMAZEDBOOT_POST_JLINK_CMD=${UNMAZEDBOOT_POST_JLINK_CMD:-date}
RUN echo "Will execute command ${UNMAZEDBOOT_POST_JLINK_CMD} after jlink execution"
ONBUILD RUN sh -c "${UNMAZEDBOOT_POST_JLINK_CMD}"
