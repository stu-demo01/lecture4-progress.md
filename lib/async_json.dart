class Book {
  final int id;
  final String title;
  final String category;
  final int borrowCount;

  Book({
    required this.id,
    required this.title,
    required this.category,
    required this.borrowCount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      title: json['title'] as String,
      category: json['category'] as String,
      borrowCount: json['borrowCount'] as int,
    );
  }

  @override
  String toString() => '#$id 《$title》[$category] 借阅$borrowCount';
}
