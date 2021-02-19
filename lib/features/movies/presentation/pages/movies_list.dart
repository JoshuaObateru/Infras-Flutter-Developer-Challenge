import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infras_flutter_developer_challenge/features/movies/presentation/bloc/get_movies_bloc.dart';
import 'package:infras_flutter_developer_challenge/values/colors.dart';

class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetMoviesBloc>(context).add(GetMoviesListEvent());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text(
            'Movies from Ghibil',
            style: TextStyle(color: secondaryColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<GetMoviesBloc, GetMoviesState>(
              builder: (context, state) {
            if (state is GetMoviesLoading) {
              return Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is GetMoviesError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: secondaryColor),
                ),
              );
            } else if (state is GetMoviesLoaded) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.movies[index].title),
                      subtitle: Text(state.movies[index].description),
                      trailing: Text(
                          '${state.movies[index].releaseDate}/ ${state.movies[index].rtScore}'),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        color: secondaryColor,
                      ),
                  itemCount: state.movies.length);
            } else {
              return Container();
            }
          }),
        ));
  }
}
