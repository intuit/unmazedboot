# Running

* Using SpringBoot 2.0.3
* Using Starter Web

## BootRun

* Uses `build.gradle`
* Run with `bootRun` default profile

```
gradle bootRun
```

* Run with `bootRun` with `dev` profile

```
SPRING_PROFILES_ACTIVE=dev gradle bootRun
```

## Docker Container

* Uses the `Dockerfile`
* Build a Docker Image default arguments

```
$ docker build -t myapp .
Sending build context to Docker daemon  20.23MB
Step 1/7 : ARG GIT_SHA=${GIT_SHA:-0101010}
Step 2/7 : ARG GIT_BRANCH=${GIT_BRANCH:-develop}
Step 3/7 : ARG BUILD_NUMBER=${BUILD_NUMBER:-0223}
Step 4/7 : ARG GRADLE_BUILD_TASKS="build -x test"
Step 5/7 : ARG EXECUTABLE_TASK_TYPE="jar"
Step 6/7 : FROM marcellodesales/springboot-builder as unmazedboot-builder-artifacts
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Running in 6b7c60c82fa1
Will execute gradle downloadDependencies
Removing intermediate container 6b7c60c82fa1
 ---> Running in 44f6a573e60e

Welcome to Gradle 4.10.1!

Here are the highlights of this release:
 - Incremental Java compilation by default
 - Periodic Gradle caches cleanup
 - Gradle Kotlin DSL 1.0-RC6
 - Nested included builds
 - SNAPSHOT plugin versions in the `plugins {}` block

For more details see https://docs.gradle.org/4.10.1/release-notes.html

Starting a Gradle Daemon (subsequent builds will be faster)

> Task :downloadDependencies

Retrieving dependencies for annotationProcessor

..
..

Retrieving dependencies for testRuntimeOnly

BUILD SUCCESSFUL in 14s
1 actionable task: 1 executed
Removing intermediate container 44f6a573e60e
 ---> Running in 40a596327554
Will execute gradle build -x test
Removing intermediate container 40a596327554
 ---> Running in 8642c9c067f4

Welcome to Gradle 4.10.1!

Here are the highlights of this release:
 - Incremental Java compilation by default
 - Periodic Gradle caches cleanup
 - Gradle Kotlin DSL 1.0-RC6
 - Nested included builds
 - SNAPSHOT plugin versions in the `plugins {}` block

For more details see https://docs.gradle.org/4.10.1/release-notes.html

Starting a Gradle Daemon (subsequent builds will be faster)
> Task :compileJava
> Task :processResources
> Task :classes
> Task :bootJar
> Task :jar SKIPPED
> Task :assemble
> Task :check
> Task :build

BUILD SUCCESSFUL in 20s
3 actionable tasks: 3 executed
Removing intermediate container 8642c9c067f4
 ---> 405621119bcf
Step 7/7 : FROM marcellodesales/springboot-executable-runner
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Running in 46cb7cebdf3b
-rw-r--r-- 1 root root 16141378 Sep 16 23:16 /tmp/myapp-0.1.0.jar
Removing intermediate container 46cb7cebdf3b
 ---> Running in b47bfaf3a78d
Will copy from /app/src/main/resources /runtime/resources
Removing intermediate container b47bfaf3a78d
 ---> Running in cc5b00fe7dad
total 20
drwxr-xr-x 2 root root 4096 Sep 16 23:17 .
drwxr-xr-x 1 root root 4096 Sep 16 23:17 ..
-rw-r--r-- 1 root root   48 Sep 16 23:12 application-dev.yml
-rw-r--r-- 1 root root   47 Sep 16 23:12 application-prd.yml
-rw-r--r-- 1 root root   51 Sep 16 23:12 application.yml
Removing intermediate container cc5b00fe7dad
 ---> Running in 40a70b1e8304
Renaming the executable jar to the runtime dir
Removing intermediate container 40a70b1e8304
 ---> Running in 3d3eea4bdd5c
Removing intermediate container 3d3eea4bdd5c
 ---> 89923a61a08c
Successfully built 89923a61a08c
Successfully tagged myapp:latest
```

