import 'package:test/test.dart';

import 'dart:async';

import 'package:api_clients/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock.dart';

void main() {
  late DeleteClientDAO dao;
  late MockConnection mockConnection;

  setUpAll(() {
    mockConnection = MockConnection();
    dao = DeleteClientDAO(mockConnection);
  });

  group('DeleteClientDAO', () {
    test('deve remover um cliente', () async {
      when(() => mockConnection.close())
          .thenAnswer((_) async => Completer().complete());
      when(() => mockConnection.query(any(), any()))
          .thenAnswer((_) async => []);

      await dao.call(1);

      verify(() => mockConnection.query(any(), any())).called(1);
      verify(() => mockConnection.close()).called(1);
    });
  });
}
