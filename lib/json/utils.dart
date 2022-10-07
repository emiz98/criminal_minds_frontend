import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

const baseURL = 'http://192.168.1.32:8000/';
const apiURL = 'http://192.168.1.32:8000/api/';
// const baseURL = 'https://criminalminds.herokuapp.com/';
// const apiURL = 'https://criminalminds.herokuapp.com/api/';

const getInvestigations = apiURL + 'get_investigations';
const postInvestigation = apiURL + 'create_investigation';
const deleteInvestigation = apiURL + 'delete_investigation/';

const getInvestigationData = apiURL + 'get_investigation_data/';
const getInvestigationDataAdditional = apiURL + 'get_investigation_additional/';

const authenticateUser = baseURL + "api-token-auth/";

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
