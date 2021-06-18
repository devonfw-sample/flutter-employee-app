import 'package:devon4ng_flutter_application_template/model/network/http_client_provider.dart';

import '../network/rest_client.dart';

abstract class AbstractRepository {
  var apiVersion = "v1";

  RestClient restClient = RestClient(HttpClientProvider.standard().client);
  
}
