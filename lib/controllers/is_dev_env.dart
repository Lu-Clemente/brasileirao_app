import 'package:flutter_dotenv/flutter_dotenv.dart';

bool isDevEnv() {
  return dotenv.env['ENVIRONMENT'] == 'dev';
}
