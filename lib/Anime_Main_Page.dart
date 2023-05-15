import 'package:flutter/material.dart';
import 'package:final_project_tpm/API/api_source.dart';
import 'package:final_project_tpm/Model/anime_list_model.dart';


class AnimePage extends StatelessWidget {
  const AnimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime List'),
      ),
        body: _buildListAnime(),
    );
  }

  Widget _buildListAnime(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadAnime(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasError){
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            AnimeList ListAnimeModel = AnimeList.fromJson(snapshot.data);
            return _buildSuccessSection(ListAnimeModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection(){
    return Container(
      child: Text('Data Gagal Didapatkan'),
    );
  }

  Widget _buildSuccessSection(AnimeList data){
    return ListView.builder(
        itemCount : data.data!.length,
        itemBuilder: (BuildContext context, int index){
          return _buildItemAnime(data.data![index]);
        }
    );
  }

  Widget _buildLoadingSection(){
    return CircularProgressIndicator();
  }

  Widget _buildItemAnime(Data AnimeData){
    return InkWell(
        onTap: (){
        },
        child: Card(
          child: Row(
            children: [
              Container(
                width: 100,
                child: Image.network(AnimeData.images!.toString()),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AnimeData.titles!.toString()),
                  Text(AnimeData.rating.toString()),
                ],
              )
            ],
          ),
        )
    );
  }

}
