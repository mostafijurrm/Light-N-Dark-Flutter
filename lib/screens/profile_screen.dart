import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileScreen extends StatefulWidget {


  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        buildProfile(context),
        buildPhotos(context)
      ],
    );
  }

  Widget buildProfile(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 46,
          backgroundColor: Theme.of(context).iconTheme.color,
          child: CircleAvatar(
            radius: 44,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: Image.asset(
                'assets/user.png'
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Text(
          'Mostafijur Rahman',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
            ),
            SizedBox(width: 4,),
            Text(
              'Dhaka, Bangladesh'
            )
          ],
        ),
        SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Text(
              'Flutter is an open-source UI software development kit created by Google'
          ),
        ),
        SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _typeData('36', 'Tweet'),
            _typeData('1.4k', 'Following'),
            _typeData('5k', 'Followers'),
          ],
        )
      ],
    );
  }

  Widget _typeData(String number, String title) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10,),
        Text(
          title
        )
      ],
    );
  }

  Widget buildPhotos(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Photos'.toUpperCase(),
              style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 12,),
          buildPhotoGrid(context)
        ],
      ),
    );
  }

  buildPhotoGrid(BuildContext context) {
    return StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        shrinkWrap: true,
        primary: false,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: 8,
        itemBuilder: (context, index) {
          final urlImage = 'https://source.unsplash.com/random?sig=$index';
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  urlImage
                ),
                fit: BoxFit.cover
              )
            ),
          );
        },
        staggeredTileBuilder: (int index) {
          return StaggeredTile.count(2, index.isEven ? 2 : 1);
        }
    );
  }
}
