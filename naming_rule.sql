naming rule 

hs_s_rt_EM_get_sma to hs_s_rt_EM_get_smaClose 2015-10-14 9:19

in proc hs_s_rt_EM_get_smaClose
     close_tmp to cursor_fetch_tmp 2015-10-14 9:19
     stock_start_end_limit_cursor to cursor1 2015-10-14 9:20
     LOOP_close to cursor1_LOOP1 2015-10-14 9:20
    
in hs_s_rt_EM_get_smaClose_rt
     close_tmp to cursor_fetch_tmp 2015-10-14 9:20
     LOOP_close to cursor1_LOOP1 2015-10-14 9:20
     in_current_close to in_current_value 2015-10-14 9:20

naming of table, procedure, view, triger, and file name, 
	s    stock    default: cn
	i    index    default: cn

changes of field names
	code to idS (abrretion of idStock)
	
Naming traditions for field names of a table

original field name		name of gxh		Chinese
code/symbol/stock id	ids
datetime				dt (originally TimeSlot is used)
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
	



        
 
