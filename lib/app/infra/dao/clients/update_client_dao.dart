part of '../../infra.dart';

class UpdateClientDAO implements UpdateClientGateway {
  final Connection connection;

  UpdateClientDAO(this.connection);

  @override
  Future<Client> call(Client client) async {
    try {
      final rows = await connection.query(
          'UPDATE clients SET name=@name, email=@email, phone=@phone WHERE id=@id returning *',
          {
            'id': client.id,
            'name': client.name,
            'email': client.email,
            'phone': client.phone,
          });

      return rows.map(ClientDB.toEntity).first;
    } finally {
      await connection.close();
    }
  }
}
