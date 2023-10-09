import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract class AuthController {
  Future<void> signInWithGoogle();
}

class GoogleAuthController extends AuthController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<bool> signInWithGoogle() async {
   String url = dotenv.env['GOOGLE_REDIRECT_URI']!;
      print(url);
      //click on google sign in. Get accessToken from google through googlesignin
      //plugin.
      //Send accessToken to socialite in backend to request/create user data

      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount == null) {
        print('Google Signin ERROR! googleAccount: null!');
        //return null;
      }
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      //this is user access token from google that is retrieved with the plugin
      String? accessToken = googleSignInAuthentication.accessToken;
      print("User Access Token: $accessToken");

      //make http request to the laravel backend
      final response = await http.get(Uri.parse(url),
          //body: json.encode({"token": accessToken}),
          headers: {
            "Content-Type": "application/json"
          });
      if (response.statusCode == 200) {
        return true;
      }

      return false;


  }
}
