import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/food.dart';
import '../../providers/custom_food_provider.dart';

enum AddEditCustomFoodModalMode { addNew, addFrom, edit }

class AddEditCustomFoodModalArguments {
  final AddEditCustomFoodModalMode mode;
  final Food? food;

  AddEditCustomFoodModalArguments(this.mode, this.food);
}

class AddEditCustomFoodModal extends StatefulWidget {
  static const routeName = '/food/add-edit-custom-food';

  @override
  _AddEditCustomFoodModalState createState() => _AddEditCustomFoodModalState();
}

class _AddEditCustomFoodModalState extends State<AddEditCustomFoodModal> {
  Food foodToEditOrCreate = Food(id: 'temp', origin: 'CUSTOM', title: '');
  final _formKey = GlobalKey<FormState>();
  var _foodTitleController = TextEditingController();
  var _foodCaloriesController = TextEditingController();
  var _foodProteinController = TextEditingController();
  var _foodCarbsController = TextEditingController();
  var _foodFatController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        final args = ModalRoute.of(context)!.settings.arguments
            as AddEditCustomFoodModalArguments;
        if (args.food != null) {
          foodToEditOrCreate = args.food!;
        }
      });

      // Fill all textfields with provided values
      _foodTitleController.text = foodToEditOrCreate.title;

      _foodCaloriesController.text =
          (foodToEditOrCreate.calories ?? '').toString();
      _foodProteinController.text =
          (foodToEditOrCreate.protein ?? '').toString();
      _foodCarbsController.text = (foodToEditOrCreate.carbs ?? '').toString();
      _foodFatController.text = (foodToEditOrCreate.fat ?? '').toString();

      // TODO: Issue #2: All text controllers
    });

    super.initState();
  }

  void _addOrEditFood(Food? food, AddEditCustomFoodModalMode mode) {
    final provider = Provider.of<CustomFoodProvider>(context, listen: false);

    // Set id for new food, id for existing food gets assigned in onInit
    if (mode != AddEditCustomFoodModalMode.edit) {
      foodToEditOrCreate.id = Food.generatedId;
    }

    foodToEditOrCreate.title = _foodTitleController.text;
    foodToEditOrCreate.origin = 'CUSTOM';
    foodToEditOrCreate.calories = _foodCaloriesController.text != ''
        ? double.parse(_foodCaloriesController.text)
        : null;
    foodToEditOrCreate.protein = _foodProteinController.text != ''
        ? double.parse(_foodProteinController.text)
        : null;
    foodToEditOrCreate.carbs = _foodCarbsController.text != ''
        ? double.parse(_foodCarbsController.text)
        : null;
    foodToEditOrCreate.fat = _foodFatController.text != ''
        ? double.parse(_foodFatController.text)
        : null;
    // TODO: Issue #2: All text controllers

    // Update or add based on existing food
    if (mode == AddEditCustomFoodModalMode.edit) {
      provider.updateFood(foodToEditOrCreate);
    } else {
      provider.addFood(foodToEditOrCreate);
    }

    Navigator.pop(context, foodToEditOrCreate);
  }

  bool isNumeric(String? s) {
    if (s == null || s == '') {
      return true;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as AddEditCustomFoodModalArguments;
    final modalMode = args.mode;
    var food = args.food;

    return Scaffold(
      appBar: AppBar(
        title: modalMode == AddEditCustomFoodModalMode.edit
            ? Text('Edit custom food')
            : Text('Add custom food'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, false);
          return true;
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                TextFormField(
                  controller: _foodTitleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _foodCaloriesController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Calories',
                    suffixText: '/ 100 g',
                  ),
                  validator: (value) {
                    if (!isNumeric(value!)) {
                      return 'Only numbers are allowed';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _foodProteinController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Protein',
                    suffixText: '/ 100 g',
                  ),
                  validator: (value) {
                    if (!isNumeric(value!)) {
                      return 'Only numbers are allowed';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _foodCarbsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Carbs',
                    suffixText: '/ 100 g',
                  ),
                  validator: (value) {
                    if (!isNumeric(value!)) {
                      return 'Only numbers are allowed';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _foodFatController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Fat',
                    suffixText: '/ 100 g',
                  ),
                  validator: (value) {
                    if (!isNumeric(value!)) {
                      return 'Only numbers are allowed';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () => {
          if (_formKey.currentState!.validate())
            {
              _addOrEditFood(food, modalMode),
            }
        },
      ),
    );
  }
}
