import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/poke_list_item.dart';
import 'package:pokemon/providers/pokemon_provider.dart';

class Pokelist extends ConsumerWidget {
  const Pokelist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const int more = 30;
    int pokeCount = more;
    final pokemonsNotifier = ref.watch(pokemonsProvider.notifier);
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      itemCount: pokeCount + 1,
      itemBuilder: (context, index) {
        if (index == pokeCount) {}

        /// 詰まっていた形跡↓↓↓（振り返り用）
        // final pokes = ref.watch(pokemonsProvider);
        /// byIDが使えないのはpokesをここで持っていないから？
        /// pokesはどうやって持ってくる？？
        /// return PokeListItem(poke: pokes.byId(index + 1));
        return PokeListItem(poke: pokemonsNotifier.byId(index + 1));
      },
    );
  }
}
/// 現在詰まっているところ↓↓↓
/// @override以下を置き換え
/// 課題：setStateするところで、画面の再描画は同書き換えが必要か？
/// 
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // const int more = 30;
//     // int pokeCount = more;
//     final pokemonsNotifier = ref.watch(pokemonsProvider.notifier);
//     return ListView.builder(
//       padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//       // itemCount: pokeCount + 1,
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         // if (index == pokeCount) {
//         //   return OutlinedButton(
//         //     child: Text('more'),
//         //     onPressed: () => {
//         //  /// 今詰まっているところ↓↓↓
//         //  /// setStateを使わずに再描画できるはずだが、この場合どうするか？
//         //       setState(
//         //         () {
//         //           pokeCount = pokeCount + more;
//         //           if (pokeCount > pokeMaxId) {
//         //             pokeCount = pokeMaxId;
//         //           }
//         //         },
//         //       )
//         //     },
//         //   );
//         // } else {
//         //   /// 詰まっていた形跡↓↓↓（振り返り用）
//         //   // final pokes = ref.watch(pokemonsProvider);
//         //   /// byIDが使えないのはpokesをここで持っていないから？
//         //   /// pokesはどうやって持ってくる？？
//         //   /// return PokeListItem(poke: pokes.byId(index + 1));
//         //   return PokeListItem(poke: pokemonsNotifier.byId(index + 1));
//         // }
//         return PokeListItem(poke: pokemonsNotifier.byId(index + 1));
//       },
//     );
//   }
// }
