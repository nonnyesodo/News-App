class NewsArticleModel {
  String? category;
  int? timestamp;
  int? read;
  List<Clusters>? clusters;

  NewsArticleModel({this.category, this.timestamp, this.read, this.clusters});

  NewsArticleModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    timestamp = json['timestamp'];
    read = json['read'];
    if (json['clusters'] != null) {
      clusters = <Clusters>[];
      json['clusters'].forEach((v) {
        clusters!.add(Clusters.fromJson(v));
      });
    }
  }
}

class Clusters {
  int? clusterNumber;
  int? uniqueDomains;
  int? numberOfTitles;
  String? category;
  String? title;
  String? shortSummary;
  String? didYouKnow;
  List talkingPoints = [];
  String? quote;
  String? quoteAuthor;
  String? quoteSourceUrl;
  String? quoteSourceDomain;
  String? location;
  List<Perspectives>? perspectives;
  String? emoji;
  String? geopoliticalContext;
  String? historicalBackground;
  List internationalReactions = [];
  String? humanitarianImpact;
  String? economicImplications;
  List timeline = [];
  String? futureOutlook;
  List keyPlayers = [];
  List technicalDetails = [];
  String? businessAngleText;
  List businessAnglePoints = [];
  List userActionItems = [];
  List scientificSignificance = [];
  List travelAdvisory = [];
  String? destinationHighlights;
  String? culinarySignificance;
  List performanceStatistics = [];
  String? leagueStandings;
  String? diyTips;
  String? designPrinciples;
  List userExperienceImpact = [];
  List gameplayMechanics = [];
  List industryImpact = [];
  String? technicalSpecifications;
  List<Articles>? articles;
  List<Domains>? domains;

  Clusters(
      {this.clusterNumber,
      this.uniqueDomains,
      this.numberOfTitles,
      this.category,
      this.title,
      this.shortSummary,
      this.didYouKnow,
      this.talkingPoints = const [],
      this.quote,
      this.quoteAuthor,
      this.quoteSourceUrl,
      this.quoteSourceDomain,
      this.location,
      this.perspectives,
      this.emoji,
      this.geopoliticalContext,
      this.historicalBackground,
      this.internationalReactions = const [],
      this.humanitarianImpact,
      this.economicImplications,
      this.timeline = const [],
      this.futureOutlook,
      this.keyPlayers = const [],
      this.technicalDetails = const [],
      this.businessAngleText,
      this.businessAnglePoints = const [],
      this.userActionItems = const [],
      this.scientificSignificance = const [],
      this.travelAdvisory = const [],
      this.destinationHighlights,
      this.culinarySignificance,
      this.performanceStatistics = const [],
      this.leagueStandings,
      this.diyTips,
      this.designPrinciples,
      this.userExperienceImpact = const [],
      this.gameplayMechanics = const [],
      this.industryImpact = const [],
      this.technicalSpecifications,
      this.articles,
      this.domains});

  Clusters.fromJson(Map<String, dynamic> json) {
    clusterNumber = json['cluster_number'];
    uniqueDomains = json['unique_domains'];
    numberOfTitles = json['number_of_titles'];
    category = json['category'];
    title = json['title'];
    shortSummary = json['short_summary'];
    didYouKnow = json['did_you_know'];
    talkingPoints = json['talking_points'].toString().trim().isEmpty
        ? []
        : json['talking_points'];
    quote = json['quote'];
    quoteAuthor = json['quote_author'];
    quoteSourceUrl = json['quote_source_url'];
    quoteSourceDomain = json['quote_source_domain'];
    location = json['location'];
    if (json['perspectives'] != null) {
      perspectives = <Perspectives>[];
      json['perspectives'].forEach((v) {
        perspectives!.add(Perspectives.fromJson(v));
      });
    }
    emoji = json['emoji'];
    geopoliticalContext = json['geopolitical_context'];
    historicalBackground = json['historical_background'];
    internationalReactions =
        json['international_reactions'].toString().trim().isEmpty
            ? []
            : json['international_reactions'];
    humanitarianImpact = json['humanitarian_impact'];
    economicImplications = json['economic_implications'];
    timeline =
        json['timeline'].toString().trim().isEmpty ? [] : json['timeline'];
    futureOutlook = json['future_outlook'];
    keyPlayers = json['key_players'].toString().trim().isEmpty
        ? []
        : json['key_players'];
    technicalDetails = json['technical_details'].toString().trim().isEmpty
        ? []
        : json['technical_details'];
    businessAngleText = json['business_angle_text'];
    businessAnglePoints =
        json['business_angle_points'].toString().trim().isEmpty
            ? []
            : json['business_angle_points'];
    userActionItems = json['user_action_items'].toString().trim().isEmpty
        ? []
        : json['user_action_items'];
    scientificSignificance =
        json['scientific_significance'].toString().trim().isEmpty
            ? []
            : json['scientific_significance'];
    travelAdvisory = json['travel_advisory'].toString().trim().isEmpty
        ? []
        : json['travel_advisory'];
    destinationHighlights = json['destination_highlights'];
    culinarySignificance = json['culinary_significance'];
    performanceStatistics =
        json['performance_statistics'].toString().trim().isEmpty
            ? []
            : json['performance_statistics'];
    leagueStandings = json['league_standings'];
    diyTips = json['diy_tips'];
    designPrinciples = json['design_principles'];
    userExperienceImpact =
        json['user_experience_impact'].toString().trim().isEmpty
            ? []
            : json['user_experience_impact'];
    gameplayMechanics = json['gameplay_mechanics'].toString().trim().isEmpty
        ? []
        : json['gameplay_mechanics'];
    industryImpact = json['industry_impact'].toString().trim().isEmpty
        ? []
        : json['industry_impact'];
    technicalSpecifications = json['technical_specifications'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
    if (json['domains'] != null) {
      domains = <Domains>[];
      json['domains'].forEach((v) {
        domains!.add(Domains.fromJson(v));
      });
    }
  }
}

class Perspectives {
  String? text;
  List<Sources>? sources;

  Perspectives({this.text, this.sources});

  Perspectives.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['sources'] != null) {
      sources = <Sources>[];
      json['sources'].forEach((v) {
        sources!.add(Sources.fromJson(v));
      });
    }
  }
}

class Sources {
  String? name;
  String? url;

  Sources({this.name, this.url});

  Sources.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class Articles {
  String? title;
  String? link;
  String? domain;
  String? date;
  String? image;
  String? imageCaption;

  Articles(
      {this.title,
      this.link,
      this.domain,
      this.date,
      this.image,
      this.imageCaption});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    domain = json['domain'];
    date = json['date'];
    image = json['image'];
    imageCaption = json['image_caption'];
  }
}

class Domains {
  String? name;
  String? favicon;

  Domains({this.name, this.favicon});

  Domains.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    favicon = json['favicon'];
  }
}
