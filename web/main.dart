import 'package:angular2/core.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular2_test_task/app/app_component.dart';
import 'package:http/http.dart';
import 'package:http/browser_client.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

void main() {
    bootstrap(AppComponent,[
        provide(Client, useFactory: () => new BrowserClient(), deps: [])
    ]);
}
