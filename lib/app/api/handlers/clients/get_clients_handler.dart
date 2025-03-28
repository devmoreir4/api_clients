part of '../../api.dart';

class GetClientsHandler implements Handler {
  final GetClientsUseCase getClientsUseCase;

  GetClientsHandler({required this.getClientsUseCase});

  @override
  Future<ResponseHandler> call() async {
    try {
      final clients = await getClientsUseCase();
      return ResponseHandler<List<ClientOutputDTO>>(
        status: StatusHandler.ok,
        body: ClientOutputDTO.toCollectionDTO(clients),
      );
    } catch (e) {
      return ResponseHandler(status: StatusHandler.internalServerError);
    }
  }
}
