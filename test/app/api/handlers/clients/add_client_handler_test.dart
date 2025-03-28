import 'package:api_clients/app/api/api.dart';
import 'package:api_clients/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late AddClientHandler handler;
  late MockAddClientUseCase mockAddClientUseCase;

  setUpAll(() {
    mockAddClientUseCase = MockAddClientUseCase();
    handler = AddClientHandler(addClientUseCase: mockAddClientUseCase);

    registerFallbackValue(
        Client(id: 1, name: 'name', email: 'email', phone: 'phone'));
  });

  group('AddClientHandler', () {
    test('deve retornar um status created', () async {
      when(() => mockAddClientUseCase.call(any())).thenAnswer((_) async =>
          Client(id: 1, name: 'name', email: 'email', phone: 'phone'));
      final result = await handler.call(RequestParams(body: {
        'name': 'nome test',
        'email': 'email@email.com',
        'phone': '1234-1234'
      }));

      expect(result.status, StatusHandler.created);
    });

    test('deve retornar um ClienteOutputDTO', () async {
      when(() => mockAddClientUseCase.call(any())).thenAnswer((_) async =>
          Client(id: 1, name: 'name', email: 'email', phone: 'phone'));
      final result = await handler.call(RequestParams(body: {
        'name': 'nome test',
        'email': 'email@email.com',
        'phone': '1234-1234'
      }));

      expect(result.body, isA<ClientOutputDTO>());
    });

    test(
        'deve retornar status InternalServerError quando for error generico',
        () async {
      when(() => mockAddClientUseCase.call(any())).thenThrow(Exception);
      final result = await handler.call(RequestParams(body: {
        'name': 'nome test',
        'email': 'email@email.com',
        'phone': '1234-1234'
      }));

      expect(result.status, StatusHandler.internalServerError);
    });

    test(
        'deve retornar status badRequest existir um cliente com o mesmo email',
        () async {
      when(() => mockAddClientUseCase.call(any()))
          .thenThrow(ClientWithThisEmailAlreadyExistsException());
      final result = await handler.call(RequestParams(body: {
        'name': 'nome test',
        'email': 'email@email.com',
        'phone': '1234-1234'
      }));

      expect(result.status, StatusHandler.badRequest);
    });

    test('deve retornar a mensagem "A client with this email already exists"',
        () async {
      when(() => mockAddClientUseCase.call(any()))
          .thenThrow(ClientWithThisEmailAlreadyExistsException());
      final result = await handler.call(RequestParams(body: {
        'name': 'nome test',
        'email': 'email@email.com',
        'phone': '1234-1234'
      }));

      expect((result.body as MessageError).message,
          "A client with this email already exists");
    });
  });
}
