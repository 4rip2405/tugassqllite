class Note {
  int? id;
  String title;
  String description;
  
  
  
  Note({
   this.id,required this.description, required this.title,
  });
   Map<String, dynamic> toMap() {
    return {
      'id': id,'title': title,'description': description,   
    };
  }

   factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }

}