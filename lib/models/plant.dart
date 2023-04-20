class Plant {
  final int id;
  final String plantName;
  final String plantType;
  final String image;
  final String info;
  final String shortInfo;
  final double water;
  final String waterDay;
  final String dirtType;

  Plant({
    required this.id,
    required this.plantType,
    required this.plantName,
    required this.image,
    required this.info,
    required this.shortInfo,
    required this.water,
    required this.waterDay,
    required this.dirtType,
  });
}
