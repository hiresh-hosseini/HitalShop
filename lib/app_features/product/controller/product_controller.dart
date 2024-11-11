import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/app_data/models/category_model.dart';
import 'package:shop/app_data/models/product_model.dart';
import 'package:shop/app_data/repositories/category_repository.dart';
import 'package:shop/app_data/repositories/product_respository.dart';

class ProductController extends GetxController {
  // این متغیر آیدی دسته بندی انتخاب شده را ذخیره میکند
  // هر بار که کاربر دسته بندی جدیدی را انتخاب میکند این مقدار بروزرسانی میشود
  int? selectedCategoryId;

  List<CategoryModel>? categoryList;
  List<ProductModel>? productList;
  // Initializing a category with repository
  CategoryRepository categoryRepository = CategoryRepository();
  ProductRespository productRespository = ProductRespository();

  TextEditingController searchController = TextEditingController();

  Sort? selectedSort;

  // پارامترهای اختیاری که در زمان ایجاد کنترلر مقدار اولیه برای سلکتد کتگوری آیدی و سلکتدسورت را تنظیم می‌کنند
  final int? categoryId;
  final Sort? defaultSort;

  ProductController({
    this.categoryId,
    this.defaultSort,
  });

  Future<void> getCategories() async {
    var response = await categoryRepository.getCategories();
    categoryList = response.categories;
    update();
  }

  // توضیح اول
  // وقتی کاربر روی لیست افقی دسته بندی زد آیدیشو به این تابع پاس میده
  // و ذخیره میشه و بعدش محصولات فیلتر شده نمایش داده میشه

  // توضیح دوم
  //این متد هنگام کلیک روی دسته‌بندی فراخوانی می‌شود و شناسه دسته‌بندی را به عنوان آرگومان دریافت می‌کند
  // بعدش متغیر سلکتدکتگوری آیدی رو بروز میکنه و متد بعدش رو برای فیلتر کردن محصولات فراخوانی میکنه
  void selectCategory(int id) {
    selectedCategoryId = id;

    // این متد لیست محصولات را بر اساس سلکتدکتگوری آیدی و هر کلمه کلیدی که ممکن است در جستجو وارد شده باشد فیلتر می‌کن
    getFilterProducts();
    update();
  }

  Future<void> getFilterProducts({String? keyword}) async {
    var response = await productRespository.getFilterProducts(
      categoryId: selectedCategoryId,
      keyword: keyword,
      orderColumn: selectedSort?.orderColumn,
      orderType: selectedSort?.orderType,
    );
    productList = response.filterProducts;
    update();
  }

  void search(String value) {
    getFilterProducts(keyword: value);
  }

  // با دریافت یک شیء سورت نوع مرتب‌سازی را در سلکتدسورت تنظیم کرده و سپس محصولات را بر اساس این مرتب‌سازی فیلتر می‌کند
  void sort(Sort sort) {
    selectedSort = sort;
    getFilterProducts();
    update();
  }

  @override
  void onInit() {
    // selectedCategoryId = categoryId;
    // selectedSort = defaultSort;
    selectedCategoryId = Get.arguments['categoryId'] as int?;
    selectedSort = Get.arguments['sort'] as Sort?;
    getCategories();
    getFilterProducts();
    super.onInit();
  }
}

class Sort {
  String orderColumn;
  String orderType;
  Sort({
    required this.orderColumn,
    required this.orderType,
  });
}
