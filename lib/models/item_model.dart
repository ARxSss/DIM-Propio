class DestinyItem {
  final int instanceId;
  final int itemHash;
  String name;
  String iconPath;
  final int powerLevel;
  final String rarity;
  final String slotName;

  DestinyItem({
    required this.instanceId,
    required this.itemHash, 
    required this.name,
    required this.iconPath,
    required this.powerLevel,
    required this.rarity,
    required this.slotName,
  });

  String get fullIconUrl => "https://www.bungie.net$iconPath";
}