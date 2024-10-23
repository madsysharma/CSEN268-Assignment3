const List<String> titles=[
  "The Anthropocene Reviewed",
  "Book Lovers",
  "The Guest List",
  "The Guncle",
  "The Invisible Life of Addie LaRue",
  "Lessons in Chemistry",
  "The Book of Longings",
  "Proof",
  "Tiny Threads",
  "Untamed"
];

const List<String> authors=[
  "John Green",
  "Emily Henry",
  "Lucy Foley",
  "Steven Rowley",
  "V.E. Schwab",
  "Bonnie Garmus",
  "Sue Monk Kidd",
  "Beverly McLachlin",
  "Lilliam Rivera",
  "Glennon Doyle"
];

const List<String> photos=[
  "Anthropocene.jpg",
  "BookLovers.jpg",
  "GuestList.jpg",
  "Guncle.jpg",
  "Invisible.jpg",
  "Lessons.jpg",
  "Longings.jpg",
  "Proof.jpg",
  "TinyThreads.jpg",
  "Untamed.jpg"
];

class Mock{
  static List<String> fetchAuthors(){
    return authors;
  }

  static List<String> fetchTitles(){
    return titles;
  }

  static List<String> fetchUrls(){
    return photos;
  }
}