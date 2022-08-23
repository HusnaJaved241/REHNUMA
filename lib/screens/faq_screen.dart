import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:rehnuma/constants.dart';

class FAQScreen extends StatelessWidget {
  Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  StreamController<String> _pageCountController = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PDF(
        //   swipeHorizontal: true,
        //   enableSwipe: true,
        //   pageFling: true,
        //   fitEachPage: true,
          fitPolicy: FitPolicy.WIDTH,

          onPageChanged: (int? current, int? total) =>
              _pageCountController.add('${current! + 1} - $total'),
          onViewCreated: (PDFViewController pdfViewController) async {
            _pdfViewController.complete(pdfViewController);
            final int currentPage =
                await pdfViewController.getCurrentPage() ?? 0;
            final int? pageCount = await pdfViewController.getPageCount();
            _pageCountController.add('${currentPage + 1} - $pageCount');
          },
        ).fromAsset(
          'assets/FAQ.pdf',
          errorWidget: (dynamic error) => Center(
            child: Text(
              error.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
