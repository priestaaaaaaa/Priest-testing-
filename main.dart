import 'package:flutter/material.dart';

void main() {
  runApp(HocoApp());
}

class HocoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hoco EW74 Control',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.tealAccent,
          secondary: Colors.teal,
        ),
        textTheme: TextTheme(
          headline4: TextStyle(fontWeight: FontWeight.bold, color: Colors.tealAccent),
          bodyText2: TextStyle(color: Colors.white70),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.headphones, size: 100, color: Colors.tealAccent),
            SizedBox(height: 20),
            Text('Welcome to Hoco EW74 Control',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardScreen()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: Text('Connect & Start'),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Device Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Battery: 95%'),
            SizedBox(height: 10),
            Text('Connected: Hoco EW74'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ControlCenterScreen()));
              },
              child: Text('Control Center'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsScreen()));
              },
              child: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class ControlCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Control Center')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Touch Gestures', style: Theme.of(context).textTheme.headline6),
            ListTile(
              title: Text('Single Tap: Play/Pause'),
              trailing: Icon(Icons.touch_app),
            ),
            ListTile(
              title: Text('Double Tap: Next Track'),
              trailing: Icon(Icons.double_arrow),
            ),
            SizedBox(height: 20),
            Text('EQ Presets', style: Theme.of(context).textTheme.headline6),
            Wrap(
              spacing: 10,
              children: [
                Chip(label: Text('Bass Boost')),
                Chip(label: Text('Treble Boost')),
                Chip(label: Text('Balanced')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Enable Low Latency Mode'),
              value: true,
              onChanged: (val) {},
            ),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: true,
              onChanged: (val) {},
            ),
            ListTile(
              title: Text('Assistant Voice: Phantom'),
              trailing: Icon(Icons.mic),
            ),
          ],
        ),
      ),
    );
  }
}
