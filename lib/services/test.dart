class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Define a variable to track the current theme
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add a Switch widget to toggle between the light and dark themes
            Switch(
              value: _isDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  // Update the theme and trigger a rebuild of the app with the new theme
                  _isDarkTheme = value;
                  if (_isDarkTheme) {
                    Theme.of(context).brightness = Brightness.dark;
                  } else {
                    Theme.of(context).brightness = Brightness.light;
                  }
                });
              },
            ),
            // Add other widgets here...
          ],
        ),
      ),
    );
  }
}
