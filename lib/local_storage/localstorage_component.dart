import 'dart:async';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'localstorage_service.dart';

@Component(
    selector: 'localstorage-component',
    templateUrl: 'localstorage_component.html',
    directives: const [ROUTER_DIRECTIVES]
)

/*
 * LocalStorageComponent
 */
class LocalStorageComponent implements OnInit {
    @Input()
    dynamic localStorage;

    @Input()
    String msg;

    static final String MSG_SUCCESS_CLEAN = 'localStorage was cleaned';

    final LocalStorageService _localStorageService;
    final RouteParams _routeParams;

    LocalStorageComponent(this._localStorageService, this._routeParams);

    Future<Null> ngOnInit() async {
        localStorage = await _localStorageService.getLocalStorage(_routeParams.get('formName'));
    }

    Future<Null> clearStoredData() async {
        msg = MSG_SUCCESS_CLEAN;

        return _localStorageService.clear();
    }
}
