Origo Store – V1 (Offline Only)
Architecture

Clean Architecture
Feature-Based Structure
SQLite (Sqflite)
Bloc (Cubit)

Final Folder Structure – V1
lib/
│
├── main.dart
│
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   │
│   ├── errors/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   │
│   ├── utils/
│   │   ├── date_utils.dart
│   │   └── profit_calculator.dart
│   │
│   └── database/
│       ├── database_helper.dart
│       └── tables.dart
│
├── features/
│
│   ├── initialization/
│   │   ├── data/
│   │   │   └── settings_model.dart
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/settings_entity.dart
│   │   │   ├── repositories/settings_repository.dart
│   │   │   └── usecases/save_settings.dart
│   │   │
│   │   └── presentation/
│   │       ├── cubit/settings_cubit.dart
│   │       ├── cubit/settings_state.dart
│   │       └── pages/initialization_page.dart
│   │
│   ├── dashboard/
│   │   ├── data/
│   │   │   └── dashboard_repository_impl.dart
│   │   │
│   │   ├── domain/
│   │   │   ├── repositories/dashboard_repository.dart
│   │   │   └── usecases/get_dashboard_data.dart
│   │   │
│   │   └── presentation/
│   │       ├── cubit/dashboard_cubit.dart
│   │       ├── cubit/dashboard_state.dart
│   │       └── pages/dashboard_page.dart
│   │
│   ├── products/
│   │   ├── data/
│   │   │   ├── models/product_model.dart
│   │   │   └── repositories/product_repository_impl.dart
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/product_entity.dart
│   │   │   ├── repositories/product_repository.dart
│   │   │   ├── usecases/add_product.dart
│   │   │   ├── usecases/update_product.dart
│   │   │   ├── usecases/delete_product.dart
│   │   │   └── usecases/get_products.dart
│   │   │
│   │   └── presentation/
│   │       ├── cubit/product_cubit.dart
│   │       ├── cubit/product_state.dart
│   │       ├── pages/products_page.dart
│   │       └── widgets/
│   │           ├── product_card.dart
│   │           └── add_product_dialog.dart
│   │
│   ├── sales/
│   │   ├── data/
│   │   │   ├── models/sale_model.dart
│   │   │   └── repositories/sale_repository_impl.dart
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/sale_entity.dart
│   │   │   ├── repositories/sale_repository.dart
│   │   │   └── usecases/create_sale.dart
│   │   │
│   │   └── presentation/
│   │       ├── cubit/sale_cubit.dart
│   │       └── pages/sales_page.dart
│   │
│   ├── expenses/
│   │   ├── data/
│   │   │   ├── models/expense_model.dart
│   │   │   └── repositories/expense_repository_impl.dart
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/expense_entity.dart
│   │   │   ├── repositories/expense_repository.dart
│   │   │   └── usecases/add_expense.dart
│   │   │
│   │   └── presentation/
│   │       ├── cubit/expense_cubit.dart
│   │       └── pages/expenses_page.dart
│   │
│   └── reports/
│       ├── data/
│       │   └── reports_repository_impl.dart
│       │
│       ├── domain/
│       │   ├── repositories/reports_repository.dart
│       │   ├── usecases/get_daily_profit.dart
│       │   ├── usecases/get_monthly_profit.dart
│       │   ├── usecases/get_expense_summary.dart
│       │   └── usecases/get_inventory_valuation.dart
│       │
│       └── presentation/
│           ├── cubit/reports_cubit.dart
│           └── pages/reports_page.dart

Database Tables (V1 Only)
settings
products
sales
expenses
inventory_adjustments

What Exists in V1

Single user

Local SQLite database

Offline only

Manual sales entry

Expense tracking

Inventory audit

Dashboard calculations

Date filtered reports