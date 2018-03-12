@REM gradlew -Dspring.profiles.active=default bootRun


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

:bootBuildInfo SKIPPED
:compileJava SKIPPED
:generateGitProperties SKIPPED
:processResources SKIPPED
:classes SKIPPED
:bootJar SKIPPED
:javadoc SKIPPED
:javadocJar SKIPPED
:sourceJar SKIPPED
:distTar SKIPPED
:distZip SKIPPED
:jar SKIPPED
:assemble SKIPPED
:check SKIPPED
:build SKIPPED
:generatePomFileForMavenJavaPublication SKIPPED
--- path 1
:publishMavenJavaPublicationToMavenLocal SKIPPED
:publishToMavenLocal SKIPPED
--- path 2
:artifactoryPublish SKIPPED
:artifactoryDeploy SKIPPED