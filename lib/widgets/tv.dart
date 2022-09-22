// @dart=2.9
import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({
    Key key,
    this.tv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Popular TV Shows', color: Colors.white, size: 26),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: tv.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          tv[index]['poster_path']))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: ModifiedText(
                              text: tv[index]['original_name'] != null
                                  ? tv[index]['original_name']
                                  : 'loading..',
                              color: Colors.white,
                              size: 12),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
