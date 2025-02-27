abstract class Success {
  final String? code;
  final String? message;
  final dynamic data;

  const Success({this.code,this.message,this.data});
}

class ServerSuccess extends Success {
  const ServerSuccess({super.code,super.message, super.data});
}
