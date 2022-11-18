class Document {
  int id = 0;
  String name = '';
  String nodoc = '';
  int sender = 0;
  int receiver = 0;
  int categoryid = 0;
  int priorityid = 0;
  bool section = false;

  Document(this.id, this.name, this.nodoc, this.sender, this.receiver,
      this.categoryid, this.priorityid, this.section);

  Document.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        nodoc = json['no_document'],
        sender = json['sender'],
        receiver = json['receiver'],
        categoryid = json['category_id'],
        priorityid = json['priority_id'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'no_document': nodoc,
      'sender': sender,
      'receiver': receiver,
      'category_id':categoryid,
      'priority_id':priorityid
    };
  }
}
