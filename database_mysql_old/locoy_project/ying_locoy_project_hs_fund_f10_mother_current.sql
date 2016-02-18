ying locoy project hs_fund_f10_mother

Steps:
1. change hs_fund_f10_mother
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

http://fund.eastmoney.com/f10/jbgk_150210.html	
	
【code】：150210
【jjjz_forecast】：0.6258
【chgrate_jjjz_forecast】：-2.98
【jjjz】：0.6270
【date_jjjz】：2015-07-24
【chgrate_jjjz】：-2.79
【mother】：161026
【mktcap】：132.1331
【date_mktcap】：2015-07-23
【ltsz】：560.44
【date_ltsz】：2015-06-30
【index_target】：中证国有企业改革
【name_full】：富国中证国有企业改革指数分级证券投资基金
【name】：富国中证国企改革指数分级B 
【cat】：分级杠杆
【date_start】：2014-12-17
【mktcap_start】：58.053
【fund_managing_company】：富国基金
【fund_company_url】：http://fund.eastmoney.com/company/80000221.html
【fund_manager】：王保合|张圣贤|王保合|张圣贤
【convert_fixed】：每年12月15日(若该日为非工作日,则提前至该日之前的最后一个工作日)。
【convert_conditional】：当富国国企改革份额的基金份额净值高至 1.500 元或以上;当富国国企改革B份额的基金份额参考净值低至 0.250 元或以下。
【return_fixed】：同期银行人民币一年期定期存款利率(税后)+3%;

DROP TABLE `hs_fund_f10_mother`;
CREATE TABLE `hs_fund_f10_mother` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL COMMENT 'code',
  `jjjz_forecast` decimal(7,4) unsigned DEFAULT NULL COMMENT 'jjjz_forecast',
  `chgrate_jjjz_forecast` decimal(5,2) DEFAULT NULL COMMENT 'chgrate_jjjz_forecast',
  `jjjz` decimal(7,4) unsigned DEFAULT NULL COMMENT 'jjjz',
  `date_jjjz` date DEFAULT NULL COMMENT 'date_jjjz',
  `chgrate_jjjz` decimal(5,2) DEFAULT NULL COMMENT 'chgrate_jjjz',
  `mother` varchar(6) DEFAULT NULL COMMENT 'mother',
  `mktcap` decimal(8,4) unsigned DEFAULT NULL COMMENT 'mktcap',
  `date_mktcap` date DEFAULT NULL COMMENT 'date_mktcap',
  `ltsz` decimal(7,2) DEFAULT NULL COMMENT 'ltsz',
  `date_ltsz` date DEFAULT NULL COMMENT 'date_ltsz',
  `index_target` varchar(28) DEFAULT NULL COMMENT 'index_target',
  `name_full` varchar(38) DEFAULT NULL COMMENT 'name_full',
  `name` varchar(28) DEFAULT NULL COMMENT 'name',
  `cat` varchar(18) DEFAULT NULL COMMENT 'cat',
  `date_start` date DEFAULT NULL COMMENT 'date_start',
  `mktcap_start` decimal(8,4) unsigned DEFAULT NULL COMMENT 'mktcap_start',
  `fund_managing_company` varchar(18) DEFAULT NULL COMMENT 'fund_managing_company',
  `fund_company_url` varchar(58) DEFAULT NULL COMMENT 'fund_company_url',
  `fund_manager` varchar(38) DEFAULT NULL COMMENT 'fund_manager',
  `convert_fixed` varchar(58) DEFAULT NULL COMMENT 'convert_fixed',
  `convert_conditional` varchar(98) DEFAULT NULL COMMENT 'convert_conditional',
  `return_fixed` varchar(38) DEFAULT NULL COMMENT 'return_fixed',
  `TimeSys` time DEFAULT NULL COMMENT 'TimeSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP PROCEDURE `ying`.`hs_fund_f10_mother`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_fund_f10_mother`(IN code VARCHAR(18), jjjz_forecast VARCHAR(18), chgrate_jjjz_forecast VARCHAR(18), jjjz VARCHAR(18), date_jjjz VARCHAR(18), chgrate_jjjz VARCHAR(18), mother VARCHAR(18), mktcap VARCHAR(18), date_mktcap VARCHAR(18), ltsz VARCHAR(18), date_ltsz VARCHAR(18), index_target VARCHAR(28),name_full VARCHAR(18), name VARCHAR(28), cat VARCHAR(18), date_start VARCHAR(18), mktcap_start VARCHAR(18), fund_managing_company VARCHAR(18), fund_company_url VARCHAR(58), fund_manager VARCHAR(38), convert_fixed VARCHAR(58), convert_conditional VARCHAR(98), return_fixed VARCHAR(18), TimeSys TIME)
