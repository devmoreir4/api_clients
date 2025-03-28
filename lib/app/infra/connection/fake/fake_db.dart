part of '../../infra.dart';

class FakeDB implements Connection {
  @override
  Future<void> close() async {
    print('close connection');
  }

  @override
  Future<List<Map<String, dynamic>>> query(String statement) async {
    return [
      {
        'id': 1,
        'name': 'Carlos',
        'email': 'email@email.com',
        'phone': '(011) 12345-12345'
      }
    ];
  }
}
