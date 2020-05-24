import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class Scan extends StatefulWidget {
  const Scan({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  var qrText = '';
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Scanning QR...'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // bool _isFlashOn(String current) {
  //   return flashOn == current;
  // }

  // bool _isBackCamera(String current) {
  //   return backCamera == current;
  // }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
        print('qrText = $qrText');
        Navigator.pop(context, qrText);
        
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
 


}