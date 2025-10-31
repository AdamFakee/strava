## 🫡Demo
[👉 Xem video demo tại đây
](https://drive.google.com/file/d/1LzxmR1sHTecHPmJxA5NcGOV2Pu0qVh9d/view?usp=sharing)

---


# 🚀 Strava Clone App (Flutter)

Ứng dụng được phát triển bằng **Flutter**, lấy cảm hứng từ **Strava**.  
Mục tiêu chính: quản lý hoạt động chạy bộ, phân tích dữ liệu và tùy chỉnh hình ảnh của người dùng.

---

## 📌 Mô tả sơ bộ
- Toàn bộ dữ liệu người dùng sẽ được lưu **local**.  
- Có tùy chọn lưu trên **database**, nhưng khi đó dữ liệu phía máy khách có thể bị mất (**nghiên cứu sau**).  
- Định hướng ban đầu của app gồm **4 chức năng chính**:
  1. 🔑 Xác thực người dùng  
  2. 🗺️ Vẽ bản đồ theo định vị (sử dụng Google Maps API)  
  3. 📊 Phân tích số liệu chạy bộ bằng AI (API gọi tới backend)  

---

## ⚙️ Cấu hình khởi tạo dự án
- 🎨 **ThemeMode** (Light/Dark mode)  
- 🌍 **Đa ngôn ngữ** (EN, VI)  
- 💾 **SharedPreferences Storage**  
- 🛣️ **Base Router** bằng `go_router`  
- 🔑 **Env file**  
- 🌐 **Multi environment**: Development & Production  

---

## 📂 Cấu trúc thư mục

```bash
strava
├── assets
│   ├── fonts/ : chứa font chữ file .tff
│   └── images
└── lib/
    ├── common/ : chứa các widget tái sử dụng được
    ├── data
    │   ├── repos/ : gọi api trả data
    │   └── services
    ├── envs/ : chứa các file env cho dev, production
    ├── features/ : chứa các màn hình + logic xử lý 
    │   ├── authentication/ : chứa các màn hình liên quan tới xác thực người dùng
    │   │   ├── controllers
    │   │   ├── models
    │   │   └── screens
    │   ├── core/ : chứa các chức năng chính
    │   ├── on_boardings/ : màn hình kiểu hiển thị 1 lần lúc vào app
    │   └── personaliztions/ : các màn hình dành cho người dùng cấu hình
    ├── l10n/ : chứa file text cho đa ngôn ngữ
    ├── main/ : file core để chạy app
    │   ├── app_env.dart
    │   ├── app.dart
    │   ├── main_common.dart
    │   └── main_dev.dart : khi dev thì chạy file này
    ├── utils
    │   ├── const/ : chứa các biến const
    │   │   ├── colors.dart 
    │   │   ├── image_strings.dart
    │   │   └── sizes.dart
    │   ├── database/ : db local sqflite
    │   │   ├── database.dart : file main ( entry point )
    │   │   ├── tables
    │   │   │   ├── users
    │   │   │   │   ├── user_queries.dart : chứa các RAW SQL dài
    │   │   │   │   └── user_table.dart : chứa các lệnh tạo bảng, khoá ngoại, index, tên bảng, tên cột
    │   │   │   ├── activities
    │   │   │   └── weekly_activity
    │   │   └── configs
    │   │       ├── db_migration.dart : chứa các lệnh sql cho từng phiển bản database
    │   │       └── open_db_options.dart : chứa các hàm callback như onCreate, upgrade, downgrade
    │   ├── device/ : gồm func liên quan đến thiết bị
    │   ├── exception : gồm các hàm bắt lỗi và xử lý lỗi
    │   ├── extensions/ : extension trong dart
    │   ├── helper/ : các hàm helper
    │   ├── local_storage
    │   │   ├── share_preference
    │   │   │   ├── share_preference_storage_abstract.dart : interface
    │   │   │   ├── share_preference_storage_keys.dart : key dùng cho share_preference_storage
    │   │   │   └── share_preference_storage.dart
    │   │   └── sql
    │   ├── localization/ : controller dùng để thay đổi ngôn ngữ
    │   ├── routers
    │   │   ├── bottom_navigations
    │   │   │   ├── bottom_navigation.dart
    │   │   │   └── tabs/ : chứa các tab 
    │   │   ├── widgets/ : chứa các widget dùng trong routers
    │   │   └── app_routers.dart : file main
    │   └── themes 
    │       ├── customs/ : chỉnh themeData cho từng widget cụ thể
    │       ├── states/ : controller dùng để thay đổi theme
    │       └── theme.dart : file main
    └── main.dart : build app => là file này
