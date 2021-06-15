/// CHANGE THIS FOR SELECTING THE CONFIGURATION
const kCurrentAppConfigType = AppConfigType.Development;

/// AVAILABLE CONFIGURATION TYPES
enum AppConfigType { Development, Testing, Production }

/// Endpoint environment
class Endpoint {
  //static const String kDevEndpoint = "http://localhost:8081/services/rest/";
  static const String kDevEndpoint = "http://10.0.2.2:8081/services/rest/";
  static const String kTestEndpoint = "http://frpariticsd:1200";
  static const String kPLServerEndpoint =
      "http://frpariticsd:8081/services/rest";
  static const String kProdEndpoint = "";

  ///For static access (i.e. Rest Client)
  static const String kCurrentEndopoint = kTestEndpoint;
}

///APP CONFIGURATION MODEL
class AppConfig {
  final String endpoint;

  AppConfig(this.endpoint);

  factory AppConfig._fromType(AppConfigType type) {
    switch (type) {
      case AppConfigType.Development:
        return AppConfig(Endpoint.kDevEndpoint);

      case AppConfigType.Testing:
        return AppConfig(Endpoint.kTestEndpoint);

      case AppConfigType.Production:
        return AppConfig(Endpoint.kProdEndpoint);
    }
    throw Exception("Unknown config type: $type");
  }

  factory AppConfig.current() {
    return AppConfig._fromType(kCurrentAppConfigType);
  }
}
