import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:saffrun_app/constants/theme_color.dart';
import 'package:saffrun_app/models/event/event_model.dart';
import 'package:saffrun_app/state_managment/search/search_cubit.dart';

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
                          alignment: const Alignment(0, 3),
                          child: TextFieldSearchWidget(
                            onChanged: (value) {
                              if (value.length < 3) {
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
          return ListView.builder(
            controller: controller,
            itemCount: state.events.length + 1,
            itemBuilder: (context, i) {
              if (i == 0) {
                return FilterButtonWidget(
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
                              sort: sortField);
                    }
                  },
                );
              }
              int index = i - 1;
              Event event = state.events[index];
              return EventCardWidget(event: event);
            },
          );
        }
        return Container();
      },
    );
  }
}
