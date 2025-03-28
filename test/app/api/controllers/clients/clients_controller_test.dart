import 'package:api_clients/app/api/api.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late ClientsController controller;
  late MockGetClientsUseCase mockGetClientsUseCase;

  setUpAll(() {
    mockGetClientsUseCase = MockGetClientsUseCase();
    controller = ClientsController(
      getClientsUseCase: mockGetClientsUseCase,
    );
  });

  group('ClientsController', () {
    test('deve conter a rota "/clients"', () async {
      expect(controller.route, '/clients');
    });

    test('deve conter a key "GET" para o GetClientsHandler',
            () async {
          expect(controller.handlers['GET'], isA<GetClientsHandler>());
        });
  });
}