BEGIN
SET code = IF(code = '', NULL, code);
SET jjjz_forecast = IF(jjjz_forecast = '', NULL, jjjz_forecast);
SET chgrate_jjjz_forecast = IF(chgrate_jjjz_forecast = '', NULL, chgrate_jjjz_forecast);
SET jjjz = IF(jjjz = '', NULL, jjjz);
SET date_jjjz = IF(date_jjjz = '', NULL, date_jjjz);
SET chgrate_jjjz = IF(chgrate_jjjz = '', NULL, chgrate_jjjz);
SET mother = IF(mother = '', NULL, mother);
SET mktcap = IF(mktcap = '', NULL, mktcap);
SET date_mktcap = IF(date_mktcap = '', NULL, date_mktcap);
SET ltsz = IF(ltsz = '', NULL, ltsz);
SET date_ltsz = IF(date_ltsz = '', NULL, date_ltsz);
SET index_target = IF(index_target = '', NULL, index_target);
SET name_full = IF(name_full = '', NULL, name_full);
SET name = IF(name = '', NULL, name);
SET cat = IF(cat = '', NULL, cat);
SET date_start = IF(date_start = '', NULL, date_start);
SET mktcap_start = IF(mktcap_start = '', NULL, mktcap_start);
SET fund_managing_company = IF(fund_managing_company = '', NULL, fund_managing_company);
SET fund_company_url = IF(fund_company_url = '', NULL, fund_company_url);
SET fund_manager = IF(fund_manager = '', NULL, fund_manager);
SET convert_fixed = IF(convert_fixed = '', NULL, convert_fixed);
SET convert_conditional = IF(convert_conditional = '', NULL, convert_conditional);
SET return_fixed = IF(return_fixed = '', NULL, return_fixed);
SET TimeSys = CURTIME();

INSERT INTO `hs_fund_f10_mother` (`code`, `jjjz_forecast`, `chgrate_jjjz_forecast`, `jjjz`, `date_jjjz`, `chgrate_jjjz`, `mother`, `mktcap`, `date_mktcap`, `ltsz`, `date_ltsz`, `index_target`, `name_full`, `name`, `cat`, `date_start`, `mktcap_start`, `fund_managing_company`, `fund_company_url`, `fund_manager`, `convert_fixed`, `convert_conditional`, `return_fixed`, `TimeSys`) VALUES (code, jjjz_forecast, chgrate_jjjz_forecast, jjjz, date_jjjz, chgrate_jjjz, mother, mktcap, date_mktcap, ltsz, date_ltsz, index_target, name_full, name, cat, date_start, mktcap_start, fund_managing_company, fund_company_url, fund_manager, convert_fixed, convert_conditional, return_fixed, TimeSys) 
ON DUPLICATE KEY UPDate 
`code` = IF(code IS NULL, `code`, code),
`jjjz_forecast` = IF(jjjz_forecast IS NULL, `jjjz_forecast`, jjjz_forecast),
`chgrate_jjjz_forecast` = IF(chgrate_jjjz_forecast IS NULL, `chgrate_jjjz_forecast`, chgrate_jjjz_forecast),
`jjjz` = IF(jjjz IS NULL, `jjjz`, jjjz),
`date_jjjz` = IF(date_jjjz IS NULL, `date_jjjz`, date_jjjz),
`chgrate_jjjz` = IF(chgrate_jjjz IS NULL, `chgrate_jjjz`, chgrate_jjjz),
`mother` = IF(mother IS NULL, `mother`, mother),
`mktcap` = IF(mktcap IS NULL, `mktcap`, mktcap),
`date_mktcap` = IF(date_mktcap IS NULL, `date_mktcap`, date_mktcap),
`ltsz` = IF(ltsz IS NULL, `ltsz`, ltsz),
`date_ltsz` = IF(date_ltsz IS NULL, `date_ltsz`, date_ltsz),
`index_target` = IF(index_target IS NULL, `index_target`, index_target),
`name_full` = IF(name_full IS NULL, `name_full`, name_full),
`name` = IF(name IS NULL, `name`, name),
`cat` = IF(cat IS NULL, `cat`, cat),
`date_start` = IF(date_start IS NULL, `date_start`, date_start),
`mktcap_start` = IF(mktcap_start IS NULL, `mktcap_start`, mktcap_start),
`fund_managing_company` = IF(fund_managing_company IS NULL, `fund_managing_company`, fund_managing_company),
`fund_company_url` = IF(fund_company_url IS NULL, `fund_company_url`, fund_company_url),
`fund_manager` = IF(fund_manager IS NULL, `fund_manager`, fund_manager),
`convert_fixed` = IF(convert_fixed IS NULL, `convert_fixed`, convert_fixed),
`convert_conditional` = IF(convert_conditional IS NULL, `convert_conditional`, convert_conditional),
`return_fixed` = IF(return_fixed IS NULL, `return_fixed`, return_fixed),
`TimeSys` = TimeSys;
END$$
DELIMITER ;

