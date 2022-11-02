/// A class that contains lists of information about Bob Ross's paintings
class BobRossData {
  /// A list of Strings containing only painting names.
  final List<String> paintingNames = [
    "Deep Wilderness Home",
    "Haven in the Valley",
    "Wintertime Blues",
    "Pastel Seascape",
    "Country Creek",
    "Silent Forest",
    "Autumn Images",
    "Hint of Springtime",
    "Around the Bend",
    "Valley View",
    "Tranquil Dawn",
    "Royal Majesty",
    "Serenity",
    "Cabin at Trails End",
    "Mountain Rhapsody",
    "Wilderness Cabin",
  ];

  /// A list of BobRossPainting objects containing a variety of information about
  /// each painting.
  final List<BobRossPainting> paintings = [
    BobRossPainting(
        paintingId: 13,
        title: "Silent Forest",
        season: 22,
        episode: 13,
        colorCount: 13),
    BobRossPainting(
        paintingId: 14,
        title: "Autumn Images",
        season: 22,
        episode: 1,
        colorCount: 11),
    BobRossPainting(
        paintingId: 15,
        title: "Hint of Springtime",
        season: 22,
        episode: 2,
        colorCount: 13),
    BobRossPainting(
        paintingId: 16,
        title: "Around the Bend",
        season: 22,
        episode: 3,
        colorCount: 14),
    BobRossPainting(
        paintingId: 17,
        title: "Valley View",
        season: 21,
        episode: 1,
        colorCount: 13),
    BobRossPainting(
        paintingId: 18,
        title: "Tranquil Dawn",
        season: 21,
        episode: 2,
        colorCount: 10),
    BobRossPainting(
        paintingId: 19,
        title: "Royal Majesty",
        season: 21,
        episode: 3,
        colorCount: 14),
    BobRossPainting(
        paintingId: 20,
        title: "Serenity",
        season: 21,
        episode: 4,
        colorCount: 12),
    BobRossPainting(
        paintingId: 21,
        title: "Cabin at Trails End",
        season: 21,
        episode: 5,
        colorCount: 13),
    BobRossPainting(
        paintingId: 22,
        title: "Mountain Rhapsody",
        season: 21,
        episode: 6,
        colorCount: 8),
    BobRossPainting(
        paintingId: 23,
        title: "Wilderness Cabin",
        season: 21,
        episode: 7,
        colorCount: 14),
  ];
}

/// A data class that holds a painting id, title, show season, show episode, and
/// count of colors used in the painting.
class BobRossPainting {
  const BobRossPainting(
      {required this.paintingId,
      required this.title,
      required this.season,
      required this.episode,
      required this.colorCount});

  final int paintingId;
  final String title;
  final int season;
  final int episode;
  final int colorCount;
}
