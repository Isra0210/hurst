import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurst/pages/components/base_card_component.dart';
import 'package:hurst/pages/components/rich_text_component.dart';
import 'package:hurst/pages/home/cubit/favorite_time_serie/favorite_time_serie_cubit.dart';
import 'package:hurst/pages/home/cubit/favorite_time_serie/favorite_time_serie_state.dart';
import 'package:hurst/pages/time_serie_details/time_serie_details_page.dart';
import 'package:hurst/repository/models/time_serie_view_model.dart';

class TimeSerieBodyCardComponent extends StatefulWidget {
  const TimeSerieBodyCardComponent({
    required this.timeSerie,
    super.key,
  });

  final TimeSerieViewModel timeSerie;

  @override
  State<TimeSerieBodyCardComponent> createState() => _TimeSerieBodyCardComponentState();
}

class _TimeSerieBodyCardComponentState extends State<TimeSerieBodyCardComponent> {
  @override
  Widget build(BuildContext context) {
    return BaseCardComponent(
      color: Theme.of(context).colorScheme.background,
      width: MediaQuery.of(context).size.width * 0.86,
      padding: 0,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://d34u8crftukxnk.cloudfront.net/slackpress/prod/sites/6/4.2.png',
                    fit: BoxFit.cover,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      return child;
                    },
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.close),
                    ),
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  BlocBuilder<FavoriteTimeSerieCubit, FavoriteTimeSerieState>(
                      builder: (context, state) {
                    // if (state is FavoriteTimeSerieState) {
                      return Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            // setState(() {
                              if (!state.items!
                                .contains(widget.timeSerie)) {
                              context
                                  .read<FavoriteTimeSerieCubit>()
                                  .addFavoriteTimeSerie(widget.timeSerie);
                            } else {
                              context
                                  .read<FavoriteTimeSerieCubit>()
                                  .removeFavoriteTimeSerie(widget.timeSerie);
                            }
                            // });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12, top: 12),
                            child: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              radius: 26,
                              child: Icon(
                                Icons.favorite,
                                color: state.items!
                                        .contains(widget.timeSerie)
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ),
                        ),
                      );
                    // }

                    // return const SizedBox();
                  })
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichTectComponent(
                            highlightedLabel: 'Informação: ',
                            label: widget.timeSerie.metaData.information,
                          ),
                          RichTectComponent(
                            highlightedLabel: 'Simbolo: ',
                            label: widget.timeSerie.metaData.symbol,
                          ),
                          RichTectComponent(
                            highlightedLabel: 'Ultima atualização: ',
                            label: widget.timeSerie.metaData.lastRefreshed,
                          ),
                          RichTectComponent(
                            highlightedLabel: 'Tamanho da saída: ',
                            label: widget.timeSerie.metaData.outputSize,
                          ),
                          RichTectComponent(
                            highlightedLabel: 'Fuso horário: ',
                            label: widget.timeSerie.metaData.timezone,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, TimeSerieDetailsPage.route,
                          arguments: widget.timeSerie);
                    },
                    child: BaseCardComponent(
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(8),
                      child: Text(
                        'Detalhar',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.background),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
