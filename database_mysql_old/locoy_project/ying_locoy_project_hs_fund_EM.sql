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
	4.1 数据库地址：C:\火车采集器V8\Data\（*）\SpiderResult.db3
5. test
	5.1 note: test with a few records
	
基金161026 
单位净值</a>((*))：</span><span class='left12'><span class="(*)">[参数]</span> 
累计净值</a>：</span><span class='right12'><span class="(*)">[参数]</span>
基金150210 http://fund.eastmoney.com/161026.html 
单位净值</a>(07-10)：</span><span class='left12'><span class="(*)">0.4570</span>
累计净值</a>：</span><span class='right12'><span class="(*)">[参数]</span>
近3月收益：</span><span class='left22'><span class="(*)">-45.73%</span>
近1年收益：</span><span class='right22'><span class="(*)">-</span>
规　　模</a>：</td><td>560.44亿元（15-06-30）</td>

<div id="statuspzgz" class="fundpz"><span class="red bold">0.5921</span><div id="statuszdf" class="fundzf up"><p class="red">0.0211</p><p class="red">3.70%</p></div><p class="time">2015-07-22 15:00</p></div>

<div id="statuspzgz" class="fundpz"><span class="red bold">[参数]</span><div id="(*)" class="(*)"><p class="(*)">[参数]</p><p class="(*)">[参数]</p></div><p class="time">[参数] [参数]</p></div> 

[参数]
[参数1]:code
[参数2]:PaiMing
[参数3]:name
[参数4]:jjjz
[参数5]:jjjz_forcast <div id="statuspzgz" class="fundpz"><span class="red bold">[参数]</span>
[参数6]:chgprice_jjjz <div id="statuszdf" class="fundzf (*)"><p class="red">[参数]</p><p class="red">[参数]</p></div>
[参数7]:chg_rate_jjjz
[参数26]:date
[参数27]:time
[参数8]:
[参数9]:
[参数10]:price
[参数11]:zjl (折价率：(净值-价格)/净值)


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
`in_1` = IF(in_1 IS NULL, `in_1`, in_1),
`in_2` = IF(in_2 IS NULL, `in_2`, in_2),
`in_3` = IF(in_3 IS NULL, `in_3`, in_3),
`in_4` = IF(in_4 IS NULL, `in_4`, in_4),
`in_5` = IF(in_5 IS NULL, `in_5`, in_5),
`in_6` = IF(in_6 IS NULL, `in_6`, in_6),
`in_7` = IF(in_7 IS NULL, `in_7`, in_7),
`in_8` = IF(in_8 IS NULL, `in_8`, in_8),
`in_9` = IF(in_9 IS NULL, `in_9`, in_9),
`in10` = IF(in10 IS NULL, `in10`, in10),
`in11` = IF(in11 IS NULL, `in11`, in11),
`in12` = IF(in12 IS NULL, `in12`, in12),
`in13` = IF(in13 IS NULL, `in13`, in13),
`in14` = IF(in14 IS NULL, `in14`, in14),
`in15` = IF(in15 IS NULL, `in15`, in15),
`in16` = IF(in16 IS NULL, `in16`, in16),
`in17` = IF(in17 IS NULL, `in17`, in17),
`in18` = IF(in18 IS NULL, `in18`, in18),
`in19` = IF(in19 IS NULL, `in19`, in19),
`in20` = IF(in20 IS NULL, `in20`, in20),
`in21` = IF(in21 IS NULL, `in21`, in21),
`in22` = IF(in22 IS NULL, `in22`, in22),
`TimeSys` = TimeSys,
`DateSys` = DateSys;
END

CALL LocoyProjectName('[标签:in_1]','[标签:in_2]','[标签:in_3]','[标签:in_4]','[标签:in_5]','[标签:in_6]','[标签:in_7]','[标签:in_8]','[标签:in_9]','[标签:in10]','[标签:in11]','[标签:in12]','[标签:in13]','[标签:in14]','[标签:in15]','[标签:in16]','[标签:in17]','[标签:in18]','[标签:in19]','[标签:in20]','[标签:in21]','[标签:in22]','','')