* Running in the `dev` profile
  * Loads the file `application-dev.yml`
  * The logs will be showing `The following profiles are active: dev`

```
$ docker run -ti -e SPRING_PROFILES_ACTIVE=dev -p 8080:8080 myapp

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.0.3.RELEASE)

2018-09-16 23:17:50.719  INFO 9 --- [           main] hello.Application                        : Starting Application on 44fb9b4347d6 with PID 9 (/runtime/server.jar started by root in /runtime)
2018-09-16 23:17:50.725  INFO 9 --- [           main] hello.Application                        : The following profiles are active: dev
2018-09-16 23:17:50.820  INFO 9 --- [           main] ConfigServletWebServerApplicationContext : Refreshing org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@6833ce2c: startup date [Sun Sep 16 23:17:50 UTC 2018]; root of context hierarchy
2018-09-16 23:17:52.445  INFO 9 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
```

## Validating

```
curl localhost:8080
Hello Docker World from My App: Environment for development%
```

## Docker Build Args

```
docker build -t myapp --build-arg GIT_SHA=$(git rev-parse HEAD) \
         --build-arg GIT_BRANCH=$(git rev-parse --abbrev-ref --symbolic HEAD) \
         --build-arg BUILD_NUMBER=1234 .
```

# Sample Features

## Response Filter with Build Info

* Build with build information while running

```
GIT_SHA=$(git rev-parse HEAD) \
GIT_BRANCH=$(git rev-parse --abbrev-ref --symbolic HEAD) \
BUILD_TAG=$USER \
gradle clean bootRun
```

* HTTP Response Headers filters

```
$ curl -i localhost:8080
HTTP/1.1 200
X-App-Build-Info: commit=486223a73d435c778ac2ef93b68ee637652ee370;branch=feature/sample/show-build-info-all-response-headers;tag=mdesales;time=2018-09-17-05:32:07-UTC;version=0.1.0
Content-Type: text/plain;charset=UTF-8
Content-Length: 47
Date: Mon, 17 Sep 2018 05:32:12 GMT

Hello Docker World from My App: Default profile%
```

## Verification with Docker Containers


* Build the docker image with the arguments

