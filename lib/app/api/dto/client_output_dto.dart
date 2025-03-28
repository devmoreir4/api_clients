part of '../api.dart';

class ClientOutputDTO {
  final int id;
  final String name;
  final String email;
  final String phone;

  ClientOutputDTO({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory ClientOutputDTO.toDTO(Client client) {
    return ClientOutputDTO(
        id: client.id,
        name: client.name,
        email: client.email,
        phone: client.phone);
  }

  static List<ClientOutputDTO> toCollectionDTO(List<Client> clients) {
    return clients.map(ClientOutputDTO.toDTO).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
