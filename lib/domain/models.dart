enum AppMode { neurodivergent, general }

enum StoryTemplate { firstThen, narrative }

/// A reusable coping strategy shown during a story (e.g. a breathing
/// exercise). Referenced from a page via [StoryPage.copingCardId] and
/// resolved against [StoryPack.copingCards].
class CopingCard {
  final String id;
  final String title;
  final List<String> steps;

  const CopingCard({
    required this.id,
    required this.title,
    required this.steps,
  });

  factory CopingCard.fromJson(Map<String, dynamic> json) {
    return CopingCard(
      id: json['id'] as String,
      title: json['title'] as String,
      steps: List<String>.from(json['steps'] as List),
    );
  }
}

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

  /// Parent-facing description of the skill this story practises. Surfaced in
  /// the post-story "what your child practised" summary.
  final String? learningGoal;

  const Story({
    required this.id,
    required this.mode,
    required this.template,
    required this.title,
    required this.pages,
    required this.voiceKeywords,
    required this.castIds,
    required this.lowArousal,
    this.learningGoal,
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
      learningGoal: json['learningGoal'] as String?,
    );
  }
}

class StoryPack {
  final String id;
  final AppMode mode;
  final String sku;
  final List<Story> stories;

  /// Coping cards keyed by id, shared across the pack's stories.
  final Map<String, CopingCard> copingCards;

  const StoryPack({
    required this.id,
    required this.mode,
    required this.sku,
    required this.stories,
    this.copingCards = const {},
  });

  factory StoryPack.fromJson(Map<String, dynamic> json) {
    final cardsJson = json['copingCards'] as Map<String, dynamic>?;
    return StoryPack(
      id: json['id'] as String,
      mode: AppMode.values.byName(json['mode'] as String),
      sku: json['sku'] as String,
      stories: (json['stories'] as List)
          .map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
      copingCards: cardsJson == null
          ? const {}
          : cardsJson.map((k, v) =>
              MapEntry(k, CopingCard.fromJson(v as Map<String, dynamic>))),
    );
  }
}