CALL hs_fund_f10_mother('[标签:code]','[标签:jjjz_forecast]','[标签:chgrate_jjjz_forecast]','[标签:jjjz]','[标签:date_jjjz]','[标签:chgrate_jjjz]','[标签:mother]','[标签:mktcap]','[标签:date_mktcap]','[标签:ltsz]','[标签:date_ltsz]','[标签:index_target]', '[标签:name_full]','[标签:name]','[标签:cat]','[标签:date_start]','[标签:mktcap_start]','[标签:fund_managing_company]','[标签:fund_company_url]','[标签:fund_manager]','[标签:convert_fixed]','[标签:convert_conditional]','[标签:return_fixed]', '')

original field name		name of gxh		Chinese
code					code			证券代码
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>富国中证国企改革指数分级B (150210)基金基本概况 _ 基金档案 _ 天天基金网</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="Content-Language" content="zh-CN" /> 
    <meta http-equiv="x-ua-compatible" content="ie=7" /> 
    <meta http-equiv="Cache-Control" content="no-cache" /> 
    <meta name="keywords" content="富国中证国企改革指数分级B ,150210,基金,基金档案,F10,基本概况,天天基金网,fund,1234567" />
    <meta name="description" content="东方财富网(www.eastmoney.com)旗下基金平台——天天基金网(fund.eastmoney.com)提供富国中证国企改革指数分级B (150210)最新的基金档案信息，富国中证国企改革指数分级B (150210)基金的基本概况信息。" />
    <link href="http://j5.dfcfw.com/css/f10/common_20140422170235.css" rel="stylesheet" type="text/css" />
    <link href="http://j5.dfcfw.com/css/f10/ucbody_20140423141904.css" rel="stylesheet" type="text/css" />
    <script src="http://j5.dfcfw.com/j1/js/embasef10.js?v=20111103.js" type="text/javascript"></script>
    <script src="http://j5.dfcfw.com/j1/js/hq-fund.js?v=20120615.js" type="text/javascript"></script>
    <script src="http://fund.eastmoney.com/js/fundcode_search.js"  type="text/javascript" ></script>
    <script src="http://j5.dfcfw.com/js/pinzhong/fundsuggest_20140226151254.js" type="text/javascript"></script>
    <script src="http://j5.dfcfw.com/js/f10/f10_20140314135050.js" type="text/javascript"></script>
    <base target="_blank" />
</head>
<body><div id="bodydiv">

