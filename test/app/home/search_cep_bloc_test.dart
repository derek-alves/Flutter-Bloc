import 'package:bloc_flutter/app/home/search_cep_bloc.dart';
import 'package:bloc_flutter/app/home/search_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements DioForNative {}

void main() {
  final dio = DioMock();
  when(() => dio.get(any())).thenAnswer(
    (_) async => Response(
      data: {},
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    ),
  );

  blocTest<SearchCepBloc, SearchCepState>(
    'deve retornar uma cidade quando o cep for passado por parametro',
    build: () => SearchCepBloc(dio),
    act: (bloc) => bloc.add("12702430"),
    expect: () => [isA<SearchCepLoading>(), isA<SearchCepSuccess>()],
  );
}
