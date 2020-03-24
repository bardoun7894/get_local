
import 'package:flutter/material.dart';
import 'package:get_local/api/authentication.dart';
import 'package:get_local/model/user.dart';
import 'package:get_local/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
	LoginScreen({Key key}) : super(key: key);

	@override
	_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
	TextEditingController _usernameController = TextEditingController();
	TextEditingController _passwordController = TextEditingController();
	Authentication authentication = Authentication();
	var _formKey = GlobalKey<FormState>();
	bool _loading = false;

	@override
	void dispose() {
		_usernameController.dispose();
		_passwordController.dispose();
		// TODO: implement dispose
		super.dispose();
	}
	@override
	Widget build(BuildContext context) {
		return Scaffold(
				body: SingleChildScrollView(
					child: Padding(
						padding: EdgeInsets.only(top: 100),
					  child: Column(
					  		mainAxisAlignment: MainAxisAlignment.center,
					  		crossAxisAlignment: CrossAxisAlignment.start,
					  		children: <Widget>[
					  			Column(
					  				crossAxisAlignment: CrossAxisAlignment.start,
					  				children: <Widget>[
					  					Center(
					  						child: Text(
					  							"SignIn",
					  							style: TextStyle(color: Colors.blue, fontSize: 40),
					  						),
					  					),
					  					SizedBox(
					  						height: 60,
					  					),
					  					Center(
					  							child: Text(
					  								"Login to continue to your account",
					  								style: TextStyle(color: Colors.grey, fontSize: 16),
					  							)),
					  				],
					  			),
					  			Padding(
					  				padding:
					  				const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
					  				child: _loginForm(context),
					  			),
					  			Center(
					  				child: Container(
					  					width: MediaQuery.of(context).size.width * 0.85,
					  					height: MediaQuery.of(context).size.height * 0.07,
					  					child: RaisedButton(
					  						color: Color(0xFF618BE1),
					  						shape: RoundedRectangleBorder(
					  							borderRadius: BorderRadius.circular(20),
					  						),
					  						child: Center(
					  							child: (_loading)
					  									? CircularProgressIndicator(
					  								backgroundColor: Colors.white,
					  							)
					  									: Text(
					  								"Login",
					  								style: TextStyle(
					  										color: Colors.white,
					  										fontWeight: FontWeight.bold,
					  										fontSize: 20),
					  							),
					  						),
					  						onPressed:(_loading)? null: _loginUser,
					  					),
					  				),
					  			),
					  			Row(
					  				mainAxisAlignment: MainAxisAlignment.center,
					  				children: <Widget>[
					  					Text(
					  						"Don\'t have an account? ",
					  						style: TextStyle(fontWeight: FontWeight.bold),
					  					),
					  					FlatButton(
					  						child: Text(
					  							"Sign Up",
					  							style: TextStyle(color: Colors.blue[400]),
					  						),
					  						onPressed: () {
					  							//TODO:send them to sign up screen
					  						},
					  					)
					  				],
					  			),
					  		]),
					),
				));
	}

	Widget _loginForm(BuildContext context) {
		return Form(
			key: _formKey,
			child: Column(
				children: <Widget>[
					TextFormField(
						controller: _usernameController,
						decoration: InputDecoration(
							hintText: 'Username',

							hintStyle: TextStyle(fontSize: 20),
						),
						style: TextStyle(fontSize: 24),
						validator: (value) {
							if (value.isEmpty) {
								return 'Username is required';
							}
						},
					),
					SizedBox( 	height: 30,),
					TextFormField(
						controller: _passwordController,
						obscureText: true,
						decoration: InputDecoration(
								hintStyle: TextStyle(fontSize: 20), hintText: 'Password'),
						validator: (value) {
							if (value.isEmpty) {
								return 'Password is required'; }
						},
					),
					SizedBox(
						height: 30,
					),
				],
			),
		);
	}

	void _loginUser() async {
		if (_formKey.currentState.validate()) {
			setState(() {
				_loading = true;
			});
			String username = _usernameController.text.trim();
			String password = _passwordController.text.trim();
			print(username);
			print(password);

 	 await authentication.login(username,password);
 		print("88888888888");
        //todo authetication
 		print("88888888888");

	 Navigator.push(
			 context, MaterialPageRoute(builder: (context) => RegisterScreen()));

			} else {}
			_loading = true;
		}

	}
