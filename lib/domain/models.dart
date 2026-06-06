enum AppMode { neurodivergent, general }

enum StoryTemplate { firstThen, narrative }

class StoryPage {
  final String text;
  final String imageAsset;
  final String? copingCardId;

  const StoryPage({
    required this.text,
    required this.imageAsset,
    this.copingCardId,
  });

  factory StoryPage.fromJson(Map<String, dynamic> json) {
    return StoryPage(
      text: json['text'] as String,
      imageAsset: json['imageAsset'] as String,
      copingCardId: json['copingCardId'] as String?,
    );
  }
}

class Story {
  final String id;
  final AppMode mode;
  final StoryTemplate template;
  final Map<String, String> title;
  final List<StoryPage> pages;
  final List<String> voiceKeywords;
  final List<String> castIds;
  final bool lowArousal;

  const Story({
    required this.id,
    required this.mode,
    required this.template,
    required this.title,
    required this.pages,
    required this.voiceKeywords,
    required this.castIds,
    required this.lowArousal,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'] as String,
      mode: AppMode.values.byName(json['mode'] as String),
      template: StoryTemplate.values.byName(json['template'] as String),
      title: Map<String, String>.from(json['title'] as Map),
      pages: (json['pages'] as List)
          .map((e) => StoryPage.fromJson(e as Map<String, dynamic>))
          .toList(),
      voiceKeywords: List<String>.from(json['voiceKeywords'] as List),
      castIds: List<String>.from(json['castIds'] as List),
      lowArousal: json['lowArousal'] as bool,
    );
  }
}

class StoryPack {
  final String id;
  final AppMode mode;
  final String sku;
  final List<Story> stories;

  const StoryPack({
    required this.id,
    required this.mode,
    required this.sku,
    required this.stories,
  });

  factory StoryPack.fromJson(Map<String, dynamic> json) {
    return StoryPack(
      id: json['id'] as String,
      mode: AppMode.values.byName(json['mode'] as String),
      sku: json['sku'] as String,
      stories: (json['stories'] as List)
          .map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
