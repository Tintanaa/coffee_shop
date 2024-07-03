import 'package:coffee_shop/src/features/menu/data/category_data.dart';
import 'package:coffee_shop/src/features/menu/view/category_fragment.dart';
import 'package:coffee_shop/src/features/menu/view/category_header.dart';
import 'package:coffee_shop/src/features/menu/view/category_grid.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuScreen extends StatefulWidget {
  final List<CategoryData> allCategories;

  const MenuScreen({Key? key, required this.allCategories}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final ItemScrollController _menuController = ItemScrollController();
  final ItemScrollController _appBarController = ItemScrollController();
  final ItemPositionsListener _itemListener = ItemPositionsListener.create();
  int _currentCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _itemListener.itemPositions.addListener(_onItemPositionChange);
  }

  void _onItemPositionChange() {
    final firstVisibleIndex = _itemListener.itemPositions.value
        .firstWhere((item) => item.itemLeadingEdge >= 0)
        .index;

    if (firstVisibleIndex != _currentCategoryIndex) {
      _setCurrentCategoryIndex(firstVisibleIndex);
      _appBarScrollToCategory(firstVisibleIndex);
    }
  }

  void _setCurrentCategoryIndex(int newIndex) {
    setState(() {
      _currentCategoryIndex = newIndex;
    });
  }

  void _menuScrollToCategory(int index) {
    _menuController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 400),
    );
  }

  void _appBarScrollToCategory(int index) {
    _appBarController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      opacityAnimationWeights: [20, 20, 60],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: SizedBox(
            height: 40,
            child: ScrollablePositionedList.builder(
              itemScrollController: _appBarController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.allCategories.length,
              itemBuilder: (context, index) {
                final category = widget.allCategories[index];
                return CategoryChip(
                  text: category.name,
                  isSelected: index == _currentCategoryIndex,
                  onSelected: () {
                    _setCurrentCategoryIndex(index);
                    _menuScrollToCategory(index);
                    _appBarScrollToCategory(index);
                  },
                );
              },
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ScrollablePositionedList.builder(
            itemScrollController: _menuController,
            itemPositionsListener: _itemListener,
            itemCount: widget.allCategories.length,
            itemBuilder: (context, index) {
              final category = widget.allCategories[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryHeader(
                    category: category,
                  ),
                  CategoryGridView(category: category)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}