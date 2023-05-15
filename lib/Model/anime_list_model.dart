class AnimeList {
  final List<Data>? data;
  final Pagination? pagination;

  AnimeList({
    this.data,
    this.pagination,
  });

  AnimeList.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList(),
        pagination = (json['pagination'] as Map<String,dynamic>?) != null ? Pagination.fromJson(json['pagination'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'data' : data?.map((e) => e.toJson()).toList(),
    'pagination' : pagination?.toJson()
  };
}

class Data {
  final String? malId;
  final List<Entry>? entry;
  final String? content;
  final User? user;

  Data({
    this.malId,
    this.entry,
    this.content,
    this.user,
  });

  Data.fromJson(Map<String, dynamic> json)
      : malId = json['mal_id'] as String?,
        entry = (json['entry'] as List?)?.map((dynamic e) => Entry.fromJson(e as Map<String,dynamic>)).toList(),
        content = json['content'] as String?,
        user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'mal_id' : malId,
    'entry' : entry?.map((e) => e.toJson()).toList(),
    'content' : content,
    'user' : user?.toJson()
  };
}

class Entry {
  final int? malId;
  final String? url;
  final Images? images;
  final String? title;

  Entry({
    this.malId,
    this.url,
    this.images,
    this.title,
  });

  Entry.fromJson(Map<String, dynamic> json)
      : malId = json['mal_id'] as int?,
        url = json['url'] as String?,
        images = (json['images'] as Map<String,dynamic>?) != null ? Images.fromJson(json['images'] as Map<String,dynamic>) : null,
        title = json['title'] as String?;

  Map<String, dynamic> toJson() => {
    'mal_id' : malId,
    'url' : url,
    'images' : images?.toJson(),
    'title' : title
  };
}

class Images {
  final Jpg? jpg;
  final Webp? webp;

  Images({
    this.jpg,
    this.webp,
  });

  Images.fromJson(Map<String, dynamic> json)
      : jpg = (json['jpg'] as Map<String,dynamic>?) != null ? Jpg.fromJson(json['jpg'] as Map<String,dynamic>) : null,
        webp = (json['webp'] as Map<String,dynamic>?) != null ? Webp.fromJson(json['webp'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'jpg' : jpg?.toJson(),
    'webp' : webp?.toJson()
  };
}

class Jpg {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  Jpg({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  Jpg.fromJson(Map<String, dynamic> json)
      : imageUrl = json['image_url'] as String?,
        smallImageUrl = json['small_image_url'] as String?,
        largeImageUrl = json['large_image_url'] as String?;

  Map<String, dynamic> toJson() => {
    'image_url' : imageUrl,
    'small_image_url' : smallImageUrl,
    'large_image_url' : largeImageUrl
  };
}

class Webp {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  Webp({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  Webp.fromJson(Map<String, dynamic> json)
      : imageUrl = json['image_url'] as String?,
        smallImageUrl = json['small_image_url'] as String?,
        largeImageUrl = json['large_image_url'] as String?;

  Map<String, dynamic> toJson() => {
    'image_url' : imageUrl,
    'small_image_url' : smallImageUrl,
    'large_image_url' : largeImageUrl
  };
}

class User {
  final String? url;
  final String? username;

  User({
    this.url,
    this.username,
  });

  User.fromJson(Map<String, dynamic> json)
      : url = json['url'] as String?,
        username = json['username'] as String?;

  Map<String, dynamic> toJson() => {
    'url' : url,
    'username' : username
  };
}

class Pagination {
  final int? lastVisiblePage;
  final bool? hasNextPage;

  Pagination({
    this.lastVisiblePage,
    this.hasNextPage,
  });

  Pagination.fromJson(Map<String, dynamic> json)
      : lastVisiblePage = json['last_visible_page'] as int?,
        hasNextPage = json['has_next_page'] as bool?;

  Map<String, dynamic> toJson() => {
    'last_visible_page' : lastVisiblePage,
    'has_next_page' : hasNextPage
  };
}