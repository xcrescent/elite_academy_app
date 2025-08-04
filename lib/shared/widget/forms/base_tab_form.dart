import 'package:flutter/material.dart';

class BaseTabForm extends StatefulWidget {
  final String title;
  final List<TabData> tabs;
  final VoidCallback? onSubmit;
  final bool Function()? validateCurrentTab;
  final Widget? floatingActionButton;

  const BaseTabForm({
    super.key,
    required this.title,
    required this.tabs,
    this.onSubmit,
    this.validateCurrentTab,
    this.floatingActionButton,
  });

  @override
  State<BaseTabForm> createState() => _BaseTabFormState();
}

class _BaseTabFormState extends State<BaseTabForm> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: DefaultTabController(
          initialIndex: 0,
          length: widget.tabs.length,
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                isScrollable: widget.tabs.length > 4,
                tabs: widget.tabs.map((tab) => Tab(
                  text: tab.title,
                  icon: Icon(tab.icon),
                )).toList(),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: widget.tabs.map((tab) => tab.content).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: widget.floatingActionButton ?? FloatingActionButton.extended(
        onPressed: () async {
          final isValid = widget.validateCurrentTab?.call() ?? _formKey.currentState?.validate() == true;
          
          if (isValid) {
            if (_tabController.index < widget.tabs.length - 1) {
              _tabController.animateTo(_tabController.index + 1);
              return;
            }
            // On last tab - submit
            widget.onSubmit?.call();
          }
        },
        icon: const Icon(Icons.arrow_forward),
        label: Text(
          (_tabController.index < widget.tabs.length - 1) ? 'Next' : 'Submit',
        ),
      ),
    );
  }
}

class TabData {
  final String title;
  final IconData icon;
  final Widget content;

  const TabData({
    required this.title,
    required this.icon,
    required this.content,
  });
}

class BaseFormTab extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding;

  const BaseFormTab({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            const SizedBox(height: 32),
            ...children.map((child) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: child,
            )),
          ],
        ),
      ),
    );
  }
}