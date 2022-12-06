import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Favorite {
  const Favorite({
    required this.id,
  });

  // イミュータブルなクラスのプロパティはすべて `final` にする必要があります。
  final int id;

  Favorite copyWith({
    int? id,
  }) {
    return Favorite(
      id: id ?? this.id,
    );
  }
}

class FavoritesNotifier extends StateNotifier<List<Favorite>> {
  // リストを空のリストとして初期化
  FavoritesNotifier() : super([]);

  void addFav(Favorite fav) {
    state = [...state, fav];
  }

  void removeFav(String favId) {
    state = [
      for (final fav in state)
        if (fav.id != favId) fav,
    ];
  }
}

final FavoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Favorite>>((ref) {
  return FavoritesNotifier();
});