<div class="mainFrame">
<div class="space6"></div>
<div class="fund_top_text">
<div class="top_weblink">
<b class="L"></b>
<a href="http://www.eastmoney.com">返回东方财富网首页</a>
<b class="SL"></b>
<a href="http://fund.eastmoney.com"><span class="red">基金首页</span></a>
<b class="SL"></b>
<a href="http://finance.eastmoney.com/">财经</a>
<b class="SL"></b>
<a href="http://stock.eastmoney.com">股票</a>
<b class="SL"></b>
<a href="http://gzqh.eastmoney.com/">期指</a>
<b class="SL"></b>
<a href="http://stock.eastmoney.com/cytz/chuangyeban.html">创业板</a>
<b class="SL"></b>
<a href="http://quote.eastmoney.com">行情</a>
<b class="SL"></b>
<a href="http://data.eastmoney.com">数据</a>
<b class="SL"></b>
<a href="http://stock.eastmoney.com/global.html">全球</a>
<b class="SL"></b>
<a href="http://hk.eastmoney.com/">港股</a>
<b class="SL"></b>
<a href="http://forex.eastmoney.com">外汇</a>
<b class="SL"></b>
<a href="http://futures.eastmoney.com/">期货</a>
<b class="SL"></b>
<a href="http://gold.eastmoney.com/">黄金</a>
<b class="SL"></b>
<a href="http://money.eastmoney.com/">理财</a>
<b class="SL"></b>
<a href="http://bank.eastmoney.com">银行</a>
<b class="SL"></b>
<a href="http://insurance.eastmoney.com">保险</a>
<b class="SL"></b>
<a href="http://bond.eastmoney.com/">债券</a>
<b class="SL"></b>
<a href="http://guba.eastmoney.com">股吧</a>
<b class="SL"></b>
<a href="http://blog.eastmoney.com/">博客</a>
<b class="SL"></b>
<a href="http://t.eastmoney.com/">财迷</a>
<b class="SL"></b>
<a href="http://video.eastmoney.com/">视频</a>
</div>
</div>
</div>    
  
<div class="mainFrame">
<div class="space6"></div>
<div class="lgbar">
<div class="flogo">
<a href="http://fund.eastmoney.com/"><img src="http://j5.dfcfw.com/j1/images/fund1234567.gif" alt="天天基金网" /></a>
<a href="http://fund.eastmoney.com/f10/" id="f10_head_fundlogo" title="基金档案主页"><img src='http://j5.dfcfw.com/j1/images/fundlogo_jjda.gif' /></a>
</div>
  <div class="expand left"><span><b class="ico jy"></b><a href="http://js1.eastmoney.com/tg.aspx?ID=1207">基金交易</a></span><span><b class="ico cs"></b><a href="http://js1.eastmoney.com/tg.aspx?ID=1208">基金超市</a></span></div>
<div class="sform">
<div id="fundSuggest" class="suggest hide"></div>
<div>
<span class="sinput">
<input type="text" value="输入代码、拼音或简称" id="search_content" name="search_content" class="gray" autocomplete="off" /><b class="cx" id="droplist"></b>
</span>
<span><b class="hq" onclick="fdhq.toHQ('search_content')"></b></span>
<span><b class="jb" onclick="fdhq.toBA('search_content')"></b></span>
<span><a href="http://fund.eastmoney.com/allfund.html" class="line">基金代码查询</a></span>
<span><b class="sc" onclick="fdhq.addFavor()" title="加入收藏"></b></span>
</div>
<script type="text/javascript">
    //var fs = new fundSuggest("search_content");
    var fs = new fundSuggest("search_content", { data: r, buy: "", autoSubmit: true });
</script>
</div>
<div class="space0"></div>
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
</div>

<div class="mainFrame">
<div class="space6"></div>
<div class="fund_quote">
<div><iframe marginheight='0' marginwidth='0' frameborder='0' width='998' height='30' scrolling='no' src='http://fund.eastmoney.com/fund_favor_quote2_beta.html'></iframe></div>
</div>
</div>

<div class="mainFrame">
<div class="space6"></div>
<div><iframe marginheight='0' marginwidth='0' frameborder='0' width='1000' height="60" scrolling='no' src='http://fund.eastmoney.com/trade/hqb_hq.html?spm=001001.sbb'></iframe></div>
</div>


<div class="mainFrame">
<div class="space6"></div>
<div class="map_banner">
<div class="left">
<a href="http://fund.eastmoney.com/" class="map">天天基金网</a>&nbsp;>&nbsp;<a href="http://fund.eastmoney.com/f10/">基金档案</a>&nbsp;>&nbsp;富国中证国企改革指数分级B 
</div>
<div class="right" id="visitfund"></div>
</div>
</div>
<script type="text/javascript" src="http://j5.dfcfw.com/js/pinzhong/getcookies_20140928104112.js"></script>
<script type="text/javascript">
    if (returnvisit != null && returnvisit != "") { document.getElementById("visitfund").innerHTML = returnvisit; }
