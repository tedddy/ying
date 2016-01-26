/*
ying locoy project LocoyProjectName

Steps:
1. change LocoyProjectName
2. change labels by replacing one by one.
	2.1 note: step 2 and step 3 can be done at the same time to save time
3. create table and setup mysql procedure
	3.1 note: add unique statement: UNIQUE KEY `UniqueKeyName` (``,``,``)
	3.2 note: change the data type of each field & change the length of VARCHAR
	3.3 note: for each field of the table, make a good comment including a standardized and consistant field, and the original label in the datasource. 
4. setup locoy project: 192.168.137.172 gxh locoy ying
	4.1 数据库地址：C:\火车采集器V8\Data\(*)\SpiderResult.db3
5. test
	5.1 note: test with a few records
	
网址：
数据：
参考：

            <tr>
                <td>120.195.196.106</td>
                <td>80</td>
                <td>高匿名</td>
                <td>HTTP</td>
                <td>GET, POST</td>
                <td>江苏省  移动</td>
                <td>3秒</td>
                <td>1小时前</td>
            </tr>
			
            <tr>
                <td>120.195.196.106</td>
                <td>80</td>
                <td>高匿名</td>
                <td>HTTP</td>
                <td>GET, POST</td>
                <td>江苏省  移动</td>
                <td>3秒</td>
                <td>1小时前</td>
            </tr>

[参数]
[参数1]: 
[参数2]: 
[参数3]: 
[参数4]: 
[参数5]: 
[参数6]: 
[参数7]: 
[参数8]: 
[参数9]: 
[参数10]: 
[参数11]: 
[参数12]: 
[参数13]: 
[参数14]: 
[参数15]: 
[参数16]: 
[参数17]: 
[参数18]: 
[参数19]: 
[参数]:DateSys
[参数]:TimeSys;
*/

SELECT * FROM `ying`.`LocoyProjectName`;		
DROP TABLE `ying`.`LocoyProjectName`;
CREATE TABLE `LocoyProjectName` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `in_1` VARCHAR(18) DEFAULT NULL COMMENT 'in_1',
  `in_2` VARCHAR(18) DEFAULT NULL COMMENT 'in_2',
  `in_3` VARCHAR(18) DEFAULT NULL COMMENT 'in_3',
  `in_4` VARCHAR(18) DEFAULT NULL COMMENT 'in_4',
  `in_5` VARCHAR(18) DEFAULT NULL COMMENT 'in_5',
  `in_6` VARCHAR(18) DEFAULT NULL COMMENT 'in_6',
  `in_7` VARCHAR(18) DEFAULT NULL COMMENT 'in_7',
  `in_8` VARCHAR(18) DEFAULT NULL COMMENT 'in_8',
  `in_9` VARCHAR(18) DEFAULT NULL COMMENT 'in_9',
  `in10` VARCHAR(18) DEFAULT NULL COMMENT 'in10',
  `in11` VARCHAR(18) DEFAULT NULL COMMENT 'in11',
  `in12` VARCHAR(18) DEFAULT NULL COMMENT 'in12',
  `in13` VARCHAR(18) DEFAULT NULL COMMENT 'in13',
  `in14` VARCHAR(18) DEFAULT NULL COMMENT 'in14',
  `in15` VARCHAR(18) DEFAULT NULL COMMENT 'in15',
  `in16` VARCHAR(18) DEFAULT NULL COMMENT 'in16',
  `in17` VARCHAR(18) DEFAULT NULL COMMENT 'in17',
  `in18` VARCHAR(18) DEFAULT NULL COMMENT 'in18',
  `in19` VARCHAR(18) DEFAULT NULL COMMENT 'in19',
  `in20` VARCHAR(18) DEFAULT NULL COMMENT 'in20',
  `in21` VARCHAR(18) DEFAULT NULL COMMENT 'in21',
  `in22` VARCHAR(18) DEFAULT NULL COMMENT 'in22',
  `TimeSys` TIME DEFAULT NULL COMMENT 'TimeSystem',
  `DateSys` DATE DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (``,``)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP PROCEDURE `ying`.`LocoyProjectName`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `LocoyProjectName`(IN in_1 VARCHAR(18), in_2 VARCHAR(18), in_3 VARCHAR(18), in_4 VARCHAR(18), in_5 VARCHAR(18), in_6 VARCHAR(18), in_7 VARCHAR(18), in_8 VARCHAR(18), in_9 VARCHAR(18), in10 VARCHAR(18), in11 VARCHAR(18), in12 VARCHAR(18), in13 VARCHAR(18), in14 VARCHAR(18), in15 VARCHAR(18), in16 VARCHAR(18), in17 VARCHAR(18), in18 VARCHAR(18), in19 VARCHAR(18), in20 VARCHAR(18), in21 VARCHAR(18), in22 VARCHAR(18), TimeSys TIME, DateSys DATE)
BEGIN
SET in_1 = IF(in_1 = '', NULL, in_1);
SET in_2 = IF(in_2 = '', NULL, in_2);
SET in_3 = IF(in_3 = '', NULL, in_3);
SET in_4 = IF(in_4 = '', NULL, in_4);
SET in_5 = IF(in_5 = '', NULL, in_5);
SET in_6 = IF(in_6 = '', NULL, in_6);
SET in_7 = IF(in_7 = '', NULL, in_7);
SET in_8 = IF(in_8 = '', NULL, in_8);
SET in_9 = IF(in_9 = '', NULL, in_9);
SET in10 = IF(in10 = '', NULL, in10);
SET in11 = IF(in11 = '', NULL, in11);
SET in12 = IF(in12 = '', NULL, in12);
SET in13 = IF(in13 = '', NULL, in13);
SET in14 = IF(in14 = '', NULL, in14);
SET in15 = IF(in15 = '', NULL, in15);
SET in16 = IF(in16 = '', NULL, in16);
SET in17 = IF(in17 = '', NULL, in17);
SET in18 = IF(in18 = '', NULL, in18);
SET in19 = IF(in19 = '', NULL, in19);
SET in20 = IF(in20 = '', NULL, in20);
SET in21 = IF(in21 = '', NULL, in21);
SET in22 = IF(in22 = '', NULL, in22);
SET TimeSys = CURTIME();
SET DateSys = CURDATE();

INSERT INTO `LocoyProjectName` (`in_1`, `in_2`, `in_3`, `in_4`, `in_5`, `in_6`, `in_7`, `in_8`, `in_9`, `in10`, `in11`, `in12`, `in13`, `in14`, `in15`, `in16`, `in17`, `in18`, `in19`, `in20`, `in21`, `in22`, `TimeSys`, `DateSys`) VALUES (in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, TimeSys, DateSys) 
ON DUPLICATE KEY UPDate 
`in_1` = in_1,
`in_2` = in_2,
`in_3` = in_3,
`in_4` = in_4,
`in_5` = in_5,
`in_6` = in_6,
`in_7` = in_7,
`in_8` = in_8,
`in_9` = in_9,
`in10` = in10,
`in11` = in11,
`in12` = in12,
`in13` = in13,
`in14` = in14,
`in15` = in15,
`in16` = in16,
`in17` = in17,
`in18` = in18,
`in19` = in19,
`in20` = in20,
`in21` = in21,
`in22` = in22,
`TimeSys` = TimeSys,
`DateSys` = DateSys;
END$$
DELIMITER ;

CALL LocoyProjectName('[标签:in_1]','[标签:in_2]','[标签:in_3]','[标签:in_4]','[标签:in_5]','[标签:in_6]','[标签:in_7]','[标签:in_8]','[标签:in_9]','[标签:in10]','[标签:in11]','[标签:in12]','[标签:in13]','[标签:in14]','[标签:in15]','[标签:in16]','[标签:in17]','[标签:in18]','[标签:in19]','[标签:in20]','[标签:in21]','[标签:in22]','','')

original field name		name of gxh		Chinese
zjl                     zjl             (折价率：(净值-价格)/净值) 
code					code			证券代码
						fSH				是否上证（1,0）
						mkt				上证为1深证为2
