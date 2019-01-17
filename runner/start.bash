#!/bin/bash

#####
## * Processes hook sources before
## * Creates ENV var
## * Calls CMD
##
## Author: Marcello.deSales@gmail.com
#####

# Source all env files in the

echo ""
echo "=> Initializing SpringBoot Runner 'start.sh'"

if  [ ! -z "${UNMAZEDBOOT_COLLATOR_ENABLED}" ]; then
  echo ""
  echo "* Executing Collator collate.sh"
  /bin/bash collate.bash
fi

# When init containers dir is defined
if [ ! -z "${UNMAZEDBOOT_RUNNER_INIT_SCRIPTS_DIR}" ]; then
  if [ ! -d "${UNMAZEDBOOT_RUNNER_INIT_SCRIPTS_DIR}" ]; then
    echo "[ERROR]: provided init dir RUNNER_INIT_SCRIPTS_DIR=${UNMAZEDBOOT_RUNNER_INIT_SCRIPTS_DIR} is NOT a directory!"
    echo ""

  else
    echo ""
    echo "########## Running init scripts at '${UNMAZEDBOOT_RUNNER_INIT_SCRIPTS_DIR}'"
    echo ""

    FILE_NAMES=$(find ${UNMAZEDBOOT_RUNNER_INIT_SCRIPTS_DIR} -name '*.sh')
    FILES=(${FILE_NAMES// / })

    for i in "${!FILES[@]}"; do
      INIT_FILE=${FILES[i]}
      echo "[$((i+1))] executing 'sh ${INIT_FILE}'"
      echo ""
      sh ${INIT_FILE}

      if [ $? -eq 0 ]; then
        echo "[$((i+1))] OK successful execution of '${INIT_FILE}'"
      else
        echo "[$((i+1))] ERROR executing 'sh ${INIT_FILE}'. Check the logs!"
      fi
      echo ""
    done
  fi
fi

if [ -z "${UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES}" ]; then
  UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES=/runtime/sources
fi

if [ -d "${UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES}" ]; then
  echo ""
  echo "########## Processing source hooks at '${UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES}'"
  echo ""

  # Look for all env files
  FILE_NAMES=$(find ${UNMAZEDBOOT_RUNNER_HOOKS_DIR_SOURCES} -name '*.sh')
  FILES=(${FILE_NAMES// / })

  for i in "${!FILES[@]}"; do
    FILE=${FILES[i]}
    echo "[$((i+1))] source ${FILE}"
    source $FILE
  done
fi

# Create an environment hook to be created based on opt files
# This is here in case someone wants to reuse this for other languages
if [ -z "${UNMAZEDBOOT_RUNNER_ENV_HOOK_VAR}" ]; then
  UNMAZEDBOOT_RUNNER_ENV_HOOK_VAR=JAVA_OPTS
fi

if [ -z "${UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR}" ]; then
  UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR=/runtime/java-opts
fi

# Just print if it is in debug mode
if [ ! -z "${UNMAZEDBOOT_RUNNER_DEBUG_ENV}" ]; then
  echo ""
  echo "####### Debugging env before processing ##########"
  echo ""
  env
  echo ""
fi

if [ -d "${UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR}" ]; then
  echo ""
  echo "=> Processing ${UNMAZEDBOOT_RUNNER_ENV_HOOK_VAR} hooks at ${UNMAZEDBOOT_RUNNER_HOOKS_ENV_VAR_DIR}"
  echo ""

  # Look for all opt files
  FILE_NAMES=$(find ${RUNNER_HOOKS_ENV_VAR_DIR} -name '*.opt')
  FILES=(${FILE_NAMES// / })

  # Concat the options from all the files
  OPTS=""
  for i in "${!FILES[@]}"; do
    FILE=${FILES[i]}
    echo "[$((i+1))] ${UNMAZEDBOOT_RUNNER_ENV_HOOK_VAR} << ${FILE}"
    OPTS="${OPTS} $(cat ${FILE})"
  done
  echo ""

  # https://askubuntu.com/questions/879144/how-to-generate-environment-variable-name-dynamically-and-export-it/879147#879147
  # https://stackoverflow.com/questions/11966983/bash-giving-a-printf-v-invalid-option-error/11967145#11967145

  # if the env var was provided initial, concatenate with the values loaded
  # The env provided has higher precedence JAVA_OPTS=$JAVA_OPTS ${OPTS}
  IFS='%'
  CURRENT_VALUE="$(printf "%s" ${!UNMAZEDBOOT_RUNNER_ENV_HOOK_VAR})"
  unset IFS

  if [ ! -z "${CURRENT_VALUE}" ]; then
    # https://unix.stackexchange.com/questions/251893/get-environment-variable-by-variable-name/251896#251896
    # https://logbuffer.wordpress.com/2010/09/23/bash-scripting-preserve-whitespaces-in-variables/
    echo "Exporting and merging  ${UNMAZEDBOOT_RUNNER_ENV_HOOK_VAR}=${CURRENT_VALUE} ${OPTS}"

    # Having the variables together places a space between them
    RESOLVED_VALUE="$(printf %s "${CURRENT_VALUE}") $(printf %s "${OPTS}")"

  else
    echo "Exporting found opts ${UNMAZEDBOOT_RUNNER_ENV_HOOK_VAR}=${OPTS}"
    RESOLVED_VALUE="$(printf %s "${OPTS}")"
  fi

  # Resolve any environment variable
  RESOLVED_VALUE=$(echo $RESOLVED_VALUE)
  export "${UNMAZEDBOOT_RUNNER_ENV_HOOK_VAR}=${RESOLVED_VALUE}"
fi

echo ""

# Just print if it is in debug mode
if [ ! -z "${UNMAZEDBOOT_RUNNER_DEBUG_ENV}" ]; then
  echo ""
  echo "####### Debugging env after processing, before app start ##########"
  echo ""
  env
  echo ""
fi

echo "####### Starting the app ####### "
echo ""
echo "${UNMAZEDBOOT_RUNNER_CMD_EXEC}"
echo ""
sh -c "${UNMAZEDBOOT_RUNNER_CMD_EXEC}"