</script>


<div class="mainFrame">
<div class="space6"></div>
<div class="l_menu left">

<h3></h3>
<div class="lm_out">
<div class="lm_in" id="dlcontent">
<div class="backpz"><a class="red" href="http://fund.eastmoney.com/150210.html">返回基金品种页</a></div>
<dl>
<dt><span>基本资料</span><b class="ico pinch"></b></dt>
<dd id="f10_menu_jjgk" class="at"><a href="jbgk_150210.html" target="_self">基本概况</a></dd>
<dd id="f10_menu_jjjl"><a href="jjjl_150210.html" target="_self">基金经理</a></dd>
<dd id="f10_menu_jjgs"><a href="http://fund.eastmoney.com/company/80000221.html" target="_blank">基金公司</a></dd>
<dd id="f10_menu_jjpj" class="nb"><a href="jjpj_150210.html" target="_self">基金评级</a></dd>
</dl>
<dl>
<dt><span>净值回报</span><b class="ico pinch"></b></dt>
<dd id="f10_menu_lsjz"><a href="jjjz_150210.html" target="_self">历史净值</a><b class="ico hot"></b></dd>
<dd id="f10_menu_fhsp"><a href="fhsp_150210.html" target="_self">分红送配</a></dd>
<dd id="f10_menu_jdzf"><a href="jdzf_150210.html" target="_self">阶段涨幅</a></dd>
<dd id="f10_menu_jndzf" class="nb"><a href="jndzf_150210.html" target="_self">季/年度涨幅</a></dd>
</dl>
<dl>
<dt><span>投资组合</span><b class="ico pinch"></b></dt>
<dd id="f10_menu_jjcc"><a href="ccmx_150210.html" target="_self">基金持仓</a></dd>
<dd id="f10_menu_zqcc"><a href="ccmx1_150210.html" target="_self">债券持仓</a></dd>
<dd id="f10_menu_hypz"><a href="hytz_150210.html" target="_self">行业配置</a></dd>
    <dd id="f10_menu_hypzsy"><a href="hypzsy_150210.html" target="_self">行业配置比较</a></dd>
<dd id="f10_menu_zcpz"><a href="zcpz_150210.html" target="_self">资产配置</a></dd>
<dd id="f10_menu_zdbd" class="nb"><a href="ccbd_150210.html" target="_self">重大变动</a></dd>
</dl>
<dl>
<dt><span>规模份额</span><b class="ico pinch"></b></dt>
<dd id="f10_menu_gmbd"><a href="gmbd_150210.html" target="_self">规模变动</a></dd>
<dd id="f10_menu_cyrjg" class="nb"><a href="cyrjg_150210.html" target="_self">持有人结构</a></dd>
</dl>
<dl>
<dt><span>基金公告</span><b class="ico pinch"></b></dt>
<dd id="f10_menu_jjgg"><a href="jjgg_150210.html" target="_self">全部公告</a></dd>
<dd id="f10_menu_fxyz"><a href="jjgg_150210_1.html" target="_self">发行运作</a></dd>
<dd id="f10_menu_fhgg"><a href="jjgg_150210_2.html" target="_self">分红公告</a></dd>
<dd id="f10_menu_dqbg"><a href="jjgg_150210_3.html" target="_self">定期报告</a></dd>
<dd id="f10_menu_rstz"><a href="jjgg_150210_4.html" target="_self">人事调整</a></dd>
<dd id="f10_menu_jjxs"><a href="jjgg_150210_5.html" target="_self">基金销售</a></dd>
<dd id="f10_menu_qtgg" class="nb"><a href="jjgg_150210_6.html" target="_self">其他公告</a></dd>
</dl>
<dl>
<dt><span>财务报表</span><b class="ico pinch"></b></dt>
<dd id="f10_menu_cwzb"><a href="cwzb_150210.html" target="_self">财务指标</a></dd>
<dd id="f10_menu_fzb"><a href="zcfzb_150210.html" target="_self">资产负债表</a></dd>
<dd id="f10_menu_lrb"><a href="lrfpb_150210.html" target="_self">利润表</a></dd>

