class MyImage {
  late String? _description;
  late String? _title;
  late String? _url;

  MyImage(this._url, this._description, this._title);

  MyImage.empty() {}

  get getDescription => _description;
  get getTitle => _title;
  get getUrl => _url;
}