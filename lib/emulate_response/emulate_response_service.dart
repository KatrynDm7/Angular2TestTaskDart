import 'dart:async';
import 'dart:convert';
import 'package:angular2/core.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

/*
 * Service for emulate of post responce (in case without server side)
 */
@Injectable()
class EmulateResponseService extends MockClient {
      static Future<Response> _handler(Request request) async {
        var data;

        switch (request.method) {
            case 'POST':
                if (request.body != null)
                    data = JSON.decode(request.body);
                    break;
          }

          return new Response(JSON.encode({'data' : data}), 200,
              headers: {'content-type': 'application/json'});
        }

        EmulateResponseService() : super(_handler);
}
