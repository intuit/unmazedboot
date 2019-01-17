# Kotlin JDK 1.8 - JRE 1.8 sample

* This sample code was created by following the initial steps of
the tutorial https://spring.io/guides/tutorials/spring-boot-kotlin/

# UnmazedBoot Process

* Dockerfile was added following the UnmazedBoot instructions

1. Create a Dockerfile selecting the first stage the Builder image

This step requires the inspection of the build system used and the target JVM instructions used.
For instance, the Kotlin tutorial uses Gradle and JDK8. For this reason, the builder image
selected is using Gradle with JDK8.

2. If the project is to run in a JRE 8, then select the Runner image with the base OS desired

Since this tutorial simply runs the application, then we just selected the base image
with JRE8. That simplified the initial process of using the current tutorial.

# Building

```
$ docker-compose -f docker-compose-samples.yml build samples-gradle-kotlin-jdk8-jre8
Building samples-gradle-kotlin-jdk8-jre8
Step 1/10 : ARG UNMAZEDBOOT_BUILDER_GIT_SHA=${UNMAZEDBOOT_BUILDER_GIT_SHA:-000000}
Step 2/10 : ARG UNMAZEDBOOT_BUILDER_GIT_BRANCH=${UNMAZEDBOOT_BUILDER_GIT_BRANCH:-master}
Step 3/10 : ARG UNMAZEDBOOT_BUILDER_GRADLE_BUILD_CMD="gradle build -x test"
Step 4/10 : ARG UNMAZEDBOOT_BUILDER_DIR="build/libs"
Step 5/10 : ARG UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION="jar"
Step 6/10 : ARG UNMAZEDBOOT_BUILDER_GRADLE_VERSION=${UNMAZEDBOOT_BUILDER_GRADLE_VERSION:--latest}
Step 7/10 : ARG UNMAZEDBOOT_RUNNER_PORT="8080"
Step 8/10 : ARG UNMAZEDBOOT_RUNNER_VERSION=${UNMAZEDBOOT_RUNNER_VERSION:--latest}
Step 9/10 : FROM intuit/unmazedboot-builder-gradle:4.10.2-jdk8-alpine${UNMAZEDBOOT_BUILDER_GRADLE_VERSION} as unmazedboot-builder-artifacts
# Executing 18 build triggers
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> e57b60923ea1

Step 10/10 : FROM intuit/unmazedboot-runner:openjdk-8u181-debian9-slim${UNMAZEDBOOT_RUNNER_VERSION}
# Executing 35 build triggers
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> 9a527d7584e5

Successfully built 9a527d7584e5
Successfully tagged intuit/unmazedboot-sample-kotlin:jdk8-jre8-debian-0.5.0
```

# Running

```
$ docker-compose -f docker-compose-samples.yml up samples-gradle-kotlin-jdk8-jre8
springboot-docker-reusable-images_samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467 is up-to-date
Attaching to springboot-docker-reusable-images_samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | => Initializing SpringBoot Runner 'start.sh'
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | ########## Running init scripts at '/runtime/init'
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | ########## Processing source hooks at '/runtime/sources'
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | [1] source /runtime/sources/springboot.sh
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | => Processing JAVA_OPTS hooks at /runtime/java-opts
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | [1] JAVA_OPTS << ./java-opts/docker.opt
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | [2] JAVA_OPTS << ./java-opts/springboot.opt
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | Exporting and merging  JAVA_OPTS=-showversion -XshowSettings:vm  -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Djava.security.egd=file:/dev/./urandom
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | ####### Starting the app #######
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | java $JAVA_OPTS -jar /runtime/server.jar $JAR_OPTS
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | VM settings:
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |     Max. Heap Size (Estimated): 2.22G
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |     Ergonomics Machine Class: server
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |     Using VM: OpenJDK 64-Bit Server VM
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | openjdk version "1.8.0_181"
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | OpenJDK Runtime Environment (build 1.8.0_181-8u181-b13-2~deb9u1-b13)
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | OpenJDK 64-Bit Server VM (build 25.181-b13, mixed mode)
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |   .   ____          _            __ _ _
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |   '  |____| .__|_| |_|_| |_\__, | / / / /
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |  =========|_|==============|___/=/_/_/_/
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |  :: Spring Boot ::        (v2.1.1.RELEASE)
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     |
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:03.997  INFO 19 --- [           main] blog.BlogApplicationKt                   : Starting BlogApplicationKt on e542c95a93cf with PID 19 (/runtime/server.jar started by root in /runtime)
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:04.007  INFO 19 --- [           main] blog.BlogApplicationKt                   : No active profile set, falling back to default profiles: default
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:05.090  INFO 19 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Bootstrapping Spring Data repositories in DEFAULT mode.
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:05.139  INFO 19 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Finished Spring Data repository scanning in 29ms. Found 0 repository interfaces.
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:05.888  INFO 19 --- [           main] trationDelegate$BeanPostProcessorChecker : Bean 'org.springframework.transaction.annotation.ProxyTransactionManagementConfiguration' of type [org.springframework.transaction.annotation.ProxyTransactionManagementConfiguration$$EnhancerBySpringCGLIB$$2d61bec0] is not eligible for getting processed by all BeanPostProcessors (for example: not eligible for auto-proxying)
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:06.612  INFO 19 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:06.655  INFO 19 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:06.655  INFO 19 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet Engine: Apache Tomcat/9.0.13
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:06.676  INFO 19 --- [           main] o.a.catalina.core.AprLifecycleListener   : The APR based Apache Tomcat Native library which allows optimal performance in production environments was not found on the java.library.path: [/usr/java/packages/lib/amd64:/usr/lib/x86_64-linux-gnu/jni:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib/jni:/lib:/usr/lib]
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:06.841  INFO 19 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:06.842  INFO 19 --- [           main] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 2741 ms
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:07.089  INFO 19 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:07.292  INFO 19 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:07.402  INFO 19 --- [           main] o.hibernate.jpa.internal.util.LogHelper  : HHH000204: Processing PersistenceUnitInfo [
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 	name: default
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 	...]
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:07.527  INFO 19 --- [           main] org.hibernate.Version                    : HHH000412: Hibernate Core {5.3.7.Final}
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:07.529  INFO 19 --- [           main] org.hibernate.cfg.Environment            : HHH000206: hibernate.properties not found
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:07.833  INFO 19 --- [           main] o.hibernate.annotations.common.Version   : HCANN000001: Hibernate Commons Annotations {5.0.4.Final}
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:08.222  INFO 19 --- [           main] org.hibernate.dialect.Dialect            : HHH000400: Using dialect: org.hibernate.dialect.H2Dialect
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:08.609  INFO 19 --- [           main] o.h.t.schema.internal.SchemaCreatorImpl  : HHH000476: Executing import script 'org.hibernate.tool.schema.internal.exec.ScriptSourceInputNonExistentImpl@4de4b452'
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:08.617  INFO 19 --- [           main] j.LocalContainerEntityManagerFactoryBean : Initialized JPA# Kotlin JDK 1.8 - JRE 1.8 sample
 EntityManagerFactory for persistence unit 'default'
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:09.036  INFO 19 --- [           main] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:09.113  WARN 19 --- [           main] aWebConfiguration$JpaWebMvcConfiguration : spring.jpa.open-in-view is enabled by default. Therefore, database queries may be performed during view rendering. Explicitly configure spring.jpa.open-in-view to disable this warning
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:09.562  INFO 19 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:18:09.570  INFO 19 --- [           main] blog.BlogApplicationKt                   : Started BlogApplicationKt in 6.15 seconds (JVM running for 7.264)
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:59:47.126  INFO 19 --- [nio-8080-exec-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring DispatcherServlet 'dispatcherServlet'
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:59:47.136  INFO 19 --- [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Initializing Servlet 'dispatcherServlet'
samples-gradle-kotlin-jdk8-jre8_1_2541dba0d467     | 2019-01-11 20:59:47.241  INFO 19 --- [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Completed initialization in 104 ms
``` 
