#!/bin/bash

COLLATOR_KEY="COLLATE_"

echo ""
echo "******  Initializing Collator  ****** "
echo ""
echo "* Filtering environment variables start with '${COLLATOR_KEY}*'"
echo ""

ENVS=$(env)
ENVS=(${ENVS// /})

# Collect all the env vars as system properties
for i in "${!ENVS[@]}"; do
  ENV_PAIR=${ENVS[i]}
  ENV_KEY=${ENV_PAIR%=*}
  ENV_VALUE=${ENV_PAIR#*=}
  ENV_VALUE=$(echo ${ENV_VALUE} | sed "s/\"//g")

  # CONTRAST_DIR=/my/dir ====>>>> -Dcontrast.key=/my/dir
  if [[ "${ENV_KEY}" =~ ^${COLLATOR_KEY}* ]]; then
    VALUE_FROM=${ENV_VALUE%>*}
    VALUE_TO=${ENV_VALUE#*>}

    # It must be from an existing file or directory
    echo "=> Processing ${ENV_KEY} collate from '${VALUE_FROM}' to '${VALUE_TO}'"
    if [[ ! "${VALUE_FROM}" == *"*"* ]] && [ ! -f ${VALUE_FROM} ] && [ ! -d ${VALUE_FROM} ]; then
      echo "ERROR: The origin path '${VALUE_FROM}' does NOT exist!"
      continue
    fi

    # Copy the files only as is, with same name or different as specified
    # /from/a.txt > /from/b.txt |  /from/a.txt > /from
    if [[ "${VALUE_FROM}" == *"*"* ]]; then
      # When providing wildcards, the to is expected to be a dir
      mkdir -p ${VALUE_TO} | true
      cp --verbose ${VALUE_FROM} ${VALUE_TO}

    else

      # The parent dir must exist for the file at least
      PARENT_TO=$(dirname ${VALUE_TO})
      if [ ! -d ${PARENT_TO} ]; then
        echo "WARN: Destination path '${VALUE_TO}' does not have a dir at ${PARENT_TO}!"
        echo "* Creating dir ${PARENT_TO}"
        mkdir -p ${PARENT_TO}
      fi

      if [ -f ${VALUE_FROM} ]; then
      cp --verbose ${VALUE_FROM} ${VALUE_TO}

      elif [ -d ${VALUE_FROM} ]; then
        cp --verbose -R ${VALUE_FROM} ${VALUE_TO}
      fi
    fi

    echo ""
  fi
done

echo ""
echo "Collation process finished!"
echo ""
