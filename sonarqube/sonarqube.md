# SonarQube

## Prerequisites

1. To execute analysis with SonarScanner for MSBuild you need to have:

2. [Java Runtime Environment 8](https://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html) (JRE 8) on your machine. Also make sure that the $JAVA_HOME environment variable points to the path where JRE 8 is installed.

## Installation

### Using docker

1. Pull the [sonarqube](https://store.docker.com/images/sonarqube) image

   ```ps
   docker pull sonarqube
   ```

2. Create a docker container

   ```ps
   docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube
   ```

3. Access the SonarQube website [localhost:9000](http://localhost:9000)

## Analyze projects

### .net standard

1. Install the [SonarScanner for MSBuild](https://docs.sonarqube.org/display/SCAN/Install+the+SonarScanner+for+MSBuild)

2. Build the project

   ```ps
   SonarScanner.MSBuild.exe begin /k:"project-key"
   MSBuild.exe /t:Rebuild
   SonarScanner.MSBuild.exe end
   ```

### .net core

1. Install the `sonarscanner dotnet tool`

   ```ps
   dotnet tool install --global dotnet-sonarscanner
   ```

2. Build the project

   ```ps
   dotnet sonarscanner begin `
          /k:"project-name-in-sonarqube"
          /d:sonar.host.url="http://localhost:9000"
   dotnet build
   dotnet sonarscanner end
   ```
