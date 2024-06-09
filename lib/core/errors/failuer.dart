
import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection TimeOut with Api Server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send TimeOut with Api Server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive TimeOut with Api Server');

      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with Api Server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to Api Server canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');

      case DioExceptionType.unknown:
        return ServerFailure('Ops There was an Error Please try again');
    }

  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 304 ) {
      return ServerFailure("website you're requesting hasn't been updated since the last time you accessed it");
    } else if (statusCode == 422) {
      return ServerFailure('Validation failed, or the endpoint has been spammed.');
      //
    } else if (statusCode == 503) {
      ServerFailure('There is a problem Server Error,try Later');
    }
    return ServerFailure('Ops There was an Error Please try again');
  }
}

