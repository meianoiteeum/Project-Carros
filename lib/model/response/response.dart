class Response {
  String status;
  Errors errors;

  Response({this.status, this.errors});

  Response.fromJson(Map<String, dynamic> map) {
    status = map['status'];
    errors =
        map['errors'] != null ? new Errors.fromJson(map['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.errors != null) {
      data['errors'] = this.errors.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Response{status: $status, errors: $errors}';
  }
}

class Errors {
  var timestamp;
  String message;
  String details;

  Errors({this.timestamp, this.message, this.details});

  Errors.fromJson(Map<String, dynamic> map) {
    var date = map['timestamp'];
    timestamp = new DateTime.fromMicrosecondsSinceEpoch(date * 1000);
    message = map['message'];
    details = map['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['message'] = this.message;
    data['details'] = this.details;
    return data;
  }



  @override
  String toString() {
    return 'Errors{timestamp: $timestamp, message: $message, details: $details}';
  }

}
