# Loosely based on https://github.com/wasabeef/dockerfiles/

FROM fedora:20

# Epel
# RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Update distribution
RUN yum -y update; yum clean all

# Install Development Tools
RUN yum -y groupinstall "Development Tools"; yum clean all

# Install java (OpenJDK)
RUN yum -y install java-1.7.0-openjdk-devel; yum clean all

# Install 32bit Libraries
RUN yum -y upgrade libstdc++; yum clean all
RUN yum -y install glibc.i686 libstdc++.i686 glibc-devel.i686 zlib-devel.i686 ncurses-devel.i686 libX11-devel.i686 libXrender.i686; yum clean all

# Install Android SDK
RUN cd /usr/local/ && \
	curl -L -O http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz && \
	tar xf android-sdk_r24.0.2-linux.tgz && \
	rm -rf android-sdk_r24.0.2-linux.tgz

# Install Android tools and libraries
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter tools --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter platform-tools --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter build-tools-21.1.1,build-tools-21.1.0 --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter extra-android-m2repository,extra-android-support --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter android-21 --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter sys-img-armeabi-v7a-android-21 --no-ui --force -a
#RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter android-20,android-19,android-18 --no-ui --force -a
#RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter addon-google_apis-google-19 --no-ui --force -a

# Install Android NDK
#RUN cd /usr/local && \
#	curl -L -O http://dl.google.com/android/ndk/android-ndk-r9b-linux-x86_64.tar.bz2 && \
#	tar xf android-ndk-r9b-linux-x86_64.tar.bz2 && \
#	rm -rf android-ndk-r9b-linux-x86_64.tar.bz2

# Install Apache-Ant
RUN cd /usr/local/ && \
	curl -L -O http://ftp.meisei-u.ac.jp/mirror/apache/dist/ant/binaries/apache-ant-1.9.5-bin.tar.gz && \
	tar xf apache-ant-1.9.5-bin.tar.gz && \
	rm -rf apache-ant-1.9.5-bin.tar.gz

# Install Maven
RUN cd /usr/local/ && \
	curl -L -O http://ftp.tsukuba.wide.ad.jp/software/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz && \
	tar xf apache-maven-3.2.5-bin.tar.gz && \
	rm -rf apache-maven-3.2.5-bin.tar.gz

# Install Gradle
RUN cd /usr/local/ && \
	curl -L -O http://services.gradle.org/distributions/gradle-2.2.1-bin.zip && \
	unzip -qo gradle-2.2.1-bin.zip && \
	rm -rf gradle-2.2.1-bin.zip

# Environment variables
ENV JAVA_HOME /usr/lib/jvm/jre-1.7.0-openjdk
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV ANDROID_AVD_HOME /root/.android/avd
#ENV ANDROID_NDK_HOME /usr/local/android-ndk-r9b
ENV ANT_HOME /usr/local/apache-ant-1.9.4
ENV MAVEN_HOME /usr/local/apache-maven-3.2.5
ENV GRADLE_HOME /usr/local/gradle-2.2.1
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
#ENV PATH $PATH:$ANDROID_NDK_HOME
ENV PATH $PATH:$ANT_HOME/bin
ENV PATH $PATH:$MAVEN_HOME/bin
ENV PATH $PATH:$GRADLE_HOME/bin

# Make sure AVD path exists as otherwise we'll fail to create an SD card
RUN mkdir -p $ANDROID_AVD_HOME

# Done
RUN mkdir -p /src
WORKDIR /src
CMD ["/bin/bash"]
