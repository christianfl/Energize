import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../models/food/food.dart';
import '../../providers/custom_food_provider.dart';
import '../../theme/energize_theme.dart';
import '../../widgets/category_list_tile_header.dart';
import '../../widgets/nutrition_facts_label_eu.dart';
import 'food_page.dart';

enum AddEditCustomFoodModalMode { addNew, addFrom, edit }

class AddEditCustomFoodModalArguments {
  final AddEditCustomFoodModalMode mode;
  final Food? food;

  AddEditCustomFoodModalArguments(this.mode, this.food);
}

class AddEditCustomFoodModal extends StatefulWidget {
  static const routeName = '/food/add-edit-custom-food';

  static const _foodAvatarRadius = 56.0;

  const AddEditCustomFoodModal({super.key});

  @override
  AddEditCustomFoodModalState createState() => AddEditCustomFoodModalState();
}

class AddEditCustomFoodModalState extends State<AddEditCustomFoodModal> {
  var activePanelIndex = 0;
  Food foodToEditOrCreate = Food(
    id: 'temp',
    origin: FoodPage.originName,
    title: '',
  );
  final _formKey = GlobalKey<FormState>();
  final _foodTitleController = TextEditingController();
  final _foodEanController = TextEditingController();
  final _foodCaloriesController = TextEditingController();
  final _foodProteinController = TextEditingController();
  final _foodCarbsController = TextEditingController();
  final _foodFatController = TextEditingController();
  final _foodVitaminAController = TextEditingController();
  final _foodVitaminB1Controller = TextEditingController();
  final _foodVitaminB2Controller = TextEditingController();
  final _foodVitaminB3Controller = TextEditingController();
  final _foodVitaminB5Controller = TextEditingController();
  final _foodVitaminB6Controller = TextEditingController();
  final _foodVitaminB7Controller = TextEditingController();
  final _foodVitaminB9Controller = TextEditingController();
  final _foodVitaminB12Controller = TextEditingController();
  final _foodVitaminCController = TextEditingController();
  final _foodVitaminDController = TextEditingController();
  final _foodVitaminEController = TextEditingController();
  final _foodVitaminKController = TextEditingController();
  final _foodCalciumController = TextEditingController();
  final _foodChlorideController = TextEditingController();
  final _foodMagnesiumController = TextEditingController();
  final _foodPhosphorusController = TextEditingController();
  final _foodPotassiumController = TextEditingController();
  final _foodSodiumController = TextEditingController();

  // This gets synced with _foodSodiumController
  final _foodSaltController = TextEditingController();

  final _foodChromiumController = TextEditingController();
  final _foodIronController = TextEditingController();
  final _foodFluorineController = TextEditingController();
  final _foodIodineController = TextEditingController();
  final _foodCopperController = TextEditingController();
  final _foodManganeseController = TextEditingController();
  final _foodMolybdenumController = TextEditingController();
  final _foodSeleniumController = TextEditingController();
  final _foodZincController = TextEditingController();
  final _foodMonounsaturatedFatController = TextEditingController();
  final _foodPolyunsaturatedFatController = TextEditingController();
  final _foodOmega3Controller = TextEditingController();
  final _foodOmega6Controller = TextEditingController();
  final _foodSaturatedFatController = TextEditingController();
  final _foodTransFatController = TextEditingController();
  final _foodCholesterolController = TextEditingController();
  final _foodFiberController = TextEditingController();
  final _foodSugarController = TextEditingController();
  final _foodSugarAlcoholController = TextEditingController();
  final _foodStarchController = TextEditingController();
  final _foodWaterController = TextEditingController();
  final _foodCaffeineController = TextEditingController();
  final _foodAlcoholController = TextEditingController();

  // Focus nodes for synchronizing salt and sodium
  final _foodSaltFocusNode = FocusNode();
  final _foodSodiumFocusNode = FocusNode();

