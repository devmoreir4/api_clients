import 'package:test/test.dart';

import 'package:api_clients/app/api/api.dart';
import 'package:api_clients/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock.dart';

void main() {
  late GetClientByIdHandler handler;
  late MockGetClientByIdUseCase mockGetClientByIdUseCase;

  setUpAll(() {
    mockGetClientByIdUseCase = MockGetClientByIdUseCase();
    handler =
        GetClientByIdHandler(getClientByIdUseCase: mockGetClientByIdUseCase);
  });

  group('GetClientByIdHandler', () {
    test('deve retornar um cliente', () async {
      when(() => mockGetClientByIdUseCase.call(any()))
          .thenAnswer((_) async => clientMock);
      final result =
          await handler.call(RequestParams(path: {'clientId': '1'}));

      expect(result.body, isA<ClientOutputDTO>());
    });

    test('deve retornar um status notFound quando não encontrar um cliente',
        () async {
      when(() => mockGetClientByIdUseCase.call(any()))
          .thenThrow(ClientNotFoundException());
      final result =
          await handler.call(RequestParams(path: {'clientId': '1'}));

      expect(result.status, StatusHandler.notFound);
    });

    test('deve retornar uma mensagem quando não encontrar um cliente',
        () async {
      when(() => mockGetClientByIdUseCase.call(any()))
          .thenThrow(ClientNotFoundException());
      final result =
          await handler.call(RequestParams(path: {'clientId': '1'}));

      expect((result.body as MessageError).message, 'Client not found');
    });

    test(
        'deve retornar um status InternalServerError quando acontecer um erro desconhecido',
        () async {
      when(() => mockGetClientByIdUseCase.call(any())).thenThrow(Exception());
      final result =
          await handler.call(RequestParams(path: {'clientId': '1'}));

      expect(result.status, StatusHandler.internalServerError);
    });
  });
}
