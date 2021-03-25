class QuranFile {
  final String name;
  final String url;
  String? description;
  final bool required;
  final QuranFileType quranFileType;
  final int version;
  final bool needRefresh;

  QuranFile(
      {required this.name,
      required this.required,
      required this.version,
      required this.quranFileType,
      required this.needRefresh,
      this.description,
      required this.url});

  static final quranFiles = [
    QuranFile(
        name: 'ayahinfo_1280.db',
        required: true,
        version: 1,
        quranFileType: QuranFileType.ayahInfo,
        needRefresh: false,
        description: '',
        url:
            'https://raw.githubusercontent.com/SadaqaWorks/IslamicDatabase/master/Quran/db/ayahinfo_1280.db')
  ];
}

enum QuranFileType { ayahInfo, translation, wordByWord, audio }