symbol					code			证券代码
trade					price			成交价
pricechange				chgprice		成交价涨跌		`chgprice` decimal(6,3) DEFAULT NULL COMMENT 'chgprice',
changepercent			chgrate			成交价涨跌幅	`chgrate` decimal(5,3) DEFAULT NULL COMMENT 'chgrate',
settlement				settlement		昨日成交价
buy						buy				买入价
sell					sell			卖出价
open					open			开盘价
high					high			最高价
low						low				最低价
volume					volume			成交量
amount					amount			成交额
ticktime				ticktime（time）		当时时间
per						per				市盈率
pb						pb				市净率
mktcap					mktcap			总市值（以前为总股本，是错误的）
nmc						nmc (ltsz)		流通市值（以前为流通股本，是错误的）
turnoverratio			tRatio			换手率
WEIGHING				weight			权重
INAME					iName			指数名称
HYSYMBOL				iCode			指数代码	
ltgb					nmc				流通股本
zgb						mktcap			总股本
prevtrade				last			昨收盘
gxzs					gxzs			贡献指数
ltsz					ltsz			流通市值
netamount				netAmount		净流入
ratioamount				netRate			净流入率
r0						amountXL		特大单流入额 超大单流入
r1						amountL		    大单流入额 大单流入
r2						amountS			小单流入额 中单流入
r3						amountI			散单流入额(I: individual) 小单流入
r0_net					netXL			特大单净流入 超大单净流入
r1_net					netL		    大单净流入 
r2_net					netS			小单净流入 中单净流入
r3_net					netI			散单净流入(I: individual) 小单净流入
turnover				amount			换手率*100
r0x_ratio				ratioXL			主力罗盘度
						WeiBi			委比
						LiangBi			量比
						LiangBi			5分钟涨跌
						sCover 			融券偿还量
						sSell 			融券卖出量
						bStock 			融券余量  (b: banlance)
						mCover 			融资偿还额
						mBuy 			融资买入额
						bMargin 		融资余额
						BVPS			每股净资产 book value of equity per share

[参数]
[参数1]:code
[参数2]:name
[参数3]:settlement
[参数4]:open
[参数5]:close
[参数6]:high
[参数7]:low
[参数8]:amount
[参数9]:volume
[参数10]:chgprice
[参数11]:chgrate
[参数12]:AvgTrade
[参数13]:ZhenFu
[参数14]:WeiBi
[参数15]:WeiCha
[参数16]:NA
[参数17]:NA
[参数18]:NA
[参数19]:NA
[参数20]:chgrate_5m(五分钟涨跌)
[参数21]:LiangBi
[参数22]:tRatio
[参数23]:per
[参数24]:buy
[参数25]:sell
[参数26]:date
[参数27]:time

