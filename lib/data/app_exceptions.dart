
class AppException implements Exception{
  final _massage;
  final _prefix;

  AppException([this._massage, this._prefix]);
  String toString(){
    return '$_prefix$_massage';
  }
}

class FetchDataException extends AppException{

  FetchDataException([String? massege]) : super(massege,'Error During Communication');
}

class BadRequestException extends AppException{

  BadRequestException([String? massege]) : super(massege,'Invalid Request ');
}

class UnauthorisedException extends AppException{

  UnauthorisedException([String? massege]) : super(massege,'UnauthorisedException Request');
}

class InvalidInputException extends AppException{

  InvalidInputException([String? massege]) : super(massege,'Invalid Input');
}