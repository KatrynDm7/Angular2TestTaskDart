import 'dart:async';
import 'package:angular2/core.dart';
import 'package:angular2_test_task/form/form.dart';
import 'package:angular2_test_task/form/form_service.dart';
import 'dart:convert';
import 'package:angular2_test_task/data/data_service.dart';
import 'package:angular2_test_task/util/util_service.dart';
import 'package:angular2_test_task/exception/exception_service.dart';
import 'package:angular2_test_task/local_storage/localstorage_service.dart';
import 'dart:html';

/*
 *  Bind Service:
 *      if (localStorage is empty) bind data from json
 *          else from localStorage
 */

@Injectable()
class BindService {
    final DataService _dataService;
    final FormService _formService;
    final LocalStorageService _localStorageService;
    final UtilService _utilService;
    final ExceptionService _exceptionService;

    BindService(this._dataService, this._formService, this._localStorageService,
        this._utilService, this._exceptionService);

    Future<Null> formBind(data, form) async {
        var dataObject = {};
        var resource = _utilService.recursionJSONWalk(data[form.formName], '', dataObject);

        if (form != null && form.fields != null) {
            form.fields.forEach((item) {
                item["fieldValue"] = resource["" + item["fieldValue"]];
            });
        }
    }

    Future<Null> localStorageBind(data, form) async {
        final name = form.formName;
        final fields = form.fields;

        if (name != null && fields != null) {
            for (var i = 0; i < fields.length; i++) {
                fields[i]['fieldValue'] = data['fields'][i]['fieldValue'];
            }
        }
    }

    Future<Form> bindFunction(formName) async {
        try {
            Form form = await _formService.getForm(formName);
            var data = await _dataService.getData(formName);
            var localStorage = await _localStorageService.getLocalStorage(formName);

            if (localStorage == null && data != '') {
                // localStorage is empty
                formBind(data, form);
            }
            else {
                // localStorage is not empty
                localStorageBind(JSON.decode(localStorage), form);
            }
            return form;
        } catch (e) {
            throw _exceptionService.handleError(e);
        }
    }
}
