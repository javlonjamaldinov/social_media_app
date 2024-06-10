import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final primaryContainerColor =
        Theme.of(context).colorScheme.primaryContainer;
    final tertiaryColor = Theme.of(context).colorScheme.tertiary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 280.30,
          height: 69.55,
          child: Stack(
            children: [
              _buildIconButton(
                icon: FontAwesomeIcons.pencil,
                color: primaryContainerColor,
                position: const Offset(0, 0),
                inversePrimaryColor:
                    Theme.of(context).colorScheme.inversePrimary,
              ),
              _buildIconButton(
                icon: FontAwesomeIcons.bookmark,
                color: primaryContainerColor,
                position: const Offset(100.11, 0),
                inversePrimaryColor:
                    Theme.of(context).colorScheme.inversePrimary,
              ),
              _buildIconButton(
                icon: FontAwesomeIcons.apple,
                color: primaryContainerColor,
                position: const Offset(200.22, 0),
                inversePrimaryColor:
                    Theme.of(context).colorScheme.inversePrimary,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required Color color,
    required Offset position,
    required Color inversePrimaryColor,
  }) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: SizedBox(
        width: 70, // Уменьшаем ширину иконки
        height: 70, // Уменьшаем высоту иконки
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width:
                    70, // Устанавливаем ширину контейнера равной ширине иконки
                height:
                    70, // Устанавливаем высоту контейнера равной высоте иконки
                decoration: ShapeDecoration(
                  color: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        25), // Уменьшаем радиус скругления
                  ),
                ),
                child: Icon(
                  icon,
                  color: inversePrimaryColor,
                  size: 22, // Уменьшаем размер иконки
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
