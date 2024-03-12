import 'package:bhagavad_gita/ui/pages/verses/chapterwise_verse.dart';
import 'package:flutter/material.dart';
import '../../../../models/chapter_model.dart';
import '../../../../utils/colors.dart';

class ChaptersList extends StatelessWidget {
  final List<ChapterModel> chapters;
  const ChaptersList({super.key, required this.chapters});

  @override
  Widget build(BuildContext context) {
    var textStyle =
        const TextStyle(color: Color(0xff627485), fontWeight: FontWeight.w500);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            "Chapters",
            style: TextStyle(
                color: Color(0xff627485),
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20.0),
        Expanded(
          child: ListView.builder(
            itemCount: chapters.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ChapterWiseVersePage(
                        chapter: chapters[index].chapterNumber)));
              },
              leading: Container(
                height: 23.0,
                width: 23.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.primary,
                ),
                child: Text(
                  "${chapters[index].id}",
                  style: const TextStyle(color: Colors.white, fontSize: 14.0),
                  textAlign: TextAlign.center,
                ),
              ),
              title: Text(chapters[index].nameTranslated, style: textStyle),
              subtitle: Row(
                children: [
                  const Icon(
                    Icons.list,
                    color: Color(0xff627485),
                  ),
                  Text(
                    "${chapters[index].versesCount} verses",
                    style: textStyle,
                  )
                ],
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
