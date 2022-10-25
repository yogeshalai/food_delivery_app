import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/filter/filter_bloc.dart';
import '../models/models.dart';

class CustomCategoryFilter extends StatelessWidget {
  const CustomCategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
      if (state is FilterLoading) {
        return const CircularProgressIndicator();
      }
      if (state is FilterLoaded) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.filter.categoryFilters.length,
          itemBuilder: ((context, index) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.filter.categoryFilters[index].category.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 25,
                    child: Checkbox(
                      value: state.filter.categoryFilters[index].value,
                      onChanged: (value) {
                        context.read<FilterBloc>().add(CategoryFilterUpdated(
                            categoryFilter: state.filter.categoryFilters[index]
                                .copyWith(
                                    value: !state
                                        .filter.categoryFilters[index].value)));
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      } else {
        return const Text('Something went wrong.');
      }
    });
  }
}
