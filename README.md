# [搶購網](http://www.edison763092.com/supersale/list)
這是我使用 JAVA 所完成的一個作品，是一個類似1111購物節的購物網站，當商品處於活動時間內，使用者可點選搶購連結，進行購買。

此外網站也實作了會員系統及後台管理系統。

# 專案使用技術及環境
- 前端 : jQuery + Bootstrap
- 後端 : Java 框架 Spring MVC + MyBatis
- 資料庫 : MySQL
- Web 容器 : Tomcat 8.0
- 架設環境 : Amazon Web Service EC2 (UBuntu 18.04)

## 作品介紹
**1. 首頁**

- 處於活動中的商品會呈現在首頁上。
![Imgur](https://i.imgur.com/x7hXEHy.png)

- 搶購預告頁
![Imgur](https://i.imgur.com/Uc1KJyL.png)

**2.會員系統**

- 註冊時需填寫會員名稱、手機號碼、Email、密碼
![Imgur](https://i.imgur.com/UyygNx9.png)

- 登入頁面使用Bootstrap的modal
![Imgur](https://i.imgur.com/Mp4qOZx.png)

- 登入後可從Hearder進入會員資料修改
![Imgur](https://i.imgur.com/JuPNFJr.png)

- 變更密碼
![Imgur](https://i.imgur.com/VLuthra.png)

- 查詢訂單
![Imgur](https://i.imgur.com/E92XxGy.png)

- 訂單收件人資料
![Imgur](https://i.imgur.com/G8UfJ6W.png)

**3.結帳流程**

- 首頁點選搶購連結後，會進到結帳流程，先選擇數量及付款方式
![Imgur](https://i.imgur.com/B7Lu0Py.png)

- 輸入結帳所需資料
![Imgur](https://i.imgur.com/g1hdGI6.png)

- 結帳完成
![Imgur](https://i.imgur.com/rIsnfWR.png)


**4.後台商品管理**

- 若登入者為管理員，可從Header進入後台的商品管理頁面
> 管理員帳號密碼: admin@com / admin00

![Imgur](https://i.imgur.com/KVUDio5.png)

- 新增商品
> 時間欄位使用jQuery plugin : Bootstrap Datepicker

![Imgur](https://i.imgur.com/Y1RP06b.png)

- 修改商品
![Imgur](https://i.imgur.com/1oNhnNd.png)

- 商品刪除前會彈出視窗，確認是否刪除
![Imgur](https://i.imgur.com/BlJwCgU.png)

**補充說明**

1. 網站中的表單皆有前端及後端的驗證，前端使用jQuery plugin: validation，後端使用JSR 303
2. 使用Interceptor，達成以下功能

    1. 檢查使用者是否已登入
    2. 檢查商品當前狀態是否可購買，若可以購買才進入結帳作業
    3. 檢查使用者是否有管理權限，若有才可執行商品管理相關功能
    
