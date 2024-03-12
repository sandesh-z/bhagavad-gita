import 'package:bhagavad_gita/features/models/verse_model.dart';
import 'package:bhagavad_gita/features/ui/pages/home/home.dart';
import 'package:bhagavad_gita/features/utils/colors.dart';
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
        actions: [
          Row(
            children: [
              const Icon(Icons.bookmark_outline),
              const SizedBox(width: 10.0),
              const Text("Aa"),
              const SizedBox(width: 10.0),
              InkWell(
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const HomePage()),
                      (route) => false),
                  child: const Icon(Icons.menu)),
              const SizedBox(width: 20.0)
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
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Text(
              verseDetail.text ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(color: Palette.primary),
            ),
            const SizedBox(height: 10.0),
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
        Text(
          isCommentary ? "Commentary" : "Translation",
          style: TextStyle(
              color: Palette.headingcolor,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10.0),
        Text(
          description.trim(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            Text(
              authorName,
              style: TextStyle(color: Palette.authorColor),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
