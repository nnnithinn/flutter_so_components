
import 'package:so/so.dart';

/// Class that holds the client instance once it is created,
/// and the user has loggedin. This instance can be used for fetching the
/// data from the client.
///
class ConnectionClient {
  final Client? client;
  static ConnectionClient? _instance;

  ConnectionClient({
    required this.client
  }) {
    _instance = this;
  }

  //Connection Client works as a singleton
  static ConnectionClient get() {
    return _instance ??= ConnectionClient(client: null);
  }
}