import 'package:angular2/core.dart';

/*
 * Exception Service
 */
@Injectable()
class ExceptionService {
    Exception handleError(dynamic e) {
        return new Exception('Server error; cause: $e');
    }
}
