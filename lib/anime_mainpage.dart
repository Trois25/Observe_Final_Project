import 'package:flutter/material.dart';
import 'package:final_project_tpm/API/api_source.dart';
import 'package:final_project_tpm/Model/anime_list_model.dart';

class AnimePage extends StatelessWidget {
  const AnimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: _buildListUserBody(),
    );
  }

  Widget _buildListUserBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadAnime(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){//snapshot digunakan untuk mengecek data apakah ada atau tidak
          if(snapshot.hasError){
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            Animelist ListUserModel = Animelist.fromJson(snapshot.data);
            return _buildSuccesSection(ListUserModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection(){
    return Container(
      child: Text("Ada Error nih"),
    );
  }

  Widget _buildLoadingSection(){
    return CircularProgressIndicator();
  }

  Widget _buildSuccesSection(Animelist data){
    return ListView.builder(
        itemCount : data.data!.length,
        itemBuilder: (BuildContext context, int index){
          return _buildItemUsers(data.data![index]);
        }
    );
  }

  Widget _buildItemUsers(Data userData){
    return InkWell(
        onTap: (){
        },
        child: Card(
          child: Row(
            children: [
              Container(
                width: 100,
                //child: Image.network(userData.!),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(userData.firstName! + " " + userData.lastName!),
                  // Text(userData.email!),
                ],
              )
            ],
          ),
        )
    );
  }

}
