import 'package:flutter/material.dart';
import 'package:love_cate/core/model/movie_model.dart';
import 'package:love_cate/core/services/dou_ban_request.dart';
import 'dou_ban_movie_item.dart';

class YSDouBanContent extends StatefulWidget {
  @override
  _YSDouBanContentState createState() => _YSDouBanContentState();
}

class _YSDouBanContentState extends State<YSDouBanContent> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('豆瓣初始化');
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: YSDouBanRequest.requestMovieList(0),
      builder: (ctx, snapshot) {
        if(snapshot.hasError) return Center(child: Text('请求失败'),);
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);

        final List<MovieItem> movies = snapshot.data;
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (ctx, index) {
            return YSDouBanMovieItem(movies[index]);
          }
        );
      },
    );
  }
}