  @override
  void initState() {
    // Conversion between sodium and salt
    _foodSodiumController.addListener(() {
      // Update only value which doesn't have focus or when both fields don't have focus (= on initial loading)
      if (_foodSodiumFocusNode.hasFocus ||
          (!_foodSodiumFocusNode.hasFocus && !_foodSaltFocusNode.hasFocus)) {
        setState(() {
          try {
            final double sodium = double.parse(_foodSodiumController.text);
            final double salt =
                sodium / 1000 * NutritionFactsLabelEU.sodiumToSaltFacor;

            _foodSaltController.text = salt.toString();
          } catch (e) {
            // do nothing
          }
        });
      }
    });

    // Conversion between salt and sodium
    _foodSaltController.addListener(() {
      // Update only value which doesn't have focus
      if (_foodSaltFocusNode.hasFocus) {
        setState(() {
          try {
            final double salt = double.parse(_foodSaltController.text);
            final double sodium =
                salt * 1000 / NutritionFactsLabelEU.sodiumToSaltFacor;

            _foodSodiumController.text = sodium.toString();
          } catch (e) {
            // do nothing
          }
        });
      }
    });

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
      _foodEanController.text = (foodToEditOrCreate.ean ?? '').toString();
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
    foodToEditOrCreate.ean = _foodEanController.text;
    foodToEditOrCreate.origin = FoodPage.originName;
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

  Widget _customListTile({
    required String title,
    required TextEditingController controller,
    required String unit,
    FocusNode? focusNode,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          isDense: true,
          labelText: title,
          filled: true,
          suffixText: unit,
        ),
        validator: (value) {
          if (!isNumeric(value!)) {
            return AppLocalizations.of(context)!.onlyNumbersAllowed;
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as AddEditCustomFoodModalArguments;
    final modalMode = args.mode;
    final food = args.food;

    return Scaffold(
      appBar: AppBar(
        title: modalMode == AddEditCustomFoodModalMode.edit
            ? Text(AppLocalizations.of(context)!.editCustomFood)
            : Text(AppLocalizations.of(context)!.addCustomFood),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                children: [
                  (food?.imageUrl != null)
                      ? CircleAvatar(
                          radius: AddEditCustomFoodModal._foodAvatarRadius,
                          foregroundImage: NetworkImage(
                            food!.imageUrl!,
                          ),
                        )
                      : CircleAvatar(
                          backgroundColor:
                              Theme.of(context).noPictureBackground,
                          radius: AddEditCustomFoodModal._foodAvatarRadius,
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size:
                                AddEditCustomFoodModal._foodAvatarRadius * 1.8,
                            color: Theme.of(context).onNoPictureBackground,
                          ),
                        ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _foodTitleController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            labelText: AppLocalizations.of(context)!.title,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .fieldMandatory;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _foodEanController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            labelText: AppLocalizations.of(context)!.barcode,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
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
                      return CategoryListTileHeader(
                        title: AppLocalizations.of(context)!
                            .energyAndMacronutrients,
                        subtitle: AppLocalizations.of(context)!
                            .energyAndMacronutrientsTargetsHint,
                      );
                    },
                    body: Column(
                      children: [
                        _customListTile(
                          title: AppLocalizations.of(context)!.energy,
                          controller: _foodCaloriesController,
                          unit: 'kcal / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.fat,
                          controller: _foodFatController,
                          unit: 'g / 100 g',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: _customListTile(
                            title: AppLocalizations.of(context)!.saturatedFat,
                            controller: _foodSaturatedFatController,
                            unit: 'g / 100 g',
                          ),
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.carbs,
                          controller: _foodCarbsController,
                          unit: 'g / 100 g',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: _customListTile(
                            title: AppLocalizations.of(context)!.sugar,
                            controller: _foodSugarController,
                            unit: 'g / 100 g',
                          ),
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.fiber,
                          controller: _foodFiberController,
                          unit: 'g / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.protein,
                          controller: _foodProteinController,
                          unit: 'g / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.salt,
                          controller: _foodSaltController,
                          unit: 'g / 100 g',
                          focusNode: _foodSaltFocusNode,
                        ),
                      ],
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: activePanelIndex == 1,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return CategoryListTileHeader(
                        title: AppLocalizations.of(context)!.vitamins,
                        subtitle:
                            '${AppLocalizations.of(context)!.vitaminA} – ${AppLocalizations.of(context)!.vitaminK}',
                      );
                    },
                    body: Column(
                      children: [
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminA,
                          controller: _foodVitaminAController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminB1,
                          controller: _foodVitaminB1Controller,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminB2,
                          controller: _foodVitaminB2Controller,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminB3,
                          controller: _foodVitaminB3Controller,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminB5,
                          controller: _foodVitaminB5Controller,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminB6,
                          controller: _foodVitaminB6Controller,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminB7,
                          controller: _foodVitaminB7Controller,
                          unit: 'μg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminB9,
                          controller: _foodVitaminB9Controller,
                          unit: 'μg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminB12,
                          controller: _foodVitaminB12Controller,
                          unit: 'μg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminC,
                          controller: _foodVitaminCController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminD,
                          controller: _foodVitaminDController,
                          unit: 'μg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminE,
                          controller: _foodVitaminEController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.vitaminK,
                          controller: _foodVitaminKController,
                          unit: 'μg / 100 g',
                        ),
                      ],
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: activePanelIndex == 2,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return CategoryListTileHeader(
                        title: AppLocalizations.of(context)!.majorMinerals,
                        subtitle:
                            '${AppLocalizations.of(context)!.calcium}, ${AppLocalizations.of(context)!.chloride}, ${AppLocalizations.of(context)!.magnesium}, ...',
                      );
                    },
                    body: Column(
                      children: [
                        _customListTile(
                          title: AppLocalizations.of(context)!.calcium,
                          controller: _foodCalciumController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.chloride,
                          controller: _foodChlorideController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.magnesium,
                          controller: _foodMagnesiumController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.phosphorous,
                          controller: _foodPhosphorusController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.potassium,
                          controller: _foodPotassiumController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.sodium,
                          controller: _foodSodiumController,
                          unit: 'mg / 100 g',
                          focusNode: _foodSodiumFocusNode,
                        ),
                      ],
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: activePanelIndex == 3,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return CategoryListTileHeader(
                        title: AppLocalizations.of(context)!.traceElements,
                        subtitle:
                            '${AppLocalizations.of(context)!.chromium}, ${AppLocalizations.of(context)!.iron}, ${AppLocalizations.of(context)!.fluorine}, ${AppLocalizations.of(context)!.iodine}, ${AppLocalizations.of(context)!.copper}, ...',
                      );
                    },
                    body: Column(
                      children: [
                        _customListTile(
                          title: AppLocalizations.of(context)!.chromium,
                          controller: _foodChromiumController,
                          unit: 'μg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.iron,
                          controller: _foodIronController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.fluorine,
                          controller: _foodFluorineController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.iodine,
                          controller: _foodIodineController,
                          unit: 'μg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.copper,
                          controller: _foodCopperController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.manganese,
                          controller: _foodManganeseController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.molybdenum,
                          controller: _foodMolybdenumController,
                          unit: 'μg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.selenium,
                          controller: _foodSeleniumController,
                          unit: 'μg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.zinc,
                          controller: _foodZincController,
                          unit: 'mg / 100 g',
                        ),
                      ],
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: activePanelIndex == 4,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return CategoryListTileHeader(
                        title: AppLocalizations.of(context)!.fats,
                        subtitle:
                            '${AppLocalizations.of(context)!.omega3}, ${AppLocalizations.of(context)!.omega6}, ${AppLocalizations.of(context)!.cholesterol}, ...',
                      );
                    },
                    body: Column(
                      children: [
                        _customListTile(
                          title:
                              AppLocalizations.of(context)!.monounsaturatedFat,
                          controller: _foodMonounsaturatedFatController,
                          unit: 'g / 100 g',
                        ),
                        _customListTile(
                          title:
                              AppLocalizations.of(context)!.polyunsaturatedFat,
                          controller: _foodPolyunsaturatedFatController,
                          unit: 'g / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.omega3,
                          controller: _foodOmega3Controller,
                          unit: 'g / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.omega6,
                          controller: _foodOmega6Controller,
                          unit: 'g / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.saturatedFat,
                          controller: _foodSaturatedFatController,
                          unit: 'g / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.transfat,
                          controller: _foodTransFatController,
                          unit: 'g / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.cholesterol,
                          controller: _foodCholesterolController,
                          unit: 'mg / 100 g',
                        ),
                      ],
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: activePanelIndex == 5,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return CategoryListTileHeader(
                        title: AppLocalizations.of(context)!.carbs,
                        subtitle:
                            '${AppLocalizations.of(context)!.fiber}, ${AppLocalizations.of(context)!.sugar}, ${AppLocalizations.of(context)!.starch}, ...',
                      );
                    },
                    body: Column(
                      children: [
                        _customListTile(
                          title: AppLocalizations.of(context)!.fiber,
                          controller: _foodFiberController,
                          unit: 'g / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.sugar,
                          controller: _foodSugarController,
                          unit: 'g / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.sugarAlcohol,
                          controller: _foodSugarAlcoholController,
                          unit: 'g / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.starch,
                          controller: _foodStarchController,
                          unit: 'g / 100 g',
                        ),
                      ],
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: activePanelIndex == 6,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return CategoryListTileHeader(
                        title: AppLocalizations.of(context)!.other,
                        subtitle:
                            '${AppLocalizations.of(context)!.water}, ${AppLocalizations.of(context)!.caffeine}, ${AppLocalizations.of(context)!.alcohol}',
                      );
                    },
                    body: Column(
                      children: [
                        _customListTile(
                          title: AppLocalizations.of(context)!.water,
                          controller: _foodWaterController,
                          unit: 'ml / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.caffeine,
                          controller: _foodCaffeineController,
                          unit: 'mg / 100 g',
                        ),
                        _customListTile(
                          title: AppLocalizations.of(context)!.alcohol,
                          controller: _foodAlcoholController,
                          unit: 'g / 100 g',
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () => {
          if (_formKey.currentState!.validate())
            {
              _addOrEditFood(food, modalMode),
            },
        },
      ),
    );
  }
}