original field name		name of gxh		Chinese
code					code			证券代码
symbol					code			证券代码
trade					price			成交价
pricechange				chgprice		成交价涨跌
changepercent			chgrate			成交价涨跌幅
settlement				close			最近一次成交价
buy						buy				买入价
sell					sell			卖出价
open					open			开盘价
high					high			最高价
low						low				最低价
volume					volume			成交量
amount					amount			成交额
ticktime				ticktime		当时时间
per						per				市盈率
pb						pb				市净率
mktcap					mktcap			总股本
nmc						nmc				流通股本
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--published at 2015-07-22 16:52:34-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>富国中证国企改革指数分级B (150210)主页_天天基金网</title>
    <meta http-equiv="Content-Language" content="zh-CN" />
    <meta name="keywords" content="富国中证国企改革指数分级B ,150210,富国中证国企改革指数分级B 基金公司档案,富国中证国企改革指数分级B 基金公司介绍,富国中证国企改革指数分级B 旗下基金净值" />
    <meta name="description" content="天天基金网每日及时更新富国中证国企改革指数分级B 基金(150210)的最新的单位净值。" />
    <meta content="ie=7" http-equiv="x-ua-compatible" />
    <meta content="900" http-equiv="refresh" />
    <link href="http://j5.dfcfw.com/css/pinzhong/pzkfs_20150612180035.css?v=20150521" rel="stylesheet" type="text/css" />
    <link href="http://j5.dfcfw.com/css/pinzhong/svgstyle_20131114165111.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">
        .referAdClose {
          width:22px;height:22px;display:block;float:right;margin-top:60px;cursor:pointer; background:url('http://j5.dfcfw.com/image/201506/20150616135236.png') scroll -25px -206px  no-repeat
        }
        .referAdClose:hover {
          background:url('http://j5.dfcfw.com/image/201506/20150616135236.png')  scroll 0 -206px no-repeat;
        }
        .referAdDiv {
           width:100%;height:100px;position:fixed;bottom:0;z-index:9999999;background:url('http://j5.dfcfw.com/image/201506/20150615142613.png') repeat-x;
        }
        .referAd {
         cursor:pointer;outline:medium none;display:block;position:absolute;left:50%;margin-left:-600px;height:100px;width:1000px;background:url('http://j5.dfcfw.com/image/201506/20150616135236.png') scroll 0 0 no-repeat;
        }
        .referAdhover {
            background:url('http://j5.dfcfw.com/image/201506/20150616135236.png') scroll 0 -100px no-repeat;
       }
        .referAdSyl {color: #ffcc00;float: left; font-family: arial;font-size: 34px;font-weight: bold;margin-left: 258px; margin-top: 50px;}
       .box-ttfund {
    border: 1px solid #ff4900;
    height: 604px;
    overflow: hidden;
}
         .zcsborder {
    border: 1px solid rgb(67, 114, 186);
    height: 110px;
    margin-top: 10px;
    margin-bottom:4px;
}
         .box-ttfund .tit {
    background-color: #ff6201;
    font-family: "Microsoft YaHei";
    font-size: 13px;
    height: 26px;
    line-height: 26px;
    margin: 1px;
    text-align: center;
}
         .box-ttfund .zcsbgcolor {
    background-color: rgb(67, 114, 186);
}
         .box-ttfund .tit a, .box-ttfund .tit a:hover {
    color: #ffffff;
    display: block;
    text-decoration: underline;
     outline: medium none;
}
         .zcs {
    border-bottom: 1px solid #cccccc;
    padding: 6px 6px;
    position: relative;
}
         .comm-c {
    cursor: pointer;
}
         .zcs p {
    height: 24px;
    line-height: 24px;
    position: relative;
}
        .zcs strong {
            color: #023498;
            font-size: 14px;
            font-weight: bold;
            margin-right: 4px;
        }
        .zcs .buy {
    background-color: #ff4400;
    color: #ffffff !important;
    display: block;
    height: 21px;
    line-height: 21px;
    overflow: hidden;
    position: absolute;
    right: 6px;
    text-align: center;
    text-decoration: none;
    top: 7px;
    width: 38px;
}
       .zcs .zhang, .zcs .die, .zcs .ping {
    color: #ff4400;
    font-family: Arial;
    font-size: 16px;
    font-style: normal;
    font-weight: 700;
    margin-left: 5px;
    position: absolute;
    top: 0;
}
        .zcs em {
    color: #ff4400;
    font-family: Arial;
    font-size: 16px;
    font-style: normal;
    font-weight: 700;
    margin-left: 3px;
    margin-right:3px;
  
    top: 0;
}
    .kzr {
    background-color: rgb(67, 114, 186);
    border-radius: 2px;
    color: white;
    font-size: 12px;
    font-weight: normal;
    left: 9px;
    padding: 2px 3px;
    position: relative;
    top: -1px;
}
 .a_sy_zcs {
    position: absolute;
    right: 0;
    top: 0;
       *margin-top:3px;
    _margin-top:3px;
}
        .plus1 {
         color:none;
         font-size:12px;
        }
       .zcs  .buy:hover {
                background-color: #f52b00;
                color: #FFFFFF !important;
                text-decoration: none;
            }
       .zcsa {
            color:#333;
          text-decoration:none;
          outline:none;
          display:block;
        }
            .zcsa:hover {
                color:#333;
                outline:none;
            }
    </style>
    <script type="text/javascript">
    var fundcode = '150210';
    var fundname = '富国中证国企改革指数分级B ';
    var fundtype = '201';    
    </script>
    <base target="_blank" />
</head>
<body><div id="bodydiv">
<div class="mainFrame">
<div class="space0"></div>
<div class="fund_top_text">
<div class="top_weblink">
<ul>
    <li><b class="ico L"></b><a href="http://www.eastmoney.com" class="line">返回东方财富网首页</a></li>
    <li>|</li>
    <li><a href="http://fund.eastmoney.com"><span class="red">基金首页</span></a></li>
    <li>|</li>
    <li><a href="http://finance.eastmoney.com/">财经</a></li>
    <li>|</li>
    <li><a href="http://stock.eastmoney.com">股票</a></li>
    <li>|</li>
    <li><a href="http://gzqh.eastmoney.com/">期指</a></li>
    <li>|</li>
    <li><a href="http://stock.eastmoney.com/cytz/chuangyeban.html">创业板</a></li>
    <li>|</li>
    <li><a href="http://quote.eastmoney.com">行情</a></li>
    <li>|</li>
    <li><a href="http://data.eastmoney.com">数据</a></li>
    <li>|</li>
    <li><a href="http://stock.eastmoney.com/global.html">全球</a></li>
    <li>|</li>
    <li><a href="http://hk.eastmoney.com/">港股</a></li>
    <li>|</li>
    <li><a href="http://forex.eastmoney.com">外汇</a></li>
    <li>|</li>
    <li><a href="http://futures.eastmoney.com/">期货</a></li>
    <li>|</li>
    <li><a href="http://gold.eastmoney.com/">黄金</a></li>
    <li>|</li>
    <li><a href="http://money.eastmoney.com/">理财</a></li>
    <li>|</li>
    <li><a href="http://bank.eastmoney.com">银行</a></li>
    <li>|</li>
    <li><a href="http://insurance.eastmoney.com">保险</a></li>
    <li>|</li>
    <li><a href="http://bond.eastmoney.com/">债券</a></li>
    <li>|</li>
    <li><a href="http://guba.eastmoney.com">股吧</a></li>
    <li>|</li>
    <li><a href="http://blog.eastmoney.com/">博客</a></li>
    <li>|</li>
    <li><a href="http://t.eastmoney.com/">财迷</a></li>
    <li>|</li>
    <li><a href="http://video.eastmoney.com/">视频</a></li>
</ul>
</div>
</div>
</div>
<div class="mainFrame">
<div class="space6"></div>
<div class="banner">
    <div>
<iframe width="175" height="90" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" src="http://same.eastmoney.com/s?z=eastmoney&c=631&op=1"></iframe>
    </div>
    <div>
<iframe width="636" height="90" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" src="http://same.eastmoney.com/s?z=eastmoney&c=633&op=1"></iframe>
    </div>
    <div class="end">
<iframe width="175" height="90" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" src="http://same.eastmoney.com/s?z=eastmoney&c=632&op=1"></iframe>
    </div>
</div>
    </div>
<div class="mainFrame">
<div class="space6"></div>
<div class="lgbar">
    <div class="flogo left">
<a href="http://fund.eastmoney.com/" title="天天基金网" class="ttjj"></a>  
<a href="http://fund.eastmoney.com/150210.html" title="富国中证国企改革指数分级B (150210)主页" class="jjpz"></a>
    </div>
    <div class="expand left"><span><b class="ico jy"></b><a href="https://trade.1234567.com.cn/">基金交易</a></span><span><b class="ico cs"></b><a href="http://fund.eastmoney.com/tradeindex.html">基金超市</a></span></div>
    <div class="sform" id="sform">
<div id="fundSuggest" class="suggest hide"></div>
<div>
    <span class="sinput">
<input type="text" value="请输入基金代码、名称或简拼" id="search_content" name="search_content" class="gray" autocomplete="off" /><b class="cx" id="droplist"></b>
    </span>
    <span><b class="hq" onclick="fdhq.toHQ('search_content')"></b></span>
    <span><b class="jb" onclick="fdhq.toBA('search_content')"></b></span>
    <span><a href="http://fund.eastmoney.com/allfund.html" class="line">基金代码查询</a></span>
    <span><b class="sc" onclick="fdhq.addFavor()" title="加入收藏"></b></span>
</div>
</div>
</div>
</div>
<div class="mainFrame">
<div class="space6"></div>
<style>
.page-box {background-color: #FFFFFF;margin: 0 auto;width: 1000px;}
.nav-txt {border: 1px solid #274A6F;line-height: 18px;font-size:12px;}
.nav-txt dl,.nav-txt dd,.nav-txt dt,.nav-txt ul,.nav-txt ol,.nav-txt li{margin: 0;padding: 0;}
.nav-txt ul {list-style-type: none;}
.nav-txt .content, .nav-txt .dt {background: url("http://j5.dfcfw.com/j1/images/header.png") repeat-x scroll 0 -340px transparent;}
.nav-txt a,.nav-txt a:visited {color: #FFFFFF;margin-left: 11px;text-decoration: none;}
.nav-txt a:hover {color: #FFFFFF;text-decoration: underline;}
.nav-txt .content {border: 1px solid #7DA4CD;height: 60px;padding-top: 6px;}
.nav-txt .dt {float: left;height: 50px;margin-left: 15px;overflow: hidden;width: 30px;}
.nav-txt .dt a {display: block;height: 0;margin: 0;padding-top: 50px;}
.nav-txt dd {float: left;}
.nav-txt .sj {background-position: 0 -280px;margin-left:2px;}
.nav-txt .zx {background-position: -30px -280px;}
.nav-txt .gj {background-position: -90px -280px;}
.nav-txt .hd {background-position: -120px -280px;}
.nav-txt .jy {background-position: -160px -215px;height: 68px;margin-top: -8px;width: 26px;}
.nav-txt .jy a {padding-top: 68px;}
</style>
<div class="page-box">
<div class="nav-txt">
<dl class="content">
<dt class="dt sj"><a href="http://fund.eastmoney.com/data/">数据</a></dt>
<dd>
<ul>
<li><a href="http://fund.eastmoney.com/fund.html">基金净值</a><a href="http://fund.eastmoney.com/fundguzhi.html">净值估算</a><a href="http://fund.eastmoney.com/data/fundranking.html">基金排行</a><a href="http://fund.eastmoney.com/dingtou/">基金定投</a><a href="http://fund.eastmoney.com/dingtou/syph_yndt.html">定投排行</a><a href="http://fund.eastmoney.com/data/fundrating.html">评级</a></li>
<li><a href="http://fund.eastmoney.com/000001.html">基金品种</a><a href="http://fund.eastmoney.com/f10/">基金档案</a><a href="http://fund.eastmoney.com/company/default.html">基金公司</a><a href="http://fund.eastmoney.com/XFXJJ_jzrgq12.html">新发基金</a><a href="http://fund.eastmoney.com/fjjj.html">分级基金</a><a href="http://fund.eastmoney.com/data/fundfenhong.html">分红</a></li>
<li><a href="http://fund.eastmoney.com/FBSJJ_zjl.html">封闭基金</a><a href="http://fund.eastmoney.com/Fund_sgzt_bzdm.html">申购状态</a><a href="http://fund.eastmoney.com/feilv.html">基金费率</a><a href="http://simu.eastmoney.com/data/smranklist.aspx">私募排行</a><a href="http://simu.eastmoney.com/data/smrating.aspx">私募评级</a><a href="http://fund.eastmoney.com/gonggao">公告</a></li>
</ul>
</dd>
<dt class="dt zx"><a href="http://roll.eastmoney.com/fund.html">资讯</a></dt>
<dd>
<ul>
<li><a href="http://fund.eastmoney.com/news/cjjyw.html">基金要闻</a><a href="http://fund.eastmoney.com/news/cjjgd.html">观点</a></li>
<li><a href="http://fund.eastmoney.com/yanbao/">基金研究</a><a href="http://fund.eastmoney.com/news/cjjxx.html">学校</a></li>
<li><a href="http://fund.eastmoney.com/news/csmjj.html">私募要闻</a><a href="http://fund.eastmoney.com/topic/#000">专题</a></li>
</ul>
</dd>
<dt class="dt gj"><a href="http://fund.eastmoney.com/favor.html">工具</a></dt>
<dd>
<ul>
<li><a href="http://fund.eastmoney.com/favor.html">自选基金</a><a href="http://fundbook.eastmoney.com/">账本</a></li>
<li><a href="http://fund.eastmoney.com/Compare/">基金比较</a><a href="http://fund.eastmoney.com/data/fundshaixuan.html">筛选</a></li>
<li><a href="http://data.eastmoney.com/money/calc/CalcFundSGRG.html">基金计算器</a></li>
</ul>
</dd>            
<dt class="dt hd"><a href="http://jijinba.eastmoney.com/">互动</a></dt>
<dd>
<ul>
<li><a href="http://jijinba.eastmoney.com/">基金吧</a></li>
<li><a href="http://show.eastmoney.com/">路演</a></li>
<li><a href="http://js1.eastmoney.com/tg.aspx?ID=3754">夜8点</a></li>
</ul>
</dd>
<dt class="dt jy"><a href="https://trade.1234567.com.cn/">交易</a></dt>
<dd>
<ul>
<li><a href="https://trade.1234567.com.cn/reg/">免费开户</a><a href="https://trade.1234567.com.cn/">基金交易</a><a href="https://trade.1234567.com.cn/xjb/index">活期宝</a><a href="https://trade.1234567.com.cn/dqb/default">定期宝</a></li>
<li><a href="http://fund.eastmoney.com/daogou">基金导购</a><a href="http://fund.eastmoney.com/topic.html">优选基金</a><a href="http://zhishubao.1234567.com.cn/">指数宝</a><a href="http://fund.eastmoney.com/data/xfdaogou.html">新基金</a></li>
<li><a href="http://fund.eastmoney.com/tradeindex.html">基金超市</a><a href="http://fund.eastmoney.com/gaoduan/">高端理财</a><a href="http://simubao.1234567.com.cn/">私募宝</a><a href="http://fund.eastmoney.com/trade/default.html">收益榜</a></li>
</ul>
</dd>
</dl>
</div>
</div>
<div class="mainFrame">
    <div class="space6"></div>
    <div class="fund_quote">
<div>
    <iframe marginheight='0' marginwidth='0' frameborder='0' width='998' height='30' scrolling='no' src='http://fund.eastmoney.com/fund_favor_quote2_beta.html'></iframe>
</div>
    </div>
</div>
    </div>
<div class="mainFrame">
<div class="space6"></div>
<div>
    <iframe width="1000" height="60" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" src="http://same.eastmoney.com/s?z=eastmoney&c=639&op=1"></iframe>
</div>
    </div>
<div class="mainFrame">
<div class="space0"></div>
<div class="map_banner">
    <div class="left">
  <a href="http://fund.eastmoney.com/">天天基金网</a>&nbsp;>&nbsp;<a href="http://fund.eastmoney.com/fund.html">全部基金</a>&nbsp;>&nbsp;<a href="http://fund.eastmoney.com/150210.html" target="_self">富国中证国企改革指数分级B </a>
    </div>
    <div class="right" id="visitfund"></div>
</div>
    </div>
<div class="mainFrame">
<div class="mainLeft">
    <div class="advertisement">
<div class="sybb">
    <span class="hqbdate">  2015-07-21</span>
</div>
<div class="hqbintro"><a class="hqbt" href="http://huoqibao.1234567.com.cn/?spm=001002001.lwb"></a><span><a href="http://huoqibao.1234567.com.cn/?spm=001002001.lwb" class="noa">随时取,最快1秒实时到账</a></span></div>
<div class="hqb">
<span class="arrow"></span>
<ul>
    <li><div class="hqbct"><a href='http://huoqibao.1234567.com.cn/?spm=001002001.lwb'><span>活期宝最高7日年化收益</span><span class="sy"> 4.34</span><span class="sybai">%</span></a></div></li>
    <li><div class="hqbct"><a href='http://huoqibao.1234567.com.cn/?spm=001002001.lwb'><span>是活期收益的</span><span class="sy"> 12.40</span><span class="symul">倍</span></a><a class="check" href="http://huoqibao.1234567.com.cn/?spm=001002001.lwb">[查收益]</a></div></li>
</ul>
<a class="btnkaihu" href="https://trade2.1234567.com.cn/reg/step1?spm=001002001.lwb"></a>
<a class="btnchzhi" href="https://trade.1234567.com.cn/login?direct_url=%2fxjb%2frecharge?spm=001002001.lwb"></a>
</div>
       
<div class="dqbintro"><a class="dqbt" href="http://dingqibao.1234567.com.cn/?spm=001002001.lwb"></a><span><a href='http://dingqibao.1234567.com.cn/?spm=001002001.lwb' class="noa">短期理财就选定期宝</a></span></div>
<div class="dqb">
    <span class="arrow"></span>
    <ul>
<li class="ta_l"><span><a href='http://dingqibao.1234567.com.cn/?spm=001002001.lwb'>最高7日年化收益率</a></span><a class="right" href="http://dingqibao.1234567.com.cn/?spm=001002001.lwb">[查收益]</a></li>
<li><a href='http://dingqibao.1234567.com.cn/?spm=001002001.lwb' ><span class="dayl">7天</span><span class="sy">5.04%</span><span class="dayr">14天</span><span class="sy">4.45%</span></a></li>
<li><a href='http://dingqibao.1234567.com.cn/?spm=001002001.lwb'><span class="dayl">30天</span><span class="sy">5.54%</span><span class="dayr">60天</span><span class="sy">5.07%</span></a></li>
    </ul>
    <a class="btndkaihu" href="https://trade2.1234567.com.cn/reg/step1?spm=001002001.lwb"></a>
    <a class="btndchzhi" href="https://trade.1234567.com.cn/login?direct_url=%2fdqb%2frecharge?spm=001002001.lwb"></a>
</div>
<div class="download">
<a href="http://js1.eastmoney.com/tg.aspx?ID=3565">
<div class="downloadl">
<p class="p1">天天基金网手机版</p>
<p class="p2">随时随地</p>
<p class="p2">查净值 买基金</p>  
</div>
<div class="downloadr">
<span class="downewm"></span>
</div>
</a>
<a href="http://js1.eastmoney.com/tg.aspx?ID=3565" class="downloada">点击下载</a>
</div>
</div>

    <div class="box-ttfund zcsborder">
        <div class="tit zcsbgcolor"><a href="https://zhongcaisuo.eastmoney.com/?spm=001002001.w.064 ">东方财富旗下互联网理财平台</a></div>
      <a class="zcsa" href="https://zhongcaisuo.eastmoney.com/lists.html?spm=001002001.w.064 " hidefocus="true"> 
           <div  style="border: none" class="zcs comm-c">
            <p class="p-tit"><strong>中财所</strong>稀缺固定收益产品</p>
            <p class="p-tit">产品预期年化收益率<span class="zhang">8.00%</span></p>
            <p class="p-tit">投资期限<em>465</em>天<span style="" class="kzr">可转让</span><a href="https://zhongcaisuo.eastmoney.com/lists.html?spm=001002001.w.064" class="a_sy_zcs">[查看]</a></p>
            <a href="https://zhongcaisuo.eastmoney.com/lists.html?spm=001002001.w.064" class="buy">购买</a>
        </div>
        </a>

    </div>
    <!--<div class="intro_newbg"></div>-->
<div class="space6"></div>
<div class="myfavor">
<div class="titbar">
    <div class="font"><a href="http://fund.eastmoney.com/favor.html" class="line">我的自选基金</a></div>
    <div class="more"><a href="http://fund.eastmoney.com/favor.html" class="line">更多>></a></div>
</div>
<div class="mftable" id="mftable"></div>
    </div>
    <div class="space6"></div>
    <div class="archive">
<div class="titbar">
    <div class="font"><a href="http://fund.eastmoney.com/f10/150210.html" class="line">基金档案</a></div>
    <div class="more"><a href="http://fund.eastmoney.com/f10/150210.html" class="line">更多>></a></div>
</div>
<div class="actable">
    <ul class="ulhead">
<li class="btype"><b></b>基本资料</li>
    </ul>
    <ul>
<li class="acL"><a href="http://fund.eastmoney.com/f10/jbgk_150210.html">基本概况</a></li>
<li class="acR"><a href="http://fund.eastmoney.com/f10/jjjl_150210.html">基金经理</a></li>
    </ul>
    <ul>
<li class="acL"><a href="http://fund.eastmoney.com/company/80000221.html">基金公司</a></li>
<li class="acR"><a href="http://fund.eastmoney.com/f10/jjpj_150210.html">基金评级</a></li>
    </ul>
    <ul class="ulhead">
<li class="btype"><b></b>净值回报</li>
    </ul>
    <ul>
<li class="acL"><a href="http://fund.eastmoney.com/f10/jjjz_150210.html" class="red">历史净值</a></li>
<li class="acR"><a href="http://fund.eastmoney.com/f10/fhsp_150210.html">分红送配</a></li>
    </ul>
    <ul>
<li class="acL"><a href="http://fund.eastmoney.com/f10/jdzf_150210.html">阶段涨幅</a></li>
<li class="acR"><a href="http://fund.eastmoney.com/f10/jndzf_150210.html">季/年度涨幅</a></li>
    </ul>
    <ul class="ulhead">
<li class="btype"><b></b>投资组合</li>
    </ul>
    <ul>
<li class="acL"><a href="http://fund.eastmoney.com/f10/ccmx_150210.html">持仓明细</a></li>
<li class="acR"><a href="http://fund.eastmoney.com/f10/hytz_150210.html">行业配置</a></li>
    </ul>
    <ul>
<li class="acL"><a href="http://fund.eastmoney.com/f10/zcpz_150210.html">资产配置</a></li>
<li class="acR"><a href="http://fund.eastmoney.com/f10/ccbd_150210.html">持仓变动</a></li>
    </ul>
    <ul>
<li class="acL"><a href="http://fund.eastmoney.com/f10/ccbd_150210.html">重大变动</a></li>
<li class="acR"></li>
    </ul>
    <ul class="ulhead">
<li class="btype"><b></b>基金公告</li>
    </ul>
    <ul>
<li class="acL"><a href="http://fund.eastmoney.com/f10/jjgg_150210.html">全部公告</a></li>
<li class="acR"><a href="http://fund.eastmoney.com/f10/jjgg_150210_3.html">定期报告</a></li>
    </ul>
    <ul class="ulhead">
<li class="btype"><b></b>规模份额</li>
    </ul>
    <ul>
<li class="acL"><a href="http://fund.eastmoney.com/f10/gmbd_150210.html">规模变动</a></li>
<li class="acR"><a href="http://fund.eastmoney.com/f10/cyrjg_150210.html">持有人结构</a></li>
    </ul>
    <ul class="ulhead">
<li class="btype"><b></b>财务报表</li>
    </ul>
    <ul>
<li class="acL"><a href="http://fund.eastmoney.com/f10/cwzb_150210.html">财务指标</a></li>
<li class="acR"><a href="http://fund.eastmoney.com/f10/zcfzb_150210.html">资产负债表</a></li>
    </ul>
    <ul class="ulhead">
<li class="btype"><b></b>销售信息</li>
    </ul>
    <ul>
<li class="acL" style="width:70%;"><a href="http://fund.eastmoney.com/f10/jjfl_150210.html">购买信息（费率表）</a></li>
    </ul>
    <ul>
 <li class="acL" style="width:70%;"><a href="http://fund.eastmoney.com/f10/jjzh_150210.html">基金互转</a></li>
</ul>
</div>
    </div>
    <div class="space6"></div>
    <div>
<iframe width="200" height="200" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" src="http://same.eastmoney.com/s?z=eastmoney&c=634&op=1"></iframe>
    </div>
    <div class="space6"></div>
    <div class="company">
<div class="titbar">
    <div class="font"><a href="http://fund.eastmoney.com/company/80000221.html" class="line">同公司旗下基金</a></div>
    <div class="more"><a href="http://fund.eastmoney.com/company/80000221.html" class="line">更多>></a></div>
</div>
<div class="cpfund">
    <ul class="ulhead"><li class="mc">基金简称</li><li class="jz">单位净值</li><li class="zf">日增长率</li></ul><ul><li class="mc" ><a href="http://fund.eastmoney.com/161015.html" class="line" title="富国天盈债券(LOF)">富国天盈债券(LOF)</a></li><li class="jz"><span class="ping">-</span></li><li class="zf"><span class="ping">-</span></li></ul><ul><li class="mc" ><a href="http://fund.eastmoney.com/100018.html" class="line" title="富国天利增长债券">富国天利增长债券</a></li><li class="jz"><span class="ping">-</span></li><li class="zf"><span class="ping">-</span></li></ul><ul><li class="mc" ><a href="http://fund.eastmoney.com/100020.html" class="line" title="富国天益价值">富国天益价值</a></li><li class="jz"><span class="ping">-</span></li><li class="zf"><span class="ping">-</span></li></ul><ul><li class="mc" ><a href="http://fund.eastmoney.com/100026.html" class="line" title="富国天合稳健优选">富国天合稳健优选</a></li><li class="jz"><span class="ping">-</span></li><li class="zf"><span class="ping">-</span></li></ul><ul><li class="mc" ><a href="http://fund.eastmoney.com/100029.html" class="line" title="富国天成红利">富国天成红利</a></li><li class="jz"><span class="ping">-</span></li><li class="zf"><span class="ping">-</span></li></ul><ul class="ulhead"><li class="mc">基金简称</li><li class="jz">每万份收益</li><li class="zf">7日年化</li></ul><ul><li class="mc" ><a href="http://fund.eastmoney.com/100025.html" class="line" title="富国天时货币A">富国天时货币A</a></li><li class="jz"><span class="ping">-</span></li><li class="zf"><span class="ping">-</span></li></ul><ul><li class="mc" ><a href="http://fund.eastmoney.com/100028.html" class="line" title="富国天时货币B">富国天时货币B</a></li><li class="jz"><span class="ping">-</span></li><li class="zf"><span class="ping">-</span></li></ul><ul><li class="go"><span class="gray">截止:07-22</span><a href="http://fund.eastmoney.com/company/80000221.html" class="line">查看旗下全部基金>></a></li></ul>
</div>
    </div>
    <div class="space6"></div>
    <div class="category">
<div class="titbar">
    <div class="font"><a href="http://fund.eastmoney.com/data/fundranking.html#tall;c0;r;szzf;ddesc;qsd20121104;qed20131104;qdii" class="line">同类型基金涨幅榜</a></div><div class="more"><a href="http://fund.eastmoney.com/data/fundranking.html#tall;c0;r;szzf;ddesc;qsd20121104;qed20131104;qdii" class="line">更多>></a></div>
</div>
<div class="cptype">
    <ul>
<li class="cxselect">
<select id="selType">
<option selected="selected">日涨幅</option>
<option>今年来涨幅</option>
<option>近1周涨幅</option>
<option>近1月涨幅</option>
<option>近3月涨幅</option>
<option>近6月涨幅</option>
<option>近1年涨幅</option>
<option>近2年涨幅</option>
<option>近3年涨幅</option>
<option>近5年涨幅</option>
</select>
</li>
    </ul>
    <div id="stTab0">
<ul class="ulhead"><li class="pm">排名</li><li class="jjjc">基金简称</li><li class="czf">涨跌幅</li></ul><ul><li class="pm">1</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150294.html" class="line" title="南方中证高铁产业指数分级B">南方中证高铁产业指数分级B</a></li><li class="czf"><span class="zhang">11.46%</span></li></ul><ul><li class="pm">2</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150278.html" class="line" title="鹏华高铁分级B">鹏华高铁分级B</a></li><li class="czf"><span class="zhang">5.56%</span></li></ul><ul><li class="pm">3</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150264.html" class="line" title="华宝兴业中证1000指数分级B">华宝兴业中证1000指数分级B</a></li><li class="czf"><span class="zhang">5.47%</span></li></ul><ul><li class="pm">4</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150272.html" class="line" title="招商国证生物医药指数分级B">招商国证生物医药指数分级B</a></li><li class="czf"><span class="zhang">5.21%</span></li></ul><ul><li class="pm">5</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150316.html" class="line" title="富国中证工业4.0指数分级B">富国中证工业4.0指数分级B</a></li><li class="czf"><span class="zhang">4.42%</span></li></ul><ul class="ulsplit"><li><div class="splitline"></div></li></ul><ul><li class="pm bold">43</span></li><li class="jjjc"><a href="http://fund.eastmoney.com/150210.html" class="line bold" title="富国中证国企改革指数分级B ">富国中证国企改革指数分级B </a></li><li class="czf"><span class="zhang">2.15%</span></li></ul><ul><li class="go"><span class="gray">截止:07-21</span><a href="http://fund.eastmoney.com/data/fundranking.html#tall;c0;r;szzf;ddesc;qsd20121104;qed20131104;qdii" class="line">查看全部同类基金>></a></li></ul>
    </div>
    <div id="stTab1" class="hide">
<ul class="ulhead"><li class="pm">排名</li><li class="jjjc">基金简称</li><li class="czf">涨跌幅</li></ul><ul><li class="pm">1</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150153.html" class="line" title="富国创业板指数分级B">富国创业板指数分级B</a></li><li class="czf"><span class="zhang">128.97%</span></li></ul><ul><li class="pm">2</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150204.html" class="line" title="鹏华传媒分级B">鹏华传媒分级B</a></li><li class="czf"><span class="zhang">113.10%</span></li></ul><ul><li class="pm">3</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150182.html" class="line" title="富国中证军工指数分级B">富国中证军工指数分级B</a></li><li class="czf"><span class="zhang">107.48%</span></li></ul><ul><li class="pm">4</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150131.html" class="line" title="国泰国证医药卫生指数分级B">国泰国证医药卫生指数分级B</a></li><li class="czf"><span class="zhang">103.51%</span></li></ul><ul><li class="pm">5</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150180.html" class="line" title="鹏华信息分级B">鹏华信息分级B</a></li><li class="czf"><span class="zhang">80.44%</span></li></ul><ul class="ulsplit"><li><div class="splitline"></div></li></ul><ul><li class="pm bold">41</span></li><li class="jjjc"><a href="http://fund.eastmoney.com/150210.html" class="line bold" title="富国中证国企改革指数分级B ">富国中证国企改革指数分级B </a></li><li class="czf"><span class="zhang">21.09%</span></li></ul><ul><li class="go"><span class="gray">截止:07-21</span><a href="http://fund.eastmoney.com/data/fundranking.html#tall;c0;r;szzf;ddesc;qsd20121104;qed20131104;qdii" class="line">查看全部同类基金>></a></li></ul>
    </div>
    <div id="stTab2" class="hide">
<ul class="ulhead"><li class="pm">排名</li><li class="jjjc">基金简称</li><li class="czf">涨跌幅</li></ul><ul><li class="pm">1</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150206.html" class="line" title="鹏华中证国防指数分级B">鹏华中证国防指数分级B</a></li><li class="czf"><span class="zhang">30.66%</span></li></ul><ul><li class="pm">2</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150182.html" class="line" title="富国中证军工指数分级B">富国中证军工指数分级B</a></li><li class="czf"><span class="zhang">23.59%</span></li></ul><ul><li class="pm">3</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150294.html" class="line" title="南方中证高铁产业指数分级B">南方中证高铁产业指数分级B</a></li><li class="czf"><span class="zhang">21.60%</span></li></ul><ul><li class="pm">4</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150187.html" class="line" title="申万菱信中证军工指数分级B">申万菱信中证军工指数分级B</a></li><li class="czf"><span class="zhang">20.37%</span></li></ul><ul><li class="pm">5</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150264.html" class="line" title="华宝兴业中证1000指数分级B">华宝兴业中证1000指数分级B</a></li><li class="czf"><span class="zhang">20.34%</span></li></ul><ul class="ulsplit"><li><div class="splitline"></div></li></ul><ul><li class="pm bold">50</span></li><li class="jjjc"><a href="http://fund.eastmoney.com/150210.html" class="line bold" title="富国中证国企改革指数分级B ">富国中证国企改革指数分级B </a></li><li class="czf"><span class="zhang">8.56%</span></li></ul><ul><li class="go"><span class="gray">截止:07-21</span><a href="http://fund.eastmoney.com/data/fundranking.html#tall;c0;r;szzf;ddesc;qsd20121104;qed20131104;qdii" class="line">查看全部同类基金>></a></li></ul>
    </div>
    <div id="stTab3" class="hide">
<ul class="ulhead"><li class="pm">排名</li><li class="jjjc">基金简称</li><li class="czf">涨跌幅</li></ul><ul><li class="pm">1</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150284.html" class="line" title="申万菱信中证申万医药生物指数分级B">申万菱信中证申万医药生物指数分级B</a></li><li class="czf"><span class="zhang">11.19%</span></li></ul><ul><li class="pm">2</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150256.html" class="line" title="易方达银行分级B">易方达银行分级B</a></li><li class="czf"><span class="zhang">3.69%</span></li></ul><ul><li class="pm">3</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150228.html" class="line" title="鹏华银行分级B">鹏华银行分级B</a></li><li class="czf"><span class="zhang">3.44%</span></li></ul><ul><li class="pm">4</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150242.html" class="line" title="富国中证银行指数分级B">富国中证银行指数分级B</a></li><li class="czf"><span class="zhang">3.29%</span></li></ul><ul><li class="pm">5</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150250.html" class="line" title="招商中证银行指数分级B">招商中证银行指数分级B</a></li><li class="czf"><span class="zhang">2.58%</span></li></ul><ul class="ulsplit"><li><div class="splitline"></div></li></ul><ul><li class="pm bold">183</span></li><li class="jjjc"><a href="http://fund.eastmoney.com/150210.html" class="line bold" title="富国中证国企改革指数分级B ">富国中证国企改革指数分级B </a></li><li class="czf"><span class="die">-38.34%</span></li></ul><ul><li class="go"><span class="gray">截止:07-21</span><a href="http://fund.eastmoney.com/data/fundranking.html#tall;c0;r;szzf;ddesc;qsd20121104;qed20131104;qdii" class="line">查看全部同类基金>></a></li></ul>
    </div>
    <div id="stTab4" class="hide">
<ul class="ulhead"><li class="pm">排名</li><li class="jjjc">基金简称</li><li class="czf">涨跌幅</li></ul><ul><li class="pm">1</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150017.html" class="line" title="兴全合润分级股票B">兴全合润分级股票B</a></li><li class="czf"><span class="zhang">17.49%</span></li></ul><ul><li class="pm">2</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150016.html" class="line" title="兴全合润分级股票A">兴全合润分级股票A</a></li><li class="czf"><span class="zhang">17.49%</span></li></ul><ul><li class="pm">3</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150182.html" class="line" title="富国中证军工指数分级B">富国中证军工指数分级B</a></li><li class="czf"><span class="zhang">9.92%</span></li></ul><ul><li class="pm">4</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150131.html" class="line" title="国泰国证医药卫生指数分级B">国泰国证医药卫生指数分级B</a></li><li class="czf"><span class="zhang">6.80%</span></li></ul><ul><li class="pm">5</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150219.html" class="line" title="前海开源健康分级A">前海开源健康分级A</a></li><li class="czf"><span class="zhang">1.90%</span></li></ul><ul class="ulsplit"><li><div class="splitline"></div></li></ul><ul><li class="pm bold">124</span></li><li class="jjjc"><a href="http://fund.eastmoney.com/150210.html" class="line bold" title="富国中证国企改革指数分级B ">富国中证国企改革指数分级B </a></li><li class="czf"><span class="die">-27.50%</span></li></ul><ul><li class="go"><span class="gray">截止:07-21</span><a href="http://fund.eastmoney.com/data/fundranking.html#tall;c0;r;szzf;ddesc;qsd20121104;qed20131104;qdii" class="line">查看全部同类基金>></a></li></ul>
    </div>
    <div id="stTab5" class="hide">
<ul class="ulhead"><li class="pm">排名</li><li class="jjjc">基金简称</li><li class="czf">涨跌幅</li></ul><ul><li class="pm">1</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150182.html" class="line" title="富国中证军工指数分级B">富国中证军工指数分级B</a></li><li class="czf"><span class="zhang">86.32%</span></li></ul><ul><li class="pm">2</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150153.html" class="line" title="富国创业板指数分级B">富国创业板指数分级B</a></li><li class="czf"><span class="zhang">79.42%</span></li></ul><ul><li class="pm">3</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150131.html" class="line" title="国泰国证医药卫生指数分级B">国泰国证医药卫生指数分级B</a></li><li class="czf"><span class="zhang">77.10%</span></li></ul><ul><li class="pm">4</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150054.html" class="line" title="泰达中证500进取">泰达中证500进取</a></li><li class="czf"><span class="zhang">64.06%</span></li></ul><ul><li class="pm">5</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150050.html" class="line" title="南方消费进取">南方消费进取</a></li><li class="czf"><span class="zhang">58.07%</span></li></ul><ul class="ulsplit"><li><div class="splitline"></div></li></ul><ul><li class="pm bold">41</span></li><li class="jjjc"><a href="http://fund.eastmoney.com/150210.html" class="line bold" title="富国中证国企改革指数分级B ">富国中证国企改革指数分级B </a></li><li class="czf"><span class="zhang">21.09%</span></li></ul><ul><li class="go"><span class="gray">截止:07-21</span><a href="http://fund.eastmoney.com/data/fundranking.html#tall;c0;r;szzf;ddesc;qsd20121104;qed20131104;qdii" class="line">查看全部同类基金>></a></li></ul>
    </div>
    <div id="stTab6" class="hide">
<ul class="ulhead"><li class="pm">排名</li><li class="jjjc">基金简称</li><li class="czf">涨跌幅</li></ul><ul><li class="pm">1</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150023.html" class="line" title="申万菱信深证成指分级进取">申万菱信深证成指分级进取</a></li><li class="czf"><span class="zhang">510.39%</span></li></ul><ul><li class="pm">2</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150019.html" class="line" title="银华锐进">银华锐进</a></li><li class="czf"><span class="zhang">348.79%</span></li></ul><ul><li class="pm">3</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150097.html" class="line" title="招商中证商品B">招商中证商品B</a></li><li class="czf"><span class="zhang">240.88%</span></li></ul><ul><li class="pm">4</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150182.html" class="line" title="富国中证军工指数分级B">富国中证军工指数分级B</a></li><li class="czf"><span class="zhang">239.39%</span></li></ul><ul><li class="pm">5</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150077.html" class="line" title="浙商进取">浙商进取</a></li><li class="czf"><span class="zhang">233.57%</span></li></ul><ul class="ulsplit"><li><div class="splitline"></div></li></ul><ul><li class="pm bold"></span></li><li class="jjjc"><a href="http://fund.eastmoney.com/150210.html" class="line bold" title="富国中证国企改革指数分级B ">富国中证国企改革指数分级B </a></li><li class="czf"><span class="ping">-</span></li></ul><ul><li class="go"><span class="gray">截止:07-21</span><a href="http://fund.eastmoney.com/data/fundranking.html#tall;c0;r;szzf;ddesc;qsd20121104;qed20131104;qdii" class="line">查看全部同类基金>></a></li></ul>
    </div>
    <div id="stTab7" class="hide">
<ul class="ulhead"><li class="pm">排名</li><li class="jjjc">基金简称</li><li class="czf">涨跌幅</li></ul><ul><li class="pm">1</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150023.html" class="line" title="申万菱信深证成指分级进取">申万菱信深证成指分级进取</a></li><li class="czf"><span class="zhang">472.08%</span></li></ul><ul><li class="pm">2</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150029.html" class="line" title="信诚中证500B">信诚中证500B</a></li><li class="czf"><span class="zhang">265.76%</span></li></ul><ul><li class="pm">3</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150019.html" class="line" title="银华锐进">银华锐进</a></li><li class="czf"><span class="zhang">224.25%</span></li></ul><ul><li class="pm">4</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150095.html" class="line" title="泰信基本面400B">泰信基本面400B</a></li><li class="czf"><span class="zhang">219.20%</span></li></ul><ul><li class="pm">5</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150054.html" class="line" title="泰达中证500进取">泰达中证500进取</a></li><li class="czf"><span class="zhang">213.12%</span></li></ul><ul class="ulsplit"><li><div class="splitline"></div></li></ul><ul><li class="pm bold"></span></li><li class="jjjc"><a href="http://fund.eastmoney.com/150210.html" class="line bold" title="富国中证国企改革指数分级B ">富国中证国企改革指数分级B </a></li><li class="czf"><span class="ping">-</span></li></ul><ul><li class="go"><span class="gray">截止:07-21</span><a href="http://fund.eastmoney.com/data/fundranking.html#tall;c0;r;szzf;ddesc;qsd20121104;qed20131104;qdii" class="line">查看全部同类基金>></a></li></ul>
    </div>
    <div id="stTab8" class="hide">
<ul class="ulhead"><li class="pm">排名</li><li class="jjjc">基金简称</li><li class="czf">涨跌幅</li></ul><ul><li class="pm">1</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150017.html" class="line" title="兴全合润分级股票B">兴全合润分级股票B</a></li><li class="czf"><span class="zhang">286.21%</span></li></ul><ul><li class="pm">2</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150029.html" class="line" title="信诚中证500B">信诚中证500B</a></li><li class="czf"><span class="zhang">228.35%</span></li></ul><ul><li class="pm">3</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150054.html" class="line" title="泰达中证500进取">泰达中证500进取</a></li><li class="czf"><span class="zhang">199.10%</span></li></ul><ul><li class="pm">4</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150089.html" class="line" title="金鹰中证500指数分级B">金鹰中证500指数分级B</a></li><li class="czf"><span class="zhang">157.46%</span></li></ul><ul><li class="pm">5</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150056.html" class="line" title="工银中证500分级B">工银中证500分级B</a></li><li class="czf"><span class="zhang">150.30%</span></li></ul><ul class="ulsplit"><li><div class="splitline"></div></li></ul><ul><li class="pm bold"></span></li><li class="jjjc"><a href="http://fund.eastmoney.com/150210.html" class="line bold" title="富国中证国企改革指数分级B ">富国中证国企改革指数分级B </a></li><li class="czf"><span class="ping">-</span></li></ul><ul><li class="go"><span class="gray">截止:07-21</span><a href="http://fund.eastmoney.com/data/fundranking.html#tall;c0;r;szzf;ddesc;qsd20121104;qed20131104;qdii" class="line">查看全部同类基金>></a></li></ul>
    </div>
    <div id="stTab9" class="hide">
<ul class="ulhead"><li class="pm">排名</li><li class="jjjc">基金简称</li><li class="czf">涨跌幅</li></ul><ul><li class="pm">1</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150017.html" class="line" title="兴全合润分级股票B">兴全合润分级股票B</a></li><li class="czf"><span class="zhang">203.20%</span></li></ul><ul><li class="pm">2</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150016.html" class="line" title="兴全合润分级股票A">兴全合润分级股票A</a></li><li class="czf"><span class="zhang">115.18%</span></li></ul><ul><li class="pm">3</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150009.html" class="line" title="国投瑞银瑞和远见">国投瑞银瑞和远见</a></li><li class="czf"><span class="zhang">67.60%</span></li></ul><ul><li class="pm">4</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150018.html" class="line" title="银华稳进">银华稳进</a></li><li class="czf"><span class="zhang">40.53%</span></li></ul><ul><li class="pm">5</li><li class="jjjc" ><a href="http://fund.eastmoney.com/150013.html" class="line" title="国联安双禧中证100B">国联安双禧中证100B</a></li><li class="czf"><span class="zhang">35.34%</span></li></ul><ul class="ulsplit"><li><div class="splitline"></div></li></ul><ul><li class="pm bold"></span></li><li class="jjjc"><a href="http://fund.eastmoney.com/150210.html" class="line bold" title="富国中证国企改革指数分级B ">富国中证国企改革指数分级B </a></li><li class="czf"><span class="ping">-</span></li></ul><ul><li class="go"><span class="gray">截止:07-21</span><a href="http://fund.eastmoney.com/data/fundranking.html#tall;c0;r;szzf;ddesc;qsd20121104;qed20131104;qdii" class="line">查看全部同类基金>></a></li></ul>
    </div>
</div>
    </div>
    <div class="space6"></div>
    <div class="history">
<div class="titbar">
    <div class="font">关注本基金的还看过</div>
</div>
<div class="browhis">
    <ul><li class='mc'><a href="http://fund.eastmoney.com/470058.html">汇添富可转换债券A</a></li><li class='an'><span class="daibtnbuy" onclick="window.open('https://trade.1234567.com.cn/FundtradePage/default2.aspx?fc=470058')" ></span></li></ul><ul><li class='mc'><a href="http://fund.eastmoney.com/000439.html">国金通用鑫盈货币</a></li><li class='an'><span class="daibtnbuy" onclick="window.open('https://trade.1234567.com.cn/FundtradePage/default2.aspx?fc=000439')" ></span></li></ul><ul><li class='mc'><a href="http://fund.eastmoney.com/161015.html">富国天盈债券(LOF)</a></li><li class='an'><span class="daibtnbuy" onclick="window.open('https://trade.1234567.com.cn/FundtradePage/default2.aspx?fc=161015')" ></span></li></ul><ul><li class='mc'><a href="http://fund.eastmoney.com/000560.html">诺安天天宝E</a></li><li class='an'><span class="daibtnbuy" onclick="window.open('https://trade.1234567.com.cn/FundtradePage/default2.aspx?fc=000560')" ></span></li></ul><ul><li class='mc'><a href="http://fund.eastmoney.com/020007.html">国泰货币</a></li><li class='an'><span class="daibtnbuy" onclick="window.open('https://trade.1234567.com.cn/FundtradePage/default2.aspx?fc=020007')" ></span></li></ul><ul><li class='mc'><a href="http://fund.eastmoney.com/001197.html">长盛转型升级主题灵活配置混合</a></li><li class='an'><span class="daibtnbuy" onclick="window.open('https://trade.1234567.com.cn/FundtradePage/default2.aspx?fc=001197')" ></span></li></ul><ul><li class='mc'><a href="http://fund.eastmoney.com/000127.html">农银行业领先</a></li><li class='an'><span class="daibtnbuy" onclick="window.open('https://trade.1234567.com.cn/FundtradePage/default2.aspx?fc=000127')" ></span></li></ul><ul><li class='mc'><a href="http://fund.eastmoney.com/110050.html">易方达月月利理财债券A</a></li><li class='an'><span class="daibtnbuy" onclick="window.open('https://trade.1234567.com.cn/FundtradePage/default2.aspx?fc=110050')" ></span></li></ul>
</div>
    </div>
</div>
<div class="mainRight">
     
    <div class="fund_intro_new">
<div class="fund_info"><div class="bktit_new"><span class="bkjob_new"><span class="zx"  onclick="fdhq.toFavor()"></span><span class="bj"  onclick='window.open("http://fund.eastmoney.com/compare/?code=150210&fix=1")'></span></span><a href="150210.html" title="富国中证国企改革指数分级B " >富国中证国企改革指数分级...</a><span class="code" title="150210" id="spancode"><a href=150210.html class="acode">150210</a></span></div><div class="bkinfo_new"><div class="infoleft"><div class="fundvalue"><span class="fundtitle">净值估算</span><span class="gzrefer">仅供参考</span> <img src="http://j5.dfcfw.com/image/201307/20130708102440.gif" onmousemove="document.getElementById('gzpmTips1').style.display='';"><div id="gzpmTips1" class="gzpmTips" style="display: none;"><span>每个交易日9：30-15：00盘中实时更新，按照基金持仓和指数走势估算，估算数据并不代表真实净值，仅供参考。<a href="javascript:void(0)" target="_self" title="关闭" onclick="document.getElementById('gzpmTips1').style.display='none';" class="promptbox">[×关闭]</a></span></div><div id="statuspzgz" class="fundpz"><span class="red bold">0.5921</span><div id="statuszdf" class="fundzf up"><p class="red">0.0211</p><p class="red">3.70%</p></div><p class="time">2015-07-22 15:00</p></div></div></div><div class="inforight"><div class="righttop"><p><span class='left11'><a href="http://fund.eastmoney.com/f10/jjjz_150210.html">单位净值</a>(07-21)：</span><span class='left12'><span class="red bold">0.5710</span><span style="margin-left:-5px;">（</span><span class="red bold">2.15%</span><span>）</span></span><span  class='right11'><a href="http://fund.eastmoney.com/f10/jjjz_150210.html">累计净值</a>：</span><span class='right12'><span class="red bold">1.7130</span></span></p><p><span class='left21'>近3月收益：</span><span class='left22'><span class="green bold">-27.50%</span></span><span class='right21'>近1年收益：</span><span class='right22'><span class="black bold">-</span></span></p></div><div class="rightbottom"><table border="0" cellspacing="0" cellpadding="0"><tr><td style="width:18%">类　　型：</td><td><a href="http://fund.eastmoney.com/fjjj.html#1_1__0__zdf,desc_1_yp">分级杠杆</a></td><td style="width:18%">成 立 日：</td><td>2014-12-17</td></tr><tr><td>管 理 人：</td><td><a href="http://fund.eastmoney.com/company/80000221.html">富国基金</a></td><td>基金经理：</td><td><a href="http://fund.eastmoney.com/f10/jjjl_150210.html" title="王保合 张圣贤">王保合</a>&nbsp;等</td></tr><tr><td><a  href='http://fund.eastmoney.com/f10/gmbd_150210.html'>规　　模</a>：</td><td>560.44亿元（15-06-30）</td><td><a href="http://fund.eastmoney.com/data/fundrating.html">海通评级</a>：</td><td class="htpjstar"><span class="gray">暂无评级</span></td></tr></table></div></div></div></div><div id="fund_sale" class="fund_sale" style="background:#fff url('http://j5.dfcfw.com/image/201307/20130713165739.jpg') no-repeat scroll 0 bottom;"><div class="bannerlink"><a class="sale_kh" href="https://trade.1234567.com.cn/reg/"><img style='margin: 6px 0 0 135px;' src="http://j5.dfcfw.com/image/201406/20140612132438.png" /></a><a href="http://fund.eastmoney.com/ContactUs/Order.aspx" class="sale_yykh">预约开户</a></div><div class='tradepart'><div class='tleft'></div><div class='tright'><a href='http://fundact.eastmoney.com/safety'><p><span class='profession'></span>专业：证监会首批的销售机构</p><p><span class='security'></span>安全：银行级加密，保障安全</p></a></div></div><div style="display:block;"><p><span class='left'><strong>状态：</strong><span class="spanstatus">场内交易</span></span></p><p style="color:#666666;">该基金暂不开放购买,您可<a target="_blank" tn="分级杠杆" href="http://fund.eastmoney.com/fundhot8.html">查看同类热销</a>：</p><ul class="daixiao"><li><p><span class="daibtnbuy" onclick="window.open('https://trade.1234567.com.cn/FundtradePage/default2.aspx?fc=519110')" ></span></p><a href="http://fund.eastmoney.com/519110.html" title="浦银价值成长（519110）">浦银价值成长（519110）</a></li><li><p><span class="daibtnbuy" onclick="window.open('https://trade.1234567.com.cn/FundtradePage/default2.aspx?fc=000251')" ></span></p><a href="http://fund.eastmoney.com/000251.html" title="工银金融地产股票（000251）">工银金融地产股票（000251）</a></li></ul></div></div>
    </div>
    <div class="intro_newbg"></div>
    <div class="space6"></div>
    <!-- AdSame ShowCode: 东方财富网 / 基金产品 / 基金品种小展示通栏 Begin -->
<iframe width="790" height="34" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" src="http://same.eastmoney.com/s?z=eastmoney&c=1176&op=1" ></iframe><div class="space6"></div>
<!-- AdSame ShowCode: 东方财富网 / 基金产品 / 基金品种小展示通栏 End -->   
    <div class='hotspot'><font class="red">热点关注：</font><ul><li><span class="red"><a target="_blank" href="http://fundact.eastmoney.com/information/0082015/?spm=001002001.mw" >国企改革有望爆发</a></span></li><li><a target="_blank" href="http://js1.eastmoney.com/tg.aspx?ID=3832" >限时限量8.0%稀缺可转让产品</a></li><li><a target="_blank" href="http://fundact.eastmoney.com/information/0032015/?spm=001002001.mw" >军工板块吹响反攻号角</a></li><li><a target="_blank" href="http://fundact.eastmoney.com/app/?spm=001002001.mjj" >手机也能买基金 点此下载安装</a></li></ul>
</div>
<div class="hqbox bg">
<a name="gz"></a>
<div class="bkAll">
    <div class="bkL">
<div class="titbar2">
<div class="font" style="position: relative;">
<ul>
<li class="at" style="cursor: default;">净值估算分时图</li>
</ul>
</div>
<div class="more"><span class="zx" onclick="fdhq.toLastest();"></span>
<a  href="http://js1.eastmoney.com/tg.aspx?ID=3569" title="天天基金手机版" class="appicon">手机版净值估算随身看</a>
</div>
</div>
<div class="bodybar">
    <div class="gzpic pzgz">
<img src="http://j4.dfcfw.com/charts/pic1/150210.png" onerror="this.src='http://j4.dfcfw.com/charts/pic1/999999.png'" id="gp_gz" alt="富国中证国企改革指数分级B (150210)净值估算分时图" /> <div class='gzpicpop'> <img src="http://j5.dfcfw.com/image/201307/20130708102440.gif" onmousemove="document.getElementById('gzpmTips2').style.display='block';"><div id="gzpmTips2" class="gzpmTips" style='display:none;'><span>每个交易日9：30-15：00盘中实时更新，按照基金持仓和指数走势估算，估算数据并不代表真实净值，仅供参考。<a href="javascript:void(0)" target="_self" title="关闭" onclick="document.getElementById('gzpmTips2').style.display='none';" class="promptbox">[×关闭]</a></span></div><div></div></div>
    </div>
</div>
    </div>
    <div class="bkR">
<div class="titbar2">
    <div class="font">
<ul id="jjczpj">
    <li class="at" style="cursor: default;">基金持仓</li>
</ul>
<label class="ccjzrq"></label>
    </div>
    <div class="more"><a href="http://fund.eastmoney.com/f10/ccmx_150210.html">更多>></a><label id="ccjzrq"></label></div>
</div>
<div class="bodybar" style="margin-bottom: 2px;">
    <div class="gzpic gzcc" id="gzcc0">
<ul class="ulhead"><li class="xh">序号</li><li class="mc">股票名称</li><li class="cc">持仓占比</li><li class="zf">涨跌幅</li><li class="zx">相关资讯</li></ul><ul><li class="xh">1</li><li class="mc"><a href="http://quote.eastmoney.com/sz000768.html">中航飞机</a></li><li class="cc"><span class="ping">3.34%</span></li><li class="zf zhang">6.02%</li><li class="zx"><a href="http://guba.eastmoney.com/topic,000768.html" class="red">股吧</a><a href="http://so.eastmoney.com/Search.htm?q=000768&m=0&t=1&s=1&f=1&p=0">资讯</a><a href="http://quote3.eastmoney.com/f10.aspx?StockCode=000768&stock_name=&f10=001">档案</a></li></ul><ul><li class="xh">2</li><li class="mc"><a href="http://quote.eastmoney.com/sh601328.html">交通银行</a></li><li class="cc"><span class="ping">3.12%</span></li><li class="zf die">-1.03%</li><li class="zx"><a href="http://guba.eastmoney.com/topic,601328.html" class="red">股吧</a><a href="http://so.eastmoney.com/Search.htm?q=601328&m=0&t=1&s=1&f=1&p=0">资讯</a><a href="http://quote3.eastmoney.com/f10.aspx?StockCode=601328&stock_name=&f10=001">档案</a></li></ul><ul><li class="xh">3</li><li class="mc"><a href="http://quote.eastmoney.com/sh601989.html">中国重工</a></li><li class="cc"><span class="ping">2.77%</span></li><li class="zf zhang">5.68%</li><li class="zx"><a href="http://guba.eastmoney.com/topic,601989.html" class="red">股吧</a><a href="http://so.eastmoney.com/Search.htm?q=601989&m=0&t=1&s=1&f=1&p=0">资讯</a><a href="http://quote3.eastmoney.com/f10.aspx?StockCode=601989&stock_name=&f10=001">档案</a></li></ul><ul><li class="xh">4</li><li class="mc"><a href="http://quote.eastmoney.com/sh601669.html">中国电建</a></li><li class="cc"><span class="ping">2.69%</span></li><li class="zf die">-2.02%</li><li class="zx"><a href="http://guba.eastmoney.com/topic,601669.html" class="red">股吧</a><a href="http://so.eastmoney.com/Search.htm?q=601669&m=0&t=1&s=1&f=1&p=0">资讯</a><a href="http://quote3.eastmoney.com/f10.aspx?StockCode=601669&stock_name=&f10=001">档案</a></li></ul><ul><li class="xh">5</li><li class="mc"><a href="http://quote.eastmoney.com/sz000728.html">国元证券</a></li><li class="cc"><span class="ping">2.58%</span></li><li class="zf die">-1.95%</li><li class="zx"><a href="http://guba.eastmoney.com/topic,000728.html" class="red">股吧</a><a href="http://so.eastmoney.com/Search.htm?q=000728&m=0&t=1&s=1&f=1&p=0">资讯</a><a href="http://quote3.eastmoney.com/f10.aspx?StockCode=000728&stock_name=&f10=001">档案</a></li></ul><ul><li class="xh">6</li><li class="mc"><a href="http://quote.eastmoney.com/sh600050.html">中国联通</a></li><li class="cc"><span class="ping">2.56%</span></li><li class="zf die">-1.96%</li><li class="zx"><a href="http://guba.eastmoney.com/topic,600050.html" class="red">股吧</a><a href="http://so.eastmoney.com/Search.htm?q=600050&m=0&t=1&s=1&f=1&p=0">资讯</a><a href="http://quote3.eastmoney.com/f10.aspx?StockCode=600050&stock_name=&f10=001">档案</a></li></ul><ul><li class="xh">7</li><li class="mc"><a href="http://quote.eastmoney.com/sh600637.html">东方明珠</a></li><li class="cc"><span class="ping">2.22%</span></li><li class="zf zhang">1.53%</li><li class="zx"><a href="http://guba.eastmoney.com/topic,600637.html" class="red">股吧</a><a href="http://so.eastmoney.com/Search.htm?q=600637&m=0&t=1&s=1&f=1&p=0">资讯</a><a href="http://quote3.eastmoney.com/f10.aspx?StockCode=600637&stock_name=&f10=001">档案</a></li></ul><ul><li class="xh">8</li><li class="mc"><a href="http://quote.eastmoney.com/sh600839.html">四川长虹</a></li><li class="cc"><span class="ping">2.10%</span></li><li class="zf zhang">1.52%</li><li class="zx"><a href="http://guba.eastmoney.com/topic,600839.html" class="red">股吧</a><a href="http://so.eastmoney.com/Search.htm?q=600839&m=0&t=1&s=1&f=1&p=0">资讯</a><a href="http://quote3.eastmoney.com/f10.aspx?StockCode=600839&stock_name=&f10=001">档案</a></li></ul><ul><li class="xh">9</li><li class="mc"><a href="http://quote.eastmoney.com/sh601106.html">中国一重</a></li><li class="cc"><span class="ping">1.83%</span></li><li class="zf die">-0.44%</li><li class="zx"><a href="http://guba.eastmoney.com/topic,601106.html" class="red">股吧</a><a href="http://so.eastmoney.com/Search.htm?q=601106&m=0&t=1&s=1&f=1&p=0">资讯</a><a href="http://quote3.eastmoney.com/f10.aspx?StockCode=601106&stock_name=&f10=001">档案</a></li></ul><ul><li class="xh">10</li><li class="mc"><a href="http://quote.eastmoney.com/sh600009.html">上海机场</a></li><li class="cc"><span class="ping">1.76%</span></li><li class="zf die">-1.07%</li><li class="zx"><a href="http://guba.eastmoney.com/topic,600009.html" class="red">股吧</a><a href="http://so.eastmoney.com/Search.htm?q=600009&m=0&t=1&s=1&f=1&p=0">资讯</a><a href="http://quote3.eastmoney.com/f10.aspx?StockCode=600009&stock_name=&f10=001">档案</a></li></ul><ul class="endulhead"><li class="jzrq">持仓截止日期：2015-06-30</li><li class="cxgd"><a href="http://fund.eastmoney.com/f10/ccmx_150210.html">查看更多基金持仓>></a></li></ul><script type="text/javascript">var stocklist="0007682,6013281,6019891,6016691,0007282,6000501,6006371,6008391,6011061,6000091"</script>
    </div>
</div>
    </div>
    <div class="space0"></div>
</div>
<div class="space0"></div>
<div class="spacenew"></div>
<a name="zf"></a>
<div class="bkAll">
    <div class="titbar2">
<div class="font">
<ul id="jdzfMain">
<li class="at">阶段涨幅</li>
<li>季度涨幅</li>
<li>年度涨幅</li>
</ul>
</div>
<div class="more"> 
    <a href="http://fund.eastmoney.com/f10/jdzf_150210.html">更多>></a><label id="jdzfrq">截止至 2011-02-10</label>
     <a href="http://js1.eastmoney.com/tg.aspx?ID=3569" title="天天基金手机版" class="appicon">随时随地查看基金排名 随时随地查看基金阶段走势</a>
</div>
    </div>
    <div class="bodybar" style="position: relative;z-index:9;">
<div id="jdzfTab0" class="jdzfnew higher">
    <ul datetime="2015-07-21" class="lie higher"><li class="title"></li><li class="title">阶段涨幅</li><li class="title">同类平均</li><li class="title">沪深300</li><li class="title gzbd">跟踪标的<img src="http://j5.dfcfw.com/image/201307/20130708102440.gif" onmousemove="document.getElementById('jdzfTipindex').style.display='';"  style="_margin-top:5px"/><div id="jdzfTipindex" class="gzpmTips" style="display: none;"><span>跟踪标的：中证国有企业改革指数<a href="javascript:void(0)" target="_self" title="关闭" onclick="document.getElementById('jdzfTipindex').style.display='none';" class="promptbox">[×关闭]</a></span></div></li><li class="title">同类排名</li><li class="sfsi">四分位排名<img src="http://j5.dfcfw.com/image/201307/20130708102440.gif" onmousemove="document.getElementById('jdzfTip').style.display='';" style="_margin-top:20px"/><div id="jdzfTip" class="gzpmTips higherTip" style="display: none;"><span>四分位排名是将同类基金按涨幅大小顺序排列，然后分为四等分，每个部分大约包含四分之一即25%的基金，基金按相对排名的位置高低分为：优秀、良好、一般、不佳。<a href="javascript:void(0)" target="_self" title="关闭" onclick="document.getElementById('jdzfTip').style.display='none';" class="promptbox">[×关闭]</a></span></div></li></ul><ul class=" higher"><li class="title">今年来</li><li class="data"><span class="zdf zhang spanadd">21.09%</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 zhang spanadd">17.89%</span></li><li class="data gzbddata"><span class="index zhang spanadd">33.55%</span></li><li class="tlpm">41<span class="gray">|</span>116</li><li class="sf"><table class="tbsi"><tr><td class="tdno"></td></tr><tr><td class="tdblack"></td></tr><tr><td class="tdno"></td></tr><tr><td class="tdno"></td></tr></table><p class="sifen">良好</p></li></ul><ul class=" higher"><li class="title">近1周</li><li class="data"><span class="zdf zhang spanadd">8.56%</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 zhang spanadd">1.31%</span></li><li class="data gzbddata"><span class="index zhang spanadd">3.24%</span></li><li class="tlpm">50<span class="gray">|</span>242</li><li class="sf"><table class="tbsi"><tr><td class="tdblack"></td></tr><tr><td class="tdno"></td></tr><tr><td class="tdno"></td></tr><tr><td class="tdno"></td></tr></table><p class="sifen">优秀</p></li></ul><ul class=" higher"><li class="title">近1月</li><li class="data"><span class="zdf die spanadd">-38.34%</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 die spanadd">-10.16%</span></li><li class="data gzbddata"><span class="index die spanadd">-17.90%</span></li><li class="tlpm">183<span class="gray">|</span>218</li><li class="sf"><table class="tbsi"><tr><td class="tdno"></td></tr><tr><td class="tdno"></td></tr><tr><td class="tdno"></td></tr><tr><td class="tdblack"></td></tr></table><p class="sifen">不佳</p></li></ul><ul class=" higher"><li class="title">近3月</li><li class="data"><span class="zdf die spanadd">-27.50%</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 die spanadd">-9.81%</span></li><li class="data gzbddata"><span class="index die spanadd">-5.17%</span></li><li class="tlpm">124<span class="gray">|</span>140</li><li class="sf"><table class="tbsi"><tr><td class="tdno"></td></tr><tr><td class="tdno"></td></tr><tr><td class="tdno"></td></tr><tr><td class="tdblack"></td></tr></table><p class="sifen">不佳</p></li></ul><ul class=" higher"><li class="title">近6月</li><li class="data"><span class="zdf zhang spanadd">21.09%</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 zhang spanadd">17.39%</span></li><li class="data gzbddata"><span class="index zhang spanadd">32.24%</span></li><li class="tlpm">41<span class="gray">|</span>116</li><li class="sf"><table class="tbsi"><tr><td class="tdno"></td></tr><tr><td class="tdblack"></td></tr><tr><td class="tdno"></td></tr><tr><td class="tdno"></td></tr></table><p class="sifen">良好</p></li></ul><ul class=" higher"><li class="title">近1年</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 zhang spanadd">92.31%</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-<span class="gray">|</span>94</li><li class="sfsi">-</li></ul><ul class=" higher"><li class="title">近2年</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 zhang spanadd">90.19%</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-<span class="gray">|</span>66</li><li class="sfsi">-</li></ul><ul class="last  higher"><li class="title">近3年</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 zhang spanadd">73.70%</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-<span class="gray">|</span>46</li><li class="sfsi">-</li></ul>
</div>
<div id="jdzfTab1" class="jdzfnew hide higher">
    <ul datetime="2015-06-30" class="lie higher"><li class="title"></li><li class="title">阶段涨幅</li><li class="title">同类平均</li><li class="title">沪深300</li><li  class="title gzbd">跟踪标的<img src="http://j5.dfcfw.com/image/201307/20130708102440.gif" onmousemove="document.getElementById('quartergainTipindex').style.display='';"  style="_margin-top:5px"/><div id="quartergainTipindex" class="gzpmTips" style="display: none;"><span>跟踪标的：中证国有企业改革指数<a href="javascript:void(0)" target="_self" title="关闭" onclick="document.getElementById('quartergainTipindex').style.display='none';" class="promptbox">[×关闭]</a></span></div></li><li class="title">同类排名</li><li class="sfsi">四分位排名<img src="http://j5.dfcfw.com/image/201307/20130708102440.gif" onmousemove="document.getElementById('quartergainTip').style.display='';" style="_margin-top:20px"/><div id="quartergainTip" class="gzpmTips  higherTip" style="display: none;"><span>四分位排名是将同类基金按涨幅大小顺序排列，然后分为四等分，每个部分大约包含四分之一即25%的基金，基金按相对排名的位置高低分为：优秀、良好、一般、不佳。<a href="javascript:void(0)" target="_self" title="关闭" onclick="document.getElementById('quartergainTip').style.display='none';" class="promptbox">[×关闭]</a></span></div></li></ul><ul class="higher"><li class="title ">15年2季度</li><li class="data"><span class="zdf zhang spanadd">17.70%</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 zhang spanadd">10.41%</span></li><li class="data gzbddata"><span class="index zhang spanadd">20.34%</span></li><li class="tlpm">23<span class="gray">|</span>120</li><li class="sf"><table class="tbsi"><tr><td class="tdblack"></td></tr><tr><td class="tdno"></td></tr><tr><td class="tdno"></td></tr><tr><td class="tdno"></td></tr></table><p class="sifen">优秀</p></li></ul><ul class="higher"><li class="title ">15年1季度</li><li class="data"><span class="zdf zhang spanadd">38.02%</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 zhang spanadd">14.64%</span></li><li class="data gzbddata"><span class="index zhang spanadd">23.74%</span></li><li class="tlpm">33<span class="gray">|</span>122</li><li class="sf"><table class="tbsi"><tr><td class="tdno"></td></tr><tr><td class="tdblack"></td></tr><tr><td class="tdno"></td></tr><tr><td class="tdno"></td></tr></table><p class="sifen">良好</p></li></ul><ul class="higher"><li class="title ">14年4季度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul><ul class="higher"><li class="title ">14年3季度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul><ul class="higher"><li class="title ">14年2季度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul><ul class="higher"><li class="title ">14年1季度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul><ul class="higher"><li class="title ">13年4季度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul><ul class="last higher"><li class="title">13年3季度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul>
</div>
<div id="jdzfTab2" class="jdzfnew hide higher">
    <ul datetime="" class="lie higher"><li class="title"></li><li class="title">阶段涨幅</li><li class="title">同类平均</li><li class="title">沪深300</li><li  class="title gzbd">跟踪标的<img src="http://j5.dfcfw.com/image/201307/20130708102440.gif" onmousemove="document.getElementById('yeargainTipindex').style.display='';"  style="_margin-top:5px"/><div id="yeargainTipindex" class="gzpmTips" style="display: none;"><span>跟踪标的：中证国有企业改革指数<a href="javascript:void(0)" target="_self" title="关闭" onclick="document.getElementById('yeargainTipindex').style.display='none';" class="promptbox">[×关闭]</a></span></div></li><li class="title">同类排名</li><li class="sfsi">四分位排名<img src="http://j5.dfcfw.com/image/201307/20130708102440.gif" onmousemove="document.getElementById('yeargainTip').style.display='';" style="_margin-top:20px"/><div id="yeargainTip" class="gzpmTips  higherTip" style="display: none;"><span>四分位排名是将同类基金按涨幅大小顺序排列，然后分为四等分，每个部分大约包含四分之一即25%的基金，基金按相对排名的位置高低分为：优秀、良好、一般、不佳。<a href="javascript:void(0)" target="_self" title="关闭" onclick="document.getElementById('yeargainTip').style.display='none';" class="promptbox">[×关闭]</a></span></div></li></ul><ul class="higher"><li class="title ">2014年度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul><ul class="higher"><li class="title ">2013年度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul><ul class="higher"><li class="title ">2012年度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul><ul class="higher"><li class="title ">2011年度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul><ul class="higher"><li class="title ">2010年度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul><ul class="higher"><li class="title ">2009年度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul><ul class="higher"><li class="title ">2008年度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul><ul class="last higher"><li class="title">2007年度</li><li class="data"><span class="zdf ping spanadd">-</span></li><li class="data"><span class="tlpj ping spanadd">-</span></li><li class="data"><span class="hs300 ping spanadd">-</span></li><li class="data gzbddata"><span class="index ping spanadd">-</span></li><li class="tlpm">-</li><li class="sfsi">-</li></ul>
</div>
    </div>
    <div class="space0"></div>
</div>
<div class="space0"></div>
<a name="jz"></a>
<div class="bkAll">
    <div class="bkL">
<div class="titbar2">
    <div class="font">
<ul id="jzMain">
    <li class="at">历史净值</li>
    <li>分红送配</li>
</ul>
    </div>
    <div class="more"><a href="http://fund.eastmoney.com/f10/jjjz_150210.html">更多>></a><a class="split"></a><a href="http://js1.eastmoney.com/tg.aspx?ID=3569" title="天天基金手机版" class="appicon">随时随地查看最新净值</a><label id="jzrq"></label></div>
</div>
<div class="bodybar">
    <div id="jzTab0">
<ul class="ulhead"><li class="rq">净值日期</li><li class="dwjz">单位净值</li><li class="ljjz">累计净值</li><li class="zdf">日增长率</li><li class="bz">分拆提醒</li></ul><ul><li class="rq">2015-07-21</li><li class="dwjz"><span class="ping">0.5710</span></li><li class="ljjz"><span class="ping">1.7130</span></li><li class="zdf"><span class="zdf zhang">2.15%</span></li><li class="bz"></li></ul><ul><li class="rq">2015-07-20</li><li class="dwjz"><span class="ping">0.5590</span></li><li class="ljjz"><span class="ping">1.7010</span></li><li class="zdf"><span class="zdf zhang">4.29%</span></li><li class="bz"></li></ul><ul><li class="rq">2015-07-17</li><li class="dwjz"><span class="ping">0.5360</span></li><li class="ljjz"><span class="ping">1.6780</span></li><li class="zdf"><span class="zdf zhang">17.03%</span></li><li class="bz"></li></ul><ul><li class="rq">2015-07-16</li><li class="dwjz"><span class="ping">0.4580</span></li><li class="ljjz"><span class="ping">1.6000</span></li><li class="zdf"><span class="zdf zhang">7.01%</span></li><li class="bz"></li></ul><ul><li class="rq">2015-07-15</li><li class="dwjz"><span class="ping">0.4280</span></li><li class="ljjz"><span class="ping">1.5700</span></li><li class="zdf"><span class="zdf die">-18.63%</span></li><li class="bz"></li></ul>
    </div>
    <div id="jzTab1" class="hide">
<ul class="ulhead"><li class="lifh"><a href="http://fund.eastmoney.com/f10/fhsp_150210.html">富国中证国企改革指数分级B </a>成立以来，总计分红<a href="http://fund.eastmoney.com/f10/fhsp_150210.html">0次</a>，拆分<a href="http://fund.eastmoney.com/f10/fhsp_150210.html">1次</a></li></ul><ul><li class="lifh">2015-05-25  每份基金<span class="zhang">份额分拆2.141864594</span>份</li></ul>
    </div>
</div>
    </div>
    <div class="bkR">
<div class="titbar2">
    <div class="font">
<ul id="jjpjMain">
    <li class="at">基金评级</li>
    <li>评级走势</li>
</ul>
    </div>
    <div class="more"><a href="http://fund.eastmoney.com/f10/jjpj_150210.html">更多>></a></div>
</div>
<div class="bodybar" style="position: relative;">
    <div id="jjpjTab0">
<ul class="ulhead"><li class="pjjg">评级机构</li><li class="pjrq">评级日期</li><li class="pj">评级</li></ul><ul><li class="pjjg"><a href="http://fund.eastmoney.com/data/fundrating_0.html">海通证券</a></li><li class="pjrq">---</li><li class="pj gray">暂无评级</li></ul><ul><li class="pjjg"><a href="http://fund.eastmoney.com/data/fundrating_0.html">招商证券</a></li><li class="pjrq">---</li><li class="pj gray">暂无评级</li></ul><ul><li class="pjjg"><a href="http://fund.eastmoney.com/data/fundrating_0.html">上海证券</a></li><li class="pjrq">---</li><li class="pj gray">暂无评级</li></ul><ul><li class="pjjg"><a href="http://fund.eastmoney.com/data/fundrating_0.html">济安金信</a></li><li class="pjrq">---</li><li class="pj gray">暂无评级</li></ul><ul class='endulhead'><li class='cxgd'><a href='http://fund.eastmoney.com/f10/jjpj_150210.html'>查看更多基金评级>></a></li></ul>
    </div>
    <div id="jjpjTab1" class="jjpjzst hide">
<a href="http://fund.eastmoney.com/150210.html#pj"><img id="pjimg" src="http://j6.dfcfw.com/charts/Rating/150210_index.png"/></a>
    </div>
</div>
    </div>
    <div class="space0"></div>
</div>
    </div>
    <div class="space6"></div>
    <div class="hqbox bg">
<a name="pm"></a>
<div class="bkAll">
    <div class="titbar2 pictop">
<div class="font">
    <ul id="jzpicMain">
<li class="at">累计收益率走势</li>
<li>单位净值走势</li>
<li>累计净值走势</li>
    </ul>
</div>
<div class="more">
    <a href="http://fund.eastmoney.com/f10/jdzf_150210.html">更多>></a><a class="split"></a><a href="http://js1.eastmoney.com/tg.aspx?ID=3569" title="天天基金手机版" class="appicon">用手机查看基金累计收益率</a>
    <label id="jzpicrq"></label>
</div>
    </div>
    <div class="bodybar">
<div class="ljsypmpic">
    <div id="jzpicTab0">
<div id="svgtab" class="svgtab">
    <label>选择时间：</label><span date="month" class="first">1个月</span><span date="threemonth">3个月</span><span date="sixmonth" class="here">6个月</span><span date="year">1年</span><span date="threeyear">3年</span><span date="thisyear">今年来</span><span date="all">最大</span>
</div>
<div class="space0"></div>
<div id="svgshow" class="svgshow"></div>
    </div>
    <div id="jzpicTab1" class="jzpic jzpicnew hide">
<div id="svgtab1" class="svgtab">
    <label>选择时间：</label><span date="month" class="first">1个月</span><span date="threemonth">3个月</span><span date="sixmonth" class="here">6个月</span><span date="year">1年</span><span date="threeyear">3年</span><span date="thisyear">今年来</span><span date="all">最大</span>
</div>
<div class="space0"></div>
<div id="dwjzcharts" class="svgshow"></div>
    </div>
    <div id="jzpicTab2" class="jzpic jzpicnew hide">
<div id="svgtab2" class="svgtab">
    <label>选择时间：</label><span date="month" class="first">1个月</span><span date="threemonth">3个月</span><span date="sixmonth" class="here">6个月</span><span date="year">1年</span><span date="threeyear">3年</span><span date="thisyear">今年来</span><span date="all">最大</span>
</div>
<div class="space0"></div>
<div id="ljjzcharts" class="svgshow"></div>
    </div>
</div>
    </div>
</div>
<div class="spacenew"></div>
<div class="bkAll">
    <div class="titbar2 tlpmzstts">
<div class="font" style="position: relative; z-index: 97;">
    <ul id="pmtab">
<li class="at">同类排名走势图</li>
<li>百分比排名走势图</li>
    </ul>
    <img id="pmtips"   src="http://j5.dfcfw.com/image/201307/20130708102440.gif" alt=""  />
    <div id="pmpicTip" class="gzpmTips" style="display: none;"><span>提供基金每日不同阶段涨幅的同类排名/百分比排名数据，封闭基金、创新型封闭基金暂不提供排名。<br /> 同类排名越小说明其在同类基金中业绩越好。<br />百分比排名显示阶段业绩在此基金之下的同类基金的百分比数，例如某股票型基金某日的近3月的百分比排名为 95%，说明此基金近3月的业绩表现优于95%的股票型基金。<a href="javascript:void(0)" target="_self" title="关闭"  class="promptbox">[×关闭]</a></span></div>
</div>
<div class="more"><a href="http://fund.eastmoney.com/f10/jdzf_150210.html">更多>></a><a href="http://js1.eastmoney.com/tg.aspx?ID=3569" title="天天基金手机版" class="appicon">随时随地查看同类排名走势图 点击下载天天基金网手机版</a></div>
    </div>
    <div class="bodybar">
<div class="ljsypmpic">
	 <iframe id="listCover" class="listCover hide"></iframe> 
    <div id="tlpm0">
<div id="jjpmsvgtab" class="svgtab">    
    <label>选择指标：</label><select id="zbselect0" class="zblist">
<option value="threemonth">近三月排名</option>
<option value="sixmonth">近六月排名</option>
<option value="year">近一年排名</option>
    </select>
    <label>选择时间：</label><span date="month" class="first">1个月</span><span date="threemonth">3个月</span><span date="sixmonth" class="here">6个月</span><span date="year">1年</span><span date="threeyear">3年</span><span date="thisyear">今年来</span><span date="all">最大</span>
</div>
<div class="space0"></div>
<div id="jjpmcharts" class="svgshow"></div>
    </div>
<div id="tlpm1" class="hide">
<div id="jjpmsvgtab1" class="svgtab">
    <label>选择指标：</label><select id="zbselect1" class="zblist">
<option value="threemonth">近三月排名</option>
<option value="sixmonth">近六月排名</option>
<option value="year">近一年排名</option>
    </select>
    <label>选择时间：</label><span date="month" class="first">1个月</span><span date="threemonth">3个月</span><span date="sixmonth" class="here">6个月</span><span date="year">1年</span><span date="threeyear">3年</span><span date="thisyear">今年来</span><span date="all">最大</span>
</div>
<div class="space0"></div>
<div id="jjpmcharts1" class="svgshow"></div>
</div>
</div>
    </div>
</div>
    </div>
    <div class="space6"></div>
    <div class="mrMiddle">
<div class="mrmLeft">
    <div class="bkAll nomargin">
<div class="bkHbL">
    <div class="mrtLHead">
<ul>
    <li class="at">基金要闻</li>
</ul>
    </div>
    <div class="mrtLBody">
<div>
    <ul><li class="title"><a href="http://futures.eastmoney.com/news/1513,20150720528760760.html">富国银行：铂金系价格看中国经济 钯金支撑</a></li><li class="pubtime">07-20</li></ul><ul><li class="title"><a href="http://fund.eastmoney.com/news/1593,20150717528426418.html">285只新基金跌穿净值 富国中证工业4.</a></li><li class="pubtime">07-17</li></ul><ul><li class="title"><a href="http://forex.eastmoney.com/news/1130,20150715527169819.html">富国银行：FED加息时机难以捉摸 已改变</a></li><li class="pubtime">07-15</li></ul><ul><li class="title"><a href="http://fund.eastmoney.com/news/1680,20150714526888496.html">富国天合稳健优选：博采众长 稳健配置</a></li><li class="pubtime">07-14</li></ul><ul><li class="title"><a href="http://fund.eastmoney.com/news/1593,20150714526851211.html">绊倒的B基金：鹏华4只申万3只华宝2只富</a></li><li class="pubtime">07-14</li></ul><ul><li class="title"><a href="http://fund.eastmoney.com/news/1680,20150710525825191.html">富国创业板指数分级：跟踪创业板指数 严控</a></li><li class="pubtime">07-10</li></ul><ul><li class="more"><a href="http://so.eastmoney.com/Search.htm?q=%28%u5BCC%u56FD%u57FA%u91D1%29%28%u5BCC%u56FD%u57FA%u91D1%u7BA1%u7406%u6709%u9650%u516C%u53F8%29%28%u5BCC%u56FD%u4E2D%u8BC1%u56FD%u4F01%u6539%u9769%u6307%u6570%u5206%u7EA7B%20%29%28150210%29&m=0&t=2&s=1&p=0">点击查看更多相关基金要闻>></a></li></ul>
</div>
    </div>
</div>
<div class="bkHbR">
    <div class="mrtLHead">
<ul id="ywMain">
    <li class="at">基金公告</li>
    <li>基金经理变动</li>
</ul>
    </div>
    <div class="mrtLBody">
<div id="ywTab0">
    <ul><li class="title"><a href="http://fund.eastmoney.com/gonggao/150210,AN201507200010256963.html">富国中证国有企业改革指数分级证券投资基金</a></li><li class="pubtime">07-21</li></ul><ul><li class="title"><a href="http://fund.eastmoney.com/gonggao/150210,AN201507210010260020.html">富国基金管理有限公司关于增加浦发银行为富</a></li><li class="pubtime">07-21</li></ul><ul><li class="title"><a href="http://fund.eastmoney.com/gonggao/150210,AN201507170010230630.html">富国基金管理有限公司关于旗下部分基金在平</a></li><li class="pubtime">07-17</li></ul><ul><li class="title"><a href="http://fund.eastmoney.com/gonggao/150210,AN201507170010230631.html">富国基金管理有限公司关于调整旗下基金最低</a></li><li class="pubtime">07-17</li></ul><ul><li class="title"><a href="http://fund.eastmoney.com/gonggao/150210,AN201507140010200569.html">富国基金管理有限公司关于增加民生证券为旗</a></li><li class="pubtime">07-14</li></ul><ul><li class="title"><a href="http://fund.eastmoney.com/gonggao/150210,AN201507130010188415.html">富国基金管理有限公司关于在农业银行股份有</a></li><li class="pubtime">07-13</li></ul><ul><li class="more"><a href="http://fund.eastmoney.com/f10/jjgg_150210.html">点击查看更多富国中证国企改革指数分级B 基金公告>></a></li></ul>
</div>
<div id="ywTab1" class="hide">
    <ul class="ulhead"><li class="qsrq">起始期</li><li class="jzrq">截止期</li><li class="jjjl">基金经理</li><li class="rzqj">任期时间</li><li class="rqhb">任期回报</li></ul><ul class="btline"><li class="qsrq">2015-06-05</li><li class="jzrq">至今</li><li class="jjjl" title="王保合 张圣贤"><a href="http://fund.eastmoney.com/manager/30069488.html">王保合</a><span>等</span></li><li class="rzqj">47天</li><li class="rqhb die">-48.00%</li></ul><ul class="btline"><li class="qsrq">2015-05-13</li><li class="jzrq">2015-06-04</li><li class="jjjl"><a href="http://fund.eastmoney.com/manager/30069488.html">王保合</a></li><li class="rzqj">22天</li><li class="rqhb zhang">24.29%</li></ul><ul class="btline"><li class="qsrq">2015-04-15</li><li class="jzrq">2015-05-12</li><li class="jjjl" title="章椹元 王保合"><span>章椹元</span><span>等</span></li><li class="rzqj">27天</li><li class="rqhb zhang">22.43%</li></ul><ul class="btline"><li class="qsrq">2014-12-17</li><li class="jzrq">2015-04-14</li><li class="jjjl"><span>章椹元</span></li><li class="rzqj">118天</li><li class="rqhb zhang">58.20%</li></ul><ul><li class="more"><a href="http://fund.eastmoney.com/f10/jjjl_150210.html">点击查看更多富国中证国企改革指数分级B 基金经理详情>></a></li></ul>
</div>
    </div>
</div>
    </div>
    <div class="space6"></div>
    <div class="mrmba">
    	
<div class="mrmLHead">
    <ul>
<li class="tit"><a href="http://guba.eastmoney.com/topic,of150210.html">富国中证国企改革指数分级B 基金吧</a></li>
<li class="more">
    <a href="http://js1.eastmoney.com/tg.aspx?ID=3569" title="天天基金手机版" class="appicon">用手机随时随地查看本基金网友观点</a> |  <a href="http://guba.eastmoney.com/type,zg80000221.html">富国基金吧</a> | <a href="javascript:void(0)" target="_self" onclick="location.reload();">刷新本页</a> | <a href="http://guba.eastmoney.com/topic,of150210.html">富国中证国企改革指数分级B 基金吧</a>
</li>
    </ul>
</div>
<div class="mrmLBody">
    <ul class="ulhead odd"><li class="dj">点击</li><li class="hf">回复</li><li class="tit">标题</li><li class="auth">作者</li><li class="time">最后更新时间</li></ul><ul><li class="dj">204363</li><li class="hf">50</li><li class="tit"><em class="settopic">话题</em><a  href="http://guba.eastmoney.com/news,jjft,188084125.html" title="“价值王者”做客夜8点，赚最安全的钱！">“价值王者”做客夜8点，赚最安全的钱！</a></li><li class="auth"><a href="http://iguba.eastmoney.com/2363114059587676">股吧访谈</a></li><li class="time">07-22 16:28</li></ul> <ul class="odd"><li class="dj">215573</li><li class="hf">200</li><li class="tit"><em class="settopic">话题</em><a  href="http://guba.eastmoney.com/news,cjpl,188763492.html" title="不到一周90%本金“消失” 你见过吗？">不到一周90%本金“消失” 你见过吗？</a></li><li class="auth"><a href="http://iguba.eastmoney.com/9313013693864916">财经评论</a></li><li class="time">07-22 16:40</li></ul> <ul><li class="dj">133492</li><li class="hf">1</li><li class="tit"><em class="settopic">话题</em><a  href="http://guba.eastmoney.com/news,jjdt,188701302.html" title="绩优基金下半年投资策略曝光：从全攻到全守">绩优基金下半年投资策略曝光：从全攻到全守</a></li><li class="auth"><a href="http://iguba.eastmoney.com/4834094337291986">资讯小号角</a></li><li class="time">07-22 16:08</li></ul> <ul class="odd"><li class="dj">123033</li><li class="hf">1</li><li class="tit"><em class="settopic">话题</em><a  href="http://guba.eastmoney.com/news,jjdt,188701554.html" title="十大基金投资总监看后市：创新转型改革仍是重点">十大基金投资总监看后市：创新转型改革仍是重点</a></li><li class="auth"><a href="http://iguba.eastmoney.com/4834094337291986">资讯小号角</a></li><li class="time">07-22 10:39</li></ul> <ul><li class="dj">129989</li><li class="hf">0</li><li class="tit"><em class="settopic">话题</em><a  href="http://guba.eastmoney.com/news,jjdt,188706937.html" title="值得收藏的五份名单：基金公司独门重仓股曝光">值得收藏的五份名单：基金公司独门重仓股曝光</a></li><li class="auth"><a href="http://iguba.eastmoney.com/4834094337291986">资讯小号角</a></li><li class="time">07-22 08:20</li></ul> <ul class="odd"><li class="dj">738075</li><li class="hf">147</li><li class="tit"><em class="settopic">话题</em><a  href="http://guba.eastmoney.com/news,jjxx,185798872.html" title="分级基金下折，您需要关注的细节">分级基金下折，您需要关注的细节</a></li><li class="auth"><a href="http://iguba.eastmoney.com/3326094319971000">往事勿追</a></li><li class="time">07-22 12:43</li></ul> <ul><li class="dj">13627622</li><li class="hf">0</li><li class="tit"><em class="settopic">话题</em><a  href="http://guba.eastmoney.com/news,szzs,179470487.html" title="IPO暂缓 闲钱放活期宝享5-25%高收益">IPO暂缓 闲钱放活期宝享5-25%高收益</a></li><li class="auth"><a href="http://iguba.eastmoney.com/6712111507146464">东方财富网</a></li><li class="time">06-23 10:52</li></ul> <ul class="odd"><li class="dj">5752174</li><li class="hf">323</li><li class="tit"><em class="settopic">话题</em><a  href="http://guba.eastmoney.com/news,jjxx,136938953.html" title="帮助帖：活期宝常见问题">帮助帖：活期宝常见问题</a></li><li class="auth"><a href="http://iguba.eastmoney.com/3621113770214230">东北小虎3366</a></li><li class="time">07-19 15:23</li></ul> <ul><li class="dj">6283698</li><li class="hf">824</li><li class="tit"><em class="settopic">话题</em><a  href="http://guba.eastmoney.com/news,jjxx,136943510.html" title="帮助帖：交易常见问题">帮助帖：交易常见问题</a></li><li class="auth"><a href="http://iguba.eastmoney.com/3621113770214230">东北小虎3366</a></li><li class="time">07-22 15:22</li></ul> <ul class="odd"><li class="dj">13110</li><li class="hf">119</li><li class="tit"><a  title="1.034进的还有吗？" href="http://guba.eastmoney.com/news,of161026,188348550.html">1.034进的还有吗？</a></li><li class="auth grey">山东聊城股友</li><li class="time">07-22 16:48</li></ul> <ul><li class="dj">11</li><li class="hf">0</li><li class="tit"><a  title="规模差距" href="http://guba.eastmoney.com/news,of161026,188978616.html">规模差距</a></li><li class="auth grey">内蒙古股友</li><li class="time">07-22 16:46</li></ul> <ul class="odd"><li class="dj">443</li><li class="hf">2</li><li class="tit"><a  title="为什么我看到的价格是0.77，今天涨停了啊" href="http://guba.eastmoney.com/news,of161026,188966476.html">为什么我看到的价格是0.77，今天涨停了啊</a></li><li class="auth grey">上海股友</li><li class="time">07-22 16:44</li></ul> <ul><li class="dj">213</li><li class="hf">1</li><li class="tit"><a  title="今天国企概念股好多涨停，本基金里面的国企股却没有一只？" href="http://guba.eastmoney.com/news,of161026,188970010.html">今天国企概念股好多涨停，本基金里面的国企股却没有一...</a></li><li class="auth"><a href="http://iguba.eastmoney.com/3568094315176896">四十一新起点</a></li><li class="time">07-22 16:42</li></ul> <ul class="odd"><li class="dj">10724</li><li class="hf">76</li><li class="tit"><a  title="富国天天倒数第一" href="http://guba.eastmoney.com/news,of161026,188054560.html">富国天天倒数第一</a></li><li class="auth grey">浙江宁波股友</li><li class="time">07-22 16:42</li></ul> <ul><li class="dj">8027</li><li class="hf">20</li><li class="tit"><a  title="买入20万国企改A，看好下折，呵呵。" href="http://guba.eastmoney.com/news,of161026,188738719.html">买入20万国企改A，看好下折，呵呵。</a></li><li class="auth"><a href="http://iguba.eastmoney.com/6981093946015054">xhx100</a></li><li class="time">07-22 16:41</li></ul> <ul class="odd"><li class="dj">2554</li><li class="hf">6</li><li class="tit"><a  title="溢价确实太高了" href="http://guba.eastmoney.com/news,of161026,188916382.html">溢价确实太高了</a></li><li class="auth grey">中国股友</li><li class="time">07-22 16:33</li></ul> <ul><li class="dj">233</li><li class="hf">1</li><li class="tit"><a  title="此鸡涨的太慢，我血本钱什么时候能回来" href="http://guba.eastmoney.com/news,of161026,188962440.html">此鸡涨的太慢，我血本钱什么时候能回来</a></li><li class="auth grey">宁夏股友</li><li class="time">07-22 16:24</li></ul> <ul class="odd"><li class="dj">470536</li><li class="hf">960</li><li class="tit"><a  title="「墨字论市12」多空决战后，将拉开新一轮行情的序幕！" href="http://guba.eastmoney.com/news,of161026,185735065.html">「墨字论市12」多空决战后，将拉开新一轮行情的序幕...</a></li><li class="auth"><a href="http://iguba.eastmoney.com/3382113732943392">墨字非攻</a></li><li class="time">07-22 16:15</li></ul> 

    <ul class="go">
<li><a href="http://guba.eastmoney.com/topic,of150210.html">点击查看更多富国中证国企改革指数分级B 吧热贴>></a></li>
    </ul>
</div>
<div class="mrmLFoot">
    <iframe frameborder="0" width="750" height="250" noresize scrolling="no" src="http://guba.eastmoney.com/guba_hqpost_new.aspx?stockcode=of150210&h=130" id="barReply" name="barReply"></iframe>
   <a href="http://js1.eastmoney.com/tg.aspx?ID=3569" title="天天基金手机版" class="appicon">随时随地与本基金投资者一起交流 点击下载天天基金网手机版</a>
</div>
    </div>
		</div>
    </div>
    <div class="space6"></div>
    <div class="hqbox bg">
<div class="bkAll">
    <div class="bkL">
<div class="titbar2">
    <div class="font">
<ul><li class="at">资产配置</li></ul>
    </div>
    <div class="more"><a href="http://fund.eastmoney.com/f10/zcpz_150210.html">更多>></a></div>
</div>
<div><img src="http://j3.dfcfw.com/images/ZCPZ/150210.png" onerror="javascript:this.src='http://j3.dfcfw.com/images/ZCPZ/999999.png'" /></div> 
    </div>
    <div class="bkR">
<div class="titbar2">
    <div class="font">
<ul><li class="at">行业配置</li></ul><select id="selHypz" style="z-index:-10;"><option value="2015S2">15年第二季</option><option value="2015S1">15年第一季</option></select>
    </div>
    <div class="more"><a href="http://fund.eastmoney.com/f10/hytz_150210.html">更多>></a></div>
</div>
<div><img id="hypzImg" tourl="http://j3.dfcfw.com/images/HYPZ/2001S2_150210.png" src="" /></div>
    </div>
    <div class="space0"></div>
</div>
<div class="space0"></div>
<div class="bkAll">
    <div class="bkL">
    	<div class="titbar2">
    <div class="font">
<ul><li class="at">持有人结构</li></ul>
    </div>
    <div class="more"><a href="http://fund.eastmoney.com/f10/cyrjg_150210.html">更多>></a></div>
</div>
<div><img src="http://j3.dfcfw.com/images/Cyr/150210.png" onerror="javascript:this.src='http://j3.dfcfw.com/images/ZCPZ/999999.png'" /></div>    
    </div>
    <div class="bkR">
 <div class="titbar2">
    <div class="font">
<ul><li class="at">申购赎回</li></ul>
    </div>
    <div class="more"><a href="http://fund.eastmoney.com/f10/gmbd_150210.html">更多>></a></div>
</div>
<div><img src="http://j3.dfcfw.com/images/SGSH/150210.png" onerror="javascript:this.src='http://j3.dfcfw.com/images/ZCPZ/999999.png'" /></div>
    </div>
    <div class="space0"></div>
</div>
    </div>
</div>
    </div>
<div class="mainFrame">
<div class="space6"></div>
<div  id="statement" style="border: 1px solid #CAC9C7; background: none no-repeat scroll 0px 0px #FFFAE0; margin: 10px 0px 0px; padding: 5px; line-height: 2.0; text-align: left; color: #333333; font-size: 12px;">郑重声明：天天基金网发布此信息目的在于传播更多信息，与本网站立场无关。天天基金网不保证该信息（包括但不限于文字、数据及图表）全部或者部分内容的准确性、真实性、完整性、有效性、及时性、原创性等。相关信息并未经过本网站证实，不对您构成任何投资决策建议，据此操作，风险自担。</div>
    </div>
<div class="mainFrame">
<div class="space6"></div>
<style>
.cpright{font-family:arial,SimSun,'宋体';text-align: center;line-height: 24px;margin: 5px 0 0 0;padding: 0 0 30px 0;}.cpright p{line-height: 24px;padding:0;margin:0;}.cpright a {color: #5D5D5D;text-decoration:underline;}.cpright a:hover,.cpright p.cp a:hover{color:#E30000;text-decoration:underline;}.cpright span {color: #5D5D5D;margin: 0 10px;}.cpright p.cp,.cpright p.cp a {color: #808080;text-decoration:none;}
  /*天天基金footer*/
       .footera { background:url("http://j5.dfcfw.com/image/201507/20150706150017.png") no-repeat;}
       .footer-police, .footer-zx110, .footer-shjubao, .footer-cxzx, .footer-shgs {height: 40px;margin: 0 4px; width: 110px;}
       .footer-police, .footer-zx110, .footer-shjubao, .footer-cxzx, .footer-shgs {display: inline-block;overflow: hidden;}
       .footer-police {background-position: 0 -512px;}
       .footer-zx110 {background-position: -112px -512px;}
       .footer-shjubao {background-position: 0 -560px;}
       .footer-cxzx {background-position: -112px -560px;width: 40px;}
       .footer-shgs {background-position: 0 -608px;width: 47px;}
</style>
<div class="cpright">
<p style="margin:10px 0 0; padding:0px;"><a style="cursor:pointer;" onclick="SetHome2(this,'http://fund.eastmoney.com/')" target="_self">将天天基金网设为上网首页吗？</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="addBook('http://fund.eastmoney.com/','天天基金网--东方财富网旗下基金平台')" style="cursor:pointer;" target="_self">将天天基金网添加到收藏夹吗？</a></p>
<p><a target="_blank" href="http://help.1234567.com.cn/aboutus/about.html">关于我们</a><span>|</span><a target="_blank" href="http://help.1234567.com.cn/aboutus/licenses.html">资质证明</a><span>|</span><a target="_blank" href="http://fundact.eastmoney.com/ttjjyjzx/">研究中心</a><span>|</span><a target="_blank" href="http://help.1234567.com.cn/aboutus/connect.html">联系我们</a><span>|</span><a target="_blank" href="http://help.1234567.com.cn/aboutus/security_guid.html">安全指引</a><span>|</span><a target="_blank" href="http://help.1234567.com.cn/aboutus/relief.html">免责条款</a><span>|</span><a target="_blank" href="http://help.1234567.com.cn/aboutus/secret.html">隐私条款</a><span>|</span><a target="_blank" href="http://help.1234567.com.cn/aboutus/risktips.html">风险提示函</a><span>|</span><a target="_blank" href="http://feedback.1234567.com.cn/">意见建议</a><span>|</span><a target="_blank" href="https://online.1234567.com.cn/">在线客服</a></p>
<p class="cp">天天基金客服热线：4001818188<span>|</span>客服邮箱：<a target="_blank" href="mailto:vip@1234567.com.cn">vip@1234567.com.cn</a>&nbsp;&nbsp;<a href="mailto:ttfund@1234567.com.cn">ttfund@1234567.com.cn</a><span>|</span>人工服务时间：工作日 7:30-21:30 双休日 9:00-21:30<br>郑重声明：<a target="_blank" href="http://help.1234567.com.cn/aboutus/licenses.html" class="footFundCertLink">天天基金系证监会批准的基金销售机构[000000303]</a>。天天基金网所载文章、数据仅供参考，使用前请核实，风险自负。<br>中国证监会上海监管局网址：<a href="http://www.csrc.gov.cn/pub/shanghai/">www.csrc.gov.cn/pub/shanghai</a><br>CopyRight&nbsp;&nbsp;上海天天基金销售有限公司&nbsp;&nbsp;2011-2015&nbsp;&nbsp;沪ICP证：沪B2-20130026<br><br></p>
   <p>
            <a class="footera footer-police" title="上海网警网络110" href="http://www.cyberpolice.cn/"></a>
            <a class="footera footer-zx110" title="网络社会征信网" href="http://www.zx110.org/"></a>
            <a class="footera footer-shjubao" title="上海违法和违规信息举报中心" href="http://www.shjbzx.cn/"></a>
            <a class="footera footer-cxzx" title="诚信在线" href="http://www.51315.cn/company_details_1138"></a>
            <a class="footera footer-shgs" title="上海工商" href="https://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&entyId=dov73ne2cwgd88longlpxsn0hcrfn5m2aa"></a>
            </p>

<script type="text/javascript">
eval(function(p,a,c,k,e,r){e=function(c){return c.toString(36)};if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'[0-9a-df]'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('7 addBook(0,2){3(8.all){3(arguments){1.9.a(1.location.href,1.8.2)}4{1.9.a(0,2)}}4{5("加入收藏失败，请使用Ctrl+D进行添加");return b}};7 SetHome2(6,0){c{6.style.behavior=\'0(#default#homepage)\';6.setHomePage(0)}d(e){3(1.f){c{f.security.PrivilegeManager.enablePrivilege("UniversalXPConnect")}d(e){5("抱歉，此操作被浏览器拒绝！\\n\\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为\'b\'")}}4{5("抱歉，您所使用的浏览器无法完成此操作。\\n\\n您需要手动将【"+0+"】设置为首页。")}}};',[],16,'url|window|title|if|else|alert|obj|function|document|external|AddFavorite|true|try|catch||netscape'.split('|'),0,{}))
</script>
<script type="text/javascript" src="http://cmsjs.eastmoney.com/analysis/emtj.min.js?v=20150401"></script>
</div>
 </div>
<div id="cfybox">
<div id="cfy" class="cfy">
<div class="cfy_warp">
<div class="cfy_sider" id="cfy_side"> 
</div>
<div class="cfy_main" id="cfy_main" style="position:relative; z-index:20;">
<a class="cfy_order" id="cfy_order" href="http://fund.eastmoney.com/ContactUs/Order.aspx">预约开户</a>
</div>
<iframe id="ie_hack_mask" style="position:relative; display:none; z-index:1; left:10px; height:230px; width:130px;top:-232px;" frameborder="0"></iframe>
</div>  
</div>
</div>
</div> 
<div id="fixedTop">
<div class="fixedBuy" id="fixedBuy">
    <div class="instantBuy">
    <span class="fix_left">
    <span><input type="text" value="请输入基金代码、名称或简拼" id="fix_search"/><b class="fix_searchb_b" onclick="fdhq.toHQ('fix_search')"></b></span>
   <span class="fix_fname">富国中证国企改革指数分级</span><span class="fix_fcode">150210</span><span class="fix_jzinfo"><a href="http://fund.eastmoney.com/f10/jjjz_150210.html">单位净值</a></span><span class="fix_date">(07-21)：</span><span class="fix_dwjz red bold">0.5710</span><span>(</span><span class="fix_zzl red bold">2.15%</span><span>)</span></span><span class="fix_right"><a class="fixdisbuy"></a><a class="fixdisdt"></a><a href="https://trade.1234567.com.cn/reg/step1?spm=pzm" class="fix_kf"></a></span>
    </div>
     <iframe style="position:absolute; top:0px; left:0px;display:block;width:996px;height:37px;z-index:-1;"></iframe> 
    <div class="intro_newbg"></div>
</div>
</div>
<div id="rightadvert"><div class="appdownload"><a href="http://js1.eastmoney.com/tg.aspx?ID=3566"><div class="dbox"></div></a><div style="text-align:center;font-size:14px;font-family:'宋体';color:#ff4400;position:absolute;top:230px;width:190px;">随时查看好基金</div><div style="text-align:center;font-size:14px;font-family:'宋体';color:#ff4400;position:absolute;top:251px;width:190px;"><span>近6月最高赚</span><span style='font-weight:bold;color:#ff0000;'>93.76%</span></div><a class="clickd" href="http://js1.eastmoney.com/tg.aspx?ID=3566">点击下载</a></div><div class="hotsale"><div class="t"><span class="dts"></span><span class="dtt">热门主题</span><span class="dts"></span></div><div class="sanbaoBox sanbao">
                                <a target="_blank" href="http://fundact.eastmoney.com/information/0142015/?spm=001.rt"><div class="Header simubaoHeader">消费主题</div></a>
                                <div class="sanbaolink"><a target="_blank" href="http://fundact.eastmoney.com/information/0142015/?spm=001.rt">今年来赚超83%</a></div>
                           </div><div class="sanbaoBox sanbao">
                                <a target="_blank" href="http://fundact.eastmoney.com/information/zxzt2014004/?spm=001.rt"><div class="Header simubaoHeader">军工主题</div></a>
                                <div class="sanbaolink"><a target="_blank" href="http://fundact.eastmoney.com/information/zxzt2014004/?spm=001.rt">近6月赚超46%</a></div>
                           </div><div class="sanbaoBox sanbao">
                                <a target="_blank" href="https://zhongcaisuo.eastmoney.com/lists.html/?spm=001.w.067"><div class="Header simubaoHeader">固定收益</div></a>
                                <div class="sanbaolink"><a target="_blank" href="https://zhongcaisuo.eastmoney.com/lists.html/?spm=001.w.067"  style="color: #ff4400;">8.0%高收益产品抢购中</a></div>
                           </div><div class="t"><span class="dts"></span><span class="dtt">热销基金</span><span class="dts"></span></div><div class="fundbox"><div class="rfund"><a hidefocus="true" class="a-wrapper" href="http://fundact.eastmoney.com/fundinfo/index.html?fund=100056&spm=xlb&spm=xlb"><p class="t1">富国低碳环保</p><p class="t2">近6月收益率高达</p><p class="t3"><span class="t3l">93.</span><span class="t3r">76%</span></p><span class="dot"></span><p class="t4"><span class="adfl">费率<em>4</em>折</span></p></a><a href="http://fundact.eastmoney.com/fundinfo/index.html?fund=100056&spm=xlb&spm=xlb" class="adbuy">立即购买</a></div><div class="rfund"><a hidefocus="true" class="a-wrapper" href="http://fundact.eastmoney.com/fundinfo/index.html?fund=000663&spm=xlb&spm=xlb"><p class="t1">国投瑞银美丽中国混合</p><p class="t2">近6月收益率高达</p><p class="t3"><span class="t3l">92.</span><span class="t3r">62%</span></p><span class="dot"></span><p class="t4"><span class="adfl">费率<em>4</em>折</span></p></a><a href="http://fundact.eastmoney.com/fundinfo/index.html?fund=000663&spm=xlb&spm=xlb" class="adbuy">立即购买</a></div><div class="rfund"><a hidefocus="true" class="a-wrapper" href="http://fundact.eastmoney.com/fundinfo/index.html?fund=519113&spm=xlb&spm=xlb"><p class="t1">浦银精致生活</p><p class="t2">近6月收益率高达</p><p class="t3"><span class="t3l">81.</span><span class="t3r">16%</span></p><span class="dot"></span><p class="t4"><span class="adfl">费率<em>4</em>折</span></p></a><a href="http://fundact.eastmoney.com/fundinfo/index.html?fund=519113&spm=xlb&spm=xlb" class="adbuy">立即购买</a></div><div class="rfund"><a hidefocus="true" class="a-wrapper" href="http://fundact.eastmoney.com/fundinfo/index.html?fund=519120&spm=xlb&spm=xlb"><p class="t1">浦银战略新兴产业混合</p><p class="t2">近6月收益率高达</p><p class="t3"><span class="t3l">80.</span><span class="t3r">36%</span></p><span class="dot"></span><p class="t4"><span class="adfl">费率<em>4</em>折</span></p></a><a href="http://fundact.eastmoney.com/fundinfo/index.html?fund=519120&spm=xlb&spm=xlb" class="adbuy">立即购买</a></div><div class="rfund"><a hidefocus="true" class="a-wrapper" href="http://fundact.eastmoney.com/fundinfo/index.html?fund=519156&spm=xlb&spm=xlb"><p class="t1">新华行业灵活配置</p><p class="t2">近6月收益率高达</p><p class="t3"><span class="t3l">77.</span><span class="t3r">87%</span></p><span class="dot"></span><p class="t4"><span class="adfl">费率<em>4</em>折</span></p></a><a href="http://fundact.eastmoney.com/fundinfo/index.html?fund=519156&spm=xlb&spm=xlb" class="adbuy">立即购买</a></div><div class="rfund"><a hidefocus="true" class="a-wrapper" href="http://fundact.eastmoney.com/fundinfo/index.html?fund=000124&spm=xlb&spm=xlb"><p class="t1">华宝服务优选混合</p><p class="t2">近6月收益率高达</p><p class="t3"><span class="t3l">76.</span><span class="t3r">11%</span></p><span class="dot"></span><p class="t4"><span class="adfl">费率<em>4</em>折</span></p></a><a href="http://fundact.eastmoney.com/fundinfo/index.html?fund=000124&spm=xlb&spm=xlb" class="adbuy">立即购买</a></div><div class="rfund"><a hidefocus="true" class="a-wrapper" href="http://fundact.eastmoney.com/fundinfo/index.html?fund=519165&spm=xlb&spm=xlb"><p class="t1">新华鑫利灵活配置</p><p class="t2">近6月收益率高达</p><p class="t3"><span class="t3l">72.</span><span class="t3r">96%</span></p><span class="dot"></span><p class="t4"><span class="adfl">费率<em>4</em>折</span></p></a><a href="http://fundact.eastmoney.com/fundinfo/index.html?fund=519165&spm=xlb&spm=xlb" class="adbuy">立即购买</a></div><div class="rfund"><a hidefocus="true" class="a-wrapper" href="http://fundact.eastmoney.com/fundinfo/index.html?fund=000574&spm=xlb&spm=xlb"><p class="t1">宝盈新价值混合</p><p class="t2">近6月收益率高达</p><p class="t3"><span class="t3l">72.</span><span class="t3r">16%</span></p><span class="dot"></span><p class="t4"><span class="adfl">费率<em>4</em>折</span></p></a><a href="http://fundact.eastmoney.com/fundinfo/index.html?fund=000574&spm=xlb&spm=xlb" class="adbuy">立即购买</a></div><div class="rfund"><a hidefocus="true" class="a-wrapper" href="http://fundact.eastmoney.com/fundinfo/index.html?fund=000524&spm=xlb&spm=xlb"><p class="t1">上投摩根民生需求</p><p class="t2">近6月收益率高达</p><p class="t3"><span class="t3l">71.</span><span class="t3r">75%</span></p><span class="dot"></span><p class="t4"><span class="adfl">费率<em>4</em>折</span></p></a><a href="http://fundact.eastmoney.com/fundinfo/index.html?fund=000524&spm=xlb&spm=xlb" class="adbuy">立即购买</a></div><div class="rfund"><a hidefocus="true" class="a-wrapper" href="http://fundact.eastmoney.com/fundinfo/index.html?fund=470009&spm=xlb&spm=xlb"><p class="t1">汇添富民营活力</p><p class="t2">近6月收益率高达</p><p class="t3"><span class="t3l">71.</span><span class="t3r">59%</span></p><span class="dot"></span><p class="t4"><span class="adfl">费率<em>4</em>折</span></p></a><a href="http://fundact.eastmoney.com/fundinfo/index.html?fund=470009&spm=xlb&spm=xlb" class="adbuy">立即购买</a></div></div></div><div class="sanbaoBox sanbao sanbao1">
                                        <a target="_blank" href="http://simubao.1234567.com.cn/?spm=001.m.058"><div class="Header newfund">私募宝</div></a>
                                        <div class="sanbaolink"><a target="_blank" href="http://simubao.1234567.com.cn/?spm=001.m.058">顶尖私募理财集结号></a></div>
                                    </div>
                                    <div class="sanbaoBox sanbao">
                                        <a target="_blank" href="http://fundact.eastmoney.com/2015/xfjj/?spm=001.m.058"><div class="Header newfund">抢购新基</div></a>
                                        <div class="sanbaolink"><a target="_blank" href="http://fundact.eastmoney.com/2015/xfjj/?spm=001.m.058">牛市必看的新发基金></a></div>
                                    </div>
                                    <div class="sanbaoBox sanbao">
                                        <a target="_blank" href="https://zhongcaisuo.eastmoney.com/index.html?spm=001.m.05"><div class="Header newfund">中财所</div></a>
                                        <div class="sanbaolink"><a target="_blank" href="https://zhongcaisuo.eastmoney.com/index.html?spm=001.m.05">稀缺高收益理财产品></a></div>
                                    </div></div>
<div id="BottomSwith" style="display:none;">
    <div class="switchCenter" id="switchCenter" >
    <ul>    
<li class="s_left"><a id="switchBtmType" href="http://fund.eastmoney.com/trade">基金涨幅榜</a></li>
    <li class="s_middle"><a href="/"><p class="fname">---</p><p><span>近1月</span><span class="syl">-</span></p></a><a href="/" class="bottombuy">购买</a></li>
    <li class="s_middle"><a href="/"><p class="fname">---</p><p><span>近3月</span><span class="syl">-</span></p></a><a href="/" class="bottombuy">购买</a></li>
    <li class="s_middle"><a href="/"><p class="fname">---</p><p><span>近6月</span><span class="syl">-</span></p></a><a href="/" class="bottombuy">购买</a></li>
    <li class="s_middle"><a href="/"><p class="fname">---</p><p><span>近1年</span><span class="syl">-</span></p></a><a href="/" class="bottombuy">购买</a></li>
    <li class="s_middle last"><a href="/"><p class="fname">---</p><p><span>近3年</span><span class="syl">-</span></p></a><a href="/" class="bottombuy">购买</a></li>
    <li class="s_right"><a href="javascript:void(0);" id="switch" title="换一换"></a><a href="javascript:void(0);" class="sclose" title="关闭" id="s_close"></a></li>
    </ul>
    <iframe frameborder="0" scrolling="no" style="position:absolute;top:0px; left:0px;display:block;width:1000px;height:40px;z-index:-1;border:none;"></iframe>  
    </div>  
</div>
<div id="referAdDiv" class="referAdDiv" style="display:none;">
    
    <a id="referAd" class="referAd"  >
        <div id="referAdSyl" class="referAdSyl">158%</div>
        <div id="referAdClose" class="referAdClose"></div>
    </a>
</div>
<script type="text/javascript" src="http://j5.dfcfw.com/js/pinzhong/base_20130713161320.js"></script>
<script type="text/javascript" src="http://j5.dfcfw.com/js/pinzhong/amcharts_20140422171534.js"></script>
<script type="text/javascript" src="http://j5.dfcfw.com/js/pinzhong/myAmcharts_20141210144532.js"></script>
<script type="text/javascript" src="http://fund.eastmoney.com/js/fundcode_search.js"></script>
<script type="text/javascript" src="http://j5.dfcfw.com/libs/js/counter.js"></script>
<script type="text/javascript" src="http://j5.dfcfw.com/js/pinzhong/pzdefault_20150717152448.js"></script>
<script type="text/javascript" src="http://j5.dfcfw.com/js/pinzhong/fundsuggest_20141204093057.js"></script>
<script type="text/javascript" src="http://j5.dfcfw.com/j1/js/hq-fund.js"></script>
<script type="text/javascript" src="http://j5.dfcfw.com/js/pinzhong/swfobject2011_20130713161353.js"></script>
<script type="text/javascript" src="http://j5.dfcfw.com/js/pinzhong/onlinekf_20150717111406.js"></script>
<script type="text/javascript" src="http://j5.dfcfw.com/js/pinzhong/getcookies_pz_20141229095101.js"></script>
<script type="text/javascript">
if (returnvisit != null && returnvisit != "") { document.getElementById("visitfund").innerHTML = returnvisit; }
var _fcode = '150210';
bindPageEvent();
var t = window.location.hash;
if (t != null && t != "") {
if (t == "gz") {location.href = "#gz";}
if (t == "jz") {location.href = "#jz";}
if (t == "pm") {location.href = "#pm";}
}
var fs = new fundSuggest("search_content", { data: r, buy: "", autoSubmit: true });
var fs1 = new fundSuggestFix("fix_search", { data: r, buy: "", autoSubmit: true });
var swithSameType = [['100060_富国高新技术产业混合_21.22','000794_宝盈睿丰创新混合A_12.69','000215_广发趋势优选灵活配置_8.11','000916_前海开源股息率100_7.65','000796_宝盈睿丰创新混合C_6.58'],['000663_国投瑞银美丽中国混合_45.63','000739_平安大华新鑫先锋A_44.24','519156_新华行业灵活配置_32.46','000063_长盛电子信息主题灵活_31.95','519113_浦银精致生活_31.10'],['100056_富国低碳环保_93.76','000663_国投瑞银美丽中国混合_92.62','519113_浦银精致生活_81.16','519120_浦银战略新兴产业混合_80.36','519156_新华行业灵活配置_77.87'],['100056_富国低碳环保_169.75','460005_华泰柏瑞价值增长股票_154.87','000124_华宝服务优选混合_149.87','762001_国金通用国鑫发起_146.03','000574_宝盈新价值混合_144.52'],['590008_中邮战略新兴产业_414.81','470009_汇添富民营活力_279.99','213006_宝盈核心优势混合A_260.37','630010_华商价值精选_257.15','213008_宝盈资源优选_252.01']];
</script>
<script type="text/javascript" src="http://fund.eastmoney.com/js/setcookies.js"></script>
<script type="text/javascript">_cpyno = "c1"</script>
<script type="text/javascript" src="http://j5.dfcfw.com/js/data/ddmap_20130617165355.js?mt=fundinfo&odds=20"></script>
<script type="text/javascript" src='http://same.eastmoney.com/s?z=eastmoney&c=1122'></script>
<script type="text/javascript" src="http://j5.dfcfw.com/js/pinzhong/promotion_20150615190458.js"></script>  
<script type="text/javascript">
    function  referAdSyl(data){
        for(i=0;i<data.length;i++){
            $("referAdSyl").innerHTML= data[i].SYL_1N.toString().substring(0,3)+"%";
        }
    }
</script>
<script type="text/javascript" src="http://fund.eastmoney.com/api/static/referAdSyl.js"></script>
</body>    
</html>


