import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class Sub {
  Sub({
    this.kind,
    this.data,
  });

  factory Sub.fromJson(Map<String, dynamic> jsonRes) => Sub(
    kind: asT<String?>(jsonRes['kind']),
    data: jsonRes['data'] == null
        ? null
        : Data.fromJson(asT<Map<String, dynamic>>(jsonRes['data'])!),
  );

  String? kind;
  Data? data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'kind': kind,
    'data': data,
  };

  Sub clone() =>
      Sub.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Data {
  Data({
    this.modhash,
    this.dist,
    this.children,
    this.after,
    this.before,
  });

  factory Data.fromJson(Map<String, dynamic> jsonRes) {
    final List<Children>? children =
    jsonRes['children'] is List ? <Children>[] : null;
    if (children != null) {
      for (final dynamic item in jsonRes['children']!) {
        if (item != null) {
          children.add(Children.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return Data(
      modhash: asT<String?>(jsonRes['modhash']),
      dist: asT<int?>(jsonRes['dist']),
      children: children,
      after: asT<String?>(jsonRes['after']),
      before: asT<Object?>(jsonRes['before']),
    );
  }

  String? modhash;
  int? dist;
  List<Children>? children;
  String? after;
  Object? before;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'modhash': modhash,
    'dist': dist,
    'children': children,
    'after': after,
    'before': before,
  };

  Data clone() =>
      Data.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Children {
  Children({
    this.kind,
    this.data,
  });

  factory Children.fromJson(Map<String, dynamic> jsonRes) => Children(
    kind: asT<String?>(jsonRes['kind']),
    data: jsonRes['data'] == null
        ? null
        : Datas.fromJson(asT<Map<String, dynamic>>(jsonRes['data'])!),
  );

  String? kind;
  Datas? data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'kind': kind,
    'data': data,
  };

  Children clone() => Children.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Datas {
  Datas({
    this.approvedAtUtc,
    this.subreddit,
    this.selftext,
    this.authorFullname,
    this.saved,
    this.modReasonTitle,
    this.gilded,
    this.clicked,
    this.title,
    this.linkFlairRichtext,
    this.subredditNamePrefixed,
    this.hidden,
    this.pwls,
    this.linkFlairCssClass,
    this.downs,
    this.thumbnailHeight,
    this.topAwardedType,
    this.hideScore,
    this.name,
    this.quarantine,
    this.linkFlairTextColor,
    this.upvoteRatio,
    this.authorFlairBackgroundColor,
    this.subredditType,
    this.ups,
    this.totalAwardsReceived,
    this.mediaEmbed,
    this.thumbnailWidth,
    this.authorFlairTemplateId,
    this.isOriginalContent,
    this.userReports,
    this.secureMedia,
    this.isRedditMediaDomain,
    this.isMeta,
    this.category,
    this.secureMediaEmbed,
    this.linkFlairText,
    this.canModPost,
    this.score,
    this.approvedBy,
    this.isCreatedFromAdsUi,
    this.authorPremium,
    this.thumbnail,
    this.edited,
    this.authorFlairCssClass,
    this.authorFlairRichtext,
    this.gildings,
    this.contentCategories,
    this.isSelf,
    this.modNote,
    this.created,
    this.linkFlairType,
    this.wls,
    this.removedByCategory,
    this.bannedBy,
    this.authorFlairType,
    this.domain,
    this.allowLiveComments,
    this.selftextHtml,
    this.likes,
    this.suggestedSort,
    this.bannedAtUtc,
    this.viewCount,
    this.archived,
    this.noFollow,
    this.isCrosspostable,
    this.pinned,
    this.over18,
    this.allAwardings,
    this.awarders,
    this.mediaOnly,
    this.canGild,
    this.spoiler,
    this.locked,
    this.authorFlairText,
    this.treatmentTags,
    this.visited,
    this.removedBy,
    this.numReports,
    this.distinguished,
    this.subredditId,
    this.modReasonBy,
    this.removalReason,
    this.linkFlairBackgroundColor,
    this.id,
    this.isRobotIndexable,
    this.reportReasons,
    this.author,
    this.discussionType,
    this.numComments,
    this.sendReplies,
    this.whitelistStatus,
    this.contestMode,
    this.modReports,
    this.authorPatreonFlair,
    this.authorFlairTextColor,
    this.permalink,
    this.parentWhitelistStatus,
    this.stickied,
    this.url,
    this.subredditSubscribers,
    this.createdUtc,
    this.numCrossposts,
    this.media,
    this.isVideo,
  });

  factory Datas.fromJson(Map<String, dynamic> jsonRes) {
    final List<Object>? linkFlairRichtext =
    jsonRes['link_flair_richtext'] is List ? <Object>[] : null;
    if (linkFlairRichtext != null) {
      for (final dynamic item in jsonRes['link_flair_richtext']!) {
        if (item != null) {
          linkFlairRichtext.add(asT<Object>(item)!);
        }
      }
    }

    final List<Object>? userReports =
    jsonRes['user_reports'] is List ? <Object>[] : null;
    if (userReports != null) {
      for (final dynamic item in jsonRes['user_reports']!) {
        if (item != null) {
          userReports.add(asT<Object>(item)!);
        }
      }
    }

    final List<Object>? authorFlairRichtext =
    jsonRes['author_flair_richtext'] is List ? <Object>[] : null;
    if (authorFlairRichtext != null) {
      for (final dynamic item in jsonRes['author_flair_richtext']!) {
        if (item != null) {
          authorFlairRichtext.add(asT<Object>(item)!);
        }
      }
    }

    final List<Object>? allAwardings =
    jsonRes['all_awardings'] is List ? <Object>[] : null;
    if (allAwardings != null) {
      for (final dynamic item in jsonRes['all_awardings']!) {
        if (item != null) {
          allAwardings.add(asT<Object>(item)!);
        }
      }
    }

    final List<Object>? awarders =
    jsonRes['awarders'] is List ? <Object>[] : null;
    if (awarders != null) {
      for (final dynamic item in jsonRes['awarders']!) {
        if (item != null) {
          awarders.add(asT<Object>(item)!);
        }
      }
    }

    final List<Object>? treatmentTags =
    jsonRes['treatment_tags'] is List ? <Object>[] : null;
    if (treatmentTags != null) {
      for (final dynamic item in jsonRes['treatment_tags']!) {
        if (item != null) {
          treatmentTags.add(asT<Object>(item)!);
        }
      }
    }

    final List<Object>? modReports =
    jsonRes['mod_reports'] is List ? <Object>[] : null;
    if (modReports != null) {
      for (final dynamic item in jsonRes['mod_reports']!) {
        if (item != null) {
          modReports.add(asT<Object>(item)!);
        }
      }
    }
    return Datas(
      approvedAtUtc: asT<Object?>(jsonRes['approved_at_utc']),
      subreddit: asT<String?>(jsonRes['subreddit']),
      selftext: asT<String?>(jsonRes['selftext']),
      authorFullname: asT<String?>(jsonRes['author_fullname']),
      saved: asT<bool?>(jsonRes['saved']),
      modReasonTitle: asT<Object?>(jsonRes['mod_reason_title']),
      gilded: asT<int?>(jsonRes['gilded']),
      clicked: asT<bool?>(jsonRes['clicked']),
      title: asT<String?>(jsonRes['title']),
      linkFlairRichtext: linkFlairRichtext,
      subredditNamePrefixed: asT<String?>(jsonRes['subreddit_name_prefixed']),
      hidden: asT<bool?>(jsonRes['hidden']),
      pwls: asT<int?>(jsonRes['pwls']),
      linkFlairCssClass: asT<Object?>(jsonRes['link_flair_css_class']),
      downs: asT<int?>(jsonRes['downs']),
      thumbnailHeight: asT<Object?>(jsonRes['thumbnail_height']),
      topAwardedType: asT<Object?>(jsonRes['top_awarded_type']),
      hideScore: asT<bool?>(jsonRes['hide_score']),
      name: asT<String?>(jsonRes['name']),
      quarantine: asT<bool?>(jsonRes['quarantine']),
      linkFlairTextColor: asT<String?>(jsonRes['link_flair_text_color']),
      upvoteRatio: asT<double?>(jsonRes['upvote_ratio']),
      authorFlairBackgroundColor:
      asT<Object?>(jsonRes['author_flair_background_color']),
      subredditType: asT<String?>(jsonRes['subreddit_type']),
      ups: asT<int?>(jsonRes['ups']),
      totalAwardsReceived: asT<int?>(jsonRes['total_awards_received']),
      mediaEmbed: asT<Object?>(jsonRes['media_embed']),
      thumbnailWidth: asT<Object?>(jsonRes['thumbnail_width']),
      authorFlairTemplateId: asT<Object?>(jsonRes['author_flair_template_id']),
      isOriginalContent: asT<bool?>(jsonRes['is_original_content']),
      userReports: userReports,
      secureMedia: asT<Object?>(jsonRes['secure_media']),
      isRedditMediaDomain: asT<bool?>(jsonRes['is_reddit_media_domain']),
      isMeta: asT<bool?>(jsonRes['is_meta']),
      category: asT<Object?>(jsonRes['category']),
      secureMediaEmbed: asT<Object?>(jsonRes['secure_media_embed']),
      linkFlairText: asT<Object?>(jsonRes['link_flair_text']),
      canModPost: asT<bool?>(jsonRes['can_mod_post']),
      score: asT<int?>(jsonRes['score']),
      approvedBy: asT<Object?>(jsonRes['approved_by']),
      isCreatedFromAdsUi: asT<bool?>(jsonRes['is_created_from_ads_ui']),
      authorPremium: asT<bool?>(jsonRes['author_premium']),
      thumbnail: asT<String?>(jsonRes['thumbnail']),
      edited: asT<bool?>(jsonRes['edited']),
      authorFlairCssClass: asT<Object?>(jsonRes['author_flair_css_class']),
      authorFlairRichtext: authorFlairRichtext,
      gildings: asT<Object?>(jsonRes['gildings']),
      contentCategories: asT<Object?>(jsonRes['content_categories']),
      isSelf: asT<bool?>(jsonRes['is_self']),
      modNote: asT<Object?>(jsonRes['mod_note']),
      created: asT<double?>(jsonRes['created']),
      linkFlairType: asT<String?>(jsonRes['link_flair_type']),
      wls: asT<int?>(jsonRes['wls']),
      removedByCategory: asT<Object?>(jsonRes['removed_by_category']),
      bannedBy: asT<Object?>(jsonRes['banned_by']),
      authorFlairType: asT<String?>(jsonRes['author_flair_type']),
      domain: asT<String?>(jsonRes['domain']),
      allowLiveComments: asT<bool?>(jsonRes['allow_live_comments']),
      selftextHtml: asT<String?>(jsonRes['selftext_html']),
      likes: asT<Object?>(jsonRes['likes']),
      suggestedSort: asT<Object?>(jsonRes['suggested_sort']),
      bannedAtUtc: asT<Object?>(jsonRes['banned_at_utc']),
      viewCount: asT<Object?>(jsonRes['view_count']),
      archived: asT<bool?>(jsonRes['archived']),
      noFollow: asT<bool?>(jsonRes['no_follow']),
      isCrosspostable: asT<bool?>(jsonRes['is_crosspostable']),
      pinned: asT<bool?>(jsonRes['pinned']),
      over18: asT<bool?>(jsonRes['over_18']),
      allAwardings: allAwardings,
      awarders: awarders,
      mediaOnly: asT<bool?>(jsonRes['media_only']),
      canGild: asT<bool?>(jsonRes['can_gild']),
      spoiler: asT<bool?>(jsonRes['spoiler']),
      locked: asT<bool?>(jsonRes['locked']),
      authorFlairText: asT<Object?>(jsonRes['author_flair_text']),
      treatmentTags: treatmentTags,
      visited: asT<bool?>(jsonRes['visited']),
      removedBy: asT<Object?>(jsonRes['removed_by']),
      numReports: asT<Object?>(jsonRes['num_reports']),
      distinguished: asT<Object?>(jsonRes['distinguished']),
      subredditId: asT<String?>(jsonRes['subreddit_id']),
      modReasonBy: asT<Object?>(jsonRes['mod_reason_by']),
      removalReason: asT<Object?>(jsonRes['removal_reason']),
      linkFlairBackgroundColor:
      asT<String?>(jsonRes['link_flair_background_color']),
      id: asT<String?>(jsonRes['id']),
      isRobotIndexable: asT<bool?>(jsonRes['is_robot_indexable']),
      reportReasons: asT<Object?>(jsonRes['report_reasons']),
      author: asT<String?>(jsonRes['author']),
      discussionType: asT<Object?>(jsonRes['discussion_type']),
      numComments: asT<int?>(jsonRes['num_comments']),
      sendReplies: asT<bool?>(jsonRes['send_replies']),
      whitelistStatus: asT<String?>(jsonRes['whitelist_status']),
      contestMode: asT<bool?>(jsonRes['contest_mode']),
      modReports: modReports,
      authorPatreonFlair: asT<bool?>(jsonRes['author_patreon_flair']),
      authorFlairTextColor: asT<Object?>(jsonRes['author_flair_text_color']),
      permalink: asT<String?>(jsonRes['permalink']),
      parentWhitelistStatus: asT<String?>(jsonRes['parent_whitelist_status']),
      stickied: asT<bool?>(jsonRes['stickied']),
      url: asT<String?>(jsonRes['url']),
      subredditSubscribers: asT<int?>(jsonRes['subreddit_subscribers']),
      createdUtc: asT<double?>(jsonRes['created_utc']),
      numCrossposts: asT<int?>(jsonRes['num_crossposts']),
      media: asT<Object?>(jsonRes['media']),
      isVideo: asT<bool?>(jsonRes['is_video']),
    );
  }

  Object? approvedAtUtc;
  String? subreddit;
  String? selftext;
  String? authorFullname;
  bool? saved;
  Object? modReasonTitle;
  int? gilded;
  bool? clicked;
  String? title;
  List<Object>? linkFlairRichtext;
  String? subredditNamePrefixed;
  bool? hidden;
  int? pwls;
  Object? linkFlairCssClass;
  int? downs;
  Object? thumbnailHeight;
  Object? topAwardedType;
  bool? hideScore;
  String? name;
  bool? quarantine;
  String? linkFlairTextColor;
  double? upvoteRatio;
  Object? authorFlairBackgroundColor;
  String? subredditType;
  int? ups;
  int? totalAwardsReceived;
  Object? mediaEmbed;
  Object? thumbnailWidth;
  Object? authorFlairTemplateId;
  bool? isOriginalContent;
  List<Object>? userReports;
  Object? secureMedia;
  bool? isRedditMediaDomain;
  bool? isMeta;
  Object? category;
  Object? secureMediaEmbed;
  Object? linkFlairText;
  bool? canModPost;
  int? score;
  Object? approvedBy;
  bool? isCreatedFromAdsUi;
  bool? authorPremium;
  String? thumbnail;
  bool? edited;
  Object? authorFlairCssClass;
  List<Object>? authorFlairRichtext;
  Object? gildings;
  Object? contentCategories;
  bool? isSelf;
  Object? modNote;
  double? created;
  String? linkFlairType;
  int? wls;
  Object? removedByCategory;
  Object? bannedBy;
  String? authorFlairType;
  String? domain;
  bool? allowLiveComments;
  String? selftextHtml;
  Object? likes;
  Object? suggestedSort;
  Object? bannedAtUtc;
  Object? viewCount;
  bool? archived;
  bool? noFollow;
  bool? isCrosspostable;
  bool? pinned;
  bool? over18;
  List<Object>? allAwardings;
  List<Object>? awarders;
  bool? mediaOnly;
  bool? canGild;
  bool? spoiler;
  bool? locked;
  Object? authorFlairText;
  List<Object>? treatmentTags;
  bool? visited;
  Object? removedBy;
  Object? numReports;
  Object? distinguished;
  String? subredditId;
  Object? modReasonBy;
  Object? removalReason;
  String? linkFlairBackgroundColor;
  String? id;
  bool? isRobotIndexable;
  Object? reportReasons;
  String? author;
  Object? discussionType;
  int? numComments;
  bool? sendReplies;
  String? whitelistStatus;
  bool? contestMode;
  List<Object>? modReports;
  bool? authorPatreonFlair;
  Object? authorFlairTextColor;
  String? permalink;
  String? parentWhitelistStatus;
  bool? stickied;
  bool? isMarked;
  String? url;
  int? subredditSubscribers;
  double? createdUtc;
  int? numCrossposts;
  Object? media;
  bool? isVideo;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'approved_at_utc': approvedAtUtc,
    'subreddit': subreddit,
    'selftext': selftext,
    'author_fullname': authorFullname,
    'saved': saved,
    'mod_reason_title': modReasonTitle,
    'gilded': gilded,
    'clicked': clicked,
    'title': title,
    'link_flair_richtext': linkFlairRichtext,
    'subreddit_name_prefixed': subredditNamePrefixed,
    'hidden': hidden,
    'pwls': pwls,
    'link_flair_css_class': linkFlairCssClass,
    'downs': downs,
    'thumbnail_height': thumbnailHeight,
    'top_awarded_type': topAwardedType,
    'hide_score': hideScore,
    'name': name,
    'quarantine': quarantine,
    'link_flair_text_color': linkFlairTextColor,
    'upvote_ratio': upvoteRatio,
    'author_flair_background_color': authorFlairBackgroundColor,
    'subreddit_type': subredditType,
    'ups': ups,
    'total_awards_received': totalAwardsReceived,
    'media_embed': mediaEmbed,
    'thumbnail_width': thumbnailWidth,
    'author_flair_template_id': authorFlairTemplateId,
    'is_original_content': isOriginalContent,
    'user_reports': userReports,
    'secure_media': secureMedia,
    'is_reddit_media_domain': isRedditMediaDomain,
    'is_meta': isMeta,
    'category': category,
    'secure_media_embed': secureMediaEmbed,
    'link_flair_text': linkFlairText,
    'can_mod_post': canModPost,
    'score': score,
    'approved_by': approvedBy,
    'is_created_from_ads_ui': isCreatedFromAdsUi,
    'author_premium': authorPremium,
    'thumbnail': thumbnail,
    'edited': edited,
    'author_flair_css_class': authorFlairCssClass,
    'author_flair_richtext': authorFlairRichtext,
    'gildings': gildings,
    'content_categories': contentCategories,
    'is_self': isSelf,
    'mod_note': modNote,
    'created': created,
    'link_flair_type': linkFlairType,
    'wls': wls,
    'removed_by_category': removedByCategory,
    'banned_by': bannedBy,
    'author_flair_type': authorFlairType,
    'domain': domain,
    'allow_live_comments': allowLiveComments,
    'selftext_html': selftextHtml,
    'likes': likes,
    'suggested_sort': suggestedSort,
    'banned_at_utc': bannedAtUtc,
    'view_count': viewCount,
    'archived': archived,
    'no_follow': noFollow,
    'is_crosspostable': isCrosspostable,
    'pinned': pinned,
    'over_18': over18,
    'all_awardings': allAwardings,
    'awarders': awarders,
    'media_only': mediaOnly,
    'can_gild': canGild,
    'spoiler': spoiler,
    'locked': locked,
    'author_flair_text': authorFlairText,
    'treatment_tags': treatmentTags,
    'visited': visited,
    'removed_by': removedBy,
    'num_reports': numReports,
    'distinguished': distinguished,
    'subreddit_id': subredditId,
    'mod_reason_by': modReasonBy,
    'removal_reason': removalReason,
    'link_flair_background_color': linkFlairBackgroundColor,
    'id': id,
    'is_robot_indexable': isRobotIndexable,
    'report_reasons': reportReasons,
    'author': author,
    'discussion_type': discussionType,
    'num_comments': numComments,
    'send_replies': sendReplies,
    'whitelist_status': whitelistStatus,
    'contest_mode': contestMode,
    'mod_reports': modReports,
    'author_patreon_flair': authorPatreonFlair,
    'author_flair_text_color': authorFlairTextColor,
    'permalink': permalink,
    'parent_whitelist_status': parentWhitelistStatus,
    'stickied': stickied,
    'url': url,
    'subreddit_subscribers': subredditSubscribers,
    'created_utc': createdUtc,
    'num_crossposts': numCrossposts,
    'media': media,
    'is_video': isVideo,
  };

  Data clone() =>
      Data.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
