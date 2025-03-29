import 'package:test/test.dart';

import 'dart:async';

import 'package:api_clients/app/domain/domain.dart';
import 'package:api_clients/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock.dart';

void main() {
  late AddClientDAO dao;
  late MockConnection mockConnection;

  setUpAll(() {
    mockConnection = MockConnection();
    dao = AddClientDAO(mockConnection);
  });

  group('AddClientDAO', () {
    test('deve adicionar um cliente', () async {
      when(() => mockConnection.close())
          .thenAnswer((_) async => Completer<void>().complete());
      when(() => mockConnection.query(any(), any())).thenAnswer((_) async => [
            {
              'id': 1,
              'name': 'nome test',
              'email': 'email@email.com',
              'phone': '1111-1111'
            }
          ]);
      final result = await dao.call(clientMock);

      expect(result, isA<Client>());
    });
  });
}
