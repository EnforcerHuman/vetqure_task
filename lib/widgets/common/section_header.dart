import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool isFilter;
  const SectionHeader({
    super.key,
    required this.title,
    required this.isFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          if (isFilter)
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(6)),
              child: const Padding(
                padding: EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.filter_list,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Filter',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10, color: Colors.blue),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
