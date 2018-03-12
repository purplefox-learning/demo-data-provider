@REM High level order
@REM clean, build, assembleDist, publishToMavenLocal, , artifactoryPublish

@REM build locally and create distribution files (one zip one tar)
gradlew clean build distTar -x test --info
@REM build locally and publish to maven local in .m2 folder
gradlew clean build publishToMavenLocal -x test --info
@REM build locally and publish to artifactory
gradlew clean build artifactoryPublish -x test --info
@REM all in one command
gradlew clean build publishToMavenLocal artifactoryPublish -x test --info

@REM run locally
gradlew bootRun


=== Dependency tree ===

:bootBuildInfo 
:compileJava 
:generateGitProperties 
:processResources 
:classes 
:bootJar 
:javadoc 
:javadocJar 
:sourceJar 
:distTar 
:distZip 
:jar 
:assemble 
:check 
:build 
:generatePomFileForMavenJavaPublication 
--- path 1
:publishMavenJavaPublicationToMavenLocal 
:publishToMavenLocal 
--- path 2
:artifactoryPublish 
:artifactoryDeploy 