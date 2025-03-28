import 'package:api_clients/app/api/api.dart';
import 'package:api_clients/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late GetClientsHandler handler;
  late MockGetClientsUseCase mockGetClientsUseCase;

  setUpAll(() {
    mockGetClientsUseCase = MockGetClientsUseCase();
    handler = GetClientsHandler(getClientsUseCase: mockGetClientsUseCase);
  });

  group('GetClientsHandler', () {
    test('deve retornar uma instancia de ResponseHandler', () async {
      when(() => mockGetClientsUseCase.call()).thenAnswer((_) async => []);
      final result = await handler.call(RequestParams());

      expect(result, isA<ResponseHandler>());
    });

    test('deve retornar um status ok', () async {
      when(() => mockGetClientsUseCase.call()).thenAnswer((_) async => []);
      final result = await handler.call(RequestParams());

      expect(result.status, StatusHandler.ok);
    });

    test('deve retornar uma lista de ClientOutputDTO', () async {
      when(() => mockGetClientsUseCase.call()).thenAnswer((_) async =>
          [Client(id: 1, name: 'name', email: 'email', phone: 'phone')]);
      final result = await handler.call(RequestParams());

      expect(result.body, isA<List<ClientOutputDTO>>());
    });

    test(
        'deve retornar um status internalServerError quando um erro desconhecido acontecer',
        () async {
      when(() => mockGetClientsUseCase.call()).thenThrow(Exception());
      final result = await handler.call(RequestParams());

      expect(result.status, StatusHandler.internalServerError);
    });
  });
}
