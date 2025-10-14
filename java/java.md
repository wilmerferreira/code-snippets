# java

## IDEs

- Visual Studio Code with [Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack)

## Build systems

### Maven

[Maven](https://maven.org)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>com.yourcompany</groupId>
  <artifactId>YourProjectName</artifactId>
  <version>1.0-SNAPSHOT</version>

  <properties>
    <maven.compiler.source>21</maven.compiler.source>
    <maven.compiler.target>21</maven.compiler.target>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  </properties>

  <dependencies>
  </dependencies>

</project>
```

### Gradle

[Gradle](https://gradle.org/)

#### Kotlin



#### Groovy

```groovy
plugins {
  id 'java'
}

group = 'com.yourcompany'
version = '1.0-SNAPSHOT'

repositories {
  mavenCentral()
}

dependencies {
  // Add any dependencies here, like Jackson
  // implementation 'com.fasterxml.jackson.core:jackson-databind:2.17.0' 
}
```
