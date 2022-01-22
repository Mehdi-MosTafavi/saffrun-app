import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/event/event_model.dart';
import 'package:saffrun_app/state_managment/search/search_cubit.dart';

import '../../logical/general/size_function.dart';
import '../../models/admin/admin_model.dart';
import '../admin/admin_page.dart';
import '../home/components/offer_page.dart';
import 'components/event_card.dart';
import 'components/filter_button.dart';
import 'components/shimmer_component.dart';
import 'components/text_field_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

final GlobalKey<ScaffoldState> scaffoldKeySearchPage = GlobalKey();

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key: scaffoldKeySearchPage,
          resizeToAvoidBottomInset: false,
          body: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              decoration: BoxDecoration(gradient: linearBackgroundGradiant),
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: 100,
                        child: Align(
                          alignment: const Alignment(0, 1.5),
                          child: TextFieldSearchWidget(
                            onChanged: (value) {
                              if (value.length < 3) {
                                BlocProvider.of<SearchCubit>(context)
                                    .emit(SearchInitial());
                                return;
                              }
                              if (state is SearchLoadedState) {
                                if (value == state.textSearched) {
                                  return;
                                }
                              }
                              if (state is SearchLoadedState) {
                                BlocProvider.of<SearchCubit>(context)
                                    .loadEventHandler(value,
                                        startDate: state.startDate,
                                        endDate: state.endDate,
                                        sort: state.sort);
                              } else {
                                BlocProvider.of<SearchCubit>(context)
                                    .loadEventHandler(value);
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.height(),
                        width: context.width(),
                        child: DraggableScrollableSheet(
                            expand: true,
                            minChildSize: 0.8,
                            initialChildSize: 0.82,
                            builder: (context, listScrollController) {
                              return Container(
                                  decoration: boxDecorationWithRoundedCorners(
                                      backgroundColor: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(40))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: BodySearchWidget(
                                        controller: listScrollController),
                                  ));
                            }),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BodySearchWidget extends StatelessWidget {
  ScrollController controller;

  BodySearchWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return const SizedBox(
            child: ShimmerWidget(),
          );
        }
        if (state is SearchLoadedState) {
          return ListViewForCardSearch(
            controller: controller,
          );
        }
        return Container();
      },
    );
  }
}

class ListViewForCardSearch extends StatelessWidget {
  ScrollController controller;

  ListViewForCardSearch({Key? key, required this.controller}) : super(key: key);
  late BuildContext contextBloc;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        contextBloc = context;
        if (state is SearchLoadedState) {
          return ListView(
            controller: controller,
            padding: EdgeInsets.only(bottom: 50),
            children: [
              Column(
                children: [
                  FilterButtonWidget(
                    confirmFilter: () async {
                      if (state is SearchLoadedState) {
                        BlocProvider.of<SearchCubit>(contextBloc)
                            .loadEventHandler(state.textSearched,
                                startDate: startDate == Jalali(1, 1, 1, 0, 0, 0)
                                    ? null
                                    : startDate,
                                endDate: endDate == Jalali(1, 1, 1, 0, 0, 0)
                                    ? null
                                    : endDate,
                                sort: sortField,
                                category: category);
                      }
                    },
                  ),
                  Text(
                    'رویدادها',
                    style: boldTextStyle(),
                  ).paddingBottom(15)
                ],
              ),
              state.events.length == 0
                  ? Center(child: Text("هیچ رویدادی یافت نشد")).paddingTop(30)
                  : ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.events.length,
                      itemBuilder: (context, i) {
                        int index = i;
                        Event event = state.events[index];
                        return EventCardWidget(event: event);
                      },
                    ),
              20.height,
              state.admins.length == 0
                  ? Center(child: Text("هیچ کارفرمایی یافت نشد")).paddingTop(30)
                  : ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      controller: controller,
                      itemCount: state.admins.length + 1,
                      itemBuilder: (context, i) {
                        if (i == 0) {
                          return Column(
                            children: [
                              Text(
                                'کارفرماها',
                                style: boldTextStyle(),
                              ).paddingBottom(15)
                            ],
                          );
                        }
                        int index = i - 1;
                        Admin admin = state.admins[index];
                        return GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            pushNewScreen(
                              context,
                              screen: AdminPage(
                                adminId: admin.ownerId,
                                heroTag: admin.ownerId.toString() + 'offer',
                              ),
                              withNavBar: false,
                              // OPTIONAL VALUE. True by default.

                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: width * 0.2,
                                  width: width * 0.2,
                                  child: Stack(
                                    children: <Widget>[
                                      Hero(
                                        tag: admin.ownerId.toString() + 'offer',
                                        child: ClipRRect(
                                          borderRadius:
                                              new BorderRadius.circular(12.0),
                                          child: CachedNetworkImage(
                                            placeholder: (context, strImage) {
                                              return Container(
                                                color: Colors.grey,
                                              );
                                            },
                                            imageUrl: getImageUrlUsers(
                                                admin.imageUrls[0]),
                                            fit: BoxFit.fill,
                                            height: width * 0.5,
                                            width: width * 0.32,
                                          ),
                                        ),
                                      ),
                                      // Align(
                                      //   alignment: Alignment.topRight,
                                      //   child: Container(
                                      //     margin: const EdgeInsets.only(right: 10, top: 10),
                                      //     child: const Icon(Icons.favorite_border,
                                      //         color: Colors.red, size: 20),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      5.height,

                                      text(admin.title,
                                          textColor: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      5.height,
                                      Row(
                                        children: <Widget>[
                                          text(admin.category,
                                              textColor: Colors.blueGrey,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13),
                                        ],
                                      ),
                                      10.height,
                                      Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration:
                                            boxDecorationWithRoundedCorners(
                                                backgroundColor: colorPallet1,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                        child: FittedBox(
                                          child: Row(
                                            children: [
                                              text('امتیاز: ',
                                                  textColor: Colors.white,
                                                  fontSize: 13),
                                              text(admin.rate.toString(),
                                                  fontWeight: FontWeight.bold,
                                                  textColor: Colors.white,
                                                  fontSize: 13),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      // const Divider(height: 0.5, color: Colors.black, thickness: 1)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
