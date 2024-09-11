import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/features/pages/categories/cubit/categories_cubit.dart';
import 'package:thimar_app/features/pages/categories/cubit/categories_state.dart';
import 'package:thimar_app/features/pages/slider/cubit/slider_cubit.dart';
import 'package:thimar_app/features/pages/slider/cubit/slider_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final images = [
  //   "assets/images/veg1.png",
  //   "assets/images/veg2.png",
  //   "assets/images/veg3.png",
  // ];
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 24),
          BlocBuilder<SliderCubit, SliderState>(
            builder: (context, state) {
              if (state is SliderFailedState) {
                return const Text("Failed");
              } else if (state is SliderSuccessState) {
                final list = state.list;
                return Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 164,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            currentImage = index;
                            setState(() {});
                          },),
                      items: list?.map(
                        (i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor),
                                  child: AppImage(
                                    i.media ?? '',
                                    fit: BoxFit.cover,
                                  ));
                            },
                          );
                        },
                      ).toList(),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        list!.length,
                        (index) => Padding(
                          padding: const EdgeInsetsDirectional.only(end: 3),
                          child: CircleAvatar(
                              radius: 3.5,
                              backgroundColor: currentImage == index
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.38)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<CategoriesCubit,CategoriesState>(
                      builder: (context,state) {
                        if(state is CategoriesFailedState){
                          return const Text("failed");
                        } else if(state is CategoriesSuccessState){
                          final categoriesList = state.list;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(start: 16),
                                child: Text(
                                  "الأقسام",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 22),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsetsDirectional.only(
                                                  end: 16),
                                              child: AppImage(
                                                "${categoriesList[index].media}",
                                                width: 73,
                                                borderRadius:
                                                BorderRadius.circular(16),
                                              ),
                                            )),
                                        Text("${categoriesList[index].name}",),
                                      ],
                                    ),
                                    itemCount: categoriesList!.length
                                ),
                              )
                            ],
                          );
                        }else{
                          return const Center(child: CircularProgressIndicator());
                        }
                      }
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            const AppImage("assets/images/logo.svg"),
            const SizedBox(width: 5),
            Text(
              "سله ثمار",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "التوصيل إلى",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "شارع الملك فهد - جدة",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.add_alert_outlined,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
