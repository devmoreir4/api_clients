import 'dart:async';

import 'package:api_clients/app/domain/domain.dart';
import 'package:api_clients/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late MockConnection connection;
  late GetClientsDAO dao;

  setUpAll(() {
    connection = MockConnection();
    dao = GetClientsDAO(connection: connection);
  });
  group('GetClientsDAO', () {
    test('deve retornar uma lista de clientes', () async {
      when(() => connection.query(any())).thenAnswer((_) async => [
            {
              'id': 1,
              'name': 'name',
              'email': 'email@email.com',
              'phone': '123456789'
            }
          ]);

      when(() => connection.close())
          .thenAnswer((_) async => Completer<void>().complete());

      final result = await dao.call();

      expect(result, isA<List<Client>>());
    });
  });
}
