import 'package:devon4ng_flutter_application_template/model/network/authentication/login_request_dto.dart';
import 'package:devon4ng_flutter_application_template/model/network/authentication/token_response_dto.dart';
import 'package:devon4ng_flutter_application_template/model/network/http_client_provider.dart';
import 'package:devon4ng_flutter_application_template/model/repository/abstract_repository.dart';

class AuthenticationRepository extends AbstractRepository {
  Future<void> login(String username, String password) async {
    LoginRequestDto dto = LoginRequestDto(username, password);

    await restClient.login(dto, apiVersion);
    TokenResponseResponseDto tokenResponseDto =
        await restClient.getToken(apiVersion);

    HttpClientProvider.csfrToken = tokenResponseDto.token;
    return;
  }
}
