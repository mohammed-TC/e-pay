import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

import '../../../core/extensions/build_context_l10n.dart';

/// Screen E5 — "View PDF" mock bill viewer.
///
/// Every fetched bill renders the same placeholder PDF asset
/// (`assets/mock/sample_bill.pdf`) — this is an offline prototype, not a
/// real billing PDF pipeline. Pushed as a full page rather than a route
/// (it isn't its own product.md screen ID, just an E5 affordance).
class PdfViewerSheet extends StatefulWidget {
  const PdfViewerSheet({super.key});

  @override
  State<PdfViewerSheet> createState() => _PdfViewerSheetState();
}

class _PdfViewerSheetState extends State<PdfViewerSheet> {
  late final PdfController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PdfController(
      document: PdfDocument.openAsset('assets/mock/sample_bill.pdf'),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.billDetailViewPdfCta)),
      body: PdfView(controller: _controller),
    );
  }
}
