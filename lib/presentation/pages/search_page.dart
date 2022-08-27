import 'package:ditonton/common/constants.dart';
import 'package:ditonton/presentation/bloc/search_movie/search_movie_bloc.dart';
import 'package:ditonton/presentation/bloc/search_tv/search_tv_bloc.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';
  @override
  Widget build(BuildContext context) {
    String? argument;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      argument = ModalRoute.of(context)!.settings.arguments as String;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                if (argument == 'tv') {
                  context
                      .read<SearchTvBloc>()
                      .add(SearchTvEvent(keyword: query));
                } else {
                  context
                      .read<SearchMovieBloc>()
                      .add(SearchMovieEvent(keyword: query));
                }
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text(
              'Search ${argument}',
              style: kHeading6,
            ),
            argument == 'movie'
                ? BlocBuilder<SearchMovieBloc, SearchMovieState>(
                    builder: (context, state) {
                      if (state is SearchMovieLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is SearchMovieLoaded) {
                        final result = state.listMovie;
                        return Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final movie = state.listMovie![index];
                              return MovieCard(movie);
                            },
                            itemCount: result!.length,
                          ),
                        );
                      }
                      return Expanded(
                        child: Container(),
                      );
                    },
                  )
                : BlocBuilder<SearchTvBloc, SearchTvState>(
                    builder: (context, state) {
                      if (state is SearchTvLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is SearchTvLoaded) {
                        final result = state.listTv;
                        return Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final tv = state.listTv![index];
                              return TvCard(tv);
                            },
                            itemCount: result!.length,
                          ),
                        );
                      }
                      return Expanded(
                        child: Container(),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
