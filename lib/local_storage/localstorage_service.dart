import 'dart:async';
import 'package:angular2/core.dart';
import 'dart:html';

/**
 * localStorage service
 */

@Injectable()
class LocalStorageService {
    Future<Null>save(key, value) async {
        window.localStorage[key] = value;
    }

    clear() {
        window.localStorage.clear();
    }

    getLocalStorage(name) {
        var storage;

        if (window.localStorage[name] != null) {
            storage = window.localStorage[name];
        }

        return storage;
    }
}
