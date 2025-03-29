part of '../../infra.dart';

class AddClientDAO implements AddClientGateway {
  final Connection connection;

  AddClientDAO(this.connection);

  @override
  Future<Client> call(Client client) async {
    try {
      final rows = await connection.query(
          'INSERT INTO clients (name, email, phone) VALUES (@name, @email, @phone) returning *',
          {
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
