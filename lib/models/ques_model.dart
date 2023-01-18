class QuesModel{
  final String id;
  final String title;
  final Map<String,bool> options;
  QuesModel({required this.id,required this.title,required this.options});
  @override
  String toString(){
    return 'QuesModel(id: $id,title: $title,options: $options)';
  }
}