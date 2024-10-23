import 'dart:convert';

class Book {
  final String bookTitle; //title of the book
  final String bookAuthor; //author of the book
  final String description; //description for the book
  final String imageUrl; //URL for the book cover

  Book({required this.bookTitle, required this.bookAuthor, required this.description, required this.imageUrl});

  Book copyWith({
    String? bookTitle,
    String? bookAuthor,
    String? description,
    String? imageUrl,
  }) {
    return Book(
      bookTitle: bookTitle ?? this.bookTitle,
      bookAuthor: bookAuthor ?? this.bookAuthor,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'bookTitle': bookTitle,
      'bookAuthor': bookAuthor,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory Book.fromMap(Map<String, String> map) {
    return Book(
      bookTitle: map['bookTitle'] as String,
      bookAuthor: map['bookAuthor'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, String>);

  @override
  String toString() {
    return 'Book(bookTitle: $bookTitle, bookAuthor: $bookAuthor, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.bookTitle == bookTitle &&
        other.bookAuthor == bookAuthor &&
        other.description == description &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return bookTitle.hashCode ^
        bookAuthor.hashCode ^
        description.hashCode ^
        imageUrl.hashCode;
  }
}