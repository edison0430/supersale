CREATE DATABASE supersale;
USE supersale;

--建立商品資料表
CREATE TABLE product(
`product_id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品ID',
`name` varchar(100) NOT NULL COMMENT '商品名稱',
`number` int NOT NULL COMMENT '庫存數量',
`price` int NOT NULL COMMENT '單價',
`start_time` timestamp NOT NULL COMMENT '搶購開啟時間',
`end_time` timestamp NOT NULL COMMENT '搶購結束時間',
PRIMARY KEY(product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品資料表';

--初始化商品資料表
insert into
  product(name, number, price, start_time, end_time)
values
  ('iPhone8', 100, 10000, '2018-11-03 00:00:00', '2018-11-08 00:00:00'),
  ('iPad Pro', 50, 7000, '2018-11-03 00:00:00', '2018-11-12 00:00:00'),
  ('小米平版4', 70, 1000, '2018-10-03 00:00:00', '2018-10-08 00:00:00'),
  ('Sony XZ3', 150, 10000, '2018-10-03 00:00:00', '2018-10-08 00:00:00');

-- 建立客戶資料表
CREATE TABLE member (
`member_id` bigint NOT NULL AUTO_INCREMENT COMMENT '會員編號',
`name` varchar(15) NOT NULL COMMENT '姓名',
`gender` char(1)  COMMENT '性別',
`phone` char(10) NOT NULL COMMENT '手機號碼',
`email` varchar(100) NOT NULL COMMENT 'E-MAIL',
`password` varchar(20) NOT NULL COMMENT '密碼',
`address` varchar(100)  COMMENT '地址',
`admin` TINYINT(1) COMMENT '是否為管理人員 (0=false, 1=true)',
PRIMARY KEY(customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客戶資料表';

--建立訂單資料表
CREATE TABLE shoppingorder(
`order_id` bigint NOT NULL auto_increment COMMENT '訂單編號',
`productName`  varchar(100) COMMENT '商品名稱',
`number` int NOT NULL COMMENT '購買數量',
`price` int NOT NULL COMMENT '單價',
`payment` varchar(10) NOT NULL COMMENT '付款方式',
`member_id` bigint NOT NULL COMMENT '會員編號',
`buyerName` varchar(15) NOT NULL COMMENT '訂購人姓名',
`buyerPhone` varchar(10) NOT NULL COMMENT '訂購人手機',
`buyerAddress` varchar(200) NOT NULL COMMENT '訂購人地址',
`receiverName` varchar(15) NOT NULL COMMENT '收件人姓名',
`receiverPhone` varchar(10) NOT NULL COMMENT '收件人手機',
`receiverAddress` varchar(200) NOT NULL COMMENT '收件人地址',
`remark` varchar(500) NOT NULL COMMENT '備注',
`createTime` timestamp NOT NULL COMMENT '建立時間',
PRIMARY KEY(order_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='訂單資料表';
