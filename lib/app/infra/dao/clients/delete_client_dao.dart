part of '../../infra.dart';

class DeleteClientDAO implements DeleteClientGateway {
  final Connection connection;

  DeleteClientDAO(this.connection);

  @override
  Future<void> call(int clientId) async {
    try {
      await connection.query('DELETE FROM clients WHERE id=@id', {
        'id': clientId,
      });
    } finally {
      await connection.close();
    }
  }
}
