import 'package:bhagavad_gita/core/shared_preferences/shared_pref_util.dart';
import 'package:bhagavad_gita/models/verse_model.dart';
import 'package:bhagavad_gita/ui/pages/verses/verse_detail.dart';
import 'package:bhagavad_gita/utils/utils.dart';
import 'package:flutter/material.dart';

class LastRead extends StatefulWidget {
  final VerseModel verse;
  const LastRead({super.key, required this.verse});

  @override
  State<LastRead> createState() => _LastReadState();
}

class _LastReadState extends State<LastRead> {
  LastReadModel? lastReadModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Last read",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xff627485),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "VERSE ${widget.verse.chapterNumber}.${widget.verse.verseNumber}",
                style: const TextStyle(
                  color: Color(0xff627485),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            truncateWithEllipsis(
                widget.verse.translations
                        .firstWhere((e) => e.language == 'english')
                        .description ??
                    "",
                25),
          ),
          const SizedBox(
            height: 10.0,
          ),
          InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => VerseDetailPage(verseDetail: widget.verse))),
              child: const Text(
                "CONTINUE READING",
                style: TextStyle(color: Color(0xffF9902D)),
              )),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
