part of '../../api.dart';

class UpdateClientHandler implements Handler {
  final UpdateClientUseCase updateClientUseCase;

  UpdateClientHandler({required this.updateClientUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) {
    throw UnimplementedError();
  }
}
