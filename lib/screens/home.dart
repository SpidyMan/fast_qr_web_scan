import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fast_qr_web_scan/screens/scan.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    String result = ''; 

  //Method //
  @override
  void initState() {
    super.initState();  

  }
 
 
  @override
  void dispose() { 
    super.dispose();
  }
 
  // Widget settingButton() {
  //   return RaisedButton(
  //     color: Colors.blue.shade700,
  //     child: Text(
  //       'Setting',
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     onPressed: () {
  //       print('you click setting button');
  //       MaterialPageRoute materialPageRoute =
  //           MaterialPageRoute(builder: (BuildContext context) => Setting());
  //       Navigator.of(context).push(materialPageRoute);
  //     },
  //   );
  // }
  


  _launchURL(String url) async {
    // const url ='https://www.google.com';
    print(url);
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget webButton() {
    return Column(
      children: <Widget>[
        RaisedButton(
          color: Colors.blue.shade700,
          child: Text(
            'OPEN GOOGLEx',
            style: TextStyle(color: Colors.white),
          ), 
           
          onPressed: () async {
           _launchURL('https://www.google.com');
          },
        ),
      ],
    );
  }

  Widget scanButton2() {
    return Column(
      children: <Widget>[
        RaisedButton(
          color: Colors.blue.shade700,
          child: Text(
            'Scan QR',
            style: TextStyle(color: Colors.white),
          ), 
           
          onPressed: () async {
                         String results = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scan(),
                ),
              );
              if (results != null && results !="") {
                setState(() {
                  result = results; 
                });
                String url = '$result';
                print('opening... $url');
                _launchURL(url);
              }
          },
        ),
      ],
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer:Drawer(
      child: ListView(children: <Widget>[
        ListTile(
          
          onTap: (){
                  showAboutDialog(
                    context: context,
                    //applicationIcon:  Container(width: 100.0, height: 100.0, child: Image.asset('images/logo.png')),
                    applicationLegalese: 'Developed by by iTum Studio',
                );
                
                },
                title: Text('Show about Page')
              ),
      ],)
      ),
      
        
      
      
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, Colors.blue.shade300],
              radius: 1,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                
                scanButton2(),
                //showButton(),
                SizedBox(height: 30.0),  
                webButton(),
                Text('Hello world')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
