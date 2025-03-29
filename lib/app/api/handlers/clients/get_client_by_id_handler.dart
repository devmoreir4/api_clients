part of '../../api.dart';

class GetClientByIdHandler implements Handler {
  final GetClientByIdUseCase getClientByIdUseCase;

  GetClientByIdHandler({required this.getClientByIdUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) {
    throw UnimplementedError();
  }
}
