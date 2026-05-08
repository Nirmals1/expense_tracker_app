import 'package:flutter/material.dart';

import '../../features/dashboard/presentation/screens/home_screen.dart';
import '../../features/expenses/presentation/screens/add_edit_expense_screen.dart';
import '../../features/expenses/presentation/screens/expenses_screen.dart';
import '../../features/insights/presentation/screens/insights_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  final _tabs = const [
    HomeScreen(),
    ExpensesScreen(),
    InsightsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: IndexedStack(index: _index, children: _tabs),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.large(
        heroTag: 'add_expense',
        shape: const CircleBorder(),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AddEditExpenseScreen()),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: _ShellNavItem(
                    label: 'Home',
                    icon: Icons.home_rounded,
                    selected: _index == 0,
                    selectedColor: colorScheme.primary,
                    unselectedColor: colorScheme.onSurfaceVariant,
                    onTap: () => setState(() => _index = 0),
                  ),
                ),
                Expanded(
                  child: _ShellNavItem(
                    label: 'Expenses',
                    icon: Icons.receipt_long_rounded,
                    selected: _index == 1,
                    selectedColor: colorScheme.primary,
                    unselectedColor: colorScheme.onSurfaceVariant,
                    onTap: () => setState(() => _index = 1),
                  ),
                ),
                const SizedBox(width: 80),
                Expanded(
                  child: _ShellNavItem(
                    label: 'Insights',
                    icon: Icons.insights_rounded,
                    selected: _index == 2,
                    selectedColor: colorScheme.primary,
                    unselectedColor: colorScheme.onSurfaceVariant,
                    onTap: () => setState(() => _index = 2),
                  ),
                ),
                Expanded(
                  child: _ShellNavItem(
                    label: 'Settings',
                    icon: Icons.settings_rounded,
                    selected: _index == 3,
                    selectedColor: colorScheme.primary,
                    unselectedColor: colorScheme.onSurfaceVariant,
                    onTap: () => setState(() => _index = 3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ShellNavItem extends StatelessWidget {
  const _ShellNavItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final Color selectedColor;
  final Color unselectedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? selectedColor : unselectedColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 2),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: color,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
