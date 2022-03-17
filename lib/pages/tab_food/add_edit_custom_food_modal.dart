import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  var activePanelIndex = 0;
  static const double _formFieldWidth = 160;
  static const double _formFieldHeight = 45;
  static const String _numberValidatorText = 'Only numbers are allowed';
  Food foodToEditOrCreate = Food(id: 'temp', origin: 'CUSTOM', title: '');
  final _formKey = GlobalKey<FormState>();
  var _foodTitleController = TextEditingController();
  var _foodCaloriesController = TextEditingController();
  var _foodProteinController = TextEditingController();
  var _foodCarbsController = TextEditingController();
  var _foodFatController = TextEditingController();
  var _foodVitaminAController = TextEditingController();
  var _foodVitaminB1Controller = TextEditingController();
  var _foodVitaminB2Controller = TextEditingController();
  var _foodVitaminB3Controller = TextEditingController();
  var _foodVitaminB5Controller = TextEditingController();
  var _foodVitaminB6Controller = TextEditingController();
  var _foodVitaminB7Controller = TextEditingController();
  var _foodVitaminB9Controller = TextEditingController();
  var _foodVitaminB12Controller = TextEditingController();
  var _foodVitaminCController = TextEditingController();
  var _foodVitaminDController = TextEditingController();
  var _foodVitaminEController = TextEditingController();
  var _foodVitaminKController = TextEditingController();
  var _foodCalciumController = TextEditingController();
  var _foodChlorideController = TextEditingController();
  var _foodMagnesiumController = TextEditingController();
  var _foodPhosphorusController = TextEditingController();
  var _foodPotassiumController = TextEditingController();
  var _foodSodiumController = TextEditingController();
  var _foodChromiumController = TextEditingController();
  var _foodIronController = TextEditingController();
  var _foodFluorineController = TextEditingController();
  var _foodIodineController = TextEditingController();
  var _foodCopperController = TextEditingController();
  var _foodManganeseController = TextEditingController();
  var _foodMolybdenumController = TextEditingController();
  var _foodSeleniumController = TextEditingController();
  var _foodZincController = TextEditingController();
  var _foodMonounsaturatedFatController = TextEditingController();
  var _foodPolyunsaturatedFatController = TextEditingController();
  var _foodOmega3Controller = TextEditingController();
  var _foodOmega6Controller = TextEditingController();
  var _foodSaturatedFatController = TextEditingController();
  var _foodTransFatController = TextEditingController();
  var _foodCholesterolController = TextEditingController();
  var _foodFiberController = TextEditingController();
  var _foodSugarController = TextEditingController();
  var _foodSugarAlcoholController = TextEditingController();
  var _foodStarchController = TextEditingController();
  var _foodWaterController = TextEditingController();
  var _foodCaffeineController = TextEditingController();
  var _foodAlcoholController = TextEditingController();

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
      _foodVitaminAController.text =
          (foodToEditOrCreate.vitaminA ?? '').toString();
      _foodVitaminB1Controller.text =
          (foodToEditOrCreate.vitaminB1 ?? '').toString();
      _foodVitaminB2Controller.text =
          (foodToEditOrCreate.vitaminB2 ?? '').toString();
      _foodVitaminB3Controller.text =
          (foodToEditOrCreate.vitaminB3 ?? '').toString();
      _foodVitaminB5Controller.text =
          (foodToEditOrCreate.vitaminB5 ?? '').toString();
      _foodVitaminB6Controller.text =
          (foodToEditOrCreate.vitaminB6 ?? '').toString();
      _foodVitaminB7Controller.text =
          (foodToEditOrCreate.vitaminB7 ?? '').toString();
      _foodVitaminB9Controller.text =
          (foodToEditOrCreate.vitaminB9 ?? '').toString();
      _foodVitaminB12Controller.text =
          (foodToEditOrCreate.vitaminB12 ?? '').toString();
      _foodVitaminCController.text =
          (foodToEditOrCreate.vitaminC ?? '').toString();
      _foodVitaminDController.text =
          (foodToEditOrCreate.vitaminD ?? '').toString();
      _foodVitaminEController.text =
          (foodToEditOrCreate.vitaminE ?? '').toString();
      _foodVitaminKController.text =
          (foodToEditOrCreate.vitaminK ?? '').toString();
      _foodCalciumController.text =
          (foodToEditOrCreate.calcium ?? '').toString();
      _foodChlorideController.text =
          (foodToEditOrCreate.chloride ?? '').toString();
      _foodMagnesiumController.text =
          (foodToEditOrCreate.magnesium ?? '').toString();
      _foodPhosphorusController.text =
          (foodToEditOrCreate.phosphorus ?? '').toString();
      _foodPotassiumController.text =
          (foodToEditOrCreate.potassium ?? '').toString();
      _foodSodiumController.text = (foodToEditOrCreate.sodium ?? '').toString();
      _foodChromiumController.text =
          (foodToEditOrCreate.chromium ?? '').toString();
      _foodIronController.text = (foodToEditOrCreate.iron ?? '').toString();
      _foodFluorineController.text =
          (foodToEditOrCreate.fluorine ?? '').toString();
      _foodIodineController.text = (foodToEditOrCreate.iodine ?? '').toString();
      _foodCopperController.text = (foodToEditOrCreate.copper ?? '').toString();
      _foodManganeseController.text =
          (foodToEditOrCreate.manganese ?? '').toString();
      _foodMolybdenumController.text =
          (foodToEditOrCreate.molybdenum ?? '').toString();
      _foodSeleniumController.text =
          (foodToEditOrCreate.selenium ?? '').toString();
      _foodZincController.text = (foodToEditOrCreate.zinc ?? '').toString();
      _foodMonounsaturatedFatController.text =
          (foodToEditOrCreate.monounsaturatedFat ?? '').toString();
      _foodPolyunsaturatedFatController.text =
          (foodToEditOrCreate.polyunsaturatedFat ?? '').toString();
      _foodOmega3Controller.text = (foodToEditOrCreate.omega3 ?? '').toString();
      _foodOmega6Controller.text = (foodToEditOrCreate.omega6 ?? '').toString();
      _foodSaturatedFatController.text =
          (foodToEditOrCreate.saturatedFat ?? '').toString();
      _foodTransFatController.text =
          (foodToEditOrCreate.transFat ?? '').toString();
      _foodCholesterolController.text =
          (foodToEditOrCreate.cholesterol ?? '').toString();
      _foodFiberController.text = (foodToEditOrCreate.fiber ?? '').toString();
      _foodSugarController.text = (foodToEditOrCreate.sugar ?? '').toString();
      _foodSugarAlcoholController.text =
          (foodToEditOrCreate.sugarAlcohol ?? '').toString();
      _foodStarchController.text = (foodToEditOrCreate.starch ?? '').toString();
      _foodWaterController.text = (foodToEditOrCreate.water ?? '').toString();
      _foodCaffeineController.text =
          (foodToEditOrCreate.caffeine ?? '').toString();
      _foodAlcoholController.text =
          (foodToEditOrCreate.alcohol ?? '').toString();
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
    foodToEditOrCreate.vitaminA = _foodVitaminAController.text != ''
        ? double.parse(_foodVitaminAController.text)
        : null;
    foodToEditOrCreate.vitaminB1 = _foodVitaminB1Controller.text != ''
        ? double.parse(_foodVitaminB1Controller.text)
        : null;
    foodToEditOrCreate.vitaminB2 = _foodVitaminB2Controller.text != ''
        ? double.parse(_foodVitaminB2Controller.text)
        : null;
    foodToEditOrCreate.vitaminB3 = _foodVitaminB3Controller.text != ''
        ? double.parse(_foodVitaminB3Controller.text)
        : null;
    foodToEditOrCreate.vitaminB5 = _foodVitaminB5Controller.text != ''
        ? double.parse(_foodVitaminB5Controller.text)
        : null;
    foodToEditOrCreate.vitaminB6 = _foodVitaminB6Controller.text != ''
        ? double.parse(_foodVitaminB6Controller.text)
        : null;
    foodToEditOrCreate.vitaminB7 = _foodVitaminB7Controller.text != ''
        ? double.parse(_foodVitaminB7Controller.text)
        : null;
    foodToEditOrCreate.vitaminB9 = _foodVitaminB9Controller.text != ''
        ? double.parse(_foodVitaminB9Controller.text)
        : null;
    foodToEditOrCreate.vitaminB12 = _foodVitaminB12Controller.text != ''
        ? double.parse(_foodVitaminB12Controller.text)
        : null;
    foodToEditOrCreate.vitaminC = _foodVitaminCController.text != ''
        ? double.parse(_foodVitaminCController.text)
        : null;
    foodToEditOrCreate.vitaminD = _foodVitaminDController.text != ''
        ? double.parse(_foodVitaminDController.text)
        : null;
    foodToEditOrCreate.vitaminE = _foodVitaminEController.text != ''
        ? double.parse(_foodVitaminEController.text)
        : null;
    foodToEditOrCreate.vitaminK = _foodVitaminKController.text != ''
        ? double.parse(_foodVitaminKController.text)
        : null;
    foodToEditOrCreate.calcium = _foodCalciumController.text != ''
        ? double.parse(_foodCalciumController.text)
        : null;
    foodToEditOrCreate.chloride = _foodChlorideController.text != ''
        ? double.parse(_foodChlorideController.text)
        : null;
    foodToEditOrCreate.magnesium = _foodMagnesiumController.text != ''
        ? double.parse(_foodMagnesiumController.text)
        : null;
    foodToEditOrCreate.phosphorus = _foodPhosphorusController.text != ''
        ? double.parse(_foodPhosphorusController.text)
        : null;
    foodToEditOrCreate.potassium = _foodPotassiumController.text != ''
        ? double.parse(_foodPotassiumController.text)
        : null;
    foodToEditOrCreate.vitaminK = _foodVitaminKController.text != ''
        ? double.parse(_foodVitaminKController.text)
        : null;
    foodToEditOrCreate.sodium = _foodSodiumController.text != ''
        ? double.parse(_foodSodiumController.text)
        : null;
    foodToEditOrCreate.chromium = _foodChromiumController.text != ''
        ? double.parse(_foodChromiumController.text)
        : null;
    foodToEditOrCreate.iron = _foodIronController.text != ''
        ? double.parse(_foodIronController.text)
        : null;
    foodToEditOrCreate.fluorine = _foodFluorineController.text != ''
        ? double.parse(_foodFluorineController.text)
        : null;
    foodToEditOrCreate.iodine = _foodIodineController.text != ''
        ? double.parse(_foodIodineController.text)
        : null;
    foodToEditOrCreate.copper = _foodCopperController.text != ''
        ? double.parse(_foodCopperController.text)
        : null;
    foodToEditOrCreate.manganese = _foodManganeseController.text != ''
        ? double.parse(_foodManganeseController.text)
        : null;
    foodToEditOrCreate.molybdenum = _foodMolybdenumController.text != ''
        ? double.parse(_foodMolybdenumController.text)
        : null;
    foodToEditOrCreate.selenium = _foodSeleniumController.text != ''
        ? double.parse(_foodSeleniumController.text)
        : null;
    foodToEditOrCreate.zinc = _foodZincController.text != ''
        ? double.parse(_foodZincController.text)
        : null;
    foodToEditOrCreate.monounsaturatedFat =
        _foodMonounsaturatedFatController.text != ''
            ? double.parse(_foodMonounsaturatedFatController.text)
            : null;
    foodToEditOrCreate.polyunsaturatedFat =
        _foodPolyunsaturatedFatController.text != ''
            ? double.parse(_foodPolyunsaturatedFatController.text)
            : null;
    foodToEditOrCreate.omega3 = _foodOmega3Controller.text != ''
        ? double.parse(_foodOmega3Controller.text)
        : null;
    foodToEditOrCreate.omega6 = _foodOmega6Controller.text != ''
        ? double.parse(_foodOmega6Controller.text)
        : null;
    foodToEditOrCreate.saturatedFat = _foodSaturatedFatController.text != ''
        ? double.parse(_foodSaturatedFatController.text)
        : null;
    foodToEditOrCreate.transFat = _foodTransFatController.text != ''
        ? double.parse(_foodTransFatController.text)
        : null;
    foodToEditOrCreate.cholesterol = _foodCholesterolController.text != ''
        ? double.parse(_foodCholesterolController.text)
        : null;
    foodToEditOrCreate.fiber = _foodFiberController.text != ''
        ? double.parse(_foodFiberController.text)
        : null;
    foodToEditOrCreate.sugar = _foodSugarController.text != ''
        ? double.parse(_foodSugarController.text)
        : null;
    foodToEditOrCreate.sugarAlcohol = _foodSugarAlcoholController.text != ''
        ? double.parse(_foodSugarAlcoholController.text)
        : null;
    foodToEditOrCreate.starch = _foodStarchController.text != ''
        ? double.parse(_foodStarchController.text)
        : null;
    foodToEditOrCreate.water = _foodWaterController.text != ''
        ? double.parse(_foodWaterController.text)
        : null;
    foodToEditOrCreate.caffeine = _foodCaffeineController.text != ''
        ? double.parse(_foodCaffeineController.text)
        : null;
    foodToEditOrCreate.alcohol = _foodAlcoholController.text != ''
        ? double.parse(_foodAlcoholController.text)
        : null;

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
            ? Text(AppLocalizations.of(context)!.editCustomFood)
            : Text(AppLocalizations.of(context)!.addCustomFood),
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
                SizedBox(
                  height: 10,
                ),
                // Start Micronutrients Expansion Panel
                ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) {
                    setState(() {
                      if (activePanelIndex == panelIndex) {
                        activePanelIndex = -1;
                      } else {
                        activePanelIndex = panelIndex;
                      }
                    });
                  },
                  children: <ExpansionPanel>[
                    ExpansionPanel(
                      isExpanded: activePanelIndex == 0,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text('Energy and macronutrients'),
                          subtitle: Text('Calories, Protein, Carbs, Fat'),
                        );
                      },
                      body: Column(
                        children: [
                          ListTile(
                            title: Text('Calories'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodCaloriesController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'kcal / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(AppLocalizations.of(context)!.protein),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodProteinController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(AppLocalizations.of(context)!.carbs),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodCarbsController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(AppLocalizations.of(context)!.fat),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodFatController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ExpansionPanel(
                      isExpanded: activePanelIndex == 1,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text('Vitamins'),
                          subtitle: Text('Vitamin A – K'),
                        );
                      },
                      body: Column(
                        children: [
                          ListTile(
                            title: Text('Vitamin A'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminAController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Vitamin B1'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminB1Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Vitamin B2'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminB2Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Vitamin B3'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminB3Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Vitamin B5'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminB5Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Vitamin B6'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminB6Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Vitamin B7'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminB7Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'μg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Vitamin B9'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminB9Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'μg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Vitamin B12'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminB12Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'μg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Vitamin C'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminCController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Vitamin D'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminDController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'μg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Vitamin E'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminEController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Vitamin K'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodVitaminKController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'μg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ExpansionPanel(
                      isExpanded: activePanelIndex == 2,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text('Major minerals'),
                          subtitle: Text('Calcium – Sodium'),
                        );
                      },
                      body: Column(
                        children: [
                          ListTile(
                            title: Text('Calcium'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodCalciumController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Chloride'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodChlorideController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Magnesium'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodMagnesiumController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Phosphorus'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodPhosphorusController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Potassium'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodPotassiumController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Sodium'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodSodiumController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ExpansionPanel(
                      isExpanded: activePanelIndex == 3,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text('Trace elements'),
                          subtitle: Text('Chromium – Zinc'),
                        );
                      },
                      body: Column(
                        children: [
                          ListTile(
                            title: Text('Chromium'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodChromiumController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'μg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Iron'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodIronController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Fluorine'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodFluorineController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Iodine'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodIodineController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'μg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Copper'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodCopperController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Manganese'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodManganeseController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Molybdenum'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodMolybdenumController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'μg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Selenium'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodSeleniumController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'μg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Zinc'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodZincController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ExpansionPanel(
                      isExpanded: activePanelIndex == 4,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text('Fats'),
                          subtitle: Text('Different kind of fats'),
                        );
                      },
                      body: Column(
                        children: [
                          ListTile(
                            title: Text('Monounsaturated fat'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodMonounsaturatedFatController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Polyunsaturated fat'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodPolyunsaturatedFatController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Omega 3'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodOmega3Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Omega 6'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodOmega6Controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Saturated fat'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodSaturatedFatController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Transfat'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodTransFatController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Cholesterol'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodCholesterolController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ExpansionPanel(
                      isExpanded: activePanelIndex == 5,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text('Carbs'),
                          subtitle: Text('Fiber, sugar, starch, etc.'),
                        );
                      },
                      body: Column(
                        children: [
                          ListTile(
                            title: Text('Fiber'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodFiberController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Sugar'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodSugarController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Sugar alcohol'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodSugarAlcoholController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Starch'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodStarchController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ExpansionPanel(
                      isExpanded: activePanelIndex == 6,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text('Other'),
                          subtitle: Text('Water, caffeine, alcohol'),
                        );
                      },
                      body: Column(
                        children: [
                          ListTile(
                            title: Text('Water'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodWaterController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'ml / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Caffeine'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodCaffeineController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'mg / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Alcohol'),
                            trailing: Container(
                              width: _formFieldWidth,
                              height: _formFieldHeight,
                              child: TextFormField(
                                controller: _foodAlcoholController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'g / 100 g',
                                ),
                                validator: (value) {
                                  if (!isNumeric(value!)) {
                                    return _numberValidatorText;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
