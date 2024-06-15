import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> openScanQrSheet(BuildContext context){
  return showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      isScrollControlled: true,
      context: context, builder: (context){
    return Theme(
        data: ThemeData(
            fontFamily: 'OpenSans'
        ),
        child: const _ScanBranch());
  });
}

class _ScanBranch extends StatefulWidget {
  const _ScanBranch({Key? key}) : super(key: key);

  @override
  State<_ScanBranch> createState() => _ScanBranchState();
}

class _ScanBranchState extends State<_ScanBranch> {
  QRViewController? _controller;
  bool _canScan = true;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller!.pauseCamera();
    } else if (Platform.isIOS) {
      _controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if(!_canScan){
        return;
      }
      _canScan = false;
      String? code = scanData.code;
      if(code == null){
        return;
      }
      Future.delayed(const Duration(seconds: 2), (){
        if(!mounted){
          return;
        }
        setState(() {
          _canScan = true;
        });});

      if(code.startsWith("http://flashcards-5984c.web.app/collection_share")){
        Navigator.of(context).pop();
        final link = code.replaceAll("http://flashcards-5984c.web.app", "");
        context.go(link);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.85,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 5,),
              Center(
                child: Container(
                  height: 5,
                  width: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFF787878),
                  ),
                ),
              ),
              SizedBox(height: 70,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 14, top: 17),
                        child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 24,
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                          padding: EdgeInsets.only(top: 17),
                          child: Text(AppLocalizations.of(context)!.scan_qr, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Text(AppLocalizations.of(context)!.scan_qr_gain_score, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
              ),
              const SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: QRView(
                  key: _qrKey,
                  overlay: QrScannerOverlayShape(
                      borderLength: 30
                  ),
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
