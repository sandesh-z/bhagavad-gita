import 'package:bhagavad_gita/models/verse_model.dart';
import 'package:flutter/material.dart';

class VerseDetailPage extends StatelessWidget {
  final VerseModel verseDetail;
  const VerseDetailPage({
    super.key,
    required this.verseDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Row(
            children: [
              Icon(Icons.bookmark_outline),
              SizedBox(width: 10.0),
              Text("Aa"),
              SizedBox(width: 10.0),
              Icon(Icons.menu),
              SizedBox(width: 20.0)
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${verseDetail.chapterNumber}.${verseDetail.verseNumber}",
              style: const TextStyle(
                  color: Color(0xff627485),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Text(
              verseDetail.text ?? "",
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: verseDetail.translations.length +
                    verseDetail.commentaries.length,
                itemBuilder: (context, index) {
                  int n = verseDetail.translations.length;
                  if (index > n - 1) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: _Translation(
                          isCommentary: true,
                          description:
                              verseDetail.commentaries[index - n].description ??
                                  "",
                          authorName:
                              verseDetail.commentaries[index - n].authorName ??
                                  ""),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: _Translation(
                        description:
                            verseDetail.translations[index].description ?? "",
                        authorName:
                            verseDetail.translations[index].authorName ?? ""),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Translation extends StatelessWidget {
  final bool isCommentary;
  final String description, authorName;
  const _Translation(
      {required this.description,
      required this.authorName,
      this.isCommentary = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(isCommentary ? "Commentary" : "Translation"),
        Text(description),
        const SizedBox(height: 5.0),
        Row(
          children: [
            Text(
              authorName,
              textAlign: TextAlign.left,
            ),
          ],
        )
      ],
    );
  }
}