```
$ docker build -t sample --build-arg BUILDER_GIT_SHA=$(git rev-parse HEAD) --build-arg BUILDER_GIT_BRANCH=$(git rev-parse --abbrev-ref --symbolic HEAD) --build-arg BUILDER_BUILD_NUMBER=$USER .
Sending build context to Docker daemon  4.205MB
Step 1/10 : ARG BUILDER_GIT_SHA=${GIT_SHA:-0101010}
Step 2/10 : ARG BUILDER_GIT_BRANCH=${GIT_BRANCH:-develop}
Step 3/10 : ARG BUILDER_BUILD_NUMBER=${BUILD_NUMBER:-0223}
Step 4/10 : ARG BUILDER_GRADLE_DOWNLOAD_DEPENDENCIES_CMD="gradle downloadDependencies"
Step 5/10 : ARG BUILDER_GRADLE_BUILD_CMD="gradle build -x test"
Step 6/10 : ARG BUILDER_DIR="build/libs"
Step 7/10 : ARG UNMAZEDBOOT_BUILDER_PACKAGE_EXTENSION="jar"
Step 8/10 : ARG RUNNER_PORT="8080"
Step 9/10 : FROM marcellodesales/springboot-builder:gradle-4.10.1-jdk-8 as unmazedboot-builder-artifacts
# Executing 15 build triggers
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Running in fa0d5676f667
Removing intermediate container fa0d5676f667
 ---> Running in c8633ef774b5
Removing intermediate container c8633ef774b5
 ---> Running in 34de329e478d
Executing BUILDER_GRADLE_DOWNLOAD_DEPENDENCIES_CMD='gradle downloadDependencies'
Removing intermediate container 34de329e478d
 ---> Running in 9d9642a2dacf

Welcome to Gradle 4.10.1!

Here are the highlights of this release:
 - Incremental Java compilation by default
 - Periodic Gradle caches cleanup
 - Gradle Kotlin DSL 1.0-RC6
 - Nested included builds
 - SNAPSHOT plugin versions in the `plugins {}` block

For more details see https://docs.gradle.org/4.10.1/release-notes.html

Starting a Gradle Daemon (subsequent builds will be faster)

> Task :downloadDependencies

Retrieving dependencies for annotationProcessor

...
...

Retrieving dependencies for testRuntimeOnly


BUILD SUCCESSFUL in 25s
1 actionable task: 1 executed
Removing intermediate container 9d9642a2dacf
 ---> Running in 9d8c260964ec
Executing BUILDER_GRADLE_BUILD_CMD='gradle build -x test'
Removing intermediate container 9d8c260964ec
 ---> Running in a628ad0694c1

Welcome to Gradle 4.10.1!

Here are the highlights of this release:
 - Incremental Java compilation by default
 - Periodic Gradle caches cleanup
 - Gradle Kotlin DSL 1.0-RC6
 - Nested included builds
 - SNAPSHOT plugin versions in the `plugins {}` block

For more details see https://docs.gradle.org/4.10.1/release-notes.html

Starting a Gradle Daemon (subsequent builds will be faster)
> Task :processResources
> Task :compileJava
> Task :classes
> Task :bootJar
> Task :jar SKIPPED
> Task :assemble
> Task :check
> Task :build

BUILD SUCCESSFUL in 27s
3 actionable tasks: 3 executed
Removing intermediate container a628ad0694c1
 ---> ff3d11b8f007
Step 10/10 : FROM marcellodesales/springboot-runner:openjdk-8-jre-slim
# Executing 15 build triggers
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Using cache
 ---> Running in f028ec130c35
-rwxr--r-- 1 root root 16151787 Sep 17 05:43 /tmp/myapp-0.1.0.jar
Removing intermediate container f028ec130c35
 ---> Running in fdd68c834c82
Will copy from /app/src/main/resources /runtime/resources
Removing intermediate container fdd68c834c82
 ---> Running in 712af509ad8c
total 20
drwxr-xr-x 2 root root 4096 Sep 17 05:43 .
drwxr-xr-x 1 root root 4096 Sep 17 05:43 ..
-rw-r--r-- 1 root root   48 Sep 16 23:32 application-dev.yml
-rw-r--r-- 1 root root   47 Sep 16 23:32 application-prd.yml
-rw-r--r-- 1 root root  185 Sep 17 05:14 application.yml
Removing intermediate container 712af509ad8c
 ---> Running in a0d64b1c78e0
Renaming the executable jar to the runtime dir
Removing intermediate container a0d64b1c78e0
 ---> Running in 65b7521b34eb
Removing intermediate container 65b7521b34eb
 ---> Running in 3689b3c4ad9d
Removing intermediate container 3689b3c4ad9d
 ---> f8c20d9b537e
Successfully built f8c20d9b537e
Successfully tagged sample:latest
```

* Run the container
  * Note that you need to bind the host's port to the one from the container.
  * The end of the output confirms the server is running with the port displayed.

