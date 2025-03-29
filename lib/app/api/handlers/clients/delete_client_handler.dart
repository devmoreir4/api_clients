part of '../../api.dart';

class DeleteClientHandler implements Handler {
  final DeleteClientUseCase deleteClientUseCase;

  DeleteClientHandler({required this.deleteClientUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) {
    throw UnimplementedError();
  }
}
