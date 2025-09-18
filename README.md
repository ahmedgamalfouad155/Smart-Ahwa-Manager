# ☕ Smart Ahwa Manager App

A **Flutter-based Smart Ahwa Manager** application that helps café/ahwa owners in Cairo streamline daily operations.  
The app allows adding and managing customer orders, tracking pending/completed ones, and generating simple sales reports (like top-selling drinks).

---
## 📽️ Demo
### 📱 Mobile Version:
[🔗 Click here to watch the demo video](https://drive.google.com/file/d/1FS7Hlh6c3ah1JXQr9CPGg8ik69S5TlV9/view?usp=sharing)

---

## 📱 Features
- Add customer orders with:
  - Customer name
  - Drink type (e.g., Shai, Turkish Coffee, Hibiscus Tea)
  - Special instructions (e.g., "extra mint, ya rais")
- Mark orders as **completed**
- View **pending orders dashboard**
- Generate reports for:
  - **Top-selling drinks**
  - **Total orders served**
- Built using **MVVM architecture** with clean folder structure

---

## 🏗 Project Structure (MVVM)
```bash
lib/
┣ core/
┣ orders/
┃ ┣ data/
┃ ┃ ┣ models/
┃ ┃ ┗ service/ 
┃ ┣ presentation/
┃ ┃ ┣ manager/ 
┃ ┃ ┣ view/ 
┃ ┃ ┗ widgets/ 
┣ dashboard/ 
┣ reports/ 
┗ main.dart 

```

This clean separation ensures **modularity, maintainability, and testability**.

---

## ⚙️ Object-Oriented Programming (OOP) in Action

1. **Encapsulation**  
   - The `Order` class keeps its data (`customerName`, `drinkType`, `notes`, `isCompleted`) private to its object scope.  
   - Behavior like `markCompleted()` is encapsulated inside the class, avoiding direct external manipulation.

2. **Abstraction**  
   - The `OrderRepository` exposes only essential methods (`addOrder`, `getAllOrders`, `getPendingOrders`) without exposing internal list details.  
   - This hides complexity and provides a clean API to the ViewModel.

3. **Polymorphism**  
   - Future extensions (e.g., `ReportGenerator` subclasses for daily, weekly, or monthly reports) can use polymorphism to handle different report types with a shared interface.

4. **Inheritance** (planned/future)  
   - Different types of orders (e.g., *DeliveryOrder* vs *InHouseOrder*) can inherit from the base `Order` class, sharing attributes while extending unique behaviors.

---

## 🧩 SOLID Principles Applied

1. **S — Single Responsibility Principle (SRP)**  
   - `Order` model: represents data only.  
   - `OrderRepository`: handles data storage & retrieval.  
   - `OrderViewModel`: manages UI state and business logic.  
   - `OrderList` widget: only responsible for displaying orders.

2. **O — Open/Closed Principle (OCP)**  
   - The `OrderRepository` is open for extension (e.g., adding a database or Hive integration) but closed for modification.  
   - You can plug in a new data source without changing ViewModel logic.

3. **D — Dependency Inversion Principle (DIP)**  
   - UI (View) depends on abstractions (`OrderViewModel` interface-like behavior) rather than concrete implementations.  
   - Future data storage changes (Hive, Firebase) won’t affect the UI layer.

---

## 🖼 Screenshots / Demo
(Add screenshots of order page, pending dashboard, etc.)

---

## 🚀 Future Improvements
- Integrate **Hive/Firebase** for persistent storage  
- Add **advanced reports** (daily sales trends, top customers)  
- Implement **authentication** for staff accounts  
- Add **localization** (Arabic/English support)  

---

## 🧑‍💻 Tech Stack
- Flutter (Dart)  
- Provider (State Management)  
- MVVM Architecture  
- Clean Folder Structure  

---

## 📌 Why This Matters
This project demonstrates not just Flutter UI skills, but also **software engineering best practices**:  
- **OOP** for modularity & abstraction  
- **SOLID** for maintainability & scalability  
- **MVVM** for clean separation of concerns  

