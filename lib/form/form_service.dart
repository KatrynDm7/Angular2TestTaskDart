import 'dart:async';
import 'dart:convert';

import 'package:angular2/core.dart';
import 'package:http/http.dart';

import 'form.dart';
import 'package:angular2_test_task/exception/exception_service.dart';
import 'package:angular2_test_task/emulate_response/emulate_response_service.dart';
import 'package:angular2_test_task/local_storage/localstorage_service.dart';

/*
 * Form Service ($http)
 */
@Injectable()
class FormService {
    static const _structureUrl = 'sources/structure';
    static const _ext = '.json';
    static final _headers = {'Content-Type': 'application/json'};
    static final _apiUrl = 'api';

    Form form;

    final Client _http;
    final EmulateResponseService _emulateResponseService;
    final ExceptionService _exceptionService;
    final LocalStorageService _localStorageService;

    FormService(this._http, this._emulateResponseService,
        this._exceptionService, this._localStorageService);

    Future<Form> getForm(String formName) async {
        try {
            final response = await _http.get('$_structureUrl/$formName$_ext');
            var jsonDecoded = JSON.decode(response.body);

            return new Form(jsonDecoded['formName'], jsonDecoded['fields']);
        } catch (e) {
            throw _exceptionService.handleError(e);
        }
    }

    Future<Form> save(Form form) async {
        try {
            var formName = form.formName;
            var response = await _emulateResponseService.post('$_apiUrl/$formName',
        headers: _headers, body: JSON.encode(form));
            var jsonDecoded = JSON.decode(response.body);
            
            _localStorageService.save(formName, JSON.encode(jsonDecoded['data']));

            return new Form(jsonDecoded['data']['formName'], jsonDecoded['data']['fields']);
        } catch (e) {
            throw _exceptionService.handleError(e);
        }
    }
}
