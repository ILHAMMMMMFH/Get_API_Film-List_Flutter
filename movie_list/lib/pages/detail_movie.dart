import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  final movie;

  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        // Allow scrolling for long content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(
                  '${movie.posterPath}',
                ),
                width: double.infinity, // Scale to full width
              ),
              SizedBox(height: 16.0), // Add spacing
              Text(
                'Overview:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(movie.overview),
              SizedBox(height: 16.0),
              Text(
                'Vote Average:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text('${movie.voteAverage}'),
            ],
          ),
        ),
      ),
    );
  }
}
