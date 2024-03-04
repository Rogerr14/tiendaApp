import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(title: 'Inicio', 
  subTitle: 'Pantalla principal', 
  link: '/homeScreen', 
  icon: Icons.density_small_outlined),
  MenuItem(title: 'Crear Producto', 
  subTitle: 'Agrega un producto nuevo', 
  link: '/productsScreen', 
  icon: Icons.density_small_outlined)
];
