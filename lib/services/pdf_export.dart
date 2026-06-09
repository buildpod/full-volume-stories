import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../domain/models.dart';

pw.Document buildStoryPdf(Story story) {
  final doc = pw.Document();
  for (final page in story.pages) {
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Container(
              width: double.infinity,
              height: 200,
              decoration: const pw.BoxDecoration(color: PdfColors.grey200),
              child: pw.Center(
                child: pw.Text(
                  '[Illustration pending review]',
                  style: pw.TextStyle(color: PdfColors.grey600, fontSize: 14),
                ),
              ),
            ),
            pw.SizedBox(height: 24),
            pw.Text(
              page.text,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
  return doc;
}

Future<void> exportStoryToPdf(Story story) async {
  final doc = buildStoryPdf(story);
  await Printing.sharePdf(
    bytes: await doc.save(),
    filename: '${story.id}.pdf',
  );
}
