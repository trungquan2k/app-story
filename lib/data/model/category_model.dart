class BookModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  // List<Stories>? stories;

  BookModel({this.id, this.name, this.slug, this.description});

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    // if (json['stories'] != null) {
    //   stories = <Stories>[];
    //   json['stories'].forEach((v) {
    //     stories!.add(new Stories.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    // if (this.stories != null) {
    //   data['stories'] = this.stories!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Stories {
  int? id;
  String? title;
  String? author;
  String? slug;
  List<String>? description;
  String? poster;
  List<String>? categoryList;
  List<String>? categories;
  String? status;
  List<Comments>? comments;
  List<Ratings>? ratings;
  List<Bookmarks>? bookmarks;
  String? uploadDate;
  String? updatedDate;
  String? deletedAt;
  int? rateCount;
  int? rateAvg;
  Permissions? favorite;
  Permissions? latestUpdatedDate;

  Stories(
      {this.id,
      this.title,
      this.author,
      this.slug,
      this.description,
      this.poster,
      this.categoryList,
      this.categories,
      this.status,
      this.comments,
      this.ratings,
      this.bookmarks,
      this.uploadDate,
      this.updatedDate,
      this.deletedAt,
      this.rateCount,
      this.rateAvg,
      this.favorite,
      this.latestUpdatedDate});

  Stories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    slug = json['slug'];
    description = json['description'].cast<String>();
    poster = json['poster'];
    categoryList = json['categoryList'].cast<String>();
    categories = json['categories'].cast<String>();
    status = json['status'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }

    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(new Ratings.fromJson(v));
      });
    }
    if (json['bookmarks'] != null) {
      bookmarks = <Bookmarks>[];
      json['bookmarks'].forEach((v) {
        bookmarks!.add(new Bookmarks.fromJson(v));
      });
    }

    uploadDate = json['uploadDate'];
    updatedDate = json['updatedDate'];
    deletedAt = json['deletedAt'];
    rateCount = json['rateCount'];
    rateAvg = json['rateAvg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['poster'] = this.poster;
    data['categoryList'] = this.categoryList;
    data['categories'] = this.categories;
    data['status'] = this.status;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }

    if (this.ratings != null) {
      data['ratings'] = this.ratings!.map((v) => v.toJson()).toList();
    }
    if (this.bookmarks != null) {
      data['bookmarks'] = this.bookmarks!.map((v) => v.toJson()).toList();
    }

    data['uploadDate'] = this.uploadDate;
    data['updatedDate'] = this.updatedDate;
    data['deletedAt'] = this.deletedAt;
    data['rateCount'] = this.rateCount;
    data['rateAvg'] = this.rateAvg;

    return data;
  }
}

class Comments {
  int? id;
  String? content;
  String? story;
  String? parent;
  List<String>? replies;
  int? parentId;
  User? user;
  String? updatedDate;
  String? deletedAt;

  Comments(
      {this.id,
      this.content,
      this.story,
      this.parent,
      this.replies,
      this.parentId,
      this.user,
      this.updatedDate,
      this.deletedAt});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    story = json['story'];
    parent = json['parent'];
    replies = json['replies'].cast<String>();
    parentId = json['parentId'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    updatedDate = json['updatedDate'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['story'] = this.story;
    data['parent'] = this.parent;
    data['replies'] = this.replies;
    data['parentId'] = this.parentId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['updatedDate'] = this.updatedDate;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? name;
  String? password;
  List<String>? roles;
  List<Permissions>? permissions;
  String? avatarFilePath;
  bool? isEmailConfirmed;
  String? updatedDate;
  String? deletedAt;
  List<String>? comments;
  List<String>? ratedStories;
  List<Bookmarks>? bookmarks;

  User({
    this.id,
    this.email,
    this.name,
    this.password,
    this.roles,
    this.permissions,
    this.avatarFilePath,
    this.isEmailConfirmed,
    this.updatedDate,
    this.deletedAt,
    this.comments,
    this.ratedStories,
    this.bookmarks,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    roles = json['roles'].cast<String>();

    avatarFilePath = json['avatarFilePath'];
    isEmailConfirmed = json['isEmailConfirmed'];
    updatedDate = json['updatedDate'];
    deletedAt = json['deletedAt'];
    comments = json['comments'].cast<String>();
    ratedStories = json['ratedStories'].cast<String>();
    if (json['bookmarks'] != null) {
      bookmarks = <Bookmarks>[];
      json['bookmarks'].forEach((v) {
        bookmarks!.add(new Bookmarks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['roles'] = this.roles;

    data['avatarFilePath'] = this.avatarFilePath;
    data['isEmailConfirmed'] = this.isEmailConfirmed;
    data['updatedDate'] = this.updatedDate;
    data['deletedAt'] = this.deletedAt;
    data['comments'] = this.comments;
    data['ratedStories'] = this.ratedStories;
    if (this.bookmarks != null) {
      data['bookmarks'] = this.bookmarks!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Permissions {}

class Bookmarks {
  int? id;
  String? user;
  String? story;
  String? updatedDate;

  Bookmarks({this.id, this.user, this.story, this.updatedDate});

  Bookmarks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    story = json['story'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['story'] = this.story;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}

class Ratings {
  int? id;
  int? value;
  User? user;
  String? story;

  Ratings({this.id, this.value, this.user, this.story});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    story = json['story'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['story'] = this.story;
    return data;
  }
}
