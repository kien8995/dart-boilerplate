class Const {
  static const Map<String, String> CONTENT_TYPE_JSON = <String, String>{
    'content-type': 'application/json'
  };

  static const Map<String, int> HTTP_STATUS = <String, int>{
    'OK': 200,
    'BadRequest': 400,
    'Unauthorized': 401,
    'Forbidden': 403,
    'NotFound': 404,
    'ServerError': 500,
    'BadGateway': 502,
    'Timeout': 504
  };

  static const String FORMAT_DATE_BD = 'yyyy-MM-dd';
  static const String FORMAT_DATE_TIME_BD = 'yyyy-MM-dd hh:mm:ss';
  static const String FORMATO_DATE = 'dd/MM/yyyy';
  static const String FORMAT_DATE_TIME = 'dd/MM/yyyy hh:mm:ss';
  static const String SPLIT_FILE_CVS = '|';
  static const String ENTER = '\n';

  static final DateTime DATETIME_INVALIDATE = DateTime(1980);
}
