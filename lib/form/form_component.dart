import 'dart:async';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'form.dart';
import 'form_service.dart';
import 'package:angular2_test_task/bind/bind_service.dart';
import 'package:angular2_test_task/exception/exception_service.dart';
import 'package:angular2_test_task/local_storage/localstorage_component.dart';

/*
 * Form component: start point
 */
@Component(
    selector: 'form-component',
    templateUrl: 'form_component.html',
    directives: const [
        ROUTER_DIRECTIVES,
        LocalStorageComponent
    ]
)

class FormComponent implements OnInit {
    @Input()
    Form form;

    @Input()
    bool isShown = false;

    final RouteParams _routeParams;
    final BindService _bindService;
    final FormService _formService;
    final ExceptionService _exceptionService;

    FormComponent(this._routeParams, this._bindService,
        this._formService, this._exceptionService);

    Future<Null> ngOnInit() async {
        try {
            var formName = _routeParams.get('formName');

            if (formName != '') {
                form = await _bindService.bindFunction(formName);
            }
        } catch (e) {
            throw _exceptionService.handleError(e);
        }
    }

    Future<Null> save() async {
        await _formService.save(form);
    }
}
