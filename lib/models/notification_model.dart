class NotificationModel {
  final String title;
  final String subtitle;
  final String time;
  final String icon;
  final bool isRead;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    this.isRead = false,
  });

  NotificationModel copyWith({
    bool? isRead,
  }) {
    return NotificationModel(
      title: title,
      subtitle: subtitle,
      time: time,
      icon: icon,
      isRead: isRead ?? this.isRead,
    );
  }
}