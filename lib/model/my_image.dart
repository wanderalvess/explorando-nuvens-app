class MyImage {
  late String? _descriptionCloudType;
  late String? _nameCloudType;
  late String? _titleCloudType;
  late String? _url;

  MyImage(this._url, this._descriptionCloudType, this._nameCloudType, this._titleCloudType);

  MyImage.empty() {}

  get getDescriptionCloudType => _descriptionCloudType;
  get getNameCloudType => _nameCloudType;
  get getTitleCloudType => _titleCloudType;
  get getUrl => _url;
}