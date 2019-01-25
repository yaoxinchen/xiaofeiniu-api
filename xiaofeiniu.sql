SET NAMES UTF8;
DROP DATABASE IF EXISTS xiaofeiniu;
CREATE DATABASE xiaofeiniu CHARSET=UTF8;
USE xiaofeiniu;

#创建管理员信息表
CREATE TABLE xfn_admin(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  aname VARCHAR(32) UNIQUE,
  apwd VARCHAR(64)
);
INSERT INTO xfn_admin VALUES(null,'yaoyao',PASSWORD('123456'));
INSERT INTO xfn_admin VALUES(null,'boss',PASSWORD('999999'));
INSERT INTO xfn_admin VALUES(null,'admin',PASSWORD('123456'));

#创建项目全局设置表
CREATE TABLE xfn_settings(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  appname VARCHAR(32),
  apiUrl VARCHAR(64),
  adminUrl VARCHAR(64),
  appUrl VARCHAR(64),
  icp VARCHAR(64),
  copyright VARCHAR(128)
);
INSERT INTO xfn_settings VALUES(null,'小肥牛','http://127.0.0.1:8090','http://127.0.0.1:8091','http://127.0.0.1:8092','京ICP备12003709号-3','Copyright © 2002-2019 北京达内金桥科技有限公司版权所有');

#桌台信息表
create table xfn_table(
    tid INT PRIMARY KEY AUTO_INCREMENT,
    tname VARCHAR(32),
    type VARCHAR(32),
    status INT
);
INSERT INTO xfn_table VALUES(null,'福满堂','2-3人桌',1);
INSERT INTO xfn_table VALUES(null,'金镶玉','6-8人桌',2);
INSERT INTO xfn_table VALUES(null,'寿启天','4-6人桌',3);
INSERT INTO xfn_table VALUES(null,'全家福','6-8人桌',0);

#桌台预定信息表
CREATE TABLE xfn_reservation(
  rid INT PRIMARY KEY AUTO_INCREMENT,
  contectName VARCHAR(64),
  phone VARCHAR(16),
  contactTime BIGINT,
  dinnerTime BIGINT
);
INSERT INTO xfn_reservation VALUES(null,'姚欣晨','13980712423',1548404830420,1548410400000);

#菜品分类表
CREATE TABLE xfn_category(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cName VARCHAR(32)
);
INSERT INTO xfn_category VALUES(null,'肉类');
INSERT INTO xfn_category VALUES(null,'蔬菜类');
INSERT INTO xfn_category VALUES(null,'蔬菜类');
INSERT INTO xfn_category VALUES(null,'豆制品类');
INSERT INTO xfn_category VALUES(null,'海鲜河鲜类');

#菜品信息表
CREATE TABLE xfn_dish(
  did INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(32),
  imgUrl VARCHAR(128),
  price DECIMAL(6,2),
  detail VARCHAR(256),
  categoryld INT,
  FOREIGN KEY(categoryld) REFERENCES xfn_category(cid)
)AUTO_INCREMENT=1001;
INSERT INTO xfn_dish VALUES(NULL,'招牌虾滑','xiahua.jpg',35,'精选湛江、北海区域出产的南美品种白虾虾仁，配以盐和淀粉等调料制作而成。虾肉含量越高，虾滑口感越纯正。相比纯虾肉，虾滑食用方便、入口爽滑鲜甜Q弹，海底捞独有的定制生产工艺，含肉量虾肉含量93%，出品装盘前手工摔打10次，是火锅中的经典食材。',1);
INSERT INTO xfn_dish VALUES(NULL,'捞派无刺巴沙鱼','wucibashayu.jpg',45,'巴沙鱼是东南亚淡水鱼品种。越南音译为"卡巴沙"(CABaSa)，意思是"三块脂肪鱼"，因为该鱼在生长过程中，腹腔积累有三块较大的油脂，约占体重的58%。 海底捞选用越南湄公河流域养殖的巴沙鱼。经工厂低温车间宰杀、快速去皮等工艺加工成鱼柳，包装速冻，再通过海底捞中央厨房加工腌制而成。巴沙鱼口味鲜嫩，且无刺无腥味，特别适合老人、小孩食用。',1);

#订单详情表
create table xfn_order(
    oid int primary key,#订单编号
    startTime bigint,#开始用餐时间
    endTime bigint,#结束用餐时间
    customerCount int,#用餐人数
    tableId int,#桌号
    foreign key(tableId) references xfn_table(tid)
);
INSERT INTO xfn_order VALUES(1,1548404830420,1548410400000,8,1);

#订单表
create table xfn_order_detail(
    did int primary key auto_increment,#订单编号
    dishId int,#菜单编号
    dishCount int,#菜品数量
    customerName varchar(64),#下单用户名
    orderId int,
    foreign key(dishId) references xfn_dish(did),
    foreign key(orderId) references xfn_order(oid)
); 
INSERT INTO xfn_order_detail VALUES(NULL,1001,1,'yaoxinchen',1);


