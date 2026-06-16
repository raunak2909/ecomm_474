class AppExceptions implements Exception{
  String title, msg;

  AppExceptions({required this.title, required this.msg});

  @override
  String toString() {
    return '$title: $msg';
  }

}

class NoInternetException extends AppExceptions {
  NoInternetException({required super.msg}) : super(title: "No Internet");
}

class BadRequestException extends AppExceptions {
  BadRequestException({required super.msg}) : super(title: "Bad Request");
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException({required super.msg}) : super(title: "Unauthorised");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException({required super.msg}) : super(title: "Invalid Input");
}

class ServerException extends AppExceptions {
  ServerException({required super.msg}) : super(title: "Internal Server Error");
}

class FetchDataException extends AppExceptions {
  FetchDataException({required super.msg}) : super(title: "Error During Communication");
}

class NotFoundException extends AppExceptions {
  NotFoundException({required super.msg}) : super(title: "Resource Not Found");
}