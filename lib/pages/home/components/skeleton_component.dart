import 'package:flutter/material.dart';
import 'package:hurst/pages/components/base_card_component.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonComponent extends StatelessWidget {
  const SkeletonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCardComponent(
      color: Theme.of(context).colorScheme.background,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: 0,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.secondary,
            highlightColor: Theme.of(context).colorScheme.outline,
            child: ClipRRect(
              child: BaseCardComponent(
                height: MediaQuery.of(context).size.height* 0.2,
                width: MediaQuery.of(context).size.width * 0.9,
                color: Theme.of(context).colorScheme.outline,
                borderRadius: BorderRadius.circular(8),
                child: const SizedBox(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
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
                          children: List.generate(
                            5,
                            (index) => Shimmer.fromColors(
                              baseColor:
                                  Theme.of(context).colorScheme.secondary,
                              highlightColor:
                                  Theme.of(context).colorScheme.outline,
                              child: ClipRRect(
                                child: BaseCardComponent(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  color: Theme.of(context).colorScheme.outline,
                                  borderRadius: BorderRadius.circular(8),
                                  child: const SizedBox(),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Theme.of(context).colorScheme.secondary,
                    highlightColor: Theme.of(context).colorScheme.outline,
                    child: ClipRRect(
                      child: BaseCardComponent(
                        width: MediaQuery.of(context).size.width * 0.9,
                        color: Theme.of(context).colorScheme.outline,
                        borderRadius: BorderRadius.circular(8),
                        child: const SizedBox(),
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
