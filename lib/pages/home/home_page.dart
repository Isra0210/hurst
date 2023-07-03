import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurst/pages/favorites/favorite_page.dart';
import 'package:hurst/pages/home/bloc/home_bloc.dart';
import 'package:hurst/pages/home/bloc/home_events.dart';
import 'package:hurst/pages/home/bloc/home_state.dart';
import 'package:hurst/pages/components/base_card_component.dart';
import 'package:hurst/pages/home/components/time_serie_body_card_component.dart';
import 'package:hurst/repository/api/time_serie_repository.dart';
import 'package:hurst/repository/models/time_serie_view_model.dart';

import 'components/skeleton_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    final List<String> filterSeries = ["Série diária", "Série intermediária"];
    final List<Map<String, dynamic>> routes = [
      {"route": "/", "pageNAme": "Home", "icon": Icons.home},
      {
        "route": FavoritePage.route,
        "pageNAme": "Favoritos",
        "icon": Icons.favorite
      }
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: const SizedBox(),
        leadingWidth: 0,
        title: Text(
          "Séries temporais",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          IconButton(onPressed: () async {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: filterSeries
                  .map(
                    (serie) => BaseCardComponent(
                      color: Theme.of(context).colorScheme.background,
                      margin: const EdgeInsets.only(right: 12.0),
                      borderRadius: BorderRadius.circular(20),
                      child: Text(
                        serie,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  )
                  .toList(),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: FutureBuilder(builder: (context, snapshot) {
                  return BlocProvider(
                    create: (context) => TimeSerieBloc(
                      TimeSerieRepository(),
                    )..add(
                        LoadTimeSerieEvent(),
                      ),
                    child: BlocBuilder<TimeSerieBloc, TimeSerieState>(
                      builder: (context, state) {
                        if (state is TimeSerieLoadingState) {
                          return const SkeletonComponent();
                        }
                        if (state is TimeSerieLoadedState) {
                          List<TimeSerieViewModel> timeSeriesList =
                              state.timeSeries;

                          final TimeSerieViewModel timeSerie =
                              timeSeriesList[1];
                              
                          return TimeSerieBodyCardComponent(
                            timeSerie: timeSerie,
                          );
                        }
                        if (state is TimeSerieErrorState) {
                          return Center(
                            child: Text("${state.error}"),
                          );
                        }

                        return Container();
                      },
                    ),
                  );
                }),
              ),
            ),
            Row(
              children: routes
                  .map(
                    (route) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (route["route"] == "/favorites") {
                            Navigator.pushNamed(context, route["route"]);
                          }
                        },
                        child: BaseCardComponent(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          color: route['route'] == 'home'
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.background,
                          height: 60,
                          borderRadius: BorderRadius.circular(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                route["icon"],
                                size: 24,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              Text(
                                route["pageNAme"],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
