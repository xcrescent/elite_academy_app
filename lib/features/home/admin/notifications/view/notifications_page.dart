import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../dashboard/model/notification_model.dart';

// Sample notifications provider (replace with real Firebase data)
final notificationsProvider = FutureProvider<List<NotificationModel>>((ref) async {
  // Simulate loading delay
  await Future.delayed(const Duration(seconds: 1));
  
  return [
    NotificationModel(
      id: '1',
      title: 'New student enrolled',
      body: 'John Doe has been enrolled in Class 10-A',
      type: NotificationType.general,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NotificationModel(
      id: '2',
      title: 'Attendance reminder',
      body: 'Don\'t forget to mark attendance for today\'s classes',
      type: NotificationType.attendance,
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    ),
    NotificationModel(
      id: '3',
      title: 'Grade submission due',
      body: 'Math quiz grades are due by end of day',
      type: NotificationType.grade,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    NotificationModel(
      id: '4',
      title: 'Fee payment received',
      body: 'Payment of ₹15,000 received from Sarah Johnson',
      type: NotificationType.fee,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      isRead: true,
    ),
    NotificationModel(
      id: '5',
      title: 'New assignment created',
      body: 'Physics assignment has been created for Class 12-B',
      type: NotificationType.assignment,
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      isRead: true,
    ),
  ];
});

@RoutePage()
class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(notificationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_chat_read),
            onPressed: () => _markAllAsRead(ref),
          ),
          PopupMenuButton<String>(
            onSelected: (value) => _handleMenuAction(value, ref),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'filter',
                child: Row(
                  children: [
                    Icon(Icons.filter_list, size: 20),
                    SizedBox(width: 8),
                    Text('Filter'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'clear_all',
                child: Row(
                  children: [
                    Icon(Icons.clear_all, size: 20),
                    SizedBox(width: 8),
                    Text('Clear All'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: notificationsAsync.when(
        data: (notifications) => _buildNotificationsList(notifications, ref, context),
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading notifications...'),
            ],
          ),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error loading notifications: ${error.toString()}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(notificationsProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationsList(
    List<NotificationModel> notifications,
    WidgetRef ref,
    BuildContext context,
  ) {
    if (notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.notifications_none, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'No notifications',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'You\'re all caught up!',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    final unreadCount = notifications.where((n) => !n.isRead).length;

    return Column(
      children: [
        if (unreadCount > 0)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Text(
              '$unreadCount unread notification${unreadCount == 1 ? '' : 's'}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.refresh(notificationsProvider);
            },
            child: ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return _buildNotificationCard(notification, ref, context);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationCard(
    NotificationModel notification,
    WidgetRef ref,
    BuildContext context,
  ) {
    return Dismissible(
      key: Key(notification.id!),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        _deleteNotification(notification, ref);
      },
      child: Container(
        color: notification.isRead ? null : Colors.blue.withOpacity(0.05),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _getTypeColor(notification.type).withOpacity(0.1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                notification.type.icon,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  notification.title,
                  style: TextStyle(
                    fontWeight: notification.isRead 
                        ? FontWeight.w500 
                        : FontWeight.bold,
                  ),
                ),
              ),
              if (!notification.isRead)
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                notification.body,
                style: TextStyle(
                  color: notification.isRead 
                      ? Colors.grey[600] 
                      : Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: _getTypeColor(notification.type).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      notification.type.displayName,
                      style: TextStyle(
                        fontSize: 12,
                        color: _getTypeColor(notification.type),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _formatTime(notification.createdAt),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          onTap: () => _handleNotificationTap(notification, ref),
        ),
      ),
    );
  }

  Color _getTypeColor(NotificationType type) {
    switch (type) {
      case NotificationType.general:
        return Colors.blue;
      case NotificationType.attendance:
        return Colors.green;
      case NotificationType.grade:
        return Colors.orange;
      case NotificationType.assignment:
        return Colors.purple;
      case NotificationType.fee:
        return Colors.teal;
      case NotificationType.exam:
        return Colors.red;
      case NotificationType.announcement:
        return Colors.indigo;
      case NotificationType.reminder:
        return Colors.amber;
    }
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return DateFormat('MMM dd').format(dateTime);
    }
  }

  void _handleNotificationTap(NotificationModel notification, WidgetRef ref) {
    // Mark as read
    if (!notification.isRead) {
      _markAsRead(notification, ref);
    }

    // Handle navigation based on notification type
    switch (notification.type) {
      case NotificationType.attendance:
        // Navigate to attendance page
        break;
      case NotificationType.grade:
        // Navigate to grades page
        break;
      case NotificationType.assignment:
        // Navigate to assignments page
        break;
      case NotificationType.fee:
        // Navigate to fee management page
        break;
      default:
        // Show notification details
        break;
    }
  }

  void _markAsRead(NotificationModel notification, WidgetRef ref) {
    // TODO: Update notification read status in backend
    ref.refresh(notificationsProvider);
  }

  void _markAllAsRead(WidgetRef ref) {
    // TODO: Mark all notifications as read in backend
    ref.refresh(notificationsProvider);
  }

  void _deleteNotification(NotificationModel notification, WidgetRef ref) {
    // TODO: Delete notification from backend
    ref.refresh(notificationsProvider);
  }

  void _handleMenuAction(String action, WidgetRef ref) {
    switch (action) {
      case 'filter':
        // TODO: Show filter options
        break;
      case 'clear_all':
        // TODO: Clear all notifications
        ref.refresh(notificationsProvider);
        break;
    }
  }
}