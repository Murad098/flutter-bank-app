import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            child: const Row(
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Tab Bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: const Color(0xFF1E88E5),
                borderRadius: BorderRadius.circular(12),
              ),
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Income'),
                Tab(text: 'Expense'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Transaction List
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTransactionList('all'),
                _buildTransactionList('income'),
                _buildTransactionList('expense'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList(String type) {
    final List<Map<String, dynamic>> transactions = [
      {
        'icon': Icons.shopping_cart,
        'title': 'Shopping',
        'subtitle': 'Amazon',
        'date': 'Today, 10:30 AM',
        'amount': '-\$120.00',
        'type': 'expense',
      },
      {
        'icon': Icons.restaurant,
        'title': 'Food & Dining',
        'subtitle': 'McDonald\'s',
        'date': 'Today, 12:45 PM',
        'amount': '-\$25.50',
        'type': 'expense',
      },
      {
        'icon': Icons.directions_bus,
        'title': 'Transportation',
        'subtitle': 'Uber',
        'date': 'Yesterday, 3:20 PM',
        'amount': '-\$15.00',
        'type': 'expense',
      },
      {
        'icon': Icons.attach_money,
        'title': 'Received',
        'subtitle': 'From Sarah',
        'date': 'Yesterday, 9:00 AM',
        'amount': '+\$500.00',
        'type': 'income',
      },
      {
        'icon': Icons.work,
        'title': 'Salary',
        'subtitle': 'Company Payment',
        'date': 'May 28, 2026',
        'amount': '+\$3,500.00',
        'type': 'income',
      },
      {
        'icon': Icons.shopping_bag,
        'title': 'Clothing',
        'subtitle': 'Nike Store',
        'date': 'May 27, 2026',
        'amount': '-\$89.99',
        'type': 'expense',
      },
      {
        'icon': Icons.movie,
        'title': 'Entertainment',
        'subtitle': 'Netflix',
        'date': 'May 26, 2026',
        'amount': '-\$15.99',
        'type': 'expense',
      },
      {
        'icon': Icons.local_hospital,
        'title': 'Healthcare',
        'subtitle': 'Pharmacy',
        'date': 'May 25, 2026',
        'amount': '-\$45.00',
        'type': 'expense',
      },
    ];

    // Filter transactions based on type
    List<Map<String, dynamic>> filteredTransactions = transactions;
    if (type == 'income') {
      filteredTransactions =
          transactions.where((t) => t['type'] == 'income').toList();
    } else if (type == 'expense') {
      filteredTransactions =
          transactions.where((t) => t['type'] == 'expense').toList();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: filteredTransactions.length,
      itemBuilder: (context, index) {
        final transaction = filteredTransactions[index];
        final isExpense = transaction['amount'].toString().startsWith('-');

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: (isExpense ? Colors.red : Colors.green)
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  transaction['icon'],
                  color: isExpense ? Colors.red : Colors.green,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      transaction['subtitle'],
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      transaction['date'],
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                transaction['amount'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: isExpense ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}