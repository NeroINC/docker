fedora-android
==============
Android build and test environment based on fedora:20.

This image contains:

* OpenJDK 7
* Android SDK r24
* Android Build Tools 21.1.0 and 21.1.1
* Android Emulator (sys-img-armeabi-v7a-android-21)
* Apache Ant 1.9.4
* Maven 3.2.5
* Gradle 2.2.1

Your application source code is expected in `/src`.

How-To
------
Build the image:
`docker build --rm -t neroinc/fedora-android .`

Start a container with an interactive shell:
`docker run -it neroinc/fedora-android /bin/bash`

To mount your local work directory (e.g. using [Boot2docker](http://boot2docker.io/))
into a new docker container, run:
`docker run -it -v /Users/<workspace path>:/src neroinc/fedora-android /bin/bash`

Or you can directly execute a build, e.g. using gradle:
`docker run -it -v /Users/<workspace path>:/src neroinc/fedora-android /bin/bash -c "cd /src && gradle [<additional command line params>]"`

And then copy the APK out of the container back into your host file system:
`docker cp <name of your container>:/src/<path to APK> .`

Running the Emulator
--------------------
The image ships with the Android Base Image (ABI) `sys-img-armeabi-v7a-android-21`. You can add more
base images by adding them to your `Dockerfile`.

Shell into your container and create a new emulator device with an 8 GBytes SD card:
`android create avd --name Default --target android-21 --sdcard 8000M --abi default/armeabi-v7a --force`

Then launch it:
`emulator64-arm -avd Default -no-boot-anim -noaudio -no-window -gpu off`

Executing Unit Tests
--------------------
Here's a simple batch file you can use to run unit tests. This will create and run an emulator, installs your APK,
executed the tests and copies the JUnit test report back into your docker file system.

    #!/bin/bash
    
    # Create AVD
    echo n | android create avd --name test-device --target android-21 --sdcard 8000M --abi default/armeabi-v7a --force
    
    # Start emulator
    emulator64-arm -avd test-device -no-boot-anim -noaudio -no-window -gpu off &
    adb wait-for-device
    
    # Waiting for emulator to fully boot
    echo 'Waiting for emulator to fully boot... (This might take several minutes)'
    adb shell 'while [ ""`getprop dev.bootcomplete` != "1" ] ; do sleep 1; done'
    
    # Run the tests
    adb shell pm list instrumentation
    adb install -rt <path to debug APK>
    adb shell mkdir /storage/sdcard/report_dir
    adb shell am instrument -w -e reportDir /storage/sdcard/report_dir <your package name>/com.zutubi.android.junitreport.JUnitReportTestRunner
    adb pull /storage/sdcard/report_dir/junit-report.xml ./test-reports/junit-report.xml
    
    # Stop the emulator
    adb -s emulator-5554 emu kill

The test results are located within your docker file system at `/src/test-reports`. 
Copy it back to your host file system via docker:
`docker cp <name of your container>:/src/test-reports .`
