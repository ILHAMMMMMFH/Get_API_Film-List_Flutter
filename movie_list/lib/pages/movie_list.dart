import 'package:flutter/material.dart';
import 'package:movie_list/http_service/httpServices.dart';
import 'package:movie_list/models/movie.dart';
import 'package:movie_list/widgets/bottom_navigasi.dart';
import 'package:movie_list/pages/detail_movie.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _movelistState();
}

class _movelistState extends State<MovieList> {
  List<Movie>? _movies;
  bool _isLoading = true;
  late httpService _httpService; // Declare httpService instance

  @override
  void initState() {
    super.initState();
    _httpService = httpService(); // Initialize httpService instance
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    try {
      final movies =
          await _httpService.getPopularMovies(); // Use httpService instance
      setState(() {
        _movies = movies;
        _isLoading = false;
      });
    } catch (error) {
      print('Error fetching movies: $error');
      // Handle error here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movie"),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _movies != null
              ? ListView.builder(
                  itemCount: _movies!.length,
                  itemBuilder: (context, index) {
                    final movie = _movies![index];
                    return ListTile(
                      leading: Image(
                        image: NetworkImage(
                          '${movie.posterPath}',
                        ),
                        width: 100,
                        height: 300,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          print('Error loading image: $error');
                          return Icon(Icons.error);
                        },
                      ),
                      title: Text(movie.title),
                      subtitle: Text('Rating: ${movie.voteAverage.toString()}'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetail(movie: movie),
                        ),
                      ), // Navigate to MovieDetail on tap
                    );
                  },
                )
              : Center(
                  child: Text('No movies found'),
                ),
      bottomNavigationBar: BottomNav(selectedItem: 1),
    );
  }
}
