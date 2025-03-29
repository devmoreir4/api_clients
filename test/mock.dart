import 'package:api_clients/app/data/data.dart';
import 'package:api_clients/app/domain/domain.dart';
import 'package:api_clients/app/infra/infra.dart';

import 'package:mocktail/mocktail.dart';

class MockGetClientsUseCase extends Mock implements GetClientsUseCase {}

class MockGetClientsGateway extends Mock implements GetClientsGateway {}

class MockAddClientUseCase extends Mock implements AddClientUseCase {}

class MockAddClientGateway extends Mock implements AddClientGateway {}

class MockGetClientByEmailGateway extends Mock
    implements GetClientByEmailGateway {}

class MockConnection extends Mock implements Connection {}

final clientMock = Client(id: 1, name: 'name', email: 'email', phone: 'phone');
