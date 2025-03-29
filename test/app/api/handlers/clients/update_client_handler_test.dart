import 'package:test/test.dart';

import 'package:api_clients/app/api/api.dart';
import 'package:api_clients/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock.dart';

void main() {
  late UpdateClientHandler handler;
  late MockUpdateClientUseCase mockUpdateClientUseCase;

  setUpAll(() {
    mockUpdateClientUseCase = MockUpdateClientUseCase();
    handler =
        UpdateClientHandler(updateClientUseCase: mockUpdateClientUseCase);

    registerFallbackValue(clientMock);
  });

  group('UpdateClientHandler', () {
    test('deve atualizar um cliente', () async {
      when(() => mockUpdateClientUseCase.call(any()))
          .thenAnswer((_) async => clientMock);
      final result = await handler.call(RequestParams(path: {
        'clientId': '1'
      }, body: {
        'name': 'nome test',
        'email': 'email@email.com',
        'phone': '1111-1111'
      }));

      expect(result.body, isA<ClientOutputDTO>());
    });

    test('deve retornar um status notFound quando não encontrar um cliente',
        () async {
      when(() => mockUpdateClientUseCase.call(any()))
          .thenThrow(ClientNotFoundException());
      final result = await handler.call(RequestParams(path: {
        'clientId': '1'
      }, body: {
        'name': 'nome test',
        'email': 'email@email.com',
        'phone': '1111-1111'
      }));

      expect(result.status, StatusHandler.notFound);
    });

    test('deve retornar uma mensagem quando não encontrar um cliente',
        () async {
      when(() => mockUpdateClientUseCase.call(any()))
          .thenThrow(ClientNotFoundException());
      final result = await handler.call(RequestParams(path: {
        'clientId': '1'
      }, body: {
        'name': 'nome test',
        'email': 'email@email.com',
        'phone': '1111-1111'
      }));

      expect((result.body as MessageError).message, 'Client not found');
    });

    test(
        'deve retornar um status InternalServerError quando acontecer um erro desconhecido',
        () async {
      when(() => mockUpdateClientUseCase.call(any())).thenThrow(Exception());
      final result = await handler.call(RequestParams(path: {
        'clientId': '1'
      }, body: {
        'name': 'nome test',
        'email': 'email@email.com',
        'phone': '1111-1111'
      }));

      expect(result.status, StatusHandler.internalServerError);
    });
  });
}
