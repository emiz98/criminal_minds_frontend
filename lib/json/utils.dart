import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

const BASE_URL = 'http://192.168.1.32:8000/';
const API_URL = 'http://192.168.1.32:8000/api/';
// const BASE_URL = 'https://criminalminds.herokuapp.com/';
// const API_URL = 'https://criminalminds.herokuapp.com/api/';

const getInvestigations = API_URL + 'get_investigations';
const postInvestigation = API_URL + 'create_investigation';
const deleteInvestigation = API_URL + 'delete_investigation/';

const getInvestigationData = API_URL + 'get_investigation_data/';
const getInvestigationDataAdditional =
    API_URL + 'get_investigation_additional/';

const authenticateUser = BASE_URL + "api-token-auth/";

Future<bool> onBackPrevent() async {
  DateTime timeBackPressed = DateTime.now();
  final difference = DateTime.now().difference(timeBackPressed);
  final isExitWarning = difference >= Duration(seconds: 2);
  timeBackPressed = DateTime.now();
  Fluttertoast.showToast(msg: "Back button is disabled", fontSize: 13);
  if (isExitWarning) {
    return false;
  } else {
    Fluttertoast.cancel();
    return false;
  }
}

final storage = FlutterSecureStorage();
getToken() async {
  String _token = (await storage.read(key: 'jwt'))!;
  return _token;
}

deleteToken() async {
  try {
    await storage.delete(key: 'jwt');
    return true;
  } catch (e) {
    return e;
  }
}
