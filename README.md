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



#### Docker ####

For building container image, run: "docker build -t devon4flutter-web ."
    (In case of cache problem, run: "docker build --no-cache -t devon4flutter-web .")

For running image, run: "docker run -d -p 1200:80 --name devon4flutter-web devon4flutter-web"

For showing create container image, run: "docker image ls"

For showing running container, run: "docker container ls"

For stopping running container, run: "docker stop [containerId]"