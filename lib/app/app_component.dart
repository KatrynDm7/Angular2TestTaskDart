import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2_test_task/data/data_service.dart';
import 'package:angular2_test_task/form/form_service.dart';
import 'package:angular2_test_task/form/form_component.dart';
import 'package:angular2_test_task/bind/bind_service.dart';
import 'package:angular2_test_task/util/util_service.dart';
import 'package:angular2_test_task/exception/exception_service.dart';
import 'package:angular2_test_task/emulate_response/emulate_response_service.dart';
import 'package:angular2_test_task/local_storage/localstorage_service.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    styleUrls: const ['app_component.css'],
    directives: const [
        ROUTER_DIRECTIVES
    ],
    providers: const [
        EmulateResponseService,
        FormService,
        BindService,
        DataService,
        UtilService,
        ExceptionService,
        LocalStorageService,
        ROUTER_PROVIDERS
    ]
)

@RouteConfig(const [
    const Route(path: '/:formName', name: 'Form', component: FormComponent)
])

class AppComponent {

}