<dd id="f10_menu_srfx"><a href="srfx_150210.html" target="_self">收入分析</a></dd>
<dd id="f10_menu_fyfx" class="nb"><a href="fyfx_150210.html" target="_self">费用分析</a></dd>
</dl>
<dl>
<dt><span>销售信息</span><b class="ico pinch"></b></dt>
<dd id="f10_menu_jjfl"><a href="jjfl_150210.html" target="_self">购买信息（费率表）</a></dd>
<dd id="f10_menu_jjzh"><a href="jjzh_150210.html" target="_self">基金转换</a></dd>

</dl>
</div>
</div>
<div class="space6"></div>
<h3 class="rel"><a href="http://fund.eastmoney.com/company/80000221.html"></a></h3>
<div class="lm_out relout">
<div class="lm_in relin">
<ul id='scompany'><li><b class="ico trig"></b><a title='富国富钱包货币' href="jbgk_000638.html">富国富钱包货币</a></li><li><b class="ico trig"></b><a title='富国天时货币B' href="jbgk_100028.html">富国天时货币B</a></li><li><b class="ico trig"></b><a title='富国天时货币C' href="jbgk_000862.html">富国天时货币C</a></li><li><b class="ico trig"></b><a title='富国天时货币A' href="jbgk_100025.html">富国天时货币A</a></li><li><b class="ico trig"></b><a title='富国天时货币D' href="jbgk_000863.html">富国天时货币D</a></li><li><b class="ico trig"></b><a title='富国收益宝货币' href="jbgk_000602.html">富国收益宝货币</a></li></ul><ul class="more"><li><a href="http://fund.eastmoney.com/company/80000221.html">查看旗下全部基金>></a></li></ul>
<script type="text/javascript">
    dtClickEvent();
    /* 公司同系基金 */
    (function sameCompanyEvent() {
        var as = $("scompany").getElementsByTagName("a");
        var _ov = function (e) {
            var eO = $E(e);
            eO.parentNode.className = "at";
        }
        var _ou = function (e) {
            var eO = $E(e);
            eO.parentNode.className = "";
        }
        for (var i = 0; i < as.length; i++) {
            $aE(as[i], "mouseover", _ov, true);
            $aE(as[i], "mouseout", _ou, true);
        }
    })();
</script>
</div>
</div>
</div>
<div class="r_cont right">
<!-- 正文部份开始 -->

<div class="basic">
<div class="bs_jz"><div class="space0"></div><p class="left"><label class="lar bold"><a title='富国中证国企改革指数分级B ' href="http://fund.eastmoney.com/150210.html">富国中证国企改革指</a>（<a href="http://fund.eastmoney.com/150210.html">150210</a>）</label><label>盘中估算：<span id="gsz" class="grn lar bold">0.6258</span><span id="gszf" class="grn lar bold lv asc">-2.98%</span></label><label>单位净值（<span>07-24</span>）：<span class="grn lar bold">0.6270（-2.79%）</span></label></p><p class="right"><input type="button" onclick="window.open('http://fund.eastmoney.com/data/favorapi.aspx?c=150210')" /><input type="button" class="unbuy"  title="您所选购的基金暂未开通购买"/></p></div><div class="bs_gl"><div class="space0"></div><p><label>成立日期：<span>2014-12-17</span></label><label>基金经理：&nbsp;&nbsp;<a href="http://fund.eastmoney.com/manager/30069488.html">王保合</a>&nbsp;&nbsp;<a href="http://fund.eastmoney.com/manager/30072302.html">张圣贤</a></label><label>类型：<span>其他（分级）</span></label><label>管理人：<a href="http://fund.eastmoney.com/company/80000221.html">富国基金</a></label><label>资产规模：<span>560.44亿元（截止至：06-30）</span></label></p></div>
<div class="bs_lj">
<div class="space0"></div>
<a href="jbgk_150210.html" class="one" target="_self">基本概况</a>
<a href="jjjz_150210.html" target="_self">历史净值</a>
<a href="fhsp_150210.html" target="_self">分红送配</a>
<a href="ccmx_150210.html" target="_self">基金持仓</a>
<a href="gmbd_150210.html" target="_self">规模变动</a>
<a href="cyrjg_150210.html" target="_self">持有人结构</a>
<a href="jjfl_150210.html" target="_self">购买信息</a>

