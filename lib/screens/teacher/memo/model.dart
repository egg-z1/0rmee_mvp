class MemoCreateModel {
  final String title;

  MemoCreateModel({required this.title});

  factory MemoCreateModel.fronJson(Map<String, dynamic> json) {
    return MemoCreateModel(title: json['title']);
  }

  Map<String, dynamic> toJson() => {'title': title};
}

class Memo {
  final int id;
  final String title;
  final String? description;
  final DateTime dueTime;
  final bool isOpen;
  final int submitCount;

  Memo({
    required this.id,
    required this.title,
    this.description,
    required this.dueTime,
    required this.isOpen,
    required this.submitCount,
  });

  factory Memo.fromJson(Map<String, dynamic> json) {
    return Memo(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Untitled',
      description: json['description'],
      dueTime: DateTime.parse(json['dueTime'] ?? DateTime.now().toString()),
      isOpen: json['isOpen'] ?? false,
      submitCount: json['submitCount'] ?? 0,
    );
  }
}

class MemosResponse {
  final List<Memo> openMemos;
  final List<Memo> closeMemos;

  MemosResponse({required this.openMemos, required this.closeMemos});

  factory MemosResponse.fromJson(Map<String, dynamic> json) {
    return MemosResponse(
      openMemos: (json['data']['openMemos'] as List)
          .map((memo) => Memo.fromJson(memo))
          .toList(),
      closeMemos: (json['data']['closeMemos'] as List)
          .map((memo) => Memo.fromJson(memo))
          .toList(),
    );
  }
}

class MessageStatistics {
  final int rank;
  final int contentDetail;
  final double submitRate;
  final int submit;

  MessageStatistics({
    required this.rank,
    required this.contentDetail,
    required this.submitRate,
    required this.submit,
  });

  factory MessageStatistics.fromJson(Map<String, dynamic> json) {
    return MessageStatistics(
      rank: json['rank'],
      contentDetail: json['contentDetail'],
      submitRate: json['submitRate'],
      submit: json['submit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'contentDetail': contentDetail,
      'submitRate': submitRate,
      'submit': submit,
    };
  }
}
