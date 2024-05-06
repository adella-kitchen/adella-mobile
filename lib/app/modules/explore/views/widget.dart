import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    this.width,
    this.height,
    this.heightImage,
    this.borderRadius = 6,
    this.contentPadding,
    required this.imageProvider,
    this.tags,
    this.title,
    this.description,
    this.footer,
    this.color = Colors.white,
    this.tagSpacing,
    this.tagRunSpacing,
    this.elevation = 0, // Default elevation
  });

  final double? width;
  final double? height;
  final double? heightImage;
  final double borderRadius;
  final double? tagSpacing;
  final double? tagRunSpacing;
  final EdgeInsetsGeometry? contentPadding;
  final ImageProvider imageProvider;
  final List<Widget>? tags;
  final Color color;
  final Widget? title;
  final Widget? description;
  final Widget? footer;
  final double elevation; // Elevation value

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      color: color,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
              child: Image(
                image: imageProvider,
                width: width,
                height: heightImage,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Padding(
                padding: contentPadding ?? EdgeInsets.zero,
                child: ImageCardContent(
                  tags: tags,
                  title: title,
                  footer: footer,
                  description: description,
                  tagSpacing: tagSpacing,
                  tagRunSpacing: tagRunSpacing,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCardContent extends StatelessWidget {
  const ImageCardContent({
    super.key,
    this.contentPadding,
    this.tags,
    this.title,
    this.description,
    this.footer,
    this.tagSpacing,
    this.tagRunSpacing,
  });

  final EdgeInsetsGeometry? contentPadding;
  final List<Widget>? tags;
  final double? tagSpacing;
  final double? tagRunSpacing;
  final Widget? title;
  final Widget? description;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding ??
          const EdgeInsets.only(top: 8, bottom: 10, left: 8, right: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (tags != null)
              Wrap(
                spacing: tagSpacing ?? 12,
                runSpacing: tagRunSpacing ?? 10,
                children: tags!,
              ),
            if (title != null || description != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) title!,
                  if (title != null && description != null)
                    const SizedBox(
                      height: 5,
                    ),
                  if (description != null) description!,
                ],
              ),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }
}
