import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

const BASE_URL = 'https://criminalminds.herokuapp.com/';
const API_URL = 'https://criminalminds.herokuapp.com/api/';

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

getToken() async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  return token;
}
