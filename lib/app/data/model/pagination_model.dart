class Pagination {
  int? currentPage;
  int? total;
  int? perPage;
  int? lastPage;
  dynamic nextPageUrl;
  dynamic prevPageUrl;
  String? firstPageUrl;
  String? lastPageUrl;
  List<Link>? links;

  Pagination({
    this.currentPage,
    this.total,
    this.perPage,
    this.lastPage,
    this.nextPageUrl,
    this.prevPageUrl,
    this.firstPageUrl,
    this.lastPageUrl,
    this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"],
        total: json["total"],
        perPage: json["per_page"],
        lastPage: json["last_page"],
        nextPageUrl: json["next_page_url"],
        prevPageUrl: json["prev_page_url"],
        firstPageUrl: json["first_page_url"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "total": total,
        "per_page": perPage,
        "last_page": lastPage,
        "next_page_url": nextPageUrl,
        "prev_page_url": prevPageUrl,
        "first_page_url": firstPageUrl,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
