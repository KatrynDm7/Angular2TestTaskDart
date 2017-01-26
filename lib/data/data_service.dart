import 'dart:async';
import 'dart:convert';
import 'package:angular2/core.dart';
import 'package:http/http.dart';
import 'package:angular2_test_task/exception/exception_service.dart';

/*
 * Service for data (*.json)
 */
@Injectable()
class DataService {
    static const _dataUrl = 'sources/data';
    static const _ext = '.json';

    final Client _http;
    final ExceptionService _exceptionService;

    DataService(this._http, this._exceptionService);

    Future<dynamic> getData(String formName) async {
        try {
            final response = await _http.get('$_dataUrl/$formName$_ext');
            return JSON.decode(response.body);
        } catch (e) {
            throw _exceptionService.handleError(e);
        }
    }
}
