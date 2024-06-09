

import 'package:dartz/dartz.dart';

import '../errors/failuer.dart';

abstract class UseCase<Type,Param>{
  Future<Either<Failures,Type>> call([Param? param]);
}

class NoParam{}