part of '../../api.dart';

class ClientsController implements Controller {
  final GetClientsUseCase getClientsUseCase;
  final AddClientUseCase addClientUseCase;
  final GetClientByIdUseCase getClientByIdUseCase;
  final DeleteClientUseCase deleteClientUseCase;
  final UpdateClientUseCase updateClientUseCase;

  ClientsController({
      required this.getClientsUseCase,
      required this.addClientUseCase,
      required this.getClientByIdUseCase,
      required this.deleteClientUseCase,
      required this.updateClientUseCase
    });

  @override
  String get route => '/clients';

  @override
  Map<String, Handler> get handlers => {
        'GET': GetClientsHandler(
          getClientsUseCase: getClientsUseCase,
        ),
        'GET /{clientId}': GetClientByIdHandler(
          getClientByIdUseCase: getClientByIdUseCase,
        ),
        'DELETE /{clientId}': DeleteClientHandler(
          deleteClientUseCase: deleteClientUseCase,
        ),
        'PUT /{clientId}': UpdateClientHandler(
          updateClientUseCase: updateClientUseCase,
        ),
        'POST': AddClientHandler(
          addClientUseCase: addClientUseCase,
        ),
      };
}
