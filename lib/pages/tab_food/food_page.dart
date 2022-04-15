import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import '../../models/food/food.dart';
import '../../pages/tab_food/add_edit_custom_food_modal.dart';
import '../../providers/custom_food_provider.dart';
import '../../widgets/food_list_item.dart';

class FoodPage extends StatefulWidget {
  final double _entryPillHeight = 35;
  final double _entryHeight = 50;

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  List<Food> _searchResultFoods = [];
  var _searchInputController = TextEditingController();
  final _scrollController = ScrollController();
  ScrollDirection? _lastScrollDirection;
  bool _isFabExplicitelyVisible = false;

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
          AddEditCustomFoodModalMode.addNew, null),
    );
  }

  void _navigateToEditCustomFood(BuildContext context, Food food) {
    Navigator.of(context).pushNamed(
      AddEditCustomFoodModal.routeName,
      arguments: AddEditCustomFoodModalArguments(
          AddEditCustomFoodModalMode.edit, food),
    );
  }

  void populateSearchedFoodList(
      String searchText, CustomFoodProvider provider) {
    // No search text, show all custom foods
    if (searchText.length == 0) {
      setState(() {
        _searchResultFoods = provider.foods;
      });
      // User has searched for some custom food
    } else {
      setState(() {
        _searchResultFoods = provider.foods
            .where((food) =>
                food.title.toLowerCase().contains(searchText.toLowerCase()))
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
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: _searchInputController,
                  onChanged: (searchString) => populateSearchedFoodList(
                      searchString, customFoodProvider),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppLocalizations.of(context)!.searchCustomFood,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      onPressed: () => {
                        _searchInputController.clear(),
                        populateSearchedFoodList('', customFoodProvider),
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: (_searchResultFoods.length != 0)
                ? ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(8.0),
                    itemBuilder: (ctx, index) {
                      final food = _searchResultFoods[index];
                      return Dismissible(
                        key: Key(food.id),
                        background: Container(
                          color: Colors.red,
                          child: Icon(
                            Icons.delete,
                          ),
                        ),
                        onDismissed: (direction) {
                          final swipedFood = food;
                          customFoodProvider.removeFood(food.id);
                          _setIsFabExplicitelyVisible(true);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${food.title} deleted!'),
                              action: SnackBarAction(
                                label: "Undo",
                                textColor: Colors.yellow,
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
                          height: widget._entryHeight,
                          pillHeight: widget._entryPillHeight,
                          hideOrigin: true,
                        ),
                      );
                    },
                    itemCount: _searchResultFoods.length,
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.no_food, size: 100),
                      ],
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        // _isFabExplicitelyVisible is there because otherwise the fab could
        // hide itself after deleting entries until there is no scrollable
        // area anymore
        visible: _lastScrollDirection != ScrollDirection.reverse ||
            _isFabExplicitelyVisible,
        onPress: () {
          _navigateToAddCustomFood(context);
        },
        curve: Curves.linear,
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        overlayOpacity: 0,
        animationSpeed: 0,
      ),
    );
  }
}
