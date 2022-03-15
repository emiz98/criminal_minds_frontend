import 'package:flutter/cupertino.dart';
import 'package:flutter_police_app/json/colors_json.dart';

class SearchResult extends StatefulWidget {
  final int count;
  final String number;
  const SearchResult({Key? key, required this.count, required this.number})
      : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: black.withOpacity(0.07),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: secondary_shade)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              child: Text(
                widget.count.toString(),
                style: TextStyle(
                    color: primary, fontSize: 15, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: primary, width: 2),
                  color: white,
                  shape: BoxShape.circle),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              widget.number,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
