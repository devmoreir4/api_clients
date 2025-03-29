part of '../api.dart';

abstract class ClientInputDTO {
  static Client toEntity(Map<String, dynamic> map) {
    return Client(
        id: map['id'] ?? 0,
        name: map['name'],
        email: map['email'],
        phone: map['phone']);
  }
}