```
$ docker run -ti -p 8080:8080 sample

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.0.3.RELEASE)

2018-09-17 05:46:23.906  INFO 9 --- [           main] hello.Application                        : Starting Application on adab7dc7946f with PID 9 (/runtime/server.jar started by root in /runtime)
2018-09-17 05:46:23.918  INFO 9 --- [           main] hello.Application                        : No active profile set, falling back to default profiles: default
2018-09-17 05:46:24.089  INFO 9 --- [           main] ConfigServletWebServerApplicationContext : Refreshing org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@5b1d2887: startup date [Mon Sep 17 05:46:24 UTC 2018]; root of context hierarchy
2018-09-17 05:46:25.929  INFO 9 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2018-09-17 05:46:25.974  INFO 9 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2018-09-17 05:46:25.975  INFO 9 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet Engine: Apache Tomcat/8.5.31
2018-09-17 05:46:25.994  INFO 9 --- [ost-startStop-1] o.a.catalina.core.AprLifecycleListener   : The APR based Apache Tomcat Native library which allows optimal performance in production environments was not found on the java.library.path: [/usr/java/packages/lib/amd64:/usr/lib/x86_64-linux-gnu/jni:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib/jni:/lib:/usr/lib]
2018-09-17 05:46:26.130  INFO 9 --- [ost-startStop-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2018-09-17 05:46:26.131  INFO 9 --- [ost-startStop-1] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 2047 ms
2018-09-17 05:46:26.325  INFO 9 --- [ost-startStop-1] o.s.b.w.servlet.ServletRegistrationBean  : Servlet dispatcherServlet mapped to [/]
2018-09-17 05:46:26.331  INFO 9 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'characterEncodingFilter' to: [/*]
2018-09-17 05:46:26.332  INFO 9 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'hiddenHttpMethodFilter' to: [/*]
2018-09-17 05:46:26.332  INFO 9 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'httpPutFormContentFilter' to: [/*]
2018-09-17 05:46:26.333  INFO 9 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'requestContextFilter' to: [/*]
2018-09-17 05:46:26.333  INFO 9 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'defaultResponseFilter' to: [/*]
2018-09-17 05:46:26.556  INFO 9 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**/favicon.ico] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2018-09-17 05:46:26.932  INFO 9 --- [           main] s.w.s.m.m.a.RequestMappingHandlerAdapter : Looking for @ControllerAdvice: org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@5b1d2887: startup date [Mon Sep 17 05:46:24 UTC 2018]; root of context hierarchy
2018-09-17 05:46:27.060  INFO 9 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/]}" onto public java.lang.String hello.Application.home()
2018-09-17 05:46:27.069  INFO 9 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error],produces=[text/html]}" onto public org.springframework.web.servlet.ModelAndView org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.errorHtml(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)
2018-09-17 05:46:27.071  INFO 9 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error]}" onto public org.springframework.http.ResponseEntity<java.util.Map<java.lang.String, java.lang.Object>> org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.error(javax.servlet.http.HttpServletRequest)
2018-09-17 05:46:27.123  INFO 9 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/webjars/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2018-09-17 05:46:27.124  INFO 9 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2018-09-17 05:46:27.388  INFO 9 --- [           main] o.s.j.e.a.AnnotationMBeanExporter        : Registering beans for JMX exposure on startup
2018-09-17 05:46:27.459  INFO 9 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
2018-09-17 05:46:27.471  INFO 9 --- [           main] hello.Application                        : Started Application in 4.275 seconds (JVM running for 4.926)
```

* Make the call to the server
  * Note tha the TAG here is different because the Dockerfile overrides the `BUILD_TAG` value!

```
$ curl -i localhost:8080
HTTP/1.1 200
X-App-Build-Info: commit=d02650d801f8fc5db7ed0cc92422f897df3a0f4b;branch=feature/sample/show-build-info-all-response-headers;tag=sha:d02650d801f8fc5db7ed0cc92422f897df3a0f4b,build:feature/sample/show-build-info-all-response-headers/mdesales;time=2018-09-17-05:43:19-UTC;version=0.1.0
Content-Type: text/plain;charset=UTF-8
Content-Length: 47
Date: Mon, 17 Sep 2018 05:44:10 GMT

Hello Docker World from My App: Default profile%
```
