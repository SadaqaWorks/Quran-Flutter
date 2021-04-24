import 'dart:async';
import 'dart:io' as io;

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:quran_reader/common/connectivity/ConnectivityService.dart';
import 'package:quran_reader/common/http/api_provider.dart';
import 'package:quran_reader/common/model/resource/resource.dart';
import 'package:quran_reader/common/quran/quran_info.dart';
import 'package:quran_reader/common/storage/provider/pref_provider.dart';
import 'package:quran_reader/feature/quran_page/model/quran_page.dart';
import 'package:quran_reader/feature/quran_page/provider/quran_page_state.dart';

final quranPageRepositoryProvider = Provider<QuranPageRepository>((ref) {
  final prefService = ref.watch(prefServiceProvider);

  return QuranPageRepository(ref.watch(apiProvider),
      ref.watch(quranInfoProvider), ref.watch(connectivityCheckProvider));
});

class QuranPageRepository {
  final APIProvider apiProvider;
  final QuranInfoRepository quranInfoRepository;
  late final Resource _quranResource;

  final ConnectivityCheck connectivityCheck;
  late StreamSubscription _connectivityStreamSubscription;

  QuranPageRepository(
      this.apiProvider, this.quranInfoRepository, this.connectivityCheck) {
    _connectivityStreamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {}
    });
  }

  void dispose() {
    _connectivityStreamSubscription.cancel();
  }

  Stream<QuranPageState> fetchQuranPage(int pageNumber) async* {
    if (pageNumber >= quranInfoRepository.startPage &&
        pageNumber <= quranInfoRepository.numberOfPages) {
      if (kIsWeb) {
        final imageFile = ImageFile(
            _quranResource.url +
                '/page${pageNumber.toString().padLeft(3, '0')}.png',
            ImageLoadPolicy.network);
        final quranPage = QuranPage(pageNumber, imageFile);
        yield QuranPageState.loaded(quranPage);
      } else {
        io.Directory documentDirectory =
            await getApplicationDocumentsDirectory();

        String filePath = path.join(
            documentDirectory.path +
                _quranResource.resourceType.toString() +
                _quranResource.name,
            'page${pageNumber.toString().padLeft(3, '0')}.png');

        bool exists = await io.File(filePath).exists();

        if (exists) {
          final quranPage =
              QuranPage(pageNumber, ImageFile(filePath, ImageLoadPolicy.cache));
          yield QuranPageState.loaded(quranPage);
        } else {
          yield QuranPageState.downloading();
          final connectivityStatus = await connectivityCheck.check();
          if (connectivityStatus != ConnectivityStatus.Online) {
            yield QuranPageState.internetUnAvailable();
          } else {
            final resourceUrl = _quranResource.url +
                '/page${pageNumber.toString().padLeft(3, '0')}.png';
            await apiProvider.downloadFile(resourceUrl, filePath);
            bool exists = await io.File(filePath).exists();

            if (exists) {
              final quranPage = QuranPage(
                  pageNumber, ImageFile(filePath, ImageLoadPolicy.cache));
              yield QuranPageState.loaded(quranPage);
            }
          }
        }
      }

      // QuranPage quranPage = QuranPage(
      //     pageNumber: pageNumber,
      //     imageUrl:
      //         'assets/images/1024/page${pageNumber.toString().padLeft(3, '0')}.png');
      // quranPage.suraVerses = quranInfoRepository.suraVerseForPage(pageNumber);
      // return QuranPageState.loaded(quranPage);
    }
  }
}
