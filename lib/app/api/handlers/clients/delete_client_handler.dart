part of '../../api.dart';

class DeleteClientHandler implements Handler {
  final DeleteClientUseCase deleteClientUseCase;

  DeleteClientHandler({required this.deleteClientUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    try {
      final clientId = requestParams.path!['clientId'];
      await deleteClientUseCase(int.parse(clientId));
      return ResponseHandler(status: StatusHandler.noContent);
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
