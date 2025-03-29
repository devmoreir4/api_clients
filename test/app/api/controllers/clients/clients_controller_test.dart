import 'package:api_clients/app/api/api.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late ClientsController controller;
  late MockGetClientsUseCase mockGetClientsUseCase;
  late MockAddClientUseCase mockAddClientUseCase;
  late MockGetClientByIdUseCase mockGetClientByIdUseCase;
  late MockDeleteClientUseCase mockDeleteClientUseCase;
  late MockUpdateClientUseCase mockUpdateClientUseCase;

  setUpAll(() {
    mockGetClientsUseCase = MockGetClientsUseCase();
    mockAddClientUseCase = MockAddClientUseCase();
    mockGetClientByIdUseCase = MockGetClientByIdUseCase();
    mockDeleteClientUseCase = MockDeleteClientUseCase();
    mockUpdateClientUseCase = MockUpdateClientUseCase();

    controller = ClientsController(
      getClientsUseCase: mockGetClientsUseCase,
      addClientUseCase: mockAddClientUseCase,
      getClientByIdUseCase: mockGetClientByIdUseCase,
      deleteClientUseCase: mockDeleteClientUseCase,
      updateClientUseCase: mockUpdateClientUseCase,
    );
  });

  group('ClientsController', () {
    test('deve conter a rota "/clients"', () async {
      expect(controller.route, '/clients');
    });

    test('deve conter a key "GET" para o GetClientsHandler', () async {
      expect(controller.handlers['GET'], isA<GetClientsHandler>());
    });

    test('deve conter uma key "POST" para o handler AddClientHandler',
        () async {
      expect(controller.handlers['POST'], isA<AddClientHandler>());
    });

    test(
        'deve conter uma key "GET /{clientId}" para o handler GetClientByIdHandler',
        () async {
      expect(controller.handlers['GET /{clientId}'],
          isA<GetClientByIdHandler>());
    });

    test(
        'deve conter uma key "DELETE /{clientId}" para o handler DeleteClientHandler',
        () async {
      expect(controller.handlers['DELETE /{clientId}'],
          isA<DeleteClientHandler>());
    });

    test(
        'deve conter uma key "PUT /{clientId}" para o handler UpdateClientHandler',
        () async {
      expect(
          controller.handlers['PUT /{clientId}'], isA<UpdateClientHandler>());
    });
  });
}
