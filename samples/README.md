# SpringBoot Samples

* This shows the differences between the JREs
* Their performance is definitely different
* Starting with JDK10, modules are huge improvement
  * You can see the difference between regular JDK 10 and custom JRE 10 built
  * So far we have cross-compiled version of jdk8 samples running in JRE 10 custom and full

> **ATTENTION**: Run this from the root dir!!!

## Building

* Use the latest `docker-compose` support with `--parallel`
  * That will speed up the entire build

```
$ docker-compose -f docker-compose-samples.yaml build --parallel
Building sample-gradle-java-jre8          ...
Building sample-gradle-java-jre10         ...
Building samples-gradle-java-custom-jre10 ...
Building sample-gradle-java-jre8
Building samples-gradle-java-custom-jre10
Building sample-gradle-java-jre10
```

## Run the applications

* Just use regular `up`

```
$ docker-compose -f docker-compose-samples.yaml up
Recreating springboot-docker-reusable-images_sample-gradle-java-jre10_1         ... done
Recreating springboot-docker-reusable-images_sample-gradle-java-jre8_1          ... done
Recreating springboot-docker-reusable-images_samples-gradle-java-custom-jre10_1 ... done
Attaching to springboot-docker-reusable-images_samples-gradle-java-custom-jre10_1, springboot-docker-reusable-images_sample-gradle-java-jre8_1, springboot-docker-reusable-images_sample-gradle-java-jre10_1
samples-gradle-java-custom-jre10_1  |
samples-gradle-java-custom-jre10_1  | => Initializing SpringBoot Runner 'start.sh'
samples-gradle-java-custom-jre10_1  |
samples-gradle-java-custom-jre10_1  | => Processing env hooks at /runtime/sources
samples-gradle-java-custom-jre10_1  |
sample-gradle-java-jre10_1          |
sample-gradle-java-jre10_1          | => Initializing SpringBoot Runner 'start.sh'
sample-gradle-java-jre10_1          |
sample-gradle-java-jre8_1           |
sample-gradle-java-jre8_1           | => Initializing SpringBoot Runner 'start.sh'
sample-gradle-java-jre8_1           |
sample-gradle-java-jre8_1           | => Processing env hooks at /runtime/sources
sample-gradle-java-jre8_1           |
samples-gradle-java-custom-jre10_1  | [1] source /runtime/sources/springboot.sh
sample-gradle-java-jre8_1           | [1] source /runtime/sources/springboot.sh
sample-gradle-java-jre10_1          | => Processing env hooks at /runtime/sources
sample-gradle-java-jre10_1          |
samples-gradle-java-custom-jre10_1  |
samples-gradle-java-custom-jre10_1  | => Processing  hooks at /runtime/java-opts
samples-gradle-java-custom-jre10_1  |
sample-gradle-java-jre8_1           |
samples-gradle-java-custom-jre10_1  | [1]  << /runtime/java-opts/docker.opt
sample-gradle-java-jre10_1          | [1] source /runtime/sources/springboot.sh
sample-gradle-java-jre8_1           | => Processing  hooks at /runtime/java-opts
sample-gradle-java-jre8_1           |
sample-gradle-java-jre10_1          |
sample-gradle-java-jre10_1          | => Processing  hooks at /runtime/java-opts
sample-gradle-java-jre10_1          |
sample-gradle-java-jre8_1           | [1]  << /runtime/java-opts/docker.opt
samples-gradle-java-custom-jre10_1  | [2]  << /runtime/java-opts/jdk10-debug.opt
sample-gradle-java-jre10_1          | [1]  << /runtime/java-opts/docker.opt
sample-gradle-java-jre8_1           | [2]  << /runtime/java-opts/springboot.opt
sample-gradle-java-jre8_1           |
sample-gradle-java-jre8_1           | Exporting JAVA_OPTS= -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Djava.security.egd=file:/dev/./urandom
samples-gradle-java-custom-jre10_1  | [3]  << /runtime/java-opts/springboot.opt
samples-gradle-java-custom-jre10_1  |
samples-gradle-java-custom-jre10_1  | Exporting JAVA_OPTS= -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap --show-module-resolution -Djava.security.egd=file:/dev/./urandom
sample-gradle-java-jre10_1          | [2]  << /runtime/java-opts/jdk10-debug.opt
sample-gradle-java-jre8_1           |
sample-gradle-java-jre10_1          | [3]  << /runtime/java-opts/springboot.opt
sample-gradle-java-jre10_1          |
sample-gradle-java-jre10_1          | Exporting JAVA_OPTS= -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap --show-module-resolution -Djava.security.egd=file:/dev/./urandom
samples-gradle-java-custom-jre10_1  |
samples-gradle-java-custom-jre10_1  | ####### Debugging env before app start ##########
samples-gradle-java-custom-jre10_1  |
samples-gradle-java-custom-jre10_1  | BUILDER_SPRINGBOOT_BUILD_TIME=Mon Nov 12 04:12:21 UTC 2018
samples-gradle-java-custom-jre10_1  | DEBUG_ENV=true
samples-gradle-java-custom-jre10_1  | HOSTNAME=784fb32378fd
samples-gradle-java-custom-jre10_1  | SPRINGBOOT_RUNNER_JRE_VERSION=openjdk:custom
samples-gradle-java-custom-jre10_1  | JAVA_OPTS= -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap --show-module-resolution -Djava.security.egd=file:/dev/./urandom
samples-gradle-java-custom-jre10_1  | JAVA_HOME=/opt/jdk-custom/jre
samples-gradle-java-custom-jre10_1  | UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION=jar
samples-gradle-java-custom-jre10_1  | BUILDER_DIR=build/libs
samples-gradle-java-custom-jre10_1  | RUNNER_PORT=8080
samples-gradle-java-custom-jre10_1  | RUNNER_HOOKS_ENV_VAR_DIR=/runtime/java-opts
samples-gradle-java-custom-jre10_1  | PWD=/runtime
samples-gradle-java-custom-jre10_1  | HOME=/root
samples-gradle-java-custom-jre10_1  | RUNNER_CMD_EXEC=java $JAVA_OPTS -jar /runtime/server.jar $JAR_OPTS
samples-gradle-java-custom-jre10_1  | APP_TIMEZONE=PST
samples-gradle-java-custom-jre10_1  | SHLVL=1
samples-gradle-java-custom-jre10_1  | RUNNER_HOOKS_DIR_SOURCES=/runtime/sources
samples-gradle-java-custom-jre10_1  | PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/jdk-custom/jre/bin
samples-gradle-java-custom-jre10_1  | _=/usr/bin/env
samples-gradle-java-custom-jre10_1  |
samples-gradle-java-custom-jre10_1  | Starting the app
samples-gradle-java-custom-jre10_1  | java $JAVA_OPTS -jar /runtime/server.jar $JAR_OPTS
samples-gradle-java-custom-jre10_1  |
sample-gradle-java-jre8_1           | ####### Debugging env before app start ##########
sample-gradle-java-jre8_1           |
sample-gradle-java-jre10_1          |
sample-gradle-java-jre10_1          | ####### Debugging env before app start ##########
sample-gradle-java-jre10_1          |
sample-gradle-java-jre10_1          | BUILDER_SPRINGBOOT_BUILD_TIME=Mon Nov 12 04:12:08 UTC 2018
sample-gradle-java-jre10_1          | DEBUG_ENV=true
sample-gradle-java-jre10_1          | LANG=C.UTF-8
sample-gradle-java-jre10_1          | HOSTNAME=f7b35c0a9b63
sample-gradle-java-jre10_1          | SPRINGBOOT_RUNNER_JRE_VERSION=openjdk:10-jre-slim
sample-gradle-java-jre10_1          | JAVA_OPTS= -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap --show-module-resolution -Djava.security.egd=file:/dev/./urandom
sample-gradle-java-jre10_1          | JAVA_HOME=/docker-java-home
sample-gradle-java-jre10_1          | UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION=jar
sample-gradle-java-jre10_1          | BUILDER_DIR=build/libs
sample-gradle-java-jre10_1          | RUNNER_PORT=8080
sample-gradle-java-jre10_1          | RUNNER_HOOKS_ENV_VAR_DIR=/runtime/java-opts
sample-gradle-java-jre10_1          | JAVA_VERSION=10.0.2
sample-gradle-java-jre10_1          | PWD=/runtime
sample-gradle-java-jre10_1          | HOME=/root
sample-gradle-java-jre10_1          | JAVA_DEBIAN_VERSION=10.0.2+13-2
sample-gradle-java-jre10_1          | RUNNER_CMD_EXEC=java $JAVA_OPTS -jar /runtime/server.jar $JAR_OPTS
sample-gradle-java-jre10_1          | SHLVL=1
sample-gradle-java-jre10_1          | RUNNER_HOOKS_DIR_SOURCES=/runtime/sources
sample-gradle-java-jre10_1          | PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
sample-gradle-java-jre10_1          | _=/usr/bin/env
sample-gradle-java-jre10_1          |
samples-gradle-java-custom-jre10_1  | OpenJDK 64-Bit Server VM warning: Option UseCGroupMemoryLimitForHeap was deprecated in version 10.0 and will likely be removed in a future release.
sample-gradle-java-jre8_1           | BUILDER_SPRINGBOOT_BUILD_TIME=Mon Nov 12 04:12:05 UTC 2018
sample-gradle-java-jre8_1           | DEBUG_ENV=true
sample-gradle-java-jre8_1           | LANG=C.UTF-8
sample-gradle-java-jre8_1           | HOSTNAME=d3eb00c6311b
sample-gradle-java-jre8_1           | SPRINGBOOT_RUNNER_JRE_VERSION=openjdk:8-jre-slim
sample-gradle-java-jre8_1           | JAVA_OPTS= -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Djava.security.egd=file:/dev/./urandom
sample-gradle-java-jre8_1           | JAVA_HOME=/docker-java-home/jre
sample-gradle-java-jre8_1           | UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION=jar
sample-gradle-java-jre8_1           | BUILDER_DIR=build/libs
sample-gradle-java-jre8_1           | RUNNER_PORT=8080
sample-gradle-java-jre8_1           | RUNNER_HOOKS_ENV_VAR_DIR=/runtime/java-opts
sample-gradle-java-jre8_1           | JAVA_VERSION=8u181
sample-gradle-java-jre8_1           | PWD=/runtime
sample-gradle-java-jre8_1           | HOME=/root
sample-gradle-java-jre8_1           | CA_CERTIFICATES_JAVA_VERSION=20170531+nmu1
sample-gradle-java-jre8_1           | JAVA_DEBIAN_VERSION=8u181-b13-2~deb9u1
sample-gradle-java-jre8_1           | RUNNER_CMD_EXEC=java $JAVA_OPTS -jar /runtime/server.jar $JAR_OPTS
sample-gradle-java-jre8_1           | SHLVL=1
sample-gradle-java-jre8_1           | RUNNER_HOOKS_DIR_SOURCES=/runtime/sources
sample-gradle-java-jre8_1           | PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
sample-gradle-java-jre8_1           | _=/usr/bin/env
sample-gradle-java-jre10_1          | Starting the app
sample-gradle-java-jre10_1          | java $JAVA_OPTS -jar /runtime/server.jar $JAR_OPTS
samples-gradle-java-custom-jre10_1  | root java.sql jrt:/java.sql
sample-gradle-java-jre8_1           |
sample-gradle-java-jre8_1           | Starting the app
sample-gradle-java-jre8_1           | java $JAVA_OPTS -jar /runtime/server.jar $JAR_OPTS
sample-gradle-java-jre8_1           |
samples-gradle-java-custom-jre10_1  | root java.logging jrt:/java.logging
samples-gradle-java-custom-jre10_1  | root java.management jrt:/java.management
samples-gradle-java-custom-jre10_1  | root java.xml jrt:/java.xml
samples-gradle-java-custom-jre10_1  | root jdk.unsupported jrt:/jdk.unsupported
samples-gradle-java-custom-jre10_1  | root java.datatransfer jrt:/java.datatransfer
samples-gradle-java-custom-jre10_1  | root java.instrument jrt:/java.instrument
samples-gradle-java-custom-jre10_1  | root java.security.jgss jrt:/java.security.jgss
sample-gradle-java-jre10_1          |
samples-gradle-java-custom-jre10_1  | root java.desktop jrt:/java.desktop
samples-gradle-java-custom-jre10_1  | root java.naming jrt:/java.naming
samples-gradle-java-custom-jre10_1  | root java.prefs jrt:/java.prefs
samples-gradle-java-custom-jre10_1  | root java.security.sasl jrt:/java.security.sasl
samples-gradle-java-custom-jre10_1  | root java.base jrt:/java.base
samples-gradle-java-custom-jre10_1  | java.security.sasl requires java.logging jrt:/java.logging
samples-gradle-java-custom-jre10_1  | java.prefs requires java.xml jrt:/java.xml
samples-gradle-java-custom-jre10_1  | java.naming requires java.security.sasl jrt:/java.security.sasl
samples-gradle-java-custom-jre10_1  | java.desktop requires java.xml jrt:/java.xml
samples-gradle-java-custom-jre10_1  | java.desktop requires java.prefs jrt:/java.prefs
samples-gradle-java-custom-jre10_1  | java.desktop requires java.datatransfer jrt:/java.datatransfer
samples-gradle-java-custom-jre10_1  | java.security.jgss requires java.naming jrt:/java.naming
samples-gradle-java-custom-jre10_1  | java.sql requires java.xml jrt:/java.xml
samples-gradle-java-custom-jre10_1  | java.sql requires java.logging jrt:/java.logging
samples-gradle-java-custom-jre10_1  | java.base binds java.naming jrt:/java.naming
samples-gradle-java-custom-jre10_1  | java.base binds java.security.jgss jrt:/java.security.jgss
samples-gradle-java-custom-jre10_1  | java.base binds java.security.sasl jrt:/java.security.sasl
samples-gradle-java-custom-jre10_1  | java.base binds java.logging jrt:/java.logging
samples-gradle-java-custom-jre10_1  | java.base binds java.desktop jrt:/java.desktop
samples-gradle-java-custom-jre10_1  | java.base binds java.management jrt:/java.management
samples-gradle-java-custom-jre10_1  | java.datatransfer binds java.desktop jrt:/java.desktop
sample-gradle-java-jre10_1          | OpenJDK 64-Bit Server VM warning: Option UseCGroupMemoryLimitForHeap was deprecated in version 10.0 and will likely be removed in a future release.
sample-gradle-java-jre10_1          | root jdk.javadoc jrt:/jdk.javadoc
sample-gradle-java-jre10_1          | root jdk.jdi jrt:/jdk.jdi
sample-gradle-java-jre10_1          | root jdk.jshell jrt:/jdk.jshell
sample-gradle-java-jre10_1          | root jdk.sctp jrt:/jdk.sctp
sample-gradle-java-jre10_1          | root jdk.jsobject jrt:/jdk.jsobject
sample-gradle-java-jre10_1          | root jdk.xml.dom jrt:/jdk.xml.dom
sample-gradle-java-jre10_1          | root jdk.unsupported jrt:/jdk.unsupported
sample-gradle-java-jre10_1          | root jdk.scripting.nashorn jrt:/jdk.scripting.nashorn
sample-gradle-java-jre10_1          | root jdk.httpserver jrt:/jdk.httpserver
sample-gradle-java-jre10_1          | root jdk.management jrt:/jdk.management
sample-gradle-java-jre10_1          | root jdk.net jrt:/jdk.net
sample-gradle-java-jre10_1          | root jdk.security.auth jrt:/jdk.security.auth
sample-gradle-java-jre10_1          | root jdk.dynalink jrt:/jdk.dynalink
sample-gradle-java-jre10_1          | root java.se jrt:/java.se
sample-gradle-java-jre10_1          | root jdk.compiler jrt:/jdk.compiler
sample-gradle-java-jre10_1          | root jdk.accessibility jrt:/jdk.accessibility
sample-gradle-java-jre10_1          | root jdk.jartool jrt:/jdk.jartool
sample-gradle-java-jre10_1          | root jdk.jconsole jrt:/jdk.jconsole
sample-gradle-java-jre10_1          | root jdk.attach jrt:/jdk.attach
sample-gradle-java-jre10_1          | root jdk.security.jgss jrt:/jdk.security.jgss
sample-gradle-java-jre10_1          | jdk.security.jgss requires java.security.jgss jrt:/java.security.jgss
sample-gradle-java-jre10_1          | jdk.security.jgss requires java.logging jrt:/java.logging
sample-gradle-java-jre10_1          | jdk.security.jgss requires java.security.sasl jrt:/java.security.sasl
sample-gradle-java-jre10_1          | jdk.attach requires jdk.internal.jvmstat jrt:/jdk.internal.jvmstat
sample-gradle-java-jre10_1          | jdk.jconsole requires jdk.management jrt:/jdk.management
sample-gradle-java-jre10_1          | jdk.jconsole requires jdk.internal.jvmstat jrt:/jdk.internal.jvmstat
sample-gradle-java-jre10_1          | jdk.jconsole requires jdk.management.agent jrt:/jdk.management.agent
sample-gradle-java-jre10_1          | jdk.jconsole requires java.desktop jrt:/java.desktop
sample-gradle-java-jre10_1          | jdk.jconsole requires jdk.attach jrt:/jdk.attach
sample-gradle-java-jre10_1          | jdk.jconsole requires java.management.rmi jrt:/java.management.rmi
sample-gradle-java-jre10_1          | jdk.jconsole requires java.rmi jrt:/java.rmi
sample-gradle-java-jre10_1          | jdk.jconsole requires java.management jrt:/java.management
sample-gradle-java-jre10_1          | jdk.accessibility requires java.desktop jrt:/java.desktop
sample-gradle-java-jre10_1          | jdk.compiler requires java.compiler jrt:/java.compiler
sample-gradle-java-jre10_1          | java.se requires java.datatransfer jrt:/java.datatransfer
sample-gradle-java-jre10_1          | java.se requires java.naming jrt:/java.naming
sample-gradle-java-jre10_1          | java.se requires java.xml jrt:/java.xml
sample-gradle-java-jre10_1          | java.se requires java.desktop jrt:/java.desktop
sample-gradle-java-jre10_1          | java.se requires java.management.rmi jrt:/java.management.rmi
sample-gradle-java-jre10_1          | java.se requires java.sql jrt:/java.sql
sample-gradle-java-jre10_1          | java.se requires java.rmi jrt:/java.rmi
sample-gradle-java-jre10_1          | java.se requires java.instrument jrt:/java.instrument
sample-gradle-java-jre10_1          | java.se requires java.logging jrt:/java.logging
sample-gradle-java-jre10_1          | java.se requires java.sql.rowset jrt:/java.sql.rowset
sample-gradle-java-jre10_1          | java.se requires java.scripting jrt:/java.scripting
sample-gradle-java-jre10_1          | java.se requires java.security.sasl jrt:/java.security.sasl
sample-gradle-java-jre10_1          | java.se requires java.prefs jrt:/java.prefs
sample-gradle-java-jre10_1          | java.se requires java.compiler jrt:/java.compiler
sample-gradle-java-jre10_1          | java.se requires java.security.jgss jrt:/java.security.jgss
sample-gradle-java-jre10_1          | java.se requires java.xml.crypto jrt:/java.xml.crypto
sample-gradle-java-jre10_1          | java.se requires java.management jrt:/java.management
sample-gradle-java-jre10_1          | jdk.dynalink requires java.logging jrt:/java.logging
sample-gradle-java-jre10_1          | jdk.security.auth requires java.naming jrt:/java.naming
sample-gradle-java-jre10_1          | jdk.security.auth requires java.security.jgss jrt:/java.security.jgss
sample-gradle-java-jre10_1          | jdk.management requires java.management jrt:/java.management
sample-gradle-java-jre10_1          | jdk.scripting.nashorn requires jdk.dynalink jrt:/jdk.dynalink
sample-gradle-java-jre10_1          | jdk.scripting.nashorn requires java.scripting jrt:/java.scripting
sample-gradle-java-jre10_1          | jdk.scripting.nashorn requires java.logging jrt:/java.logging
sample-gradle-java-jre10_1          | jdk.xml.dom requires java.xml jrt:/java.xml
sample-gradle-java-jre10_1          | jdk.jsobject requires java.desktop jrt:/java.desktop
sample-gradle-java-jre10_1          | jdk.jshell requires jdk.internal.le jrt:/jdk.internal.le
sample-gradle-java-jre10_1          | jdk.jshell requires jdk.compiler jrt:/jdk.compiler
sample-gradle-java-jre10_1          | jdk.jshell requires java.logging jrt:/java.logging
sample-gradle-java-jre10_1          | jdk.jshell requires java.prefs jrt:/java.prefs
sample-gradle-java-jre10_1          | jdk.jshell requires java.compiler jrt:/java.compiler
sample-gradle-java-jre10_1          | jdk.jshell requires jdk.jdi jrt:/jdk.jdi
sample-gradle-java-jre10_1          | jdk.jshell requires jdk.internal.ed jrt:/jdk.internal.ed
sample-gradle-java-jre10_1          | jdk.jshell requires jdk.internal.opt jrt:/jdk.internal.opt
sample-gradle-java-jre10_1          | jdk.jdi requires jdk.jdwp.agent jrt:/jdk.jdwp.agent
sample-gradle-java-jre10_1          | jdk.jdi requires jdk.attach jrt:/jdk.attach
sample-gradle-java-jre10_1          | jdk.javadoc requires java.compiler jrt:/java.compiler
sample-gradle-java-jre10_1          | jdk.javadoc requires java.xml jrt:/java.xml
sample-gradle-java-jre10_1          | jdk.javadoc requires jdk.compiler jrt:/jdk.compiler
sample-gradle-java-jre10_1          | java.security.jgss requires java.naming jrt:/java.naming
sample-gradle-java-jre10_1          | java.security.sasl requires java.logging jrt:/java.logging
sample-gradle-java-jre10_1          | jdk.management.agent requires java.management.rmi jrt:/java.management.rmi
sample-gradle-java-jre10_1          | jdk.management.agent requires java.management jrt:/java.management
sample-gradle-java-jre10_1          | java.desktop requires java.prefs jrt:/java.prefs
sample-gradle-java-jre10_1          | java.desktop requires java.xml jrt:/java.xml
sample-gradle-java-jre10_1          | java.desktop requires java.datatransfer jrt:/java.datatransfer
sample-gradle-java-jre10_1          | java.management.rmi requires java.rmi jrt:/java.rmi
sample-gradle-java-jre10_1          | java.management.rmi requires java.naming jrt:/java.naming
sample-gradle-java-jre10_1          | java.management.rmi requires java.management jrt:/java.management
sample-gradle-java-jre10_1          | java.rmi requires java.logging jrt:/java.logging
sample-gradle-java-jre10_1          | java.naming requires java.security.sasl jrt:/java.security.sasl
sample-gradle-java-jre10_1          | java.sql requires java.xml jrt:/java.xml
sample-gradle-java-jre10_1          | java.sql requires java.logging jrt:/java.logging
sample-gradle-java-jre10_1          | java.sql.rowset requires java.sql jrt:/java.sql
sample-gradle-java-jre10_1          | java.sql.rowset requires java.logging jrt:/java.logging
sample-gradle-java-jre10_1          | java.sql.rowset requires java.naming jrt:/java.naming
sample-gradle-java-jre10_1          | java.prefs requires java.xml jrt:/java.xml
sample-gradle-java-jre10_1          | java.xml.crypto requires java.logging jrt:/java.logging
sample-gradle-java-jre10_1          | java.xml.crypto requires java.xml jrt:/java.xml
sample-gradle-java-jre10_1          | jdk.jshell binds jdk.editpad jrt:/jdk.editpad
sample-gradle-java-jre10_1          | java.compiler binds jdk.javadoc jrt:/jdk.javadoc
sample-gradle-java-jre10_1          | java.compiler binds jdk.compiler jrt:/jdk.compiler
sample-gradle-java-jre10_1          | jdk.internal.jvmstat binds jdk.jstatd jrt:/jdk.jstatd
sample-gradle-java-jre10_1          | java.scripting binds jdk.scripting.nashorn jrt:/jdk.scripting.nashorn
sample-gradle-java-jre10_1          | java.management binds java.management.rmi jrt:/java.management.rmi
sample-gradle-java-jre10_1          | java.management binds jdk.management jrt:/jdk.management
sample-gradle-java-jre10_1          | java.management binds jdk.internal.vm.compiler.management jrt:/jdk.internal.vm.compiler.management
sample-gradle-java-jre10_1          | java.base binds jdk.zipfs jrt:/jdk.zipfs
sample-gradle-java-jre10_1          | java.base binds java.desktop jrt:/java.desktop
sample-gradle-java-jre10_1          | java.base binds jdk.crypto.ec jrt:/jdk.crypto.ec
sample-gradle-java-jre10_1          | java.base binds java.security.sasl jrt:/java.security.sasl
sample-gradle-java-jre10_1          | java.base binds jdk.security.jgss jrt:/jdk.security.jgss
sample-gradle-java-jre10_1          | java.base binds java.smartcardio jrt:/java.smartcardio
sample-gradle-java-jre10_1          | java.base binds java.security.jgss jrt:/java.security.jgss
sample-gradle-java-jre10_1          | java.base binds java.naming jrt:/java.naming
sample-gradle-java-jre10_1          | java.base binds java.xml.crypto jrt:/java.xml.crypto
sample-gradle-java-jre10_1          | java.base binds jdk.crypto.cryptoki jrt:/jdk.crypto.cryptoki
sample-gradle-java-jre10_1          | java.base binds jdk.charsets jrt:/jdk.charsets
sample-gradle-java-jre10_1          | java.base binds jdk.localedata jrt:/jdk.localedata
sample-gradle-java-jre10_1          | java.base binds jdk.jlink jrt:/jdk.jlink
sample-gradle-java-jre10_1          | java.base binds jdk.compiler jrt:/jdk.compiler
sample-gradle-java-jre10_1          | java.base binds jdk.jdeps jrt:/jdk.jdeps
sample-gradle-java-jre10_1          | java.base binds jdk.javadoc jrt:/jdk.javadoc
sample-gradle-java-jre10_1          | java.base binds jdk.jartool jrt:/jdk.jartool
sample-gradle-java-jre10_1          | java.base binds java.management jrt:/java.management
sample-gradle-java-jre10_1          | java.base binds jdk.security.auth jrt:/jdk.security.auth
sample-gradle-java-jre10_1          | java.base binds java.logging jrt:/java.logging
sample-gradle-java-jre10_1          | java.datatransfer binds java.desktop jrt:/java.desktop
sample-gradle-java-jre10_1          | java.naming binds jdk.naming.dns jrt:/jdk.naming.dns
sample-gradle-java-jre10_1          | java.naming binds jdk.naming.rmi jrt:/jdk.naming.rmi
sample-gradle-java-jre10_1          | jdk.dynalink binds jdk.scripting.nashorn jrt:/jdk.scripting.nashorn
sample-gradle-java-jre10_1          | jdk.naming.rmi requires java.naming jrt:/java.naming
sample-gradle-java-jre10_1          | jdk.naming.rmi requires java.rmi jrt:/java.rmi
sample-gradle-java-jre10_1          | jdk.naming.dns requires java.naming jrt:/java.naming
sample-gradle-java-jre10_1          | jdk.jdeps requires jdk.compiler jrt:/jdk.compiler
sample-gradle-java-jre10_1          | jdk.jdeps requires java.compiler jrt:/java.compiler
sample-gradle-java-jre10_1          | jdk.jlink requires jdk.internal.opt jrt:/jdk.internal.opt
sample-gradle-java-jre10_1          | jdk.jlink requires jdk.jdeps jrt:/jdk.jdeps
sample-gradle-java-jre10_1          | jdk.crypto.cryptoki requires jdk.crypto.ec jrt:/jdk.crypto.ec
sample-gradle-java-jre10_1          | jdk.internal.vm.compiler.management requires jdk.internal.vm.compiler jrt:/jdk.internal.vm.compiler
sample-gradle-java-jre10_1          | jdk.internal.vm.compiler.management requires jdk.internal.vm.ci jrt:/jdk.internal.vm.ci
sample-gradle-java-jre10_1          | jdk.internal.vm.compiler.management requires jdk.management jrt:/jdk.management
sample-gradle-java-jre10_1          | jdk.internal.vm.compiler.management requires java.management jrt:/java.management
sample-gradle-java-jre10_1          | jdk.jstatd requires jdk.internal.jvmstat jrt:/jdk.internal.jvmstat
sample-gradle-java-jre10_1          | jdk.jstatd requires java.rmi jrt:/java.rmi
sample-gradle-java-jre10_1          | jdk.editpad requires jdk.internal.ed jrt:/jdk.internal.ed
sample-gradle-java-jre10_1          | jdk.editpad requires java.desktop jrt:/java.desktop
sample-gradle-java-jre10_1          | jdk.internal.vm.compiler requires jdk.management jrt:/jdk.management
sample-gradle-java-jre10_1          | jdk.internal.vm.compiler requires jdk.unsupported jrt:/jdk.unsupported
sample-gradle-java-jre10_1          | jdk.internal.vm.compiler requires java.instrument jrt:/java.instrument
sample-gradle-java-jre10_1          | jdk.internal.vm.compiler requires java.management jrt:/java.management
sample-gradle-java-jre10_1          | jdk.internal.vm.compiler requires jdk.internal.vm.ci jrt:/jdk.internal.vm.ci
sample-gradle-java-jre10_1          | jdk.internal.vm.ci binds jdk.internal.vm.compiler jrt:/jdk.internal.vm.compiler
samples-gradle-java-custom-jre10_1  |
samples-gradle-java-custom-jre10_1  |   .   ____          _            __ _ _
samples-gradle-java-custom-jre10_1  |  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
samples-gradle-java-custom-jre10_1  | ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
samples-gradle-java-custom-jre10_1  |  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
samples-gradle-java-custom-jre10_1  |   '  |____| .__|_| |_|_| |_\__, | / / / /
samples-gradle-java-custom-jre10_1  |  =========|_|==============|___/=/_/_/_/
samples-gradle-java-custom-jre10_1  |  :: Spring Boot ::        (v2.0.3.RELEASE)
samples-gradle-java-custom-jre10_1  |
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:07.577  INFO 17 --- [           main] hello.Application                        : Starting Application on 784fb32378fd with PID 17 (/runtime/server.jar started by root in /runtime)
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:07.591  INFO 17 --- [           main] hello.Application                        : No active profile set, falling back to default profiles: default
sample-gradle-java-jre8_1           |
sample-gradle-java-jre8_1           |   .   ____          _            __ _ _
sample-gradle-java-jre8_1           |  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
sample-gradle-java-jre8_1           | ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
sample-gradle-java-jre8_1           |  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
sample-gradle-java-jre8_1           |   '  |____| .__|_| |_|_| |_\__, | / / / /
sample-gradle-java-jre8_1           |  =========|_|==============|___/=/_/_/_/
sample-gradle-java-jre8_1           |  :: Spring Boot ::        (v2.0.3.RELEASE)
sample-gradle-java-jre8_1           |
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:07.772  INFO 17 --- [           main] ConfigServletWebServerApplicationContext : Refreshing org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@10e31a9a: startup date [Mon Nov 12 04:16:07 UTC 2018]; root of context hierarchy
sample-gradle-java-jre8_1           | 2018-11-12 04:16:08.187  INFO 16 --- [           main] hello.Application                        : Starting Application on d3eb00c6311b with PID 16 (/runtime/server.jar started by root in /runtime)
sample-gradle-java-jre8_1           | 2018-11-12 04:16:08.202  INFO 16 --- [           main] hello.Application                        : No active profile set, falling back to default profiles: default
sample-gradle-java-jre10_1          |
sample-gradle-java-jre10_1          |   .   ____          _            __ _ _
sample-gradle-java-jre10_1          |  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
sample-gradle-java-jre10_1          | ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
sample-gradle-java-jre10_1          |  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
sample-gradle-java-jre10_1          |   '  |____| .__|_| |_|_| |_\__, | / / / /
sample-gradle-java-jre10_1          |  =========|_|==============|___/=/_/_/_/
sample-gradle-java-jre10_1          |  :: Spring Boot ::        (v2.0.3.RELEASE)
sample-gradle-java-jre10_1          |
sample-gradle-java-jre8_1           | 2018-11-12 04:16:08.409  INFO 16 --- [           main] ConfigServletWebServerApplicationContext : Refreshing org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@24273305: startup date [Mon Nov 12 04:16:08 UTC 2018]; root of context hierarchy
sample-gradle-java-jre10_1          | 2018-11-12 04:16:08.789  INFO 17 --- [           main] hello.Application                        : Starting Application on f7b35c0a9b63 with PID 17 (/runtime/server.jar started by root in /runtime)
sample-gradle-java-jre10_1          | 2018-11-12 04:16:08.847  INFO 17 --- [           main] hello.Application                        : No active profile set, falling back to default profiles: default
sample-gradle-java-jre10_1          | 2018-11-12 04:16:09.034  INFO 17 --- [           main] ConfigServletWebServerApplicationContext : Refreshing org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@31304f14: startup date [Mon Nov 12 04:16:09 UTC 2018]; root of context hierarchy
samples-gradle-java-custom-jre10_1  | WARNING: An illegal reflective access operation has occurred
samples-gradle-java-custom-jre10_1  | WARNING: Illegal reflective access by org.springframework.cglib.core.ReflectUtils$1 (jar:file:/runtime/server.jar!/BOOT-INF/lib/spring-core-5.0.7.RELEASE.jar!/) to method java.lang.ClassLoader.defineClass(java.lang.String,byte[],int,int,java.security.ProtectionDomain)
samples-gradle-java-custom-jre10_1  | WARNING: Please consider reporting this to the maintainers of org.springframework.cglib.core.ReflectUtils$1
samples-gradle-java-custom-jre10_1  | WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
samples-gradle-java-custom-jre10_1  | WARNING: All illegal access operations will be denied in a future release
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:10.827  INFO 17 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:11.223  INFO 17 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:11.226  INFO 17 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet Engine: Apache Tomcat/8.5.31
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:11.349  INFO 17 --- [ost-startStop-1] o.a.catalina.core.AprLifecycleListener   : The APR based Apache Tomcat Native library which allows optimal performance in production environments was not found on the java.library.path: [/usr/java/packages/lib:/usr/lib64:/lib64:/lib:/usr/lib]
sample-gradle-java-jre10_1          | WARNING: An illegal reflective access operation has occurred
sample-gradle-java-jre10_1          | WARNING: Illegal reflective access by org.springframework.cglib.core.ReflectUtils$1 (jar:file:/runtime/server.jar!/BOOT-INF/lib/spring-core-5.0.7.RELEASE.jar!/) to method java.lang.ClassLoader.defineClass(java.lang.String,byte[],int,int,java.security.ProtectionDomain)
sample-gradle-java-jre10_1          | WARNING: Please consider reporting this to the maintainers of org.springframework.cglib.core.ReflectUtils$1
sample-gradle-java-jre10_1          | WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
sample-gradle-java-jre10_1          | WARNING: All illegal access operations will be denied in a future release
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:11.601  INFO 17 --- [ost-startStop-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:11.602  INFO 17 --- [ost-startStop-1] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 3840 ms
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:12.089  INFO 17 --- [ost-startStop-1] o.s.b.w.servlet.ServletRegistrationBean  : Servlet dispatcherServlet mapped to [/]
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:12.097  INFO 17 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'characterEncodingFilter' to: [/*]
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:12.098  INFO 17 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'hiddenHttpMethodFilter' to: [/*]
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:12.098  INFO 17 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'httpPutFormContentFilter' to: [/*]
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:12.098  INFO 17 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'requestContextFilter' to: [/*]
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:12.098  INFO 17 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'defaultResponseFilter' to: [/*]
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:12.429  INFO 17 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**/favicon.ico] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
sample-gradle-java-jre8_1           | 2018-11-12 04:16:12.597  INFO 16 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
sample-gradle-java-jre8_1           | 2018-11-12 04:16:12.688  INFO 16 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
sample-gradle-java-jre8_1           | 2018-11-12 04:16:12.690  INFO 16 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet Engine: Apache Tomcat/8.5.31
sample-gradle-java-jre8_1           | 2018-11-12 04:16:12.724  INFO 16 --- [ost-startStop-1] o.a.catalina.core.AprLifecycleListener   : The APR based Apache Tomcat Native library which allows optimal performance in production environments was not found on the java.library.path: [/usr/java/packages/lib/amd64:/usr/lib/x86_64-linux-gnu/jni:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib/jni:/lib:/usr/lib]
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:12.956  INFO 17 --- [           main] s.w.s.m.m.a.RequestMappingHandlerAdapter : Looking for @ControllerAdvice: org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@10e31a9a: startup date [Mon Nov 12 04:16:07 UTC 2018]; root of context hierarchy
sample-gradle-java-jre8_1           | 2018-11-12 04:16:13.035  INFO 16 --- [ost-startStop-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
sample-gradle-java-jre8_1           | 2018-11-12 04:16:13.035  INFO 16 --- [ost-startStop-1] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 4643 ms
sample-gradle-java-jre8_1           | 2018-11-12 04:16:13.266  INFO 16 --- [ost-startStop-1] o.s.b.w.servlet.ServletRegistrationBean  : Servlet dispatcherServlet mapped to [/]
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:13.280  INFO 17 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/]}" onto public java.lang.String hello.Application.home()
sample-gradle-java-jre8_1           | 2018-11-12 04:16:13.282  INFO 16 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'characterEncodingFilter' to: [/*]
sample-gradle-java-jre8_1           | 2018-11-12 04:16:13.284  INFO 16 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'hiddenHttpMethodFilter' to: [/*]
sample-gradle-java-jre8_1           | 2018-11-12 04:16:13.285  INFO 16 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'httpPutFormContentFilter' to: [/*]
sample-gradle-java-jre8_1           | 2018-11-12 04:16:13.285  INFO 16 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'requestContextFilter' to: [/*]
sample-gradle-java-jre8_1           | 2018-11-12 04:16:13.286  INFO 16 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'defaultResponseFilter' to: [/*]
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:13.301  INFO 17 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error]}" onto public org.springframework.http.ResponseEntity<java.util.Map<java.lang.String, java.lang.Object>> org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.error(javax.servlet.http.HttpServletRequest)
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:13.303  INFO 17 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error],produces=[text/html]}" onto public org.springframework.web.servlet.ModelAndView org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.errorHtml(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)
sample-gradle-java-jre10_1          | 2018-11-12 04:16:13.334  INFO 17 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:13.434  INFO 17 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/webjars/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:13.434  INFO 17 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
sample-gradle-java-jre10_1          | 2018-11-12 04:16:13.470  INFO 17 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
sample-gradle-java-jre10_1          | 2018-11-12 04:16:13.470  INFO 17 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet Engine: Apache Tomcat/8.5.31
sample-gradle-java-jre10_1          | 2018-11-12 04:16:13.541  INFO 17 --- [ost-startStop-1] o.a.catalina.core.AprLifecycleListener   : The APR based Apache Tomcat Native library which allows optimal performance in production environments was not found on the java.library.path: [/usr/java/packages/lib:/usr/lib/x86_64-linux-gnu/jni:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib/jni:/lib:/usr/lib]
sample-gradle-java-jre10_1          | 2018-11-12 04:16:13.871  INFO 17 --- [ost-startStop-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
sample-gradle-java-jre10_1          | 2018-11-12 04:16:13.871  INFO 17 --- [ost-startStop-1] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 4865 ms
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:13.881  INFO 17 --- [           main] o.s.j.e.a.AnnotationMBeanExporter        : Registering beans for JMX exposure on startup
sample-gradle-java-jre8_1           | 2018-11-12 04:16:13.927  INFO 16 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**/favicon.ico] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:14.056  INFO 17 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
samples-gradle-java-custom-jre10_1  | 2018-11-12 04:16:14.073  INFO 17 --- [           main] hello.Application                        : Started Application in 7.995 seconds (JVM running for 8.875)
sample-gradle-java-jre10_1          | 2018-11-12 04:16:14.358  INFO 17 --- [ost-startStop-1] o.s.b.w.servlet.ServletRegistrationBean  : Servlet dispatcherServlet mapped to [/]
sample-gradle-java-jre10_1          | 2018-11-12 04:16:14.363  INFO 17 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'characterEncodingFilter' to: [/*]
sample-gradle-java-jre10_1          | 2018-11-12 04:16:14.364  INFO 17 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'hiddenHttpMethodFilter' to: [/*]
sample-gradle-java-jre10_1          | 2018-11-12 04:16:14.364  INFO 17 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'httpPutFormContentFilter' to: [/*]
sample-gradle-java-jre10_1          | 2018-11-12 04:16:14.364  INFO 17 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'requestContextFilter' to: [/*]
sample-gradle-java-jre10_1          | 2018-11-12 04:16:14.364  INFO 17 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'defaultResponseFilter' to: [/*]
sample-gradle-java-jre8_1           | 2018-11-12 04:16:14.495  INFO 16 --- [           main] s.w.s.m.m.a.RequestMappingHandlerAdapter : Looking for @ControllerAdvice: org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@24273305: startup date [Mon Nov 12 04:16:08 UTC 2018]; root of context hierarchy
sample-gradle-java-jre8_1           | 2018-11-12 04:16:14.724  INFO 16 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/]}" onto public java.lang.String hello.Application.home()
sample-gradle-java-jre8_1           | 2018-11-12 04:16:14.732  INFO 16 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error],produces=[text/html]}" onto public org.springframework.web.servlet.ModelAndView org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.errorHtml(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)
sample-gradle-java-jre8_1           | 2018-11-12 04:16:14.732  INFO 16 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error]}" onto public org.springframework.http.ResponseEntity<java.util.Map<java.lang.String, java.lang.Object>> org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.error(javax.servlet.http.HttpServletRequest)
sample-gradle-java-jre8_1           | 2018-11-12 04:16:14.771  INFO 16 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/webjars/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
sample-gradle-java-jre8_1           | 2018-11-12 04:16:14.772  INFO 16 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
sample-gradle-java-jre10_1          | 2018-11-12 04:16:14.810  INFO 17 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**/favicon.ico] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
sample-gradle-java-jre8_1           | 2018-11-12 04:16:15.104  INFO 16 --- [           main] o.s.j.e.a.AnnotationMBeanExporter        : Registering beans for JMX exposure on startup
sample-gradle-java-jre8_1           | 2018-11-12 04:16:15.378  INFO 16 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
sample-gradle-java-jre8_1           | 2018-11-12 04:16:15.393  INFO 16 --- [           main] hello.Application                        : Started Application in 8.606 seconds (JVM running for 10.108)
sample-gradle-java-jre10_1          | 2018-11-12 04:16:15.399  INFO 17 --- [           main] s.w.s.m.m.a.RequestMappingHandlerAdapter : Looking for @ControllerAdvice: org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@31304f14: startup date [Mon Nov 12 04:16:09 UTC 2018]; root of context hierarchy
sample-gradle-java-jre10_1          | 2018-11-12 04:16:15.550  INFO 17 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/]}" onto public java.lang.String hello.Application.home()
sample-gradle-java-jre10_1          | 2018-11-12 04:16:15.558  INFO 17 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error],produces=[text/html]}" onto public org.springframework.web.servlet.ModelAndView org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.errorHtml(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)
sample-gradle-java-jre10_1          | 2018-11-12 04:16:15.558  INFO 17 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error]}" onto public org.springframework.http.ResponseEntity<java.util.Map<java.lang.String, java.lang.Object>> org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.error(javax.servlet.http.HttpServletRequest)
sample-gradle-java-jre10_1          | 2018-11-12 04:16:15.595  INFO 17 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/webjars/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
sample-gradle-java-jre10_1          | 2018-11-12 04:16:15.595  INFO 17 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
sample-gradle-java-jre10_1          | 2018-11-12 04:16:15.882  INFO 17 --- [           main] o.s.j.e.a.AnnotationMBeanExporter        : Registering beans for JMX exposure on startup
sample-gradle-java-jre10_1          | 2018-11-12 04:16:15.963  INFO 17 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
sample-gradle-java-jre10_1          | 2018-11-12 04:16:15.969  INFO 17 --- [           main] hello.Application                        : Started Application in 9.065 seconds (JVM running for 10.528)
```
