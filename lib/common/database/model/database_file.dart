class DatabaseFile {
  final String name;
  final String url;

  DatabaseFile({required this.name, required this.url});

  static final databaseFiles = [
    DatabaseFile(
        name: 'ayahinfo_1280.db',
        url:
            'https://raw.githubusercontent.com/SadaqaWorks/IslamicDatabase/master/Quran/db/ayahinfo_1280.db')
  ];
}
