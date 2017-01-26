import 'field_descriptor.dart';

/*
 * DTO Form
 */
class Form {
    String formName;
    List<FieldDescriptor> fields;

    Form(this.formName, this.fields);

    factory Form.fromJson(Map<String, dynamic> form) =>
        new Form(form['formName'], form['fields']);

    Map toJson() => {'formName': formName, 'fields': fields};
}
