import 'package:angular2/core.dart';

/**
* Service for util functions
*/
@Injectable()
class UtilService {
    /**
    *  Method for recursion walk of stored json data file
    */
    recursionJSONWalk(object, txt, dataObject) {
        object.forEach((key, value) {
            if (object[key] is String == false) {
                recursionJSONWalk(object[key], (txt == '' ? txt + '': txt + '.') + key, dataObject);
            } else {
                dataObject[(txt == '' ? txt + '': txt + '.') + key] = object[key];
            }
        });

        return dataObject;
    }
}