</div>
</div>
<script type="text/javascript">
    setInterval(function () {
        var today = new Date();
        if (today.getDay() > 0 && today.getDay() < 6) {
            if (today.getHours() >= 9 && today.getHours() < 12) {
                reGetGZ('150210');
            }
            else if (today.getHours() >= 13 && today.getHours() < 15) {
                reGetGZ('150210');
            }
            else {
            }
        }

    }, 45000);
</script>
<div class="detail">
<div class="space8"></div>
<div class="tit_h3">
<div class="space0"></div>
<h1 class="left">
<a class="tit" href="jbgk_150210.html">基本概况</a><b class="ico arrow"></b>
</h1>
<p class="right">
<label>其他基金基本概况查询：</label><select id="jjlist"></select>
</p>

 

</div>
<div class="txt_cont">
<div class="txt_in">
<div class="box">
<table class="info w790"><tr><th>基金全称</th><td style='width:300px;padding-right:10px;'>富国中证国有企业改革指数分级证券投资基金</td><th>基金简称</th><td>富国中证国企改革指数分级B </td></tr><tr><th>基金代码</th><td>150210（主代码）<th>基金类型</th><td>分级杠杆</td></tr><tr><th>发行日期</th><td>2014年11月28日</td><th>成立日期/规模</th><td>2014年12月17日 / 58.053亿份</td></tr><tr><th>资产规模</th><td>560.44亿元（截止至：2015年06月30日）<th>份额规模</th><td><a href="gmbd_150210.html">132.1331亿份</a>（截止至：2015年07月23日）</td></tr><tr><th>基金管理人</th><td><a href="http://fund.eastmoney.com/company/80000221.html">富国基金</a></td><th>基金托管人</th><td><a href="http://fund.eastmoney.com/bank/80001120.html">农业银行</a></td></tr><tr><th>基金经理人</th><td><a href="http://fund.eastmoney.com/manager/30069488.html">王保合</a>、<a href="http://fund.eastmoney.com/manager/30072302.html">张圣贤</a></td><th>成立来分红</th><td><a href="fhsp_150210.html">每份累计0.00元（0次）</a></td></tr><tr><th>管理费率</th><td>1.00%（每年）</td><th>托管费率</th><td>0.22%（每年）</td></tr><tr><th>销售服务费率</th><td>---（每年）</td><th>最高认购费率</th><td>---（前端）</td></tr><tr><th>最高申购费率</th><td>---（前端）</td><th>最高赎回费率</th><td>---（前端）</td></tr><tr><th>业绩比较基准</th><td  style="width:300px">95%×中证国有企业改革指数收益率+5%×银行人民币活期存款利率(税后)</td><th>跟踪标的</th><td>中证国有企业改革指数</td></tr></table>
<div class="tfoot">
<font class="px14">基金管理费和托管费直接从基金产品中扣除，具体计算方法及费率结构请参见<a href="http://fund.eastmoney.com/f10/jjgg_150210_1.html">基金《招募说明书》</a></font>
</div>
</div>


<div class="box"><div class="boxitem w790"><h4 class="t"><label class="left">基金分级信息</label><label class="right"></label></h4><div class="space0"></div></div><table class="info w790" style="margin-top:5px;"><tbody><tr><th style="width:165px;">母子基金</th><td style="width:330px;">161026（母）150209 150210（子）</td><th style="width:100px;">是否配对转换</th><td>是</td></tr><tr><th style="width:165px;">是否转LOF</th><td>否</td><th style="width:100px;">封闭期</th><td>无</td></tr><tr><th style="width:165px;">提前结束条款</th><td colspan="3">无</td></tr></tbody></table><table class="info w790" style="margin-top:5px;"><tbody><tr><th style="width:165px;">定期折算日</th><td colspan="3">每年12月15日(若该日为非工作日,则提前至该日之前的最后一个工作日)。</td></tr><tr><th style="width:165px;">不定期折算条件</th><td colspan="3">当富国国企改革份额的基金份额净值高至 1.500 元或以上;当富国国企改革B份额的基金份额参考净值低至 0.250 元或以下。 </td></tr></tbody></table><table class="info w790" style="margin-top:5px;"><tbody><tr><th style="width:165px;">固定收益份额年化收益率</th><td colspan="3">同期银行人民币一年期定期存款利率(税后)+3%</td></tr><tr><th style="width:165px;">亏损临界点</th><td colspan="3">无</td></tr><tr><th style="width:165px;">保收益临界点</th><td colspan="3">无</td></tr><tr><th style="width:165px;">超额收益临界点</th><td colspan="3">无</td></tr></tbody></table></div>

