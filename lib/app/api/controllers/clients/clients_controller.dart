part of '../../api.dart';

class ClientsController implements Controller {
  final GetClientsUseCase getClientsUseCase;
  final AddClientUseCase addClientUseCase;

  ClientsController(
      {required this.getClientsUseCase, required this.addClientUseCase});
  @override
  String get route => '/clients';

  @override
  Map<String, Handler> get handlers => {
        'GET': GetClientsHandler(
          getClientsUseCase: getClientsUseCase,
        ),
        'POST': AddClientHandler(
          addClientUseCase: addClientUseCase,
        ),
      };
}
