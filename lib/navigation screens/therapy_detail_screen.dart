import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'package:rehnuma/models/therapy_model.dart';
import 'package:rehnuma/navigation%20screens/therapy_screen.dart';

import '../constants.dart';

class TherapyDetailScreen extends StatefulWidget {
  TherapyDetailScreen({Key? key, required this.index}) : super(key: key);
  // String pdfAssetPath = "assets/therapies.pdf";
  Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  StreamController<String> _pageCountController = StreamController<String>();
  final int index;
  // final controller = PdfViewerController();

  @override
  State<TherapyDetailScreen> createState() => _TherapyDetailScreenState();
}

class _TherapyDetailScreenState extends State<TherapyDetailScreen> {
  List therpy = therapiesList;

  // @override
  // void dispose() {
  //   widget.controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 27.0,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TherapyScreen(),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  therpy[widget.index].name,
                  style: kQuestionTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .58,
                  width: MediaQuery.of(context).size.width,
                  child: PDF(

                    // enableSwipe: true,
                    // swipeHorizontal: true,
                    // autoSpacing: true,
                    pageFling: false,
                    fitEachPage: true,
                    onPageChanged: (int? current, int? total) => widget
                        ._pageCountController
                        .add('${current! + 1} - $total'),
                    onViewCreated: (PDFViewController pdfViewController) async {
                      widget._pdfViewController.complete(pdfViewController);
                      final int currentPage =
                          await pdfViewController.getCurrentPage() ?? 0;
                      final int? pageCount =
                          await pdfViewController.getPageCount();
                      widget._pageCountController
                          .add('${currentPage + 1} - $pageCount');
                    },
                  ).fromAsset(
                    therpy[widget.index].pdfPath,
                    errorWidget: (dynamic error) =>
                        Center(child: Text(error.toString())),
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * .8,
                //   child: PdfViewer.openAsset(
                //     'assets/therapies.pdf',
                //     viewerController: widget.controller,
                //     onError: (err) => print(err),
                //     params: const PdfViewerParams(
                //       padding: 2,
                //       minScale: 1.0,

                //       // scrollDirection: Axis.horizontal,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
