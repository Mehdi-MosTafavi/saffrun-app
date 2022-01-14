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
    // TODO: implement build
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        contextBloc = context;
        if (state is SearchLoadedState) {
          return ListView(
            children: [
              state.events.length == 0
                  ? Center(child: Text("هیچ رویدادی یافت نشد")).paddingTop(30)
                  : ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      controller: controller,
                      itemCount: state.events.length + 1,
                      itemBuilder: (context, i) {
                        if (i == 0) {
                          return Column(
                            children: [
                              FilterButtonWidget(
                                confirmFilter: () async {
                                  if (state is SearchLoadedState) {
                                    BlocProvider.of<SearchCubit>(contextBloc)
                                        .loadEventHandler(state.textSearched,
                                            startDate: startDate ==
                                                    Jalali(1, 1, 1, 0, 0, 0)
                                                ? null
                                                : startDate,
                                            endDate: endDate ==
                                                    Jalali(1, 1, 1, 0, 0, 0)
                                                ? null
                                                : endDate,
                                            sort: sortField);
                                  }
                                },
                              ),
                              Text(
                                'رویداد ها',
                                style: boldTextStyle(),
                              ).paddingBottom(15)
                            ],
                          );
                        }
                        int index = i - 1;
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
                      itemCount: state.events.length + 1,
                      itemBuilder: (context, i) {
                        if (i == 0) {
                          return Column(
                            children: [
                              Text(
                                'کارفرما ها',
                                style: boldTextStyle(),
                              ).paddingBottom(15)
                            ],
                          );
                        }
                        int index = i - 1;
                        Admin admin = state.admins[index];
                        return Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 10, bottom: 0),
                          // decoration: BoxDecoration(
                          //     boxShadow: defaultBoxShadow(),
                          //     borderRadius: BorderRadius.circular(12)),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(color: Colors.transparent, width: 5),
                                const SizedBox(width: 0),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 12,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                      flex: 2,
                                                      child: CachedNetworkImage(
                                                        imageBuilder: (context,
                                                            imageProvider) {
                                                          return Container(
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    image:
                                                                        imageProvider)),
                                                          );
                                                        },
                                                        placeholder: (context,
                                                            strImage) {
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color:
                                                                  Colors.grey,
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        imageUrl:
                                                            getImageUrlUsers(
                                                                admin.imageUrls[
                                                                    0]),
                                                        fit: BoxFit.cover,
                                                        height:
                                                            context.height() *
                                                                0.11,
                                                        width: context.width() *
                                                            0.2,
                                                      ).paddingAll(8)),
                                                  Expanded(
                                                    flex: 6,
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 5),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            FittedBox(
                                                              fit: BoxFit
                                                                  .scaleDown,
                                                              child: Text(
                                                                  admin.title,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: boldTextStyle(
                                                                      size: 16,
                                                                      color: Colors
                                                                          .black)),
                                                            ),
                                                            5.height,
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              // const SizedBox(height: 16),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: IconButton(
                                                onPressed: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  pushNewScreen(
                                                    context,
                                                    screen: AdminPage(
                                                      adminId: admin.ownerId,
                                                    ),
                                                    withNavBar: false,
                                                    // OPTIONAL VALUE. True by default.
                                                    pageTransitionAnimation:
                                                        PageTransitionAnimation
                                                            .cupertino,
                                                  );
                                                },
                                                icon: const Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.black,
                                                )))
                                      ],
                                    ),
                                  ),
                                )
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
