import "package:testflutter/tools/http.dart";

class SearchQuery extends APIQueryBase {
  final String queryString;
  final String limit;
  final String offset;

  const SearchQuery({this.queryString, this.limit, this.offset});
}

searchByString(SearchQuery searchQuery) async {
  final data = await dio.get('/search', data: {
    "q": searchQuery.queryString,
    "client_id": searchQuery.clientId,
    "limit": searchQuery.limit,
    "offset": searchQuery.offset
  });
  print(data.data);
}