<div class="box">
<div class="boxitem w790">
<h4 class="t"><label class="left">投资目标</label><label class="right"></label></h4>
<div class="space0"></div>
<p>
暂无数据
</p>
</div>
</div>
<div class="box">
<div class="boxitem w790">
<h4 class="t"><label class="left">投资理念</label><label class="right"></label></h4>
<div class="space0"></div>
<p>
暂无数据
</p>
</div>
</div>
<div class="box">
<div class="boxitem w790">
<h4 class="t"><label class="left">投资范围</label><label class="right"></label></h4>
<div class="space0"></div>
<p>
暂无数据
</p>
</div>
</div>
<div class="box">
<div class="boxitem w790">
<h4 class="t"><label class="left">投资策略</label><label class="right"></label></h4>
<div class="space0"></div>
<p>
暂无数据
</p>
</div>
</div>
<div class="box">
<div class="boxitem w790">
<h4 class="t"><label class="left">分红政策</label><label class="right"></label></h4>
<div class="space0"></div>
<p>
暂无数据
</p>
</div>
</div>
<div class="box">
<div class="boxitem w790">
<h4 class="t"><label class="left">业绩比较基准</label><label class="right"></label></h4>
<div class="space0"></div>
<p>
暂无数据
</p>
</div>
</div>
<div class="box nb">
<div class="boxitem w790">
<h4 class="t"><label class="left">风险收益特征</label><label class="right"></label></h4>
<div class="space0"></div>
<p>
暂无数据
</p>
</div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
    LoadFundSelect("jjlist","jbgk");
    ChkSelectItem("jjlist","150210");
    //var module = "jbgk";
   // fundcodelist.load();
   // ChkSelectLiItem("150210");
</script>
<!-- 正文部份结束 -->
</div>
</div>

<div class="mainFrame">
<div class="space6"></div>

<div style="border:1px solid #CAC9C7;background: none no-repeat scroll 0px 0px #FFFAE0;margin:10px 0px 0px;padding: 5px;line-height: 2.0;text-align: left;color: #333333; font-size:12px;">
郑重声明：天天基金网发布此信息目的在于传播更多信息，与本网站立场无关。天天基金网不保证该信息（包括但不限于文字、数据及图表）全部或者部分内容的准确性、真实性、完整性、有效性、及时性、原创性等。相关信息并未经过本网站证实，不对您构成任何投资决策建议，据此操作，风险自担。
</div>
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
<script type="text/javascript">_cpyno = "c1"</script>
<script type="text/javascript" src="http://js4.eastmoney.com/counter.js?c=t"></script> 
 <script>
     var rightAd_bodywidth = 1000; //网页主体宽度
     var rightAd_fixedwidth = 150; //模块占用宽度,一般不变
     var rightAd_width = 135; //模块iframe实际宽度,一般不变
     var rightAd_height = 1741; //模块iframe实际高度,一般不变
     var rightAd_top = 50; //模块距顶部top值
     var rightAd_zindex = 0; //模块z-index值
     var rightAd_url = 'http://fund.eastmoney.com/trade/Hot_Em.html?spm=001001.rw'; //内嵌iframe的url
    </script>
    <script type="text/javascript" src="http://fund.eastmoney.com/js/rightAd.js"></script>
</div>
</body>
<!-- AdSame ShowCode: 东方财富网 / 基金档案 / 基金档案全屏 Begin -->
<script language="javascript" type="text/javascript" src="http://same.eastmoney.com/s?z=eastmoney&c=1127" ></script>
<!-- AdSame ShowCode: 东方财富网 / 基金档案 / 基金档案全屏 End -->
<script type="text/javascript" src="http://j5.dfcfw.com/js/f10/bd_f10_20140529160202.js"></script>
<script type="text/javascript" src="http://j5.dfcfw.com/libs/js/counter.js"></script>
</html>
