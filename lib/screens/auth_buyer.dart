import 'package:flutter/material.dart';
import 'package:grocery_app/screens/dashboard/dashboard_screen.dart';

// Main entry point of the application
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kissan setu',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AuthScreen(),
    );
  }
}

// A simple user data model
class User {
  String username;
  String password;

  User(this.username, this.password);
}

// A class to manage user data
class UserManager {
  static List<User> users = [];
}

// The authentication screen with SignUp and Login options
class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}
class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add a form key
  bool _isLogin = true;

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) { // Validate inputs
      final username = _usernameController.text;
      final password = _passwordController.text;
      if (username.isNotEmpty && password.isNotEmpty) {
        UserManager.users.add(User(username, password));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User registered successfully!')),
        );
        _toggleForm();
      }
    }
  }
  void _login() {
    if (_formKey.currentState!.validate()) { // Validate inputs
      final username = _usernameController.text;
      final password = _passwordController.text;

      User? user;
      try {
        user = UserManager.users.firstWhere(
              (user) => user.username == username && user.password == password,
        );
      } catch (e) {
        user = null; // Set user to null if no match found
      }

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }
  /*
  void _login() {
    if (_formKey.currentState!.validate()) { // Validate inputs
      final username = _usernameController.text;
      final password = _passwordController.text;
      final User? user = UserManager.users.firstWhere(
            (user) => user.username == username && user.password == password,
        orElse: () => null,
      );

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }

   */
/*
  void _login() {
    if (_formKey.currentState!.validate()) { // Validate inputs
      final username = _usernameController.text;
      final password = _passwordController.text;
      final user = UserManager.users.firstWhere(
            (user) => user.username == username && user.password == password,
        orElse: () => null,
      );

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }

 */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isLogin ? 'Login' : 'Sign Up',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form( // Wrap in Form widget
          key: _formKey, // Assign form key
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username cannot be empty";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password cannot be empty";
                  } else if (value.length < 6) {
                    return "Password length should be at least 6 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLogin ? _login : _signUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  _isLogin ? 'Login' : 'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: _toggleForm,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text(
                  _isLogin ? 'Sign Up' : 'Already have an account? Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLogin = true;

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _signUp() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      UserManager.users.add(User(username, password));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully!')),
      );
      _toggleForm();
    }
  }

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final user = UserManager.users.firstWhere(
          (user) => user.username == username && user.password == password,
      orElse: (null),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Sign Up',
        style: TextStyle(
          fontWeight: FontWeight.w400,
            color:Colors.black
        ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
             validator : (value) {
              if (value == null || value.isEmpty) {
                return "Username cannot be empty";
              }
              return null;
            },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password cannot be empty";
                } else if (value.length < 6) {
                  return "Password length should be at least 6 characters";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLogin ? _login : _signUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(_isLogin ? 'Login' : 'Sign Up',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color:Colors.black
                ),),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: _toggleForm,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text(_isLogin
                  ? 'Sign Up'
                  : 'Already have an account? Login',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color:Colors.black
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Home page to navigate after a successful login
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          child: Image.asset(''),
        ),
      ),
    );
  }
}

 */