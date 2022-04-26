import 'package:dio/dio.dart';
import 'package:flutter_shorlty_task/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  final ApiService apiService = ApiService();

  group('if everything goes right...',(){
    late final Map<String, dynamic> result;
    late final String url;

    setUpAll(() async{
      url = 'https://flutter.dev/';
      result =await apiService.getData(url);
    });
    test('.getData() should be map', (){
      expect(result, isMap);
    });
    test('.getData() should not be null', (){
      expect(result, isNotNull);
    });
    test('result should be ok', (){
      expect(result['ok'], true);
    });
  });
  group('if something goes wrong...',(){
    late final String url;
    late final DioErrorType result;

    setUpAll(() async{
      await Future.delayed(const Duration(seconds: 1));
      url = 'http://shrtco.de/dhChiv';
      result = await apiService.getData(url);
    });
    test('.getData() should be map and should be not null', () async{
      expect(result, DioErrorType.response);
    });
  });
}