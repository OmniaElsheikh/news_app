
import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/home/pages/category_view.dart';
import 'package:news_app/core/widgets/custom_background.dart';
import 'package:news_app/main.dart';
import '../../models/category_model.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categoryList=[
   CategoryModel(
       id:"sports" ,
       title:"Sports",
       image:"assets/images/sports.png",
       backgrounColor: Color(0xFFC91C22)),

    CategoryModel(
        id:"general" ,
        title:"Politics",
        image:"assets/images/Politics.png",
        backgrounColor: Color(0xFF003E90)),
    CategoryModel(
        id:"health" ,
        title:"Health",
        image:"assets/images/health.png",
        backgrounColor:const  Color(0xFFED1E79)),
    CategoryModel(
        id:"bussines" ,
        title:"Bussines",
        image:"assets/images/bussines.png",
        backgrounColor: Color(0xFFCF7E48)),
    CategoryModel(
        id:"environment" ,
        title:"Environment",
        image:"assets/images/environment.png",
        backgrounColor: Color(0xFF4882CF)),
    CategoryModel(
        id:"science" ,
        title:"Science",
        image:"assets/images/science.png",
        backgrounColor: Color(0xFFF2D352)),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Scaffold(
       appBar: AppBar(
         title: Text(selectedCategory==null?"News App":selectedCategory!.title,
           style:Constants.theme.textTheme.titleLarge,
         ),
         actions:[
           if(selectedCategory!=null)
             Padding(
               padding: const EdgeInsets.only(bottom: 6,right: 3),
               child: IconButton(onPressed: (){}, icon: Icon(
                 Icons.search,
                 color: Colors.white,
                 size: 35,)),
             )
           ],
         leadingWidth: 100,
       ),
        drawer: CustomDrawer(onDrawerClick: onDrawerClick,),

        body: selectedCategory==null? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("Pick your category \nof interest",
                style:  Constants.theme.textTheme.bodyLarge?.copyWith(
                  color: Color(0xFF4F5A69),
                ),


              textAlign: TextAlign.start,


              ),
            ),
            Expanded(

              child: GridView.builder(
                padding:EdgeInsets.symmetric(vertical: 25,horizontal: 20),

                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing:20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 4/5
                ),
                  itemBuilder: (context, index) => CategoryItemWidget(
                    index:index,
                    categoryModel: categoryList[index],
                    onCategoryClicked: onCategoryClicked,



                  ),
                    itemCount: 6,
                                  ),
            )

          ],
        ):CategoryView(categoryModel: selectedCategory!,),

      ),
    );

  }
  CategoryModel? selectedCategory;
  void onCategoryClicked(CategoryModel categoryModel){
    setState(() {
      selectedCategory=categoryModel;

    });
    print(categoryModel.id);

  }
  void onDrawerClick(){
    setState(() {
      selectedCategory=null;

    });
    navigatorkey.currentState!.pop();
  }
}

