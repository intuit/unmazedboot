# #####################################################################
# Build and pull dependencies
# #####################################################################
# Build Arguments to be received from a build pipeline
# Use --build-arg <varname>=<value> during docker build
# https://github.com/moby/moby/issues/15025#issuecomment-371466934
# #####################################################################
ARG UNMAZEDBOOT_INTERNAL_BASE_IMAGE

# hadolint ignore=DL3006
FROM ${UNMAZEDBOOT_INTERNAL_BASE_IMAGE}

# hadolint ignore=DL3002
USER root

ARG UNMAZEDBOOT_INTERNAL_DEPENDENCIES
RUN sh -c "${UNMAZEDBOOT_INTERNAL_DEPENDENCIES}"

# Adding dependencies to the image that the user requires
ONBUILD ARG BUILDER_BINARY_DEPENDENCIES
ONBUILD RUN sh -c "${BUILDER_BINARY_DEPENDENCIES:-echo installing-no-builder-dependencies}"

# The command used to build the gradle app
ONBUILD ARG UNMAZEDBOOT_BUILDER_GRADLE_BUILD_CMD
# The extension of the produced artifacts, usually  "jar" or "war"
ONBUILD ARG UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION
ONBUILD ENV UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION=${UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION}
# The dir where the artifacts are built, usually "build/"
ONBUILD ARG UNMAZEDBOOT_BUILDER_DIR
ONBUILD ENV UNMAZEDBOOT_BUILDER_DIR=${UNMAZEDBOOT_BUILDER_DIR}

WORKDIR /app/

# Copy the needed files to build a gradle project
ONBUILD COPY ./build.gradle build.gradle
ONBUILD COPY ./settings.gradle settings.gradle
ONBUILD COPY ./src src/

ONBUILD RUN echo "Executing UNMAZEDBOOT_BUILDER_GRADLE_BUILD_CMD='${UNMAZEDBOOT_BUILDER_GRADLE_BUILD_CMD}'"
ONBUILD RUN ${UNMAZEDBOOT_BUILDER_GRADLE_BUILD_CMD}

ONBUILD RUN echo "Built artifacts at /app/${UNMAZEDBOOT_BUILDER_DIR} and looking for package .${UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION}"
ONBUILD RUN find . -name "/app/${UNMAZEDBOOT_BUILDER_DIR}/*.${UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION}"

# Just rename the built version
ONBUILD RUN echo "Renaming the executable ${UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION} to the runtime dir"
ONBUILD RUN mkdir /runtime/ && \
            find /app/${UNMAZEDBOOT_BUILDER_DIR} -name "*.${UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION}" ! -name "*sources*" ! -name "*javadoc*" -exec cp -t /runtime {} + && \
            mv /runtime/*.${UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION} /runtime/server.jar

ONBUILD RUN echo "Contents for built /runtime/server.jar"
ONBUILD RUN echo "jar -tf /runtime/server.jar"
