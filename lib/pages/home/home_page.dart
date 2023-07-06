import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurst/i18n/i18n.dart';
import 'package:hurst/pages/favorites/favorite_page.dart';
import 'package:hurst/pages/home/cubit/filter_time_serie_by_index/change_index_cubit.dart';
import 'package:hurst/pages/home/cubit/filter_time_serie_by_index/change_index_state.dart';
import 'package:hurst/pages/home/cubit/time_serie/time_serie_cubit.dart';
import 'package:hurst/pages/home/cubit/time_serie/time_serie_state.dart';
import 'package:hurst/pages/components/base_card_component.dart';
import 'package:hurst/pages/components/time_serie_body_card_component.dart';
import 'package:hurst/repository/models/time_serie_view_model.dart';

import 'components/skeleton_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    final List<String> filterSeries = [
      R.string.intermediateSeries,
      R.string.dailySeries
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: const SizedBox(),
        leadingWidth: 0,
        title: Text(
          R.string.timeSeries,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: filterSeries
                  .map(
                    (serie) => BlocBuilder<ChangeIndexCubit, ChangeIndexState>(
                        builder: (context, state) {
                      if (state is UpdateIndexState) {
                        return GestureDetector(
                          onTap: () {
                            context.read<ChangeIndexCubit>().updateIndexList(
                                  filterSeries.indexOf(serie),
                                );
                          },
                          child: BaseCardComponent(
                            color: state.index == filterSeries.indexOf(serie)
                                ? Theme.of(context).colorScheme.surface
                                : Theme.of(context).colorScheme.background,
                            margin: const EdgeInsets.only(right: 12.0),
                            borderRadius: BorderRadius.circular(20),
                            child: Text(
                              serie,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: state.index ==
                                            filterSeries.indexOf(serie)
                                        ? Theme.of(context)
                                            .colorScheme
                                            .background
                                        : Theme.of(context).colorScheme.surface,
                                  ),
                            ),
                          ),
                        );
                      }
                      return Container();
                    }),
                  )
                  .toList(),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: FutureBuilder(builder: (context, snapshot) {
                  return BlocBuilder<TimeSerieCubit, TimeSerieState>(
                    builder: (context, state) {
                      if (state is TimeSerieLoadingState) {
                        return const SkeletonComponent();
                      }
                      if (state is TimeSerieLoadedState) {
                        final TimeSerieViewModel? timeSerie =
                            state.timeSeries.isNotEmpty
                                ? state.timeSeries[0]
                                : null;

                        return BlocBuilder<ChangeIndexCubit, ChangeIndexState>(
                          builder: (context, indexState) {
                            if (indexState is UpdateIndexState) {
                              if (state.timeSeries.isEmpty) {
                                return Center(
                                  child: Text(
                                    R.string.somethingWentWrong,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                );
                              }
                              final TimeSerieViewModel timeSerie =
                                  state.timeSeries[indexState.index];

                              return TimeSerieBodyCardComponent(
                                timeSerie: timeSerie,
                              );
                            }

                            if (timeSerie == null) {
                              return Center(
                                child: Text(
                                  R.string.somethingWentWrong,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              );
                            }

                            return TimeSerieBodyCardComponent(
                              timeSerie: timeSerie,
                            );
                          },
                        );
                      }
                      if (state is TimeSerieErrorState) {
                        return Center(
                          child: Text(state.error),
                        );
                      }

                      return Container();
                    },
                  );
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, FavoritePage.route);
              },
              child: BaseCardComponent(
                width: MediaQuery.of(context).size.width * 0.24,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                color: Theme.of(context).colorScheme.background,
                height: 80,
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Text(
                      R.string.favorites,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