CREATE TABLE `hs_s_xts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL COMMENT '代码id; code id in table hk_s and in table hk_s',
  `date` date DEFAULT NULL COMMENT '交易日期; trade date',
  `open` decimal(7,3) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(7,3) unsigned DEFAULT NULL COMMENT '最高价',
  `low` decimal(7,3) unsigned DEFAULT NULL COMMENT '最低价',
  `close` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT '成交量',
  `amount` int(11) unsigned DEFAULT NULL COMMENT '股票成交额',
  `time` time DEFAULT NULL,
  `adjusted` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `fR` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Result of data collection\n0: fail; 1: success',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stock_date` (`code`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `hs_s_hs300_EM` (
    `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
    `open` DECIMAL(6 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'open',
    `close` DECIMAL(6 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'close',
    `high` DECIMAL(6 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'high',
    `low` DECIMAL(6 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'low',
    `amount` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount',
    `volume` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume',
    `chgrate` DECIMAL(5 , 2 ) DEFAULT NULL COMMENT 'chgrate',
    `WeiBi` DECIMAL(6 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'WeiBi',
    `chgrate5` DECIMAL(5 , 2 ) DEFAULT NULL COMMENT 'chgrate5',
    `LiangBi` DECIMAL(6 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'LiangBi',
    `tRatio` DECIMAL(5 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'tRatio',
    `date` DATE DEFAULT NULL COMMENT 'date',
    `time` TIME DEFAULT NULL COMMENT 'time',
    PRIMARY KEY (`id`),
    UNIQUE KEY `KeyName` (`code` , `date`)
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `hs_s_loan_EM` (
    `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
    `fSH` TINYINT(1) UNSIGNED DEFAULT NULL COMMENT 'fSH',
    `name` VARCHAR(18) DEFAULT NULL COMMENT 'name',
    `date` DATE DEFAULT NULL COMMENT 'date',
    `sCover` INT(9) UNSIGNED DEFAULT NULL COMMENT 'sCover',
    `sSell` INT(9) UNSIGNED DEFAULT NULL COMMENT 'sSell',
    `bStock` INT(11) UNSIGNED DEFAULT NULL COMMENT 'bStock',
    `mCover` BIGINT(11) UNSIGNED DEFAULT NULL COMMENT 'mCover',
    `mBuy` BIGINT(11) UNSIGNED DEFAULT NULL COMMENT 'mBuy',
    `bMargin` BIGINT(12) UNSIGNED DEFAULT NULL COMMENT 'bMargin',
    PRIMARY KEY (`id`),
    UNIQUE KEY `KeyName` (`code` , `date`)
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `hs_fund_b_jsl` (
    `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    `code_m` VARCHAR(6) DEFAULT NULL COMMENT 'code_m',
    `code_b` VARCHAR(6) DEFAULT NULL COMMENT 'code_b',
    `price_b` DECIMAL(6 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'price_b',
    `chgrate_p` DECIMAL(6 , 3 ) DEFAULT NULL COMMENT 'chgrate_p',
    `amount` DECIMAL(8 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'amount',
    `jjjz_b` DECIMAL(7 , 4 ) UNSIGNED DEFAULT NULL COMMENT 'jjjz_b',
    `date` DATE DEFAULT NULL COMMENT 'date',
    `yjl` DECIMAL(6 , 3 ) DEFAULT NULL COMMENT 'yjl',
    `leverate_p` DECIMAL(6 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'leverate_p',
    `leverate_j` DECIMAL(6 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'leverate_j',
    `cost_c` DECIMAL(5 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'cost_c',
    `recal_l` DECIMAL(5 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'recal_l',
    `recal_u` DECIMAL(5 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'recal_u',
    `jjjz_b_est` DECIMAL(6 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'jjjz_b_est',
    `code_index` VARCHAR(6) DEFAULT NULL COMMENT 'code_index',
    `chgrate_index` DECIMAL(5 , 2 ) DEFAULT NULL COMMENT 'chgrate_index',
    `a_ratio` TINYINT(1) DEFAULT NULL COMMENT 'a_ratio',
    `b_ratio` TINYINT(1) DEFAULT NULL COMMENT 'b_ratio',
    `jjjz_m` DECIMAL(6 , 4 ) UNSIGNED DEFAULT NULL COMMENT 'jjjz_m',
    `yjl_m_est` DECIMAL(6 , 3 ) DEFAULT NULL COMMENT 'yjl_m_est',
    `ticktime` TIME DEFAULT NULL COMMENT 'ticktime',
    PRIMARY KEY (`id`),
    UNIQUE KEY `KeyName` (`code_b` , `date`)
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;



<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=1000">
<title>快代理 - 高速http代理ip每天更新</title>
 
<meta name="keywords" content="快代理,代理ip购买,代理服务器,高速http代理,代理ip,代理ip地址,花刺代理ip,ip代理,ip代理软件,国外代理服务器,免费代理服务器,免费代理ip,高匿代理ip,最新代理ip,免费代理ip,代理服务器ip,代理服务,代理地址,代理列表,最新免费代理ip" />
<meta name="description" content="快代理专业为您提供代理ip购买|代理服务器|高速http代理|免费代理ip|代理ip地址|最新免费代理ip每天更新，想要了解更多代理服务|代理地址|代理列表的详情，就到快代理。" />
<meta content="index,follow" name="robots"/>
<meta content="index,follow" name="GOOGLEBOT"/>
<meta content="快代理"  name="Author"/>
 
<link rel="shortcut icon" href="http://img.kuaidaili.com/img/favicon.ico?v=2" type="image/x-icon">
 
 
 
<style> 
body { font-family:"微软雅黑", Helvetica; font-size:13px;line-height:160%; margin:0; padding:0; color:#777; -webkit-tap-highlight-color:rgba(0, 0, 0, 0); }
body { margin:0px auto; }
form, table, td, h1, h2, h3, h4, ul, ol, li, p { margin:0; padding:0; border:0; list-style:none }
h2 { color:#2f2f2f; font-size: 18px;}
.header_top { float:right;padding: 0 20px 0 0; line-height:30px; }
.header_top .login { display:inline-block; margin-right:40px; }
.header_top .login .log { color:#b94a48;}
.header_top a { text-decoration:none; color:#49afcd; }
.header_top a:hover { text-decoration:underline;  }
.header_top a img { vertical-align:-25%;}
.header_top .splt { color:#bbb; margin: 0 8px;}
.header_top .btn {background-color:#49afcd; padding:3px 5px 3px 5px; color:#fff; font-weight:bold; border-radius:3px; transition: background-color 0.2s linear;}
.header_top .btn:hover { background-color:#3a87ad; text-decoration:none;}
.header_top .faq_btn {background-color:#aaa;}
.header_top .faq_btn:hover { background-color:#1a1a1a; }
 
#nav{height:66px; text-align:right; margin-left:30px; clear:right; }
#nav ul { margin-top: 16px; margin-left: 40px; float:right;}
#nav ul li{ float:left; display:inline-block;height:37px; margin-right:15px;}
#nav ul li a{display:inline-block;color: #979795; font-size:16px;font-weight:bold; line-height:32px; vertical-align:middle; padding: 0 10px; text-decoration:none; border-bottom:2px solid #c8e6e0;}
#nav ul li a:hover {border-bottom:2px solid #49afcd; color:#333;}
#nav ul li.active a {background-color:#49afcd;color:#fff; border-bottom:2px solid #49afcd;}
 
#container { width: 960px; min-height:500px; margin: 0 auto; overflow:auto; padding-top:10px;}
.taglineWrap { background: #eee; border-bottom: 1px solid #ddd; min-height: 20px; border: 0px solid #eee; border: 0px solid rgba(0, 0, 0, 0.05); }
.taglineContent { width:960px; margin: 0 auto; padding: 24px 19px; word-wrap: break-word; }
.taglineContent div { display:inline-block; }
.taglineContent h1 { margin-bottom:20px;}
.taglineContent h2 { margin-bottom:15px;}
.taglineContent span { display:inline-block; width:110px; }
.taglineContent li { font-size:14px; margin:6px 0px; }
.taglineContent p { font-size:14px; margin:3px 0px; }
 
.stat span { font-size:16px;color:#2f2f2f;}
.stat strong { font-size:36px;color:#49afcd; font-weight:bold;}
.stat .right { float:right;}
.stat .hint { font-size:13px;color:#aaa;}
.stat_num { color:#49afcd; font-size:24px; font-weight:bold; }
 
#intro { padding: 0 50px;}
#intro p{text-indent: 2em;}
 
.col { display:inline-block; width:24.5%; }
.col div { display:inline-block; }
.col h1 { margin: 10px 0; }
 
.bottom_kw { color:#ffffff;}
.bottom_kw a { text-decoration:none; color:#ffffff;}
</style>
 
 
<meta name="baidu-site-verification" content="AO3Q6dKj9R" />
<meta name="sogou_site_verification" content="9ELczs5cQc"/>
</head>
 
<body>
 
<div id="header">
    <div id="logo"><a href="/"><img width="150" height="59" src="http://img.kuaidaili.com/img/kdl_logo.png?v=1" alt="快代理"/></a></div>
    <div>
        <div class="header_top">
          
            <span class="wrap">
                <span class="login">
                    <span class="splt"></span><a id="uc_btn" class="btn" href="/usercenter/"><i class="icon-user icon-white"></i>&nbsp;会员中心</a>
                </span>
                <a id="uc_btn" class="btn faq_btn" href="/help/" target="_blank"><i class="icon-question-sign icon-white"></i>&nbsp;我要咨询</a>
            </span>
        </div>
        <div id="nav">
            <ul id="menu">
            <li id="menu_list"><a href="/">首页</a></li>
            <li id="menu_free"><a href="/free/">免费代理</a></li>
            <li id="menu_pricing"><a href="/pricing/">购买代理</a></li>
            <li id="menu_dist"><a href="/dist/">代理详情</a></li>
            <li id="menu_fetch"><a href="/fetch/">代理提取</a></li>
            <li id="menu_apidoc"><a href="/apidoc/">API接口</a></li>
            <!--<li id="menu_check"><a href="/check/">代理检测</a></li>-->
            <li id="menu_help"><a href="/help/">帮助中心</a></li>
            </ul>
        </div>
    </div>
</div>
 
 
 
 
<div class="taglineWrap">
    <div class="taglineContent">
        <h2>为什么使用快代理？</h2>
        <p>我们不间断地运行着极其高效、精准的公网代理收集系统，每天扫描的代理数以万计，最新出现的代理总能在第一时间收录。</p>
        <p>我们精确地检测每一个代理IP的匿名度、响应时间、数据传输速度、地域、运营商，平均每个IP每天被检测上百次，因此你总是可以在这里找到可以正常工作的代理。</p>
        <p>我们提供了极其丰富的代理筛选和API接口，只为更便捷地提取。</p>
 
    </div>
</div>
 
<div id="container">
 
 
<div class="stat" style="margin: 20px 0;">
    <span>代理总数: <strong>8801732</strong>个<span class="hint"> 56秒前更新</span></span>
    <span class="right">10分钟内可用: <strong>5162</strong>个<span class="hint"> 54秒前更新</span></span>
</div>
 
<div id="freelist" style="margin:10px 0 10px 0;">
    <h3 style="text-align:center;">免费高速HTTP代理IP列表（2015-09-19）</h3>
</div>
<div id="intro">
<p></p>
</div>
<div id="list">
    <table class="table table-bordered table-striped">
      <thead>
          <tr>
            <th>IP</th>
            <th>PORT</th>
            <th>匿名度</th>
            <th>类型</th>
            <th>get/post支持</th>
            <th>位置</th>
            <th>响应速度</th>
            <th>最后验证时间</th>
          </tr>
        </thead>
        <tbody>
            
            <tr>
                <td>58.220.2.148</td>
                <td>80</td>
                <td>高匿名</td>
                <td>HTTP, HTTPS</td>
                <td>GET, POST</td>
                <td>江苏省扬州市  电信</td>
                <td>0.9秒</td>
                <td>1小时前</td>
            </tr>
            
            <tr>
                <td>120.195.203.207</td>
                <td>80</td>
                <td>高匿名</td>
                <td>HTTP</td>
                <td>GET, POST</td>
                <td>江苏省  移动</td>
                <td>2秒</td>
                <td>1小时前</td>
            </tr>
            
            <tr>
                <td>1.202.251.178</td>
                <td>8080</td>
                <td>透明</td>
                <td>HTTP, HTTPS</td>
                <td>GET, POST</td>
                <td>北京市  电信</td>
                <td>2秒</td>
                <td>1小时前</td>
            </tr>
            
            <tr>
                <td>120.195.203.217</td>
                <td>80</td>
                <td>高匿名</td>
                <td>HTTP</td>
                <td>GET, POST</td>
                <td>江苏省  移动</td>
                <td>1秒</td>
                <td>1小时前</td>
            </tr>
            
            <tr>
                <td>120.195.207.227</td>
                <td>80</td>
                <td>高匿名</td>
                <td>HTTP</td>
                <td>GET, POST</td>
                <td>江苏省  移动</td>
                <td>3秒</td>
                <td>1小时前</td>
            </tr>
            
            <tr>
                <td>116.52.16.191</td>
                <td>8090</td>
                <td>高匿名</td>
                <td>HTTP</td>
                <td>GET, POST</td>
                <td>云南省昆明市  电信</td>
                <td>2秒</td>
                <td>1小时前</td>
            </tr>
            
            <tr>
                <td>120.195.192.170</td>
                <td>80</td>
                <td>高匿名</td>
                <td>HTTP</td>
                <td>GET, POST</td>
                <td>江苏省  移动</td>
                <td>2秒</td>
                <td>1小时前</td>
            </tr>
            
            <tr>
                <td>218.92.227.165</td>
                <td>18378</td>
                <td>高匿名</td>
                <td>HTTP, HTTPS</td>
                <td>GET, POST</td>
                <td>江苏省盐城市 电信</td>
                <td>3秒</td>
                <td>1小时前</td>
            </tr>
            
            <tr>
                <td>120.195.196.106</td>
                <td>80</td>
                <td>高匿名</td>
                <td>HTTP</td>
                <td>GET, POST</td>
                <td>江苏省  移动</td>
                <td>3秒</td>
                <td>1小时前</td>
            </tr>
            
            <tr>
                <td>120.195.196.197</td>
                <td>80</td>
                <td>高匿名</td>
                <td>HTTP</td>
                <td>GET, POST</td>
                <td>江苏省  移动</td>
                <td>2秒</td>
                <td>1小时前</td>
            </tr>
            
        </tbody>
    </table>
    <p>注：表中响应速度是中国测速服务器的测试数据，仅供参考。响应速度根据你机器所在的地理位置不同而有差异。</p>
 
    <div id="listnav">
        <ul>
            <li>第</li>
            <li><a id="p1" href="/proxylist/1/">1</a></li>
            <li><a id="p2" href="/proxylist/2/">2</a></li>
            <li><a id="p3" href="/proxylist/3/">3</a></li>
            <li><a id="p4" href="/proxylist/4/">4</a></li>
            <li><a id="p5" href="/proxylist/5/">5</a></li>
            <li><a id="p6" href="/proxylist/6/">6</a></li>
            <li><a id="p7" href="/proxylist/7/">7</a></li>
            <li><a id="p8" href="/proxylist/8/">8</a></li>
            <li><a id="p9" href="/proxylist/9/">9</a></li>
            <li><a id="p10" href="/proxylist/10/">10</a></li>
            <li>页</li>
        </ul>
    </div>
</div>
 
<div class="btn center"><a id="tobuy" href="/pricing/">购买更多代理</a></div>
 
</div>
 
 
 
<div id="footer2">
    <div class="container">
        <div class="copyright">© 2015 Kuaidaili.com 版权所有</div>
        <div class="footnav"><a href="/about/">关于我们</a><span>|</span><a href="/help/">帮助中心</a><span>|</span><a href="/privacy/">隐私政策</a><span>|</span><a href="http://blog.kuaidaili.com/" target="_blank">官方博客</a><span>|</span><a href="/sitemap.xml">网站地图</a></div>
        <div class="icon">
           <a href="http://zhanzhang.anquan.org/physical/report/?domain=www.kuaidaili.com" target="_blank" title="安全联盟站长平台安全网站"><img width="105" height="40" src="http://img.kuaidaili.com/img/zhanzhang.png" alt="安全联盟站长平台" /></a>
        </div>
    </div>
</div>
<div class="bottom_kw"> 
<span>Keywords:
<a href="http://www.kuaidaili.com" title="免费代理ip" target="_blank"><strong><span>免费代理ip</strong></a> 
<a href="http://www.kuaidaili.com" title="代理ip地址" target="_blank"><strong><span>代理ip地址</strong></a> 
<a href="http://www.kuaidaili.com" title="免费代理服务器" target="_blank"><strong><span>免费代理服务器</strong></a> 
<a href="http://www.kuaidaili.com" title="代理服务器地址" target="_blank"><strong><span>代理服务器地址</strong></a> 
</div>
<a href="#top" id="top_btn" class="label btt" style="display:none;"><span class="icon-chevron-up icon-white"></span></a>
 
 
<link rel="stylesheet" href="http://img.kuaidaili.com/css/base.min.css?v=54" media="screen" />
<!--[if lt IE 8]><link rel="stylesheet" href="http://img.kuaidaili.com/css/ie.css?v=2" media="screen" /><![endif]-->
<script language="javascript" type="text/javascript" src="http://img.kuaidaili.com/js/all.js?v=7"></script>
 
<script type="text/javascript"> 
$("tbody tr:nth-child(odd)").addClass("odd");
function jumpToAnchor(id){
    if($('#'+id).length > 0){
        var jump_to = $('#'+id).offset(); window.scrollTo(jump_to.left, jump_to.top);
    }
}
$(document).ready(function() {
    if(window.location.pathname.indexOf("/proxylist/") != -1)
        jumpToAnchor("freelist");
    $("#p1").addClass("active");
});
</script>
 
<script type="text/javascript"> 
var menu = "menu_list";
if(menu) $('#'+menu).addClass('active');
var ucm = "";
if(ucm){
    $('#ucm_'+ucm).addClass('active');
    $('#ucm_'+ucm+' a i').addClass('icon-white');
}
$(document).ready(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#top_btn').fadeIn(200);
        } else {
            $('#top_btn').fadeOut(200);
        }
    });
    $('#top_btn').click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, 500);
        return false;
    });
});
 
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F7ed65b1cc4b810e9fd37959c9bb51b31' type='text/javascript'%3E%3C/script%3E"));
 
</script>
 
</body>
</html>

