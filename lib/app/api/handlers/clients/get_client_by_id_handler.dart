part of '../../api.dart';

class GetClientByIdHandler implements Handler {
  final GetClientByIdUseCase getClientByIdUseCase;

  GetClientByIdHandler({required this.getClientByIdUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    try {
      final clientId = requestParams.path!['clientId'];
      final client = await getClientByIdUseCase(int.parse(clientId));
      return ResponseHandler(
        status: StatusHandler.ok,
        body: ClientOutputDTO.toDTO(client),
      );
    } on ClientNotFoundException {
      return ResponseHandler(
        status: StatusHandler.notFound,
        body: MessageError('Client not found'),
      );
    } catch (e) {
      return ResponseHandler(status: StatusHandler.internalServerError);
    }
  }
}
