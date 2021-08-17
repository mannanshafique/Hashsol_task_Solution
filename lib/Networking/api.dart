import 'package:dio/dio.dart';
import 'package:hashlob_app/Constant/constant.dart';
import 'package:hashlob_app/Model/model.dart';

//! Get using Dio Pacakage
class ApiIntegration {
  List<Datum>? detail = [];

  Future<ApiResponse> fetchDetail() async {
    Response responses;
    Dio dio = new Dio();

    responses = await dio.get(apiUrl);

    if (responses.statusCode == 200) {
      var jsonData = responses.data; //In dia not decode
      print(jsonData);

      var completeData = DataModel.fromJson(jsonData);
      detail = completeData.data!;
      print(detail![0].name);
    }

    return ApiResponse(responses);
  }
}

class ApiResponse {
  final Response response;
  ApiResponse(this.response);
}
