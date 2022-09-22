import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/top_rated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topRatedMovie = [];
  List tvShows = [];
  final String apiKey = 'bf4bfe5438379c83a03ef18377fcf581';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZjRiZmU1NDM4Mzc5YzgzYTAzZWYxODM3N2ZjZjU4MSIsInN1YiI6IjYyNDJlZWEyZGZlMzFkMDA0NzVhNGMxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gOIK4pP3Tu5Zt7_YDzA2R-CDLd2W95IMpho7juAuAxg';

  fetchData() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovie = topratedresult['results'];
      tvShows = tvresult['results'];
    });
    print(trendingMovies);
    print(topRatedMovie);
    print(tvShows);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
            ModifiedText(text: 'The Movie App', color: Colors.white, size: 20),
      ),
      body: ListView(
        children: [
          TrendingMovies(
            trending: trendingMovies,
          ),
          TopRated(
            toprated: topRatedMovie,
          ),
          TV(
            tv: tvShows,
          )
        ],
      ),
    );
  }
}
