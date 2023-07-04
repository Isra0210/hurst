import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurst/pages/components/time_serie_body_card_component.dart';
import 'package:hurst/pages/home/cubit/favorite_time_serie/favorite_time_serie_cubit.dart';
import 'package:hurst/pages/home/cubit/favorite_time_serie/favorite_time_serie_state.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  static const route = "/favorites";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Favoritos",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: BlocBuilder<FavoriteTimeSerieCubit, FavoriteTimeSerieState>(
        builder: (context, state) {
          if (state.timeSeriesList.isNotEmpty) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ...state.timeSeriesList.map((timeSerie) => Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TimeSerieBodyCardComponent(
                              timeSerie: timeSerie!,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 60),
                child: Text(
                  "Não há favoritos",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
