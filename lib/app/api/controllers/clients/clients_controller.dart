part of '../../api.dart';

class ClientsController implements Controller {
  final GetClientsUseCase getClientsUseCase;

  ClientsController({required this.getClientsUseCase});
  @override
  String get route => '/clients';

  @override
  Map<String, Handler> get handlers => {
        'GET': GetClientsHandler(
          getClientsUseCase: getClientsUseCase,
        ),
      };
}
