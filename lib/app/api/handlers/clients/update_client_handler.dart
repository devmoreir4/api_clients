part of '../../api.dart';

class UpdateClientHandler implements Handler {
  final UpdateClientUseCase updateClientUseCase;

  UpdateClientHandler({required this.updateClientUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    try {
      final clientId = int.parse(requestParams.path!['clientId']);
      final body = {...requestParams.body!, 'id': clientId};

      final client = ClientInputDTO.toEntity(body);
      final updatedClient = await updateClientUseCase(client);
      return ResponseHandler(
        status: StatusHandler.ok,
        body: ClientOutputDTO.toDTO(updatedClient),
      );
    } on ClientNotFoundException {
      return ResponseHandler(
          status: StatusHandler.notFound,
          body: MessageError('Client not found'));
    } catch (e) {
      return ResponseHandler(status: StatusHandler.internalServerError);
    }
  }
}
