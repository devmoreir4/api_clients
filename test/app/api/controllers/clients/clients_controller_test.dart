import 'package:api_clients/app/api/api.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late ClientsController controller;
  late MockGetClientsUseCase mockGetClientsUseCase;
  late MockAddClientUseCase mockAddClientUseCase;

  setUpAll(() {
    mockGetClientsUseCase = MockGetClientsUseCase();
    mockAddClientUseCase = MockAddClientUseCase();

    controller = ClientsController(
      getClientsUseCase: mockGetClientsUseCase,
      addClientUseCase: mockAddClientUseCase,
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
  });
}
