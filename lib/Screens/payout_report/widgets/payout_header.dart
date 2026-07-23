import 'package:flutter/material.dart';

class PayoutHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onDownload;
  final VoidCallback onShare;

  const PayoutHeader({
    super.key,
    required this.onDownload,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        "Payout Report",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),

      actions: [
        PopupMenuButton<String>(
          icon: const Icon(
            Icons.more_vert,
            color: Colors.black, // Changed from white
          ),
          onSelected: (value) {
            if (value == 'download') {
              onDownload();
            } else if (value == 'share') {
              onShare();
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: 'download',
              child: ListTile(
                leading: Icon(Icons.download),
                title: Text('Download PDF'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            PopupMenuItem(
              value: 'share',
              child: ListTile(
                leading: Icon(Icons.share),
                title: Text('Share PDF'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ],

      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}