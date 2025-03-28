part of '../../api.dart';

class AddClientHandler implements Handler {
  final AddClientUseCase addClientUseCase;

  AddClientHandler({required this.addClientUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    try {
      final client = ClientInputDTO.toEntity(requestParams.body!);
      final createdClient = await addClientUseCase(client);
      return ResponseHandler(
        status: StatusHandler.created,
        body: ClientOutputDTO.toDTO(createdClient),
      );
    } on ClientWithThisEmailAlreadyExistsException {
      return ResponseHandler(
          status: StatusHandler.badRequest,
          body: MessageError('A client with this email already exists'));
    } catch (e) {
      print(e.toString());
      return ResponseHandler(status: StatusHandler.internalServerError);
    }
  }
}
