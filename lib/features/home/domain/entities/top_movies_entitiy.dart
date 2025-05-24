class TopMoviesResultEntity {
  final int totalPages;
  final List<TopMoviesEntity> topMoviesEntity;
  TopMoviesResultEntity(
      {required this.totalPages, required this.topMoviesEntity});
}

class TopMoviesEntity {
  final int id;
  final String title;
  final String img;
  final String description;
  final String date;
  TopMoviesEntity({
    required this.id,
    required this.title,
    required this.img,
    required this.description,
    required this.date,
  });
}
