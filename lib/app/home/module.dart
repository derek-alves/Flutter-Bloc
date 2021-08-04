import 'package:bloc_flutter/app/home/search_cep_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final i = GetIt.instance;

initModule() {
  i.registerFactory(() => Dio());
  i.registerFactory(() => SearchCepBloc(i()));
}

disposeModule() {
  i<SearchCepBloc>().close();
  i.unregister<SearchCepBloc>();
  i.unregister<Dio>();
}
