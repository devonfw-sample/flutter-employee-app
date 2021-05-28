# Flutter Employee App
Flutter Sample App based on https://github.com/devonfw-forge/devonfw4flutter


#### Project setup ####
1) Rename root folder to: "devon4ng_flutter_application_template"
2) Run "flutter create ."
3) Run "flutter pub get"
4) Run "flutter pub run build_runner build --delete-conflicting-outputs"
5) Configure splash screen file flutter_native_splash.yaml
6) Run "flutter pub run flutter_native_splash:create"
7) Enable Insecure HTTP Calls https://flutter.dev/docs/release/breaking-changes/network-policy-ios-android



#### Code Generation on demand ####
1) Run "flutter clean"
2) Run "flutter pub get"
3) Run "flutter pub run build_runner build --delete-conflicting-outputs"



#### REST URLs configuration ####
In file lib/config.dart set variables:
- kDevEndpoint
- kTestEndpoint
- kProdEndpoint

Variable "kCurrentEndopoint" is for setting the current environment. Run command n4 of Project Setup above at every endpoint change in order to regenerate Rest Client code.



#### Android Emulator Hosts Setup ####
In order to reach the private hostname "frpariticsd" you have to update the /etch/hosts file into the Android filesystem.
1) Using Android Studio, create a non-Play Store emulator
2) Update PATH system variable including "emulator" and "adb" executables from Android SDK. 
    - For OSX users:
        1) Run command "sudo nano /etc/paths"
        2) Append the path to the "emulator" command (i.e. /Users/YOUR_USERNAME/Library/Android/sdk/emulator)
        3) Append the path to the "adb" command (i.e. /Users/YOUR_USERNAME/Library/Android/sdk/platform-tools)
    - For Windows users:
        1) export ANDROID_HOME="/Users/YOUR_USERNAME/Library/Android/sdk"
        2) export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$PATH
3) Run command "emulator -list-avds" to see the list of available emulators.
4) Run command for writable system feature "emulator -avd YOUR_AVD_NAME -writable-system -no-snapshot-load -no-cache"
5) Fetch the hosts file running "adb pull /etc/hosts"
6) Edit the file and append line "10.24.219.91    frpariticsd"
7) Run the following commands in order to run as root and to remount partition:
    - adb devices  #you should see your devices
    - adb root
    - adb shell avbctl disable-verification
    - adb reboot (it may take a minute)
    - adb root
    - adb remount
7) After remount push the new hosts file to the emulator filesystem, running command "adb push hosts /etc/hosts"
8) Open browser and navigate to "frpariticsd:1200" to check everything is fine


#### Docker ####
For building container image, run: "docker build -t devon4flutter-web ."
    (In case of cache problem, run: "docker build --no-cache -t devon4flutter-web .")

For running image, run: "docker run -d -p 1200:80 --name devon4flutter-web devon4flutter-web"

For showing create container image, run: "docker image ls"

For showing running container, run: "docker container ls"

For stopping running container, run: "docker stop [containerId]"