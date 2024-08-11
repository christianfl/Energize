import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../models/food/food.dart';
import '../../pages/tab_food/add_edit_custom_food_modal.dart';
import '../../providers/custom_food_provider.dart';
import '../../theme/energize_theme.dart';
import '../../widgets/food_list_item.dart';

class FoodPage extends StatefulWidget {
  static const originName = 'CUSTOM';

  static const double _entryPillHeight = 35;
  static const double _entryHeight = 50;

  const FoodPage({super.key});

  @override
  FoodPageState createState() => FoodPageState();
}

class FoodPageState extends State<FoodPage> {
  List<Food> _searchResultFoods = [];
  final _searchInputController = TextEditingController();
  final _scrollController = ScrollController();
  ScrollDirection? _lastScrollDirection;
  bool _isFabExplicitelyVisible = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_lastScrollDirection !=
          _scrollController.position.userScrollDirection) {
        setState(() {
          _lastScrollDirection = _scrollController.position.userScrollDirection;
          _setIsFabExplicitelyVisible(false);
        });
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    populateSearchedFoodList('', Provider.of<CustomFoodProvider>(context));
  }

  void _setIsFabExplicitelyVisible(bool value) {
    setState(() {
      _isFabExplicitelyVisible = value;
    });
  }

  void _navigateToAddCustomFood(BuildContext context) {
    Navigator.of(context).pushNamed(
      AddEditCustomFoodModal.routeName,
      arguments: AddEditCustomFoodModalArguments(
        AddEditCustomFoodModalMode.addNew,
        null,
      ),
    );
  }

  void _navigateToEditCustomFood(BuildContext context, Food food) {
    Navigator.of(context).pushNamed(
      AddEditCustomFoodModal.routeName,
      arguments: AddEditCustomFoodModalArguments(
        AddEditCustomFoodModalMode.edit,
        food,
      ),
    );
  }

  void populateSearchedFoodList(
    String searchText,
    CustomFoodProvider provider,
  ) {
    // No search text, show all custom foods
    if (searchText.isEmpty) {
      setState(() {
        _searchResultFoods = provider.foods;
      });
      // User has searched for some custom food
    } else {
      setState(() {
        _searchResultFoods = provider.foods
            .where(
              (food) =>
                  food.title.toLowerCase().contains(searchText.toLowerCase()),
            )
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final customFoodProvider = Provider.of<CustomFoodProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.customFood,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SearchBar(
              controller: _searchInputController,
              onChanged: (searchString) => populateSearchedFoodList(
                searchString,
                customFoodProvider,
              ),
              hintText: AppLocalizations.of(context)!.searchCustomFood,
              leading: const Icon(Icons.search),
              trailing: [
                IconButton(
                  onPressed: () => {
                    _searchInputController.clear(),
                    populateSearchedFoodList('', customFoodProvider),
                  },
                  icon: const Icon(Icons.clear),
                ),
              ],
              elevation: WidgetStateProperty.all(0),
            ),
          ),
          Expanded(
            child: (_searchResultFoods.isNotEmpty)
                ? ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (ctx, index) {
                      final food = _searchResultFoods[index];
                      return Dismissible(
                        key: Key(food.id),
                        background: Container(
                          color: Theme.of(context).dangerContainer,
                          child: Icon(
                            Icons.delete,
                            color: Theme.of(context).onDangerContainer,
                          ),
                        ),
                        onDismissed: (direction) {
                          final swipedFood = food;
                          customFoodProvider.removeFood(food.id);
                          _setIsFabExplicitelyVisible(true);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${food.title} ${AppLocalizations.of(context)!.deleted}',
                              ),
                              action: SnackBarAction(
                                label: AppLocalizations.of(context)!.undo,
                                onPressed: () {
                                  customFoodProvider.addFood(swipedFood);
                                },
                              ),
                            ),
                          );
                        },
                        child: FoodListItem(
                          food,
                          onTapCallback: _navigateToEditCustomFood,
                          height: FoodPage._entryHeight,
                          pillHeight: FoodPage._entryPillHeight,
                          hideOrigin: true,
                        ),
                      );
                    },
                    itemCount: _searchResultFoods.length,
                  )
                : const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.no_food, size: 100),
                      ],
                    ),
                  ),
          ),
        ],
      ),
      // _isFabExplicitelyVisible is there because otherwise the fab could
      // hide itself after deleting entries until there is no scrollable
      // area anymore
      floatingActionButton: _lastScrollDirection != ScrollDirection.reverse ||
              _isFabExplicitelyVisible
          ? FloatingActionButton(
              onPressed: () => _navigateToAddCustomFood(context),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
