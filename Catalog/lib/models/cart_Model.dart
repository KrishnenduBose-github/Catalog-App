// ignore_for_file: unused_element, unused_import

import 'package:catalog/core/store.dart';
import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;

  final List<int> _itemsId = [];
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

  //get items in the cart
  List<Item> get items => _itemsId.map((id) => _catalog.getbyId(id)).toList();

  //get total price
  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  //Add items

  void add(Item item) {
    _itemsId.add(item.id);
  }

  void remove(Item item) {
    _itemsId.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store?.cart._itemsId.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store?.cart._itemsId.remove(item.id);
  }
}
