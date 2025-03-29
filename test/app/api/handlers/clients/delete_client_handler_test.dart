import 'package:test/test.dart';

import 'dart:async';

import 'package:api_clients/app/api/api.dart';
import 'package:api_clients/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock.dart';

void main() {
  late DeleteClientHandler handler;
  late MockDeleteClientUseCase mockDeleteClientUseCase;

  setUpAll(() {
    mockDeleteClientUseCase = MockDeleteClientUseCase();
    handler = DeleteClientHandler(deleteClientUseCase: mockDeleteClientUseCase);
  });
  group('DeleteClientHandler', () {
    test('deve deletar um cliente retornando um status noContent', () async {
      when(() => mockDeleteClientUseCase.call(any()))
          .thenAnswer((_) async => Completer<void>().complete());
      final result = await handler.call(RequestParams(path: {'clientId': '1'}));

      expect(result.status, StatusHandler.noContent);
    });

    test('deve retornar um status notFound quando não encontrar um cliente',
        () async {
      when(() => mockDeleteClientUseCase.call(any()))
          .thenThrow(ClientNotFoundException());
      final result = await handler.call(RequestParams(path: {'clientId': '1'}));

      expect(result.status, StatusHandler.notFound);
    });

    test('deve retornar uma mensagem quando não encontrar um cliente',
        () async {
      when(() => mockDeleteClientUseCase.call(any()))
          .thenThrow(ClientNotFoundException());
      final result = await handler.call(RequestParams(path: {'clientId': '1'}));

      expect((result.body as MessageError).message, 'Client not found');
    });

    test(
        'deve retornar um status InternalServerError quando acontecer um erro desconhecido',
        () async {
      when(() => mockDeleteClientUseCase.call(any())).thenThrow(Exception());
      final result = await handler.call(RequestParams(path: {'clientId': '1'}));

      expect(result.status, StatusHandler.internalServerError);
    });
  });
}
