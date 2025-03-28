part of '../../infra.dart';

class FakeDB implements Connection {
  @override
  Future<void> close() async {
    print('close connection');
  }

  @override
  Future<List<Map<String, dynamic>>> query(String statement, [
    Map<String, dynamic> params = const {},
  ]) async {
    return [
      {
        'id': 1,
        'name': 'nome test',
        'email': 'email@email.com',
        'phone': '(011) 12345-12345'
      }
    ];
  }
}
