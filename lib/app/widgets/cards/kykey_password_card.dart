import 'package:flutter/material.dart';

class KykeyPasswordCard extends StatefulWidget {
  final String title;
  final String login;
  final String password;

  const KykeyPasswordCard({
    Key? key,
    required this.title,
    required this.login,
    required this.password,
  }) : super(key: key);

  @override
  State<KykeyPasswordCard> createState() => _KykeyPasswordCardState();
}

class _KykeyPasswordCardState extends State<KykeyPasswordCard> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => setState(() {
                isVisible = !isVisible;
              }),
              child: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.login,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  flex: 10,
                  child: Text(
                    isVisible ? widget.password : '******',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Flexible(
                  flex: 2,
                  child: Icon(
                    Icons.copy,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
