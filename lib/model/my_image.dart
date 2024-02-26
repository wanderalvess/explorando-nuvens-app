class MyImage {
  late String? _descriptionCloudType;
  late String? _nameCloudType;
  late String? _url;

  MyImage(this._url, this._descriptionCloudType, this._nameCloudType);

  MyImage.empty() {}

  get getDescriptionCloudType => _descriptionCloudType;
  get getNameCloudType => _nameCloudType;
  get getUrl => _url;
}