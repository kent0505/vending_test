class News {
  final String title;
  final String content;
  final String date;

  News({
    required this.title,
    required this.content,
    required this.date,
  });
}

List<News> newsList = [
  News(
    title: 'Aaa',
    content: 'Aaa aaa',
    date: '08-22-24',
  ),
  News(
    title: 'Bbb',
    content: 'Bbb bbb',
    date: '08-23-24',
  ),
  News(
    title: 'Ccc',
    content: 'Ccc ccc',
    date: '08-24-24',
  ),
];
