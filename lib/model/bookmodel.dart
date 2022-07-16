class BookModel {
  final String? kind;
  final int? totalItems;
  final List<Items>? items;

  BookModel({
    this.kind,
    this.totalItems,
    this.items,
  });

  BookModel.fromJson(Map<String, dynamic> json)
      : kind = json['kind'] as String?,
        totalItems = json['totalItems'] as int?,
        items = (json['items'] as List?)
            ?.map((dynamic e) => Items.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'totalItems': totalItems,
        'items': items?.map((e) => e.toJson()).toList()
      };
}

class Items {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

  Items({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  Items.fromJson(Map<String, dynamic> json)
      : kind = json['kind'] as String?,
        id = json['id'] as String?,
        etag = json['etag'] as String?,
        selfLink = json['selfLink'] as String?,
        volumeInfo = (json['volumeInfo'] as Map<String, dynamic>?) != null
            ? VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>)
            : null,
        saleInfo = (json['saleInfo'] as Map<String, dynamic>?) != null
            ? SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>)
            : null,
        accessInfo = (json['accessInfo'] as Map<String, dynamic>?) != null
            ? AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>)
            : null,
        searchInfo = (json['searchInfo'] as Map<String, dynamic>?) != null
            ? SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo?.toJson(),
        'saleInfo': saleInfo?.toJson(),
        'accessInfo': accessInfo?.toJson(),
        'searchInfo': searchInfo?.toJson()
      };
}

class VolumeInfo {
  final String? title;
  final String? subtitle;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifiers>? industryIdentifiers;
  final ReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final int? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  VolumeInfo.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        subtitle = json['subtitle'] as String?,
        authors = (json['authors'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        publisher = json['publisher'] as String?,
        publishedDate = json['publishedDate'] as String?,
        description = json['description'] as String?,
        industryIdentifiers = (json['industryIdentifiers'] as List?)
            ?.map((dynamic e) =>
                IndustryIdentifiers.fromJson(e as Map<String, dynamic>))
            .toList(),
        readingModes = (json['readingModes'] as Map<String, dynamic>?) != null
            ? ReadingModes.fromJson(
                json['readingModes'] as Map<String, dynamic>)
            : null,
        pageCount = json['pageCount'] as int?,
        printType = json['printType'] as String?,
        categories = (json['categories'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        averageRating = json['averageRating'] as int?,
        ratingsCount = json['ratingsCount'] as int?,
        maturityRating = json['maturityRating'] as String?,
        allowAnonLogging = json['allowAnonLogging'] as bool?,
        contentVersion = json['contentVersion'] as String?,
        imageLinks = (json['imageLinks'] as Map<String, dynamic>?) != null
            ? ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>)
            : null,
        language = json['language'] as String?,
        previewLink = json['previewLink'] as String?,
        infoLink = json['infoLink'] as String?,
        canonicalVolumeLink = json['canonicalVolumeLink'] as String?;

  Map<String, dynamic> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'authors': authors,
        'publisher': publisher,
        'publishedDate': publishedDate,
        'description': description,
        'industryIdentifiers':
            industryIdentifiers?.map((e) => e.toJson()).toList(),
        'readingModes': readingModes?.toJson(),
        'pageCount': pageCount,
        'printType': printType,
        'categories': categories,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
        'maturityRating': maturityRating,
        'allowAnonLogging': allowAnonLogging,
        'contentVersion': contentVersion,
        'imageLinks': imageLinks?.toJson(),
        'language': language,
        'previewLink': previewLink,
        'infoLink': infoLink,
        'canonicalVolumeLink': canonicalVolumeLink
      };
}

class IndustryIdentifiers {
  final String? type;
  final String? identifier;

  IndustryIdentifiers({
    this.type,
    this.identifier,
  });

  IndustryIdentifiers.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        identifier = json['identifier'] as String?;

  Map<String, dynamic> toJson() => {'type': type, 'identifier': identifier};
}

class ReadingModes {
  final bool? text;
  final bool? image;

  ReadingModes({
    this.text,
    this.image,
  });

  ReadingModes.fromJson(Map<String, dynamic> json)
      : text = json['text'] as bool?,
        image = json['image'] as bool?;

  Map<String, dynamic> toJson() => {'text': text, 'image': image};
}

class ImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  ImageLinks.fromJson(Map<String, dynamic> json)
      : smallThumbnail = json['smallThumbnail'] as String?,
        thumbnail = json['thumbnail'] as String?;

  Map<String, dynamic> toJson() =>
      {'smallThumbnail': smallThumbnail, 'thumbnail': thumbnail};
}

class SaleInfo {
  final String? country;
  final String? saleability;
  final bool? isEbook;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
  });

  SaleInfo.fromJson(Map<String, dynamic> json)
      : country = json['country'] as String?,
        saleability = json['saleability'] as String?,
        isEbook = json['isEbook'] as bool?;

  Map<String, dynamic> toJson() =>
      {'country': country, 'saleability': saleability, 'isEbook': isEbook};
}

class AccessInfo {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final Epub? epub;
  final Pdf? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  AccessInfo.fromJson(Map<String, dynamic> json)
      : country = json['country'] as String?,
        viewability = json['viewability'] as String?,
        embeddable = json['embeddable'] as bool?,
        publicDomain = json['publicDomain'] as bool?,
        textToSpeechPermission = json['textToSpeechPermission'] as String?,
        epub = (json['epub'] as Map<String, dynamic>?) != null
            ? Epub.fromJson(json['epub'] as Map<String, dynamic>)
            : null,
        pdf = (json['pdf'] as Map<String, dynamic>?) != null
            ? Pdf.fromJson(json['pdf'] as Map<String, dynamic>)
            : null,
        webReaderLink = json['webReaderLink'] as String?,
        accessViewStatus = json['accessViewStatus'] as String?,
        quoteSharingAllowed = json['quoteSharingAllowed'] as bool?;

  Map<String, dynamic> toJson() => {
        'country': country,
        'viewability': viewability,
        'embeddable': embeddable,
        'publicDomain': publicDomain,
        'textToSpeechPermission': textToSpeechPermission,
        'epub': epub?.toJson(),
        'pdf': pdf?.toJson(),
        'webReaderLink': webReaderLink,
        'accessViewStatus': accessViewStatus,
        'quoteSharingAllowed': quoteSharingAllowed
      };
}

class Epub {
  final bool? isAvailable;

  Epub({
    this.isAvailable,
  });

  Epub.fromJson(Map<String, dynamic> json)
      : isAvailable = json['isAvailable'] as bool?;

  Map<String, dynamic> toJson() => {'isAvailable': isAvailable};
}

class Pdf {
  final bool? isAvailable;

  Pdf({
    this.isAvailable,
  });

  Pdf.fromJson(Map<String, dynamic> json)
      : isAvailable = json['isAvailable'] as bool?;

  Map<String, dynamic> toJson() => {'isAvailable': isAvailable};
}

class SearchInfo {
  final String? textSnippet;

  SearchInfo({
    this.textSnippet,
  });

  SearchInfo.fromJson(Map<String, dynamic> json)
      : textSnippet = json['textSnippet'] as String?;

  Map<String, dynamic> toJson() => {'textSnippet': textSnippet};
}
