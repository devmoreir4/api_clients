import 'package:test/test.dart';

import 'dart:async';

import 'package:api_clients/app/domain/domain.dart';
import 'package:api_clients/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock.dart';

void main() {
  late GetClientByEmailDAO dao;
  late MockConnection mockConnection;

  setUpAll(() {
    mockConnection = MockConnection();
    dao = GetClientByEmailDAO(mockConnection);
  });

  setUp(() {
    when(() => mockConnection.close())
        .thenAnswer((_) async => Completer<void>().complete());
  });

  group('GetClientByEmailDAO', () {
    test('deve retornar um cliente', () async {
      when(() => mockConnection.query(any(), any())).thenAnswer((_) async => [
            {
              'id': 1,
              'name': 'nome test',
              'email': 'email@email.com',
              'phone': '1111-1111'
            }
          ]);
      final result = await dao.call('email@email.com');

      expect(result, isA<Client>());
    });

    test('deve retornar null quando não encontrar um cliente', () async {
      when(() => mockConnection.query(any(), any()))
          .thenAnswer((_) async => []);
      final result = await dao.call('email@email.com');

      expect(result, isNull);
    });
  });
}
