naming rule 

-- to do list

	order by d	to	order by `d`
	name_index	to	name_i
		E:\user_tony\Documents\GitHub\ying\locoy\locoy_index_info.sql
		ALTER TABLE `ying`.`index_info` CHANGE COLUMN `name_index` `name_i` VARCHAR(18) NULL DEFAULT NULL COMMENT 'index name' ;
		ALTER TABLE `ying_calc`.`index_cons_stat_zd` CHANGE COLUMN `name_index` `name_i` VARCHAR(12) NOT NULL COMMENT '' ;

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
						
Calculate

英文简称 : CALC
中文全称 : vi. 计算, 预测, 依赖
所属分类 : 无
词条简介 : 无						
	
The following standard word abbreviations should be used in naming records, fields, and SQRs:
	
Word(s) 	Abbreviation 	Description
Abbreviate
Abbreviation 	ABRV 	
Academic 	ACAD 	
Accept
Acceptance
Accepted 	ACPT 	
Access 	ACCS 	
Accident 	ACDNT 	
Accomplish
Accomplishment
Accomplishments 	ACMP 	
Account* 	ACCT* 	
Accounting* 	ACCTG* 	
Accounts Payable
Advanced Placement 	AP 	
Accounts Receivable 	AR 	
Accredited 	ACRD 	
Accrual 	ACRL 	
Accumulated* 	ACCUM* 	
Accumulation
Accumulative 	ACUM 	
Achieve
Achievement 	ACHV 	
Acquisition* 	ACQ* 	
Act
Active
Activity
American College Test 	ACT 	
Action* 	ACTN* 	
Actual 	ACTL 	
Add
Added 	ADD 	
Additional* 	ADDL* 	
Address* 	ADDR* 	Narrative data which describes a person, place or things location
Ad hoc 	ADHC 	
Adjudicate
Adjudicated
Adjudication 	ADJD 	
Adjusted Gross Income 	AGI 	
Adjustment* 	ADJ* 	
Administered
Administrated
Administration 	ADM 	
Admissible
Admission 	ADMS 	
Admittance
Admitted 	ADMT 	
Advanced Placement
Accounts Payable 	AP 	
Advice 	ADVC 	
Affiliation 	AFFL 	
After 	AFT 	
Age 	AGE 	
Agency 	AGCY 	
Agent 	AGNT 	
Aid 	AID 	
Alien 	ALN 	
All 	ALL 	
Allocate
Allocation* 	ALLOC* 	
Alpha 	ALPH 	
Alter
Alternate 	ALT 	
Alumni
Alumnus 	ALMN 	
AM 	AM 	"Ante Meridiem" (morning)
American College Test
Act
Active
Activity 	ACT 	
Amount* 	AMT* 	Monetary value(s)
Analysis 	ANLS 	
Annual* 	ANNL* 	
Anonymous 	ANON 	
Answer 	ANS 	
Apartment 	APT 	
Appeal
Appealed 	APEL 	
Applicant* 	APP* 	
Application* 	APPL* 	
Appointment 	APPT 	
Approval
Approve 	APRV 	
Area 	AREA 	
Array 	ARAY 	
Arrears 	ARRS 	
Ascending 	ASC 	
Assign
Assigned
Assignment 	ASGN 	
Association 	ASSC 	
Assumption 	ASMP 	
Athlete
Athletic 	ATHL 	
Attach 	ATCH 	
Attempt 	ATMPT 	
Attend
Attendance 	ATND 	
Attention 	ATTN 	
Attribute 	ATTR 	
Audit
Audited 	ADT 	
Authority
Authorize 	AUTH 	
Auxiliary 	AUX 	
Availability
Available 	AVL 	
Average 	AVG 	The mean of two or more numbers
Average Cumulative Grade 	ACG 	
Award
Awarded 	AWRD 	
Balance* 	BAL* 	The net value (balance) of an account
Bank 	BNK 	
Bargain 	BARG 	
Base
Basic 	BAS 	
Batch 	BTCH 	
Before 	BEF 	
Begin
Beginning 	BEGN 	
Beginning of Term 	BOT 	
Benefits 	BEN 	
Bid 	BID 	
Bill
Billing 	BILL 	
Billing and Receivables System 	BRS 	
Birth 	BRTH 	
Board 	BRD 	
Break 	BRK 	
Budget
Budgetable 	BUD 	
Budget Balance Account 	BBA 	
Build
Building 	BLD 	
Business 	BUS 	
Business Unit* 	BU* 	
Buy
Buyer 	BUY 	
Calculate
Calculated
Calculation* 	CALC* 	
Calendar* 	CAL* 	
Call 	CALL 	
Campaign 	CMPN 	
Campus 	CMPS 	
Cancel
Canceled 	CAN 	
Capacity 	CAP 	
Capitalization 	CPLZ 	
Card 	CRD 	
Career 	CAR 	
Carrier 	CRIR 	
Cartridge 	CART 	
Case 	CSE 	
Cash 	CSH 	
Catalog 	CTLG 	
Category* 	CATG* 	
Census 	CENS 	
Center 	CTR 	
Certificate
Certification 	CERT 	
Change
Changed 	CHG 	
Chapter 	CHAP 	
Charge 	CRG 	
Chartfield 	CHARTF 	
Check
Checked 	CHK 	
Citizen
Citizenship 	CTZN 	
City 	CTY 	
Class 	CLAS 	
Clear
Cleared 	CLR 	
CLEP 	CLEP 	
Close 	CLO 	
Club 	CLB 	
COBRA* 	CBR* 	
Code* 	CD* 	Data which represents encoded values (translate or code table)
Collect
Collection 	CLCT 	
College 	COLG 	
Column 	CLMN 	
Combination
Combine 	COMB 	
Command 	CMD 	
Comment 	CMT 	An explanatory, illustrative or critical note, remark or observation
Committee 	CMMTTEE 	
Company* 	CO* 	
Comparative* 	COMPA* 	
Competitor 	CPTR 	
Complete
Completion
Compliance 	CMPL 	
Component 	CMPT 	When the meaning is "part", use abbreviation "PRT".
Composite
Compensation 	COMP 	
Conditional 	COND 	
Confidential 	CNFD 	
Confirm
Confirmation* 	CONF* 	
Constant 	CNST
CST 	Data which is unchanging or invariable
Contact 	CTCT 	
Continue
Continuing
Continuous 	CONT 	
Contract
Contractor 	CNTR 	
Control* 	CNTL* 	
Conversation* 	CONVR* 	
Conversion*
Convert*
Converted 	CNV* 	
Correspondence 	CRSP 	
Cost 	COST 	
Count
Counter 	CNT 	A number of people or things that have been "counted", such as inventory cycle count
Country 	CTRY 	
County 	CNTY 	
Course* 	CRSE* 	
Coverage* 	COVRG* 	
Create 	CRE 	
Credential 	CRDL 	
Credit* 	CR*
CRDT 	Use "CR" for field names relating to financial data
Use "CRDT" for field names relating to academic work
CREF 	CREF 	
Cross 	CRS 	
Cross List
Cross Listed 	XLST 	
Cross Reference 	XREF 	
Cumulative 	CUM 	
Currency* 	CURR* 	
Current* 	CUR* 	tedd
Cursor 	CRSR 	
Custodian 	CSTN 	
Customer* 	CUST* 	
Daily 	DLY 	
Data 	DATA 	
Data Processing 	DP 	
Date* 	DT* 	A calendar day, month, and year (including century)
Date-Time Stamp 	DTTM 	
Day* 	DD*
DY* 	A day of the week (Sunday, Monday, etc.)
Dead
Death
Deceased 	DEAD 	
Debit* 	DR* 	
Decimal 	DEC 	
Deduct
Deduction* 	DED* 	
Default* 	DFLT* 	
Deficit 	DFCT 	
Definition* 	DEFN* 	
Degree 	DEG 	
Delete 	DEL 	
Deliver
Delivery 	DLVR 	
Demo 	DMO 	
Dental 	DNTL 	
Department* 	DEPT* 	
Department of Motor Vehicles 	DMV 	
Dependency
Dependent*
Depends 	DEP* 	
Deposit 	DPST 	
Depreciation* 	DEPR* 	
Description* 	DESCR*
DSC 	Narrative data which translates a code or number. When a suffix, use "_DSC" (see Standard Field Name Suffix table).
Design 	DSGN 	
Destination* 	DEST* 	
Detail* 	DETL* 	
Develop
Development
Deviation 	DEV 	
Difference
Differential 	DIFF 	
Digit 	DGT 	
Direct
Direction
Directional 	DIR 	
Disability
Disabled 	DISA 	
Disbursed
Disbursement 	DSB 	
Discount* 	DISC* 	
Displacement 	DSPL 	
Display 	DISP 	
Disposition 	DSP 	
Distribute
Distribution* 	DIST* 	
District 	DSTR 	
Division 	DIV 	
Division of Continuing Education 	DCE 	
Document 	DOC 	
Donor 	DONR 	
Down 	DN 	
Drive
Driver 	DRV 	
Drop 	DRP 	
Due 	DUE 	
Duplicate*
Duplication 	DUP* 	
Each 	EA 	
Early 	ERLY 	
Earn
Earned
Earnings* 	EARN* 	
Earned Income Credit 	EIC 	
Educate
Education 	EDU 	
Effect
Effective* 	EFF* 	
Effective Date* 	EFFDT* 	
Effective Date Sequence* 	EFFSEQ* 	
Effort 	EFRT 	
Elect
Elected
Elective 	ELCT 	
Electronic Data Interchange 	EDI 	
Electronic Funds Transfer 	EFT 	
Electronic Mail 	EM 	
Eligibility*
Eligible 	ELIG* 	
Emergency 	EMRG 	
Emphasis 	EMPH 	
Employee* 	EE*
EMPL 	
Employee ID* 	EMPLID* 	
Employer* 	ER* 	
Employment 	EMPLMT 	
Encumber
Encumbrance 	ENCB 	
End
Ending 	END 	
End of Term 	EOT 	
Endorse
Endorsement 	ENDR 	
Endorsement 	ENDR 	
Endow
Endowment 	ENDW 	
Engineer
Engineering 	ENGN 	
English 	ENGL 	
Enrichment 	ENRCH 	
Enrollment 	ENRL 	
Enter
Entered
Entry 	ENTR 	
Entitle
Entitlement 	ENTL 	
Equal
Equality
Equivalence
Equivalent 	EQ 	
Equal Employment Opportunity
Equal Opportunity 	EEO 	
Equip 	EQP 	
Error 	ERR 	
Establishment 	ESTB 	
Ethnic 	ETHN 	
Evaluation
Evaluator 	EVAL 	
Event 	EVNT 	
Exam 	EXM 	
Exception 	EXCP 	
Exclude
Exclusion 	EXCL 	
Execute
Execution 	EXEC 	
Exempt
Exemption 	EXMT 	
Expect
Expected 	EXPC 	
Expected Family Contribution 	EFC 	
Expedite 	XPDT 	
Expense
Export
Express 	EXP 	
Experimental 	EXPM 	
Expiration
Expire 	EXPR 	
Export
Expense 	EXP 	
Extend
Extended
Extension 	EXT 	
External 	EXTR 	
Facility 	FCLT 	
Faculty 	FAC 	
Family 	FMLY 	
Family Eduaction Rights and Privacy Act 	FERPA 	
Fast 	FST 	
Father 	FATH 	
Federal 	FED 	
Federal Labor and Security Act 	FLSA 	
Fee 	FEE 	
Feet
Full Time 	FT 	
FICA 	FICA 	
Field
Fields 	FLD 	
File 	FILE 	
Final 	FNL 	
Financial* 	FIN* 	
Financial Aid 	FA 	
Fine 	FINE 	
First 	FRST 	
Fiscal 	FISC 	
Fiscal Year 	FY 	
Fiscal Year to Date 	FYTD 	
Fix
Fixed 	FIX 	
Flag 	FLG
SW 	Data which functions as a flag or indicator. Used with only two possible states/conditions. Data should normally be "Y" or "N".
Flexible Spending Account 	FSA 	
Floor 	FLR 	
For 	FOR 	
Foreign 	FGN 	
Foreign Key 	FK 	
Form 	FRM 	
Format 	FMT 	
Former 	FORMR 	
Free 	FREE 	
Free Application for Federal Student Aid 	FAFSA 	
Free on Board 	FOB 	
Freeze
Frozen 	FRZ 	
Frequency* 	FREQ* 	
Fresh
Freshman 	FRSH 	
From 	FR 	
Fulfill
Fulfilled 	FULF 	
Full Time 	FT 	
Full Time Equivalent 	FTE 	
Function
Functional 	FCN 	
Fund
Funding 	FUND 	
Future 	FUT 	
Garnishment* 	GARN* 	
General 	GENL 	
General Education Degree 	GED 	
General Ledger 	GL 	
Geographic
Geography 	GEOG 	
Gift 	GFT 	
Global 	GLBL 	
Government 	GOVT 	
Grade 	GDE
GRD 	A value assigned to reflect performance or position on a scale
Grade Point Average 	GPA 	
Graduate 	GRAD 	
Grant
Granted 	GRNT 	
Gross 	GROS 	
Group 	GRP 	
Guarantee 	GUAR 	
Guaranteed Student Loan 	GSL 	
Guest 	GST 	
Handicap
Handicapped 	HAND 	
Head 	HEAD 	
Header* 	HDR* 	
Health 	HLTH 	
Held
Hold 	HLD 	
Help 	HLP 	
Hierarchy 	HIER 	
High 	H 	Normally used in conjunction with another word (i.e., High School abbreviated as "HS").
High School 	HS 	
High School Services 	HSS 	
Higher Education 	HED 	
Highway 	HWAY 	
Hire 	HIRE 	
History 	HST 	
Home 	HM 	
Honor 	HONR 	
Honor Society 	HSC 	
Hospital 	HOSP 	
Hour 	HH 	A duration of time expressed in hours
Hourly 	HRLY 	
Hours* 	HRS* 	
House
Housing 	HSE 	
How 	HOW 	
Human Resources 	HR 	
Human Resource System 	HRS 	
Identification
Identifier*
Indicator 	ID* 	Alphanumeric data which identifies a person, place, or thing
Image 	IMG 	
Immune
Immunization 	IMUN 	
Impact 	IMPC 	
Implementation 	IMPL 	
Import 	IMP 	
Import/Export 	IMPEXP 	
Inch 	IN 	
Include 	INCL 	
Income 	INCM 	
Increase
Increment 	INCR 	
Index 	INDX 	
Indicator 	ID
IND 	
Individual 	INDV 	
Individual Student Information Report 	ISIR 	
Information 	INFO 	
Initial
Initialize 	INIT 	
Injury* 	INJ* 	
Inoculation 	INOC 	
Input 	INPT 	
Inquiry 	INQ 	
Insert 	ISRT 	
Institution 	INST 	
Instruction
Instructional
Instructor 	ISTR 	
Instructional Need Analysis System 	INAS 	
Insurance 	INS 	
Inter-Unit* 	IU* 	
Interest 	INT 	
Interface* 	INTFC* 	
Internal 	INTR 	
International 	INTL 	
Interval 	INVL 	
Interview
Interviewer 	INTV 	
Invent 	INVN 	
Inventory 	INV 	
Investment* 	INVEST* 	
Invitation
Invite 	INVT 	
Invoice 	INVC 	
Issue
Issued 	ISS 	
Item 	ITM 	
Job 	JOB 	
Journal* 	JRNL* 	
Junior 	JR 	
Junior Science 	JS 	
Key 	KEY 	
Label 	LBL 	
Labor 	LBR 	
Laboratory 	LAB 	
Language 	LNG 	
Last
List 	LST 	
Late 	LATE 	
Latitude 	LAT 	
Layoff 	LAYF 	
Leave 	LV 	
Lecture 	LCTR 	
Ledger* 	LED* 	
Legal 	LGL 	
Lender 	LNDR 	
Length* 	LEN* 	
Letter 	LTR 	
Level 	LVL 	
Liaison 	LISN 	
Liberal Education 	LBD 	
Library 	LIB 	
License 	LIC 	
License Plate Number 	LIC_PLTE_NBR 	
Life 	LIFE 	
Limit* 	LIM* 	
Line*
Loan 	LN* 	
Link
Linked 	LNK 	
Liquid 	LIQ 	
List
Last 	LST 	
Literal 	LTRL 	
Load 	LOAD 	
Loan
Line* 	LN 	
Locate
Location* 	LOC* 	
Lock 	LK 	
Locker 	LKR 	
Log 	LOG 	
Log on 	LOGON 	
Long
Longest 	LONG 	
Long Term Care 	LTC 	
Long Term Disability 	LTD 	
Longitude 	LON 	
Lot 	LOT 	
Low 	LOW 	
Mail
Mailer
Mailing 	MAIL 	
Maintenance* 	MAINT* 	
Major 	MJR 	
Make 	MK 	
Manager 	MGR 	
Map 	MAP 	
Marital 	MRTL 	
Message Agent Server 	MAS 	
Mask 	MSK 	
Master Academic Records System 	MARS 	
Match
Matching 	MTCH 	
Math 	MTH 	
Matriculated
Matriculation 	MTRC 	
Maximum* 	MAX* 	
Medical
Medicinal 	MED 	
Meet
Meeting 	MT 	
Member 	MBR 	
Membership 	MSHP 	
Memo
Memorandum 	MMO 	
Memorial 	MEMR 	
Merchandise 	MERCHNDS 	
Merchant 	MERCH 	
Merit 	MERT 	
Message
Messages* 	MSG* 	
Meter 	MTR 	
Method 	METH 	
Microfilm 	MFILM 	
Middle 	MID 	
Military 	MIL 	
Minimum* 	MIN* 	
Minor 	MINR 	
Minute 	MNT
MM 	A duration of time expressed in minutes
Miscellaneous 	MISC 	
Mode 	MDE 	
Modification
Modifier 	MOD 	
Monetary
Money 	MONY 	
Month* 	MM*
MN* 	A calendar month in numeric form (e.g., 01=January)
Month-to-Date* 	MTD* 	
More 	MORE 	
Mother 	MOTH 	
Move 	MOVE 	
Multiple 	MULT 	
Name 	NM
NME 	Word(s) by which a person, place or thing is commonly known
National 	NATL 	
National Association of College and University Business Officers 	NACUBO 	
National Student Loan Direct System 	NSLDS 	Commonly known as the "Perkins Loan"
Navigation 	NAV 	
New 	NEW 	
Next 	NXT 	
Next of Kin 	NOK 	
No Charge 	NC 	
No Credit 	NOCR 	
No Print 	NPRT 	
Nominal 	NOM 	
Non 	NON 	
Non-Personal Services 	NPS 	
Not 	NOT 	
Not Applicable 	NA 	
Note
Notice
Notification
Notify 	NOTE 	
Number*
Numeric 	NBR* 	Numeric data which identifies a person, place, or thing
Object
Objective 	OBJ 	
Occupation 	OCP 	
Occurs 	OCC 	
Offer
Offered 	OFFR 	
Office 	OFFC 	
Officer 	OFCR 	
Official 	OFCL 	
Old 	OLD 	
Online 	ONLN 	
Open 	OPN 	
Operator* 	OPR* 	
Option
Optional
Options 	OPT 	
Order 	ORDR 	
Organization
Organize 	ORG 	
Orientation 	ORNT 	
Origin
Original
Origination 	ORIG 	
Other 	OTHR 	
Out 	OUT 	
Over 	OVR 	
Overhead 	OH 	
Override 	OVRD 	
Overtime 	OT 	
Own
Owned 	OWN 	
Owner 	OWNR 	
Packaged 	PACK 	
Paid 	PAID 	
Paper 	PPR 	
Parameter* 	PARM* 	
Parent 	PAR 	
Parity
Priority 	PRTY 	
Park 	PRK 	
Part
Partial 	PRT 	
Part Time 	PT 	
Participation 	PRTP 	
Pass
Passed 	PASS 	
Past 	PAST 	
Patron 	PTRN 	
Pay
Payable
Payment 	PAY 	
Payroll 	PYRL 	
Pedestrian 	PED 	
Pell (Pell Grant) 	PEL 	
Pending 	PEND 	
Pension 	PENS 	
Percent*
Percentage
Percentile 	PCT* 	Part of a whole expressed in hundredths
Period* 	PD* 	
Period-to-Date* 	PTD* 	
Perkins Loan 	NSLDS 	Common name for National Student Loan Direct System
Permanent 	PERM 	
Permit 	PRMT 	
Person 	PERS 	
Personal
Personnel 	PSNL 	
Personal Identification 	PIN 	
Personnel Action Notification 	PAN 	
Phone 	PHN 	
Physics 	PHYS 	
Place 	PLCE 	
Plan 	PLN 	
Plate 	PLTE 	
Pledge 	PLDG 	
PM 	PM 	"Post Meridiem" (afternoon)
Point 	PNT 	
Policy 	PLCY 	
Position* 	POSN* 	
Post
Posted 	POST 	
Postal 	PSTL 	
Potential 	POTN 	
Predicted 	PRED 	
Preference
Preferred 	PREF 	
Prefix 	PRFX 	
Premium 	PREM 	
Prerequisite 	PREQ 	
Prescribed 	PSCR 	
Presentation 	PRST 	
President 	PRES 	
Previous
Prior 	PREV 	
Price 	PRC 	
Price Level 	PL 	
Primary 	PRIM 	
Primary Key 	PK 	
Principal
Principle 	PRIN 	
Principal Investigator 	PI 	
Print
Printed 	PRN 	
Prior
Previous 	PREV 	
Priority
Parity 	PRTY 	
Probation
Problem 	PROB 	
Procedure
Process 	PROC 	
Profession
Professional 	PRFS 	
Proficiency 	PRFC 	
Profile* 	PROF* 	
Program 	PROG 	
Project
Projected 	PROJ 	
Promissory 	PRMS 	
Promotion 	PROM 	
Proposal 	PRPS 	
Prospect 	PRSP 	
Province 	PRVN 	
Purchase 	PUR 	
Purchase Order 	PO 	
Purge 	PRG 	
Purpose 	PURP 	
Qualitative
Quality 	QAL 	
Quantitative
Quantity* 	QTY* 	A number of things other than money
Quantity-to-Date
Quarter-to-Date* 	QTD* 	
Quarter 	QTR 	
Question 	QSTN 	
Race 	RACE 	
Range 	RNG 	
Rank 	RNK 	Relative standing or position
Rate* 	RT* 	Numeric value expressing amount per some unit of coverage
Read
Reading 	READ 	
Real
Reallocation 	REAL 	
Reason* 	RSN* 	
Recall 	RCL 	
Receipt 	RCPT 	
Receive
Received* 	RECV* 	
Receiver 	RCVR 	
Recharge 	RCHG 	
Recognition
Recognize 	RECG 	
Recommend 	RCMD 	
Reconciliation* 	RECON* 	
Record* 	REC* 	
Recreate
Recreation 	RECR 	
Recruit
Recruiting 	RCRT 	
Reduce
Reduced
Reduction* 	RED* 	
Refer
Reference*
Referral
Referred 	REF* 	
Refund 	RFND 	
Regional 	RGNL 	
Registrar 	REGR 	
Registration 	REG 	
Reject
Rejection 	RJCT 	
Relate
Relation
Relationship 	RLAT 	
Release 	RLSE 	
Religion
Religious 	RELG 	
Remaining 	RMNG 	
Reminder 	RMDR 	
Renewal 	RNWL 	
Repeat
Repeatable
Repeated 	REPT 	
Replace
Replaced 	REPL 	
Reply 	RPLY 	
Report* 	RPT* 	
Request*
Requested
Require
Required*
Requisition* 	REQ* 	
Requirements* 	RQMT* 	
Research 	RES 	
Reserve
Reserved 	RSRV 	
Reserve Officers Training Corps 	ROTC 	
Residence
Residency
Resident 	RSDT 	
Resign 	RSGN 	
Resource 	RSRC 	
Response 	RESP 	
Restart 	RST 	
Restock 	RSTK 	
Restrict
Restricted
Restrictions 	RSTR 	
Result 	RSLT 	
Retire*
Retirement* 	RET* 	
Retroactive 	RETR 	
Return 	RTN 	
Revenue 	REV 	
Review 	RVW 	
Revision 	REVS 	
Revoke 	REVK 	
Roll 	RL 	
Roll up 	RLUP 	
Room 	RM 	
Route 	ROUT 	
Row 	ROW 	
RSVP 	RSVP 	French abbreviation meaning "please reply"
Run 	RUN 	
Run Control 	RUNCTL 	
Salary* 	SAL* 	
Sale 	SALE 	
Salutation 	SLTN 	
Same 	SM 	
Save 	SAVE 	
Scale 	SCAL 	
Schedule*
Scheduled
Scheduling 	SCHED* 	
Scholar
Scholarship 	SCHLR 	
Scholastic
School 	SCHL 	
Scholastic Aptitude Test 	SAT 	
Science 	SCI 	
Score 	SCR 	A number that expresses merit or performance
Screen 	SCRN 	
Search 	SRCH 	
Second 	SCND
SS 	Use "SCND" for field names relating to number two in a countable series
Use "SS" for field names relating to a duration of time expressed in seconds
Section 	SCTN 	
Secure
Security* 	SEC* 	
Segment 	SEG 	
Select*
Selection
Selective 	SEL* 	
Semester 	SEM 	
Semi Finalist 	SEMF 	
Senate
Senator 	SEN 	
Send 	SND 	
Senior 	SR 	
Sent 	SNT 	
Separate 	SEPR 	
Sequence* 	SEQ* 	
Serial 	SERL 	
Service 	SERV 	
Session* 	SESSN* 	
Sex 	SEX 	
Sharing 	SHR 	
Sheet 	SHET 	
Shelter 	SHLT 	
Shift 	SHFT 	
Shipping 	SHIP 	
Short 	SHRT 	
Sign 	SGN 	
Simulated 	SIM 	
Site 	SITE 	
Size 	SZ 	
Skill 	SKL 	
Skip 	SKP 	
Social
Society 	SOC 	
Social Security Number 	SSN 	
Soft 	SFT 	
Solid 	SLID 	
Sophomore 	SOPH 	
Sort 	SRT 	
Source 	SRC 	
Special
Specialty 	SPCL 	
Specific
Specification 	SPEC 	
Sponsor
Sponsored 	SPON 	
Sports 	SPRT 	
Spouse 	SPSE 	
Square 	SQ 	
Stack 	STCK 	
Staff 	STF 	
Stage 	STG 	
Stamp 	STMP 	
Standard 	STD 	
Standard Deviation 	STDV 	
Start
Starting 	STRT 	
State 	ST 	
Statement 	STMT 	
Static 	STC 	
Statistics* 	STAT* 	
Status 	STS 	
Step 	STP 	
Stipend 	STPD 	
Stock 	STK 	
Stop 	STOP 	
Street 	STR 	
String 	STRG 	
Structure 	STRC 	
Student 	STU 	
Student Academic Records 	SAR 	
Student Credit Hour 	SCH 	
Study 	STDY 	
Subcampaign 	SCMP 	
Subject 	SUBJ 	
Subordinate 	SUB 	
Subsidiary 	SUBS 	
Suffix 	SFX 	
Summation
Summary* 	SUM* 	
Supervisor*
Support 	SUP* 	
Supplement
Supplemental* 	SUPL* 	
Survey 	SRVY 	
Suspense 	SUSP
SUSPN 	
Switch 	FLG
SW 	Data which functions as a flag or indicator. Used with only two possible states/conditions. Data should normally be "Y" or "N".
System 	SYS 	
Table
Tables 	TBL 	
Taken 	TKN 	
Tape 	TAPE 	
Target 	TRGT 	
Taught 	TGHT 	
Tax
Taxable 	TX 	
Tax ID Number 	TIN 	
Team 	TEAM 	
Temperature 	TEMP 	
Template* 	TMPL* 	
Temporary 	TMP 	
Tenure 	TENR 	
Term 	TRM 	
Terminal 	TRML 	
Terminate 	TRMT 	
Test 	TST 	
Text 	TXT 	Narrative informational data such as a message or error text
Thermidor 	THERM 	13th Month
TIAA 	TIAA 	
Ticket 	TKT 	
Time 	TM 	Hours and minutes. May include seconds, hundredths of seconds.
Time keeping 	TMKP 	
Time-stamp 	TS 	A system generated Time-stamp
Title 	TITL 	
Today 	TDY 	
Total* 	TOT* 	
Tour 	TOUR 	
Town 	CTY 	
Track
Tracking 	TRK 	
Traditional 	TRAD 	
Training* 	TRN* 	
Transact
Transaction* 	TRANS* 	
Transcript 	TSCP 	
Transfer* 	XFER* 	
Translate
Translation 	XLT 	Meaning "Crosswalk Table"
Transmit
Transmittal 	XMIT 	
Travel 	TRVL 	
Tuition* 	TUIT* 	
Type 	TYP 	
Undergraduate 	UGRD 	
Unemployment 	UNEMPL 	
Unit 	UNIT 	
Unit of Measure* 	UOM* 	
Universal 	UNVRSL 	
University 	UNIV 	
Unpaid 	UNPD 	
Unsecure
Unsecured 	UNSEC 	
Up To 	MAX 	
Update
Updated 	UPDT 	
Upper 	UPR 	
US Department of Education 	USDE 	
Use
Used 	USE 	
User 	USR 	
Vacation* 	VACN* 	
Valedictorian 	VLDC 	
Valid
Validate
Validation 	VLD 	
Value 	VAL 	
Variable 	VAR 	
Vehicle* 	VEH* 	
Vendor 	VEND 	
Verbal 	VRBL 	
Verify
Verified 	VERF 	
Veteran 	VET 	
Vice President 	VP 	
Violation 	VIO 	
Visa 	VISA 	
Visit 	VST 	
Voucher 	VCHR 	
W2 	W2 	
W4 	W4 	
W9 	W9 	
Waived 	WVED 	
Week
Work
Worked
Worker(s) 	WK 	
Width 	WID 	
With 	W 	Normally used as part of a compound word (i.e., Withdrawl abbreviated as "WDRL").
Withdrawal 	WDRL 	
Withhold
Withholding 	WHLD 	
Women 	WMN 	
Worksheet 	WKST 	
Write
Written 	WRT 	
Year* 	YR*
YY* 	A calendar year, including century (e.g., 1997)
Year-to-Date* 	YTD* 	
Zip 	ZIP 	
Zone 	ZN


Abbr.　	Name　	名称　
ICC 
ICC-CAPA
WTO
INTRADE
INTRADCEN
WBT
WTC
WTCA
IDO
OECD
ICDA
EEC
ICA
ICA
ICA	International Chamber of Commerce
International Chamber of Commerce Commission on Asia and Pacific Affairs
World Trade Organization
International Trade Development Organization
International Trade Center
World Board of Trade
World Trade Corporation
World Trade Center Association
International Development Organization
Organization for Economic Cooperation and Development
International Cooperative Development Association
European Economic Community
International Co-operative Alliance
International Commodity Association
Institute of Chartered Accountants	国际商会　　
国际商会亚洲及太平洋事务委员会　
国际贸易组织 
国际贸易发展组织 
国际贸易中心 
世界贸易委员会 
世界贸易公司 
国际贸易中心 
国际开发组织　
经济合作与发展组织
国际合作发展协会 
欧洲经济共同体　
国际合作社联盟 
国际商品协会　　　
特许会计师协


M
MAI Multilateral Agreement on Investment 
多边投资协定

MEA Multilateral Environmental Agreement 
多边环境协定

MFA Multifibre Agreement or Arrangement Regarding International
Trade in Textiles 
《多种纤维协定》、《国际纺织品贸易协定》

MFN Most-favored-nation treatment 
最惠国待遇

MTN Multilateral trade negotiations 
多边贸易谈判

N
NAMA non agricultural market access 
非农业市场准入

NFIDC Net Food-Importing Developing Countries 
粮食净进口发展中国家

NGBT Negotiating Group on Basic Telecommunications 
基础电信谈判组

NGMA Negotiating Group on Market Access 
非农产品市场准入谈判工作组

NGMTS Negotiating Group on Maritime Transport Services 
海运谈判小组

NGO non-government Organization 
非政府机构

NTB non tariff barriers 
非关税壁垒

NTE National Trade Estimate Report on Foreign Trade Barriers 
对外贸易壁垒国别评估报告

NTMs Non-tariff measures 
非关税措施

O
OCTs Overseas Countries and Territories 
与欧共体成员有特殊关系的海外国家和领土

OECD Organization for Economic Cooperation and Development 
经济合作与发展组织

OIE/ IOE the International Office of Epizootics 
国际兽医组织

OMA Orderly market arrangements 
有秩序的市场安排

P
PCWTO Preparatory Committee for the World Trade Organization 
世界贸易组织筹备委员会

PGE Permanent Group of Experts 
（反补贴协议的）常设专家小组

PPM Processes and Production Methods 
工序和生产方法

PS Partial Scope Agreements
局部自由贸易协定

PSE Producer subsidy equivalent 
（农业）生产者补贴等量

PSE Producer Support Estimate 
生产者支持评估

PSI Pre-shipment Inspection 
装运前检验

PTA Preferential Trade Agreement 
优惠贸易安排

Q
QRs Quantitative restrictions 
数量限制

R
R&D Services Research and Development Services 
研发服务

RTA Regional Trade Agreements 
区域贸易协定
转贴于：24EN.COM

外贸常用缩写语
　　cu.ft.;cb.ft. cubic foot 立方英尺
　　cur.;curt. current(this month) 本月
　　cur. currency 币制
　　cu.yd.;cb.yd. cubic yard 立方码
　　C.W.O. cash with order 订货时付款
　　c.w.t.;cwt. hundredweight 英担(122磅)
　　CY Container Yard 集装箱堆场
　　d. denarii(L),panny or pence 便士
　　D/A Document against Acceptance 承兑交单
　　d/a days after acceptance 承兑后若干天(交款)
　　D.D.;D/D Demand draft 即期汇票 Delivered at docks 码头交货
　　D/d documentary draft 跟单汇票
　　Dec. December 十二月
　　deld. delivered 交付
　　dept. department 部;股;处
　　destn. destination 目的港;目的地
　　D/f dead freight 空舱费
　　drt. draft 汇票
　　diam. diameter 直径
　　diff. difference 差额;差异
　　dis.;disc't discount 贴现;折扣;贴现息
　　dis.;Dolls. dollars 元
　　Dmge. Damage 损坏 destn. destination 目的港;目的地
　　D/N debit note 久款帐单
　　doc. document 单据
　　doc.att. document attached 附单据;附证件
　　dols.;dolls. dollars 元
　　D/P document against payment 付款交单
　　doz. dozen 打
　　d.p. direct port 直达 港口
　　d/s;d.s.;days.st. days after sight 见票后若干天付款
　　ds.;d's days 日
　　dto.;do ditto 同上;同前
　　d.t. delivery time 交货时间
　　dup.;dupl.;duplte. duplicate 誊本;第二份;两份
　　D.W.T. dead weight tonnage 载重吨
　　D/Y delivery 交付;交货
　　dz.;doz. dozen 打
　　ea. each 每
　　E.C. Exempli causa(for example) 例如
　　E/D Export Declaration 出口申报单
　　E.E. errors excepted 错误当查;错误当改
　　E.E.C. European Economic Community 欧洲共同体
　　e.g.;ex.g. Exempli gratia(L.)=for example 例如
　　end. endorsed;endorsement 背书
　　encl.;enc. ecnlosure 附件
　　E.&O.E. errors and omissions excepted 错漏当查;错漏当改
　　E.O.M. end of month 月末
　　E.O.S. end of season 季末
　　eq. equivalent 等值的,等量的
　　e.q.m. equal quantity monthly 每月相等的数量
　　Et.seq. Et sequentia(and other things) 及以下所棕述的
　　Et.al. Et.alibi(and elsewhere) 等等

e.t.a.;eta;ETA estimated(expected)time of arrival 预计到时间
　　etc. et cetera(L.)=and others 等等
　　ETCL;etcl expected time of commencement of loading 预计开装时间
　　etd;ETD estimated(expected)time of departure 预计离港时间
　　ETDEL expected time of delivery 预计交货时间
　　ETFD expected time of finishing discharging 预计卸完时间
　　ETFL expected time of finishing loading 预计装完时间
　　ex per or out of 搭乘
　　ex. excluding 除外;example 例子;样本
　　Exch. exchange,兑换;汇兑
　　Excl. exclusive or excluding 除外
　　ex.int. ex interest 无利息
　　exp. export 出口
　　Exs. expenses 费用
　　Ext. extra 特别的;额外的
　　F degree Fahrenheit 华氏度数
　　F.A. free alongside(ship) (船)边交货
　　f/a/a;F.A.A. free from all average 分损不赔(保险用语)
　　f.a.c. fast as can 尽快
　　f.a.q.;E.A.Q. fair average quality 大路货;中等品质
　　f.a.s.;F.A.S. free alongside ship 船边交货价
　　F.B. freight bill 运费单
　　fc franc 法郎
　　Fch. frachise 免赔率(一般指相对的)
　　FCL Full Container Load 整箱货
　　F.C.&.S. free of capture and seizure clause 战争险不保条款
　　f.e. for example 例如
　　Feb. February 二月
　　f.f.a. free from alongside 船边交货价
　　f.g.a.;F.G.A. free from general average 共同海损不赔
　　f.i. for instance 例如;free in 船方不负担装船费
　　f.ig. figure 数字
　　f.i.o. free in and out 船方不负担装卸费
　　fi.o.s. free in,out and stowed 船方不负担装卸费及理舱费
　　f.i.o.s.t. free in.lut,stowed and trimmed 船方不负担装卸费、理舱费及平舱费
　　f.i.w. free in wagon 承运人不负担装入货车费
　　F/O in favor of 交付给......,以......为受益人
　　f.o. free out 船方不负担卸货费
　　F.O.A. free on aircraft 飞机上交货价
　　fo.vo. filio verso=turn the page 转下页
　　f.o.r.;F.O.R. free on rail 火车上交货价
　　FOS.;f.o.s. free on steamer 船上交货价
　　f.o.b.;F.O.B. free on board 船上交货价
　　F.O.B.S. free on board stowed 包括理舱费在内的船上交货价
　　f.o.c. free of charges 免费
　　f.ot.;fot free on truck 卡车上交货价
　　F/P fire policy 火灾保险单
　　E.P. floating policy 总括保险单
　　F.P.A. free from particular average 平安险
　　F.;Fr. franc 法郎
　　frt.;frit.;fgt. freight 运费
　　frt.ppd freight prepaid 运费已预付
　　ft. foot 英尺
　　ft.-lb. foot-pound 英尺磅(功的单位)
　　f.w.d. fresh water damage 淡水损失
　　fwd. forward 前面;接下页
　　F.X. foreign excharge 外汇


到了ms以后，发现email里经常有一些缩写，所以上网搜了一下记录下来
电子邮件或互联网常用语及缩写 
Some Useful Email/Internet Expressions in Abbreviated Form
电子邮件或互联网常用语及缩写 
　
1. FYI = For your information
仅供参考
2. Cc = Carbon copy. Enter the address of anyone you'd like to receive a copy of your email on the cc line.
抄送。在抄送一栏中输入你希望收到你的邮件副本的人员地址。
3. Bcc = Blind carbon copy. If you want to send a copy of your email without the original recipient's knowledge, put the address on the Bcc line.
暗送。如果你想发送邮件复本，又不想让原始接受人知道，就在暗送一栏中输入地址。
4. Spam (n) = electronic junk mail
电子垃圾邮件
5. Scroll (v.)= to move text or graphics up or down or across a display screen as if unrolling a Chinese scroll painting. 
例句： If you scroll down to the very bottom, you will see my contact numbers.
上下或左右移动正文或图片，如同打开中国卷轴画。
例：如果你拉动画面到最下方，你将看到我的联系电话。
6. Flaming (n.) = using rude or obscene language in an email message or sending such messages. 
例句： Flaming is strictly prohibited in workplace.
在电子邮件通信中使用粗鲁或猥亵的语言，或发送这样的信息。
例：在工作场合严禁使用猥亵的语言
7. Group list = email addresses of a group of people with whom you communicate frequently. Most email software allow the storage of such group lists, enabling users to select a name for each group and send messages without having to type multiple addresses.
群体列表, 即经常联系的一组人员的电子邮件地址。大多数电子信函软件都能储存这样的地址列表，允许使用者为每组起个名字以便在发送信件时无须录入全部地址。
8. BTW = By the way
顺便说一句
9. LOL = Laughing out loud
大声笑
10. FAQ = Frequently asked questions
常见问答
11. FYEO = For your eyes only; confidential
只给你看；保密
12. OIC = Oh, I see
哦，我知道了
13. BBL = Be back later
一会儿就回来
14. THX = Thanks
谢谢
15. CYA= See ya (or, See you later)
一会见
16. IMO = In my opinion
在我看来
17. IMHO = In my humble (or, honest) opinion
依鄙人之见
18. ROFL= Rolling on the floor laughing
捧腹大笑
IAE = In any event 不管怎样，在任何活动中
IOW = In other words 换句话说
OTOH = On the other hand 另一方面 
PS = Post scriptum 拉丁语，当在文章末尾加上一个特别的句子时实用，通常表示：“特别提示”“请注意”等
ASAP = As soon as possible 尽快
WRT = With respect to 至于，关于
=====================另外一份信息=======================================
RGDS: regards 
TKS: thanks 
ASAP: as soon as posible 
BTW: by the way 
FW: foward 
COD: code of conduct 公司行为规范准则 
OL: office lady 
EG: for example 
FYI: for you information 
ETC: esmated time of complete 
ETS: esmated time of shipping 
NG: no good 
NFG: no fxxking good 
FNG: fxxking new guy 常指把事情搞得一团糟的新员工 
SOB: son of a bitch 我的口头禅 
cc: copies send to 
bcc: copies send to undisclosed-recipients 这一招很阴毒，发文骂人，bcc老板，而受文者看不到你告状 
stand up meeting非正式的短会，比如说三两个人站在过道中间讨论一下事情，老外喜欢这样干； 
sticker一种名为"post-it"的黄色小纸片，可以贴在电脑屏幕上或电话机上，办公室的小女生喜欢用它来写一些与工作无关的事； 
Fedex/DHL/UPS 常用的快递公司； 
Gettogether 聚一聚，"Let's have a gettogether this weekend." 
Reminder 提醒一下，"Just a kind reminder."表示你可能miss掉了一些事情，人家不方便指责你，所以"善意提醒"； 
Localize 这几年各大公司流行这个词，是老外挂在中层本地骨干前面的胡萝卜。"localize the management level" 
Cell 对手机比较地道的说法，"Call my cell if you can't find me in the office." 说 mobil phone比较土，说hand phone就土掉渣了； 
Page 传呼，BB机流行的年代常用。"Page me." 说"Call me."的很土； 
Manuel 工作手册，指南 
Expense 费用，出差要报销的也是expense； 
Budget 预算，每个项目不论大小，包括出去聚餐，都要事先算budget； 
pain in the ass 办公室口头禅，意指老也没办法解决的麻烦事； 
outing 忙碌了一段时间，或一个重要项目完成后，老板带大家出去疯一次，当然是公费，一般是星期五方一天假，再加上周末两天；用travel 或 tour 相当不地道，很土； 
project 使用频率最高的词之一，很多非外企也爱用它，我朋友的公司开会时也爱说"我们来讨论一下这个破街。" 
fall guy 替罪羊，公司里避免不了； 
face music 挨骂，被上司训斥； 
kick somebody's ass 老板训人； 
go by book 按规章办事 
tough 两个意思，一指办事手段果断，不留情面；一指棘手的事情； 
day in and day out 日复一日； 
first-aid 指公司内的医药箱； 
misunderstanding 误解，误会，办公室内经常会有； 
routine 例行事务 
screw up 弄砸事情，常用纯口语，正式一点的说法是"You did it wrong."公司里面一般说"You screw it up." screw这个词单独用在口语里，相当于国语里面的"操"和"干"，当然原意是指钻钉螺丝,名词指螺丝刀； 
creative / creativity 创造性思维，老外最推崇这一点； 
petty cash 出差或办事前，跟财务领取的备用金，这个词组很有用； 
sign off 签发，可以指文件，也可以指正式认可某件事的开始执行； 
stationary 文具，很有用的一个词； 
这次介绍一些关于工作方面的东东， 
asignment 
任务，职责；in charge / follow up / responsible for 
这三个说法的意思都是"负责"，但用法不一样： 
in charge 表示对一个部门，一项有一定重要性的事务负责，也可以对人，与权力相关， 
follow up 表示具体跟进某事，与事情的重要性，与人，与权力无关， 
responsible for 的程度介乎前两种表达之间； 
credit 不是信用卡那个信用的意思，指员工在公司内积累的口碑，信任度和价值，"Good job, this will add your credit in the company."这句话的意思是老板以后会更重视你，因为你这件事干得好。 
Reputation 名声，口碑，不论好坏； 
lay off: 解雇； 
extension: 分机，常简作:ext# 
approach 报告，会议中常用此词，尽量达到的意思，中文确切表达此词有难度； 
presentation 简报，一般用ppt来做； 
scenario 这个词很有意思，原用于电子游戏的"关卡"的意思，公司内常用于指某个大项目的其中一个阶段，或其中一个部份； 
proposal 未经确认通过的提议，待讨论的方案； 
package 包裹，所谓"一揽子计划"就由此而来，比如你去某公司interview，最后让你提问，比较地道的说法是"What's the package?"问的是你们能给的待遇乱七八糟加起来有些什么？ 
harassment ：骚扰 
headquarters ：总公司，总部 
LO ：liaison office，当地国家的分部； 
recognize ：认可，recgnized supplier， 指认可的供应商； 
amotize ：分摊，"The expenses are to be amotized by the LOs."由各分公司分摊费用； 
on shifts ：轮班； 
driver ：推动者，"The develpment will drive this case."这个项目由开发部主导。


网络版

IT  
IT是指信息技术，即英文Information Technology 的缩写.  

BT  
一种P2P共享软件，全名叫"BitTorrent",中文全称:"比特流"又名"变态下载"  

DIY  
是每个电脑爱好者熟悉的新名词，是英文Do It Yourself的首字母缩写,自己动手制作的意思,硬件爱好者也被俗称DIYer.  

OEM  
英文Original Equipment Manufacturer的缩写，意思是原设备制造商。  

BBS  
英文Bulletin Board System的缩写，中文意思是电子公告板系统，现在国内统称做论坛。  

XP  
英文Experience（体验）的缩写，自从微软发布Office XP后,成为软件流行命名概念。  

ZT  
论坛上常见文章标有zt字样，新手不知所云，其实不过是"转帖"的拼音缩写而已。  

PS  
在网上，常用软件一般都用缩写代替photoshop简称ps，DreamWeaver简称dw，等等  

ID  
英文IDentity的缩写，ID是身份标识号码的意思.  

MSN  
即MICROSOFT NETWORK，是微软公司的一个门户站点。 MSN作为互联网上最受欢迎的一个门户，具备了为用户提供了在线调查、浏览和购买各种产品和服务的能力。  

DJ  
DISCO JOCIKEY(唱片骑士)的英文缩写，以DISCO为主，DJ这两个字现在已经代表了最新、最劲、最毒、最HIGH的Muisc。  

URL  
英文Uniform Resoure Locator的缩写，即统一资源定位器，它是WWW网页的地址,http://discuz.net

CEO  
CEO(Chief Executive Officer)，即首席执行官，源自美国20世纪60年代进行公司治理结构改革创新时  

OVA  
英文录象带的缩写.  

VIP  
英文Very Important Person的缩写，就是贵宾的意思。  

顶  
论坛里，新帖每有人回复，该帖子就会在主题列表里排列在最上面，所以同意楼主观点的就叫"顶"要不它就"沉"了，呵呵  

灌水？潜水？  
灌水是指在论坛发表有阅读价值或者没有阅读价值的文章，潜水顾名思义，论坛里沉默不发帖的人。  

MC  
MC的意思是Micphone Controller的意思，翻译差不多是“控制麦克风的人”。也可以理解为Rapper，很多Rap都在自己的艺名前面加上“MC”，比如台湾的MChotdog，香港的MCYan，美国的MC Hammer等。  

CS  
CS是非常流行的网络游戏,中文名是反恐精英。  

SOHO  
SOHO，是SMALLOFFICEHOMEOFFICER的简称，意思是“在家办公”。  

Banner是什么意思?logo是什么意思?  
BANNER是横幅广告，logo是图标广告.  

FTP  
FTP是英文File Transfer Protocol的缩写，即文本传输协议。  

IP  
为了使Internet上的众多电脑主机在通信时能够相互识别，Internet上的每一台主机都分配有一个唯一的32位地址，该地址称为IP地址，也称作网际地址。IP地址由4个数组成，每个数可取值0～255，各数之间用一个点号“.” ，比如 202.103.224.68

星期
星期一：MONDAY=MON 星期二：TUESDAY=TUS
星期三：WENSEDAY=WEN 星期四：THURSDAY=THUR
星期五：FRIDAY=FRI 星期六：SATURDAY=SAT
星期天：SUNDAY=SUN

月份
一月份＝JAN 二月份＝FEB
三月份＝MAR 四月份＝APR
五月份＝MAY 六月份＝JUN
七月份＝JUL 八月份＝AUG
九月份＝SEP 十月份＝OCT
十一月份＝NOV 十二月份＝DEC

常用词
4＝FOR 到永远＝FOREVER
2＝TO RTN＝RETURN(送回)
BT＝BLOOD TYPE(血型) PLS＝PLEASE(请)
BD＝BIRTHDAY(生日) REWARD＝酬谢
REWARD 4 RETURN＝送回有酬谢 ALLRG＝过敏


军事术语
USMC＝海军陆战队 NAVY＝海军
AF＝AIR FORCE(空军) ARMY＝陆军



宗教类
C＝CHRISTIANISM(基督教) J＝JUDAISM(犹太教)
C＝CATHOLICISM(天主教) B＝BUDDHISM(佛教)
I＝ISLAM（伊斯兰教） NR＝NO REFERENCE(没有宗教信仰)


星座
水瓶座： AQUARIUS（1月21日 - 2月19日）
双鱼座： PISCES（2月20日 - 3月20日 ）
白羊座： ARIES （3月21日 - 4月20日 ）
金牛座： TAURUS（4月21日 - 5月21日）
双子座： GEMINI（5月22日 - 6月21日 ）
巨蟹座： CANCER（6月22日 - 7月23日 ）
狮子座： LEO（7月24日 - 8月23日）
处女座： VIRGO（8月24日 - 9月23日 ）
天秤座： LIBRA （9月24日 - 10月23日 ）
天蝎座： SCORPIUS（10月24日 - 11月22日 ）
人马座： SAGITTARIUS（11月23日 - 12月21日 ）
山羊座： CAPRICORNUS （12月22日 - 1月20日 ）

1. 国际性或全美性：

UNESCO (United Nations Educational, Scientific and Cultural organization）联合国教育科学文化组织（也叫国际文教组织）
例如： (The）UNESCO has made some contributions to the world.（UNESCO 对世界做出一些贡献）

NATO（North Atlantic Treaty organization）北大西洋公约组织。
例如：Could（the）NATO members stick to their commitments？（NATO 的成员能坚守承担义务吗？)

SALT（Strategic Arms Limitation Treaty）战略武器限制公约
例如：Should every nation join（the）SALT？（每个国家都要加入 SALT？）

NASA（National Aeronautics and Space Administration）美国航天太空总署
例句：The U.S. space programs depend on the performances of NASA.（美国的太空计画是靠NASA的表现而定。）
(注：以上缩写字也被人们当做一个字看待）

WHO（World Health organization）世界卫生组织
例句：Taiwan has been trying to become one of the WHO members.（台湾一直想办法成为WHO的成员之一）

FBI（Federal Bureau of Investigation）联邦调查局（负责美国境内）

CIA（Central Intelligence Agency）中央情报局（负责国外）
例句：Over the past years, Dr. and Mrs. Lee have worked for both FBI and CIA.（过去多年来李博士夫妇都为 FBI 和 CIA 工作）

FDA（Food and Drug Administration）美国食品药物管理局
例句：This new drug has to be approved by the FDA.（这新药要经 FDA 批准）

USDA（United States Department of Agriculture）美国农业部
例句：USDA supplies myriad of information on agriculture market.（有关农业市场，USDA 供应大量资料。）

IRS（Internal Revenue Service）美国税务局
例句：Employees working for IRS should be courteous toward tax payers.（IRS 员工对纳税人应该有礼貌）

NAACP（National Association for the Advancement of Color People）(全国黑人权益促进会，即黑人为了增进权益的最大机构）
例句：Many African－Americans join NAACP.（许多美国黑人参加 NAACP）

NIH（National Institute of Health）
例句：Mr. Wang has worked at NIH as a researcher.（王先生在 NIH 担任研究员）

AARP (American Association of Retired People.)（美国退休人员协会）
例句：At age 50, you are eligible to be a member of AARP.（如果你 50 岁就可以成为 AARP 的会员)

AAUP (American Association of University Professors) (美国大学教授协会）
例句：The AAUP has many branches at different colleges and universities in the U.S. (AAUP 在美国各大学有很多分会)

SCORE (Services Corps of Retired Executives)（退休主管服务队）(这是美国企业界主管退休后，免费担任顾问，协助年轻人创业的团体。）
(注意：corps 单复数一样，发音与 corpse 不同，要小心。）
(注：老外在机构名称缩写字前面，有时加冠词 the, a ,an，有时不加，不过在正式文件里，通常都加。）

2. 一般考试名称：

SAT (Scholastic Aptitude Test) 学术能力倾向测验 (就是美国为高中生想进大学而设的考试)
例句：The well－known universities accept new students based on SAT scores and well－rounded personalities. (名大学接受新生根据 SAT 成绩及各方面优良的品德)

GPA (Grade Point Average)（学业成绩总平均）
例句：His GPA always stands on the top of his class. (他的 GPA 都是全班第一)

GED (General Equivalent Diploma); 一般同等文凭（高中没有毕业的学生，如果参加 GED，及格后，就可取得高中毕业证书)
例句：If he passes GED test, he will earn a high school diploma.

AP (advanced placement) 在校高中生，如果选修 AP 课程，考试及格，将来进大学时，可不必再修。
例句：His son took some AP courses at high school.

GMAT (Graduate Management Admission Test) 美国为攻读企管硕士 (MBA) 学生而设的入学考试
例句：In order to enter a MBA program, you need a high score on GMAT.

LSAT (Law School Admission Test) 美国为攻读法律学生而设的入学考试
例句：He did very well in his LSAT. (他的 LSAT 考得不错)

MCAT (Medical College Admission Test) 美国为进入医学院学生而设的考试
例句：Do you think he will do well in his MCAT?

GRE (Graduate Record Exam) 这是美国大学研究所对一般研究生的入学考试
例句：Most American graduate schools require GRE scores.(多半美国研究所需要 GRE 成绩)

TOEFL (Test of English as a Foreign Language) 外国学生想进美国大学的英语能力考试(即所谓：「托福」考试)
例句：Almost all Chinese college graduates are required to take TOEFL if they come to the U.S. for advanced degrees. (几乎所有的中国大学毕业生都要参加 TOEFL，假如他们要到美国取得高学位的话。)

CLEP（College Level Exam Program) 任何人只要有学识专长，都可参加这种考试，一旦及格，就可取得大学的学分。
例句：As long as you pass CLEP, You may earn college credits.（只要你通过 CLEP，就能获得大学学分。）
(注：老外一般所谓「大学」只说 College，不说 University）

ESOL（English for Speakers of Other Languages）这是美国为新来移民或外国学生所设的特别英语课程。也叫 ESL（English as a Second Language）
例句：Many American campuses offer ESOL courses for foreign students.（许多美国校园为外国学生开设 ESOL 课程）

3. 一般生活方面：

EOE (Equal Opportunity Employer) 这是美国各机构招考员工时向申请工作者表明自己是「平等机会雇主」。
例句：All African-Americans hope that their employments will be based on EOE.（所有美国黑人都希望他们的工作机会均等）

DOQ (Depending on Qualifications) 根据申请工作者的资历决定是否雇用。
例句：The DOQ policy is being used by our school in hiring new teachers. (聘请新教师时，本校采用 DOQ 政策。)

PR (Public Relation) 公共关系
例句：The college president wants to improve its PR with the community.（大学校长想与社区增进公共关系）

CEO (Chief Executive Officer) 最高行政执行长 (多半指企业界或公司领导人)
例句：The CEO of this company will resign because of poor health. (这公司的 CEO 因为身体不好而辞职)

CPA (Certified Public Accountant) 美国有执照的会计师
例句：Do you have a CPA to prepare your income tax?（你有 CPA 为你报税吗？）

COLA (Cost of Living Adjustment) 生活费用的调整（即加薪时是按生活指数而定）
例句：Our annual pay raise will be based on COLA.

STD (Sexually Transmitted Disease) = VD = Venereal Disease 性病（现在 STD 较常用）
例句：Many teen-agers face STD problems.（许多青少年面临 STD 问题）

SOA (Sexually oriented Advertisement) 有关性方面的广告
例句：Don\'t you feel we have too much SOA in the media?（你不认为在媒体上有太多的 SOA 吗？）

GOP (Grand Old Party) 美国共和党另一称呼 = Republican Party
例句：The GOP has nominated Mr. Bush as its Presidential candidate.（GOP 已提名 Bush 先生为总统候选人）

PMS (Pre-menstrual Syndrome) 这是女人在月经前不舒服或心情不好所常用的缩写字
例句：Don\'t bother her; she has PMS.

ADHD (Attention Deficit Hyperactivity Disorder) 指青少年不能集中注意力，静不下来的一种病症。
例句：Tens of thousands of youngsters are suffering from ADHD in the U.S. (在美国成千上万的青少年有 ADHD 的毛病)

RSVP (Respondez sil vous plait) 这是法文，通常在请帖上使用的「敬请回音」= Please reply（或 respond）
例句：There is“RSVP”on the invitation card.

BYOB (bring your own bottle) 老外请客时，为了减少负担或个人爱好酒的品种，在请帖上注明「请自己带酒」。
例句：Whenever he invites guests, he asks “BYOB”。 (他只要请客，就要人家自己带酒。)

AIDS (Acquired Immune Deficiency Sydrome) 爱滋病
例句：AIDS has spread all over the world.

CPR (Cardiopulmonary resuscitation) 心脏病急救法
例句：Everyone should learn how to do CPR.

EKG (Electrocardiography) 心电图检查 (不是 ECG)
例句：Her physician asks her to have an EKG next week. (医生要她下周做 EKG)

IV (intravenous injection) 为病人注射的点滴
例句：In the hospital emergency room, I saw a patient with an IV on his arm. (在医院大的急诊病房里，我看见一个病人在打点滴）
2006-10-19 16:47 狼大
网络常用英文缩写含义

WWW----万维网(World Wide Wdb)；
Http---超文本传输协议(Hypertext transfer protocol)；
FTP----文件传输协议(File Transfer Protocol)；
TCP----传输控制协议(Transmission Control Protocol)；
IP-----网际协议(Internet Protocol)；
ISP----网络服务提供商(Internet Service Provider)；
DNS----域名服务器(Domain Name Server)；
IE-----网络浏览器(Internet Explorer)；
OE-----邮件收发软件(Outlook Express)；
BBS----电子布告栏系统；
OICQ---网上聊天工具；
LAN----局域网(Local Area Network)；
MAN----城域网(Metropolitan Area Network)；
WAN----广域网(Wide Area Network)；
企业常用英文缩写

5S : 5S管理
ABC : 作业制成本制度 (Activity-Based Costing)
ABB : 实施作业制预算制度 (Activity-Based Budgeting)
ABM : 作业制成本管理 (Activity-Base Management)
APS : 先进规画与排程系统 (Advanced Planning and Scheduling)
ASP : 应用程序服务供货商（Application Service Provider）
ATP : 可承诺量 (Available To Promise)
AVL : 认可的供货商清单(Approved Vendor List)
BOM : 物料清单 (Bill Of Material)
BPR : 企业流程再造 (Business Process Reengineering)
BSC : 平衡记分卡 (Balanced ScoreCard)
BTF : 计划生产 (Build To Forecast)
BTO : 订单生产 (Build To Order)
CPM : 要径法 (Critical Path Method)
CPM : 每一百万个使用者会有几次抱怨(Complaint per Million)
CRM : 客户关系管理 (Customer Relationship Management)
CRP : 产能需求规划 (Capacity Requirements Planning)
CTO : 客制化生产 (Configuration To Order)
DBR : 限制驱导式排程法 (Drum-Buffer-Rope)
DMT : 成熟度验证(Design Maturing Testing)
DVT : 设计验证(Design Verification Testing)
DRP : 运销资源计划 (Distribution Resource Planning)
DSS : 决策支持系统 (Decision Support System)
EC : 设计变更／工程变更 (Engineer Change)
EC : 电子商务 (Electronic Commerce)
ECRN : 原件规格更改通知(Engineer Change Request Notice)
EDI : 电子数据交换 (Electronic Data Interchange)
EIS : 主管决策系统 (Executive Information System)
EMC : 电磁相容(Electric Magnetic Capability)
EOQ : 基本经济订购量 (Economic Order Quantity)
ERP : 企业资源规划 (Enterprise Resource Planning)
FAE : 应用工程师(Field Application Engineer)
FCST : 预估(Forecast)
FMS : 弹性制造系统 (Flexible Manufacture System)
FQC : 成品质量管理 (Finish or Final Quality Control)
IPQC: 制程质量管理 (In-Process Quality Control)
IQC : 进料质量管理 (Incoming Quality Control)
ISO : 国际标准组织 (International Organization for Standardization)
ISAR: 首批样品认可(Initial Sample Approval Request)
JIT : 实时管理 (Just In Time)
KM   ： 知识管理 (Knowledge Management)
L4L : 逐批订购法 (Lot-for-Lot)
LTC : 最小总成本法 (Least Total Cost)
LUC : 最小单位成本 (Least Unit Cost)
MES : 制造执行系统 (Manufacturing Execution System)
MO : 制令(Manufacture Order)
MPS : 主生产排程 (Master Production Schedule)
MRO : 请修(购)单(Maintenance Repair Operation)
MRP : 物料需求规划 (Material Requirement Planning)
MRPII : 制造资源计划 (Manufacturing Resource Planning)
NFCF : 更改预估量的通知Notice for Changing Forecast
OEM : 委托代工 (Original Equipment Manufacture)
ODM : 委托设计与制造 (Original Design & Manufacture)
OLAP : 在线分析处理 (On-Line Analytical Processing)
OLTP : 在线交易处理 (On-Line Transaction Processing)
OPT : 最佳生产技术 (Optimized Production Technology)
OQC : 出货质量管理 (Out-going Quality Control)
PDCA : PDCA管理循环 (Plan-Do-Check-Action)
PDM : 产品数据管理系统 (Product Data Management)
PERT : 计划评核术 (Program Evaluation and Review Technique)
PO : 订单(Purchase Order)
POH : 预估在手量 (Product on Hand)
PR : 采购申请Purchase Request
QA : 品质保证(Quality Assurance)
QC : 质量管理(Quality Control)
QCC : 品管圈 (Quality Control Circle)
QE : 品质工程(Quality Engineering)
RCCP : 粗略产能规划 (Rough Cut Capacity Planning)
RMA : 退货验收Returned Material Approval
ROP : 再订购点 (Re-Order Point)
SCM : 供应链管理 (Supply Chain Management)
SFC : 现场控制 (Shop Floor Control)
SIS : 策略信息系统 (Strategic Information System)
SO : 订单(Sales Order)
SOR : 特殊订单需求(Special Order Request)
SPC : 统计制程管制 (Statistic Process Control)
TOC : 限制理论 (Theory of Constraints)
TPM : 全面生产管理Total Production Management
TQC : 全面质量管理 (Total Quality Control)
TQM : 全面品质管理 (Total Quality Management)
WIP : 在制品 (Work In Process)

国家英文缩写爱的诠释

Holland（荷兰）：Hope our love lasts and never dies.希望我们的爱延续到永远。
Italy（意大利）：I trust and love you.我相信你、爱你。
Libya（利比亚）：Love is beautiful;you also.爱是美丽的，你也是。
France（法国） ：Friendships remain and never can end.友谊永存。
China（中国） ：Coma here,I need affection.来这儿，我需要爱。
Burma（缅甸） ：Between us,remember me always.在我们之间，要常记得我哦。
Nepal（尼泊尔）：Never ever part as lovers.像相爱的人一样永不分开。
India（印度） ：I nearly died in adoration.我差点在爱恋中死去。
Canada（加拿大）：Cute and naughty action that developed into attraction.可爱和顽皮的举动会变成吸引力的。
Egypt（埃及） ：Everything's great,you pretty thing.真是十全十美，你这漂亮的家伙。


国家国际域名英文缩写汇总

A字头
AE-阿联酋(UNITED EMIRATES)
AF-阿富汗(AFGHANISTAN)
AL-阿尔巴尼亚(ALBANIA)
AM-亚美尼亚(ARMENIA)
AO-安哥拉(ANGOLA)
AR-阿根廷(ARGENTINA)
AT-奥地利(AUSTRIA)
AU-澳大利亚(AUSTRALIA)
AZ-阿塞拜疆(AZERBAIJAN(REPUBLIC))

B字头
BD-孟加拉(BANGLADESH)
BE-比利时(BELGIUM)
BF-布基纳法索(BURKINA FASO)
BG-保加利亚(BULGARIA)
BH-巴林(BAHREIN)
BI-布隆迪(BURUNDI)
BJ-贝宁(BENIN)
BL-巴勒斯坦()
BN-文莱(BRUNEI DARUSSALAM)
BO-玻利维亚(BOLIVIA)
BR-巴西(BRAZIL)
BW-博茨瓦纳(BOTSWANA)
BY-白俄罗斯(BYELORUSSIA)

C字头
CA-加拿大(CANADA)
CF-中非(CENTRAL AFRICA)
CG-刚果(CONGO)
CH-瑞士(SWITZERLAND)
CL-智利(CHILE)
CM-喀麦隆(CAMEROON)
CN-中国(CHINA)
CO-哥伦比亚(COLOMBIA)
CR-哥斯达黎加(COSTA RICA)
CS-捷克(CZECH REPUBIC)
CU-古巴(CUBA)
CY-塞浦路斯(CYPRUS)

D字头
DE-德 国(GERMANY)
DK-丹麦(DENMARK)
DO-多米尼加共和国(DOMINICAN REPUBLIC)
DZ-阿尔及利亚(ALGERIA)

E字头
EC-厄瓜多尔(ECUADOR)
EE-爱沙尼亚(ESTONIA)
EG-埃及(EGYPT)
ES-西班牙(SPAIN)
ET-埃塞俄比亚(ETHIOPIA)

F字头
FI-芬兰(FINLAND)
FJ-斐济(FIJI)
FR-法国(FRANCE)

G字头
GA-加蓬(GABON)
GB-英国(UNITED KINGDOM)
GD-格林纳达(GRENADA)
GE-格鲁吉亚(GEORGIA)
GH-加纳(GHANA)
GN-几内亚(GUINEA)
GR-希腊(GREECE)
GT-危地马拉(GUATEMALA)

H字头
HK-香港特别行政区(HONG KONG)
HN-洪都拉斯(HONDURAS)
HU-匈牙利(HUNGARY) 　

I字头
ID-印度尼西亚(INDONESIA)
IE-爱尔兰(IRELAND)
IL-以色列(ISRAEL)
IN-印度(INDIA)
IQ-伊拉克(IRAQ)
IR-伊朗(IRAN)
IS-冰岛(ICELAND)
IT-意大利(ITALY)

J字头
JM-牙买加(JAMAICA)
JO-约旦(JORDAN)
JP-日本(JAPAN)

K字头
KG-吉尔吉斯坦(KYRGYZSTAN)
KH-柬埔寨(KAMPUCHEA(CAMBODIA))
KP-北朝鲜(KOREA,DEM.PEOPLE’S)
KR-韩国(REPUBLIC OF KOREA)
KT-科特迪瓦共和国(COTE O’IVOIRE)
KW-科威特(KUWATI)
KZ-哈萨克(KAZAKHSTAN)

L 字头
LA-老挝(LAOS)
LB-黎巴嫩(LEBANON)
LC-圣卢西亚(SAINT LUEIA)
LI-列支敦士登(LIECHTENSTEIN)
LK-斯里兰卡(SRI LANKA)
LR-利比里亚(LIBERIA)
LT-立陶宛(LITHUANIA)
LU-卢森堡(LUXEMBOURG)
LV-拉脱维亚(LATVIA)
LY-利比亚(LIBYAN)

M字头
MA-摩洛哥(MOROCCO)
MC-摩纳哥(MONACO)
MD-摩尔多瓦(MOLDOVA,REPUBLIC OF)
MG-马达加斯加(MADAGASCAR)
ML-马里(MALI)
MM-缅甸(BURMA(MYANMAR))
MN-蒙古(MONGOLIA)
MO-澳门地区(MACAU)
MT-马耳他(MALTA)
MU-毛里求斯(MAURITIUS)
MW-马拉维(MALAWI)
MX-墨西哥(MEXICO)
MY-马来西亚(MALAYSIA)
MZ-莫桑比克(MOZAMBIQUE)

N字头
NA-纳米比亚(NAMIBIA)
NE-尼日尔(NIGER)
NG-尼日利亚(NIGERIA)
NI-尼加拉瓜(NICARAGUA)
NL-荷兰(NETHERLANDS)
NO-挪威(NORWAY)
NP-尼泊尔(NEPAL)
NZ-新西兰(NEW ZEALAND)

O字头
OM-阿曼(OMAN)

P字头
PA-巴拿马(PANAMA)
PE-秘鲁(PERU)
PG-巴布亚新几内亚(PAPUA NEW GUINEA)
PH-菲律宾(PHILIPPINES)
PK-巴基斯坦(PAKISTAN)
PL-波兰(POLAND)
PT-葡萄牙(PORTUGAL)
PY-巴拉圭(PARAGUAY)

Q字头
QA-卡塔尔(QATAR)

R字头
RO-罗马尼亚(ROMANIA)
RU-俄罗斯(RUSSIAN FEDERATION)

S字头
SA-沙特阿拉伯(SAUDI ARABIA)
SC-塞舌尔(SEYCHELLES)
SD-苏丹(SUDAN)
SE-瑞典(SWEDEN)
SG-新加坡(SINGAPORE)
SI-斯洛文尼亚(SLOVENIA)
SK-斯洛伐克(SLOVAKIA)
SM-圣马力诺(SAN MARINO)
SN-塞内加尔(SENEGAL)
SO-索马里(SOMALIA)
SY-叙利亚(SYRIA)
SZ-斯威士兰(SWAZILAND)

T 字头
TD-乍得(CHAD)
TG-多哥(TOGO)
TH-泰国(THAILAND)
TJ-塔吉克斯坦(TAJIKISTAN)
TM-土库曼(TURKMENISTAN)
TN-突尼斯(TUNISIA)
TR-土耳其(TURKEY)
TW-台湾省(TAIWAN)
TZ-坦桑尼亚(TANZANIA)

U字头
UA-乌克兰(UKRAINE)
UG-乌干达(UGANDA)
US-美国(UNITED STATES)
UY-乌拉圭(URUGUAY)
UZ-乌兹别克(UZBEKISTAN)

V 字头
VC-圣文森特岛(SAINT VINCENT)
VE-委内瑞拉(VENEZUELA)
VN-越南(VIET NAM)

Y 字头
YE-也门(YEMEN)
YU-南斯拉夫联盟(YUGOSLAVIA)

Z 字头
ZA-南非(SOUTH AFRICA)
ZM-赞比亚(ZAMBIA)
ZR-扎伊尔(ZAIRE)
ZW-津巴布韦(ZIMBABWE)


常用英文单词缩写

WTO----world trade organization   世贸
CEO----chief executive officer    总裁
R&B----research and development   研究开发
CAD----computer assisted design    计算机辅助设计
CTV----cable television  有线电视
PCS----program controltches   程控电话交换机
IDD----international direct dialing  国际长途直拨
Int-tele----internet telephone  因特网电话
Mob tele----mobile telephone   移动电话
B-ISTN---- 宽带综合业务数字网
E-b----E-business   电子商务
SOE----state-owned enterprise      国有企业
FIE----foreign-invested enterprise   外资企业
FDI----foreign direct investment   外国直接投资
JV ----joint venture    合资经营
SEZ----special economic zone  经济特区
TQC----total quality control  全面质量管理
CI ----corporate image   企业形象
h.o.---head office    总部
IT-----information industry     信息产业
memo---memora0000       备忘录
5yr-P-----Five-Year Plan          五年计划
telcom-----telecommunication      通讯

外贸

　1 C&F (cost&freight)成本加运费价


　　2 T/T (telegraphic transfer)电汇


　　3 D/P (document against payment)付款交单


　　4 D/A (document against acceptance)承兑交单


　　5 C.O (certificate of origin)一般原产地证


　　6 G.S.P. (generalized system of preferences)普惠制


　　7 CTN/CTNS (carton/cartons)纸箱


　　8 PCE/PCS (piece/pieces)只、的个、的支等


　　9 DL/DLS (dollar/dollars)美元


　　10 DOZ/DZ (dozen)一打


　　11 PKG (package)一包，一捆，一扎，一件等


　　12 WT (weight)重量


　　13 G.W. (gross weight)毛重


　　14 N.W. (net weight)净重


　　15 C/D (customs declaration)报关单


　　16 EA (each)每个，各


　　17 W (with)具有


　　18 w/o (without)没有


　　19 FAC (facsimile)传真


　　20 IMP (import)进口


　　21 EXP (export)出口


　　22 MAX (maximum)最大的、的最大限度的


　　23 MIN (minimum)最小的，最低限度


　　24 M 或MED (medium)中等，中级的


　　25 M/V (merchant vessel)商船


　　26 S.S (steamship)船运


　　27 MT或M/T (metric ton)公吨


　　28 DOC (document)文件、的单据


　　29 INT (international)国际的


　　30 P/L (packing list)装箱单、的明细表


　　31 INV (invoice)发票


　　32 PCT (percent)百分比


　　33 REF (reference)参考、的查价


　　34 EMS (express mail special)特快传递


　　35 STL. (style)式样、的款式、的类型


　　36 T或LTX或TX(telex)电传


　　37 RMB (renminbi)人民币


　　38 S/M (shipping marks)装船标记


　　39 PR或PRC (price) 价格


　　40 PUR (purchase)购买、的购货


　　41 S/C (sales contract)销售确认书


　　42 L/C (letter of credit)信用证


　　43 B/L (bill of lading)提单


　　44 FOB (free on board)离岸价


　　45 CIF (cost,insurance&freight)成本、的保险加运费价


　　补充：


　　CR=credit贷方，债主


　　DR=debt借贷方


　　（注意：国外常说的debt card，就是银行卡，credit card就是信誉卡。这里都是指银行和财务公司说的，你的银行卡，是你将钱放入银行，银行是“借贷方”，所以叫做debt卡。用credit卡，是你从银行或者财政公司借钱，银行或公司是“贷方”，所就叫credit。）


　　Exp=Expense花费，费用


　　O/H=overhead常用开支


　　TC=total cost总费用


　　FC=fixed cost常设费用


　　VC=variable cost变动费用


　　P=profit竟利润


　　S=sales销售总额


　　Rev=revenue利润


　　MC=marginal cost费用差额


　　GM=gross margin毛利


　　MR=marginal revenue利润差额


　　A/R=acount receivable待收款（销售后，记账以后收取。）


　　A/P=account payable代付费（花费后记账，以后付费。）


　　PMT=payment支付款


　　N/I=net income纯收入


　　AMT=amount数额


　　DCT=discount打折
书籍

英文全称 缩写 中文
Abstracts Abstr 文摘
Abbreviation 缩语和略语
Acta 学报
Advances 进展
Annals Anna. 纪事
Annual Annu. 年鉴，年度
Semi-Annual 半年度
Annual Review 年评
Appendix Appx 附录
Archives 文献集
Association Assn 协会
Author 作者
Bibliography 书目，题录
Biological Abstract BA 生物学文摘
Bulletin 通报，公告
Chemical Abstract CA 化学文摘
Citation Cit 引文，题录
Classification 分类，分类表
College Coll. 学会，学院
Compact Disc-Read only Memory CD-ROM 只读光盘
Company Co. 公司
Content 目次
Co-term 配合词，共同词
Cross-references 相互参见
Digest 辑要，文摘
Directory 名录，指南
Dissertations Diss. 学位论文
Edition Ed. 版次
Editor Ed. 编者、编辑
Excerpta Medica EM 荷兰《医学文摘》
Encyclopedia 百科全书
The Engineering Index Ei 工程索引
Et al 等等
European Patent Convertion EPC 欧洲专利协定
Federation 联合会
Gazette 报，公报
Guide 指南
Handbook 手册
Heading 标题词
Illustration Illus. 插图
Index 索引
Cumulative Index 累积索引
Index Medicus IM 医学索引
Institute Inst. 学会、研究所
International Patent Classification IPC 国际专利分类法
International Standard Book Number ISBN 国际标准书号
International Standard Series Number ISSN 国际标准刊号
Journal J. 杂志、刊
Issue 期（次）
Keyword 关键词
Letter Let. 通讯、读者来信
List 目录、一览表
Manual 手册
Medical Literature Analysis and MADLARS 医学文献分析与检索系统
Retrieval System
Medical Subject Headings MeSH 医学主题词表
Note 札记
Papers 论文
Patent Cooperation Treaty PCT 国际专利合作条约
Precision Ratio 查准率
Press 出版社
Procceedings Proc. 会报、会议录
Progress 进展
Publication Publ. 出版物
Recall Ratio 查全率
Record 记录、记事
Report 报告、报导
Review 评论、综述
Sciences Abstracts SA 科学文摘
Section Sec. 部分、辑、分册
See also 参见
Selective Dissemination of Information SDI 定题服务
Seminars 专家讨论会文集
Series Ser. 丛书、辑
Society 学会
Source 来源、出处
Subheadings 副主题词
Stop term 禁用词
Subject 主题
Summary 提要
Supplement Suppl. 附刊、增刊
Survey 概览
Symposium Symp. 专题学术讨论会
Thesaurus 叙词表、词库
Title 篇名、刊名、题目
Topics 论题、主题
Transactions 汇报、汇刊
Volume Vol. 卷
World Intellectual Property Organization WIPO 世界知识产权
World Patent Index WPI 世界专利索引
Yearbook 年鉴

生理

AKP alkaline phosphatase 碱性磷酸酶
AIDS aquired immunodeficiency syndrome 获得性免疫缺陷综合症
BPH benign prostatic hyperplasia 良性前列腺增生症
BUN blood urea nitrogen 血尿素氮
BG blood group 血型
CT computed tomography
Ccr endogenous creatinine clearance rate 内生肌酐清除率
Eps expressed prostatic secretious 前列腺液
ESWL extracorporeal shock wave lithotripsy 体外冲击波碎石
GFR glomerular filtration rate 肾小球滤过率
IVP intravenous pyelography 静脉肾盂造影
KUB plain film of kidney-ureter-bladder 尿路平片
HIFU high intersity foused ultrasound 高能聚焦超声
TURP transurethral prostatic resection 经尿道前列腺切除术
TURBt transurethral bladder tumer resection 经尿道膀胱肿瘤切除术
Scr serum creatinine 血肌酐
STDs serxual transmitted disease 性传播疾病
HIV human immunodeficiency virus 人类免疫缺陷病毒
BBT basal body temperature 基础体温
PCNL percutaneous nephrostolitho tomy 经皮肾镜取石
PG prostal glandin 前列腺液
PSA prostate specific antigen 前列腺特异抗原
ERPF effective renal plasma flow 有效肾血浆流量
RPF renal blood plasma flow 肾全血流量
PAP prostatic acid phosphatase 前列腺酸性磷酸酶
ECG electrocardiogram 心电图
DRE directeral rectun examination 直肠指检
REP retrograde pyelography 逆行造影
TRus transrectun ultrasound 直肠B超
NMP22 核基质蛋白
MRI
BM bowel movement 肠蠕动，排便
BMR basal metabolic rate 基础代谢率
BP blood pressure 血压
BS blood sugar 血糖
BUN blood urea nitrogen 血液尿素氮
BUS blood, urine, stool 血液，小便，大便
BW body weight 体重
C Celsius, centigrade 度（摄氏温度计）
C1,C2, cervical vertebrae 1,2 第一颈椎，第二颈椎，
C with 和
Ca calcium 钙
CA, Ca. Carcinoma 癌
cap,caps. Capsule 胶囊，胶囊剂
CAT computerized axial tomography 电脑断层检查
CB complete blood count 全血球计数

C.C chief complaint 主诉
c.c cubic centimeter 毫升
C & E consultation and examination 会诊及检查
CM coming morning 明晨
CNS central nervous system 中枢神经系统
C/O complains of 主诉
CPR cardiopulmonary resuscitation 心肺复苏术
CSF cerebrospinal fluid 脑脊髓液
CV cardiovascular 心脏血管的
CVP central venous pressure 中心静脉压
DC,D/C discontinue 停止
DD differential diagnosis 鉴别诊断
dil. Dilute 稀释
dist. Distilled 蒸馏
DOA dead on arrival 到达时已死亡

DPT diphtheria, pertussis, tetanus 白喉，百日咳，破伤风
D/S dextrose and saline 葡萄糖与盐水
D/W dextrose in water 葡萄糖水
Dx diagnosis 诊断
ECG electrocardiogram 心电图
ECM external cardiac massage 体外心脏按摩
E.coli Escherichia coli 大肠杆菌
EDD effective drug duration 药物有效时间
EEG electroencephalogram 脑电图
e.g. for example 例如
elb. Elbow 肘
EMG electromyogram 肌电图
emul emulsion 乳剂
en. enema 灌肠
e.o.d every other day 每隔一日
eq equivalent 同量
ESR erythrocyte sedimentation rate 血球沉降率
est estimated 估计的
et al and others 及其他
ect et cetera 等等
eval evaluation 审查 评值
ex examined 检查过的
exam examination 检查
exc excision 切除
exp expired 死亡的
Exp. Lap，exp.lap. exploratory laparotomy 剖宫探查术
ext. extension 伸直
external 外在的
externus 外用
F Fahrenheit 华氏（温度计华氏表）
Female 女性（的）
FBS fasting blood sugar 禁食血糖测定
Fe iron 铁
FH, FHx family history 家庭史
fl,fld, fluid 液体
flex flexion 弯屈
fl. oz. fluid ounce 液两（英药量单位）
freq frequency 次数
frict friction 摩擦
ft foot 足，英尺
5-FU 5-Fluorouracil 抗癌药
g gram 克
GA general anesthesia 全身麻醉
ga gargale, gargarism 含漱剂
gel gelatum 凝胶
 
学位的简称写法

B.A. or BA 文学士 （BACHELOR OF ARTS）
B.S. or BS 理学士 （BACHELOR OF SCIENCE）
M.A. or MA 文科硕士 （MASTER OF ARTS）
M.S. or MS 理科硕士 （MASTER OF SCIENCE）
M.B.A. 工商管理硕士 （MASTER OF BUSINESS ADMINISTRATION）
PH.D 哲学博士 （DOCTOR OF PHILOSOPHY）
D.S. 理学博士 （DOCTOR OF SCIENCE）
M. D. 医学博士 （DOCTOR OF MEDICINE）
ENG.D 工学博士 （DOCTOR OF ENGINEERING）

建筑物、地址、街道通名与方位名的简称

APT. 公寓 （APARTMENT）
RM. 房间、室 （ROOM）
FL. （楼房的）层 （FLOOR）
BLDG. 大厦、大楼 （BUILDING）
BLVD. 林荫大道 （BOULEVARD）
ST. 街 （STREET）
RD. 路、大道 （ROAD）
SQ. 广场 （SQUARE）
AVE. 大街、大道 （AVENUE）
BLK. 街区 （BLOCK）
CTR. 中心 （CENTER）
DIST. 地区、区 （DISTRICT）

E.,S.,W.,N. 东、南、西、北(EAST, SOUTH, WEST, NORTH)
N.E.,S.E.,etc. 东北、东南等 (NORTHEAST, SOUTHEAST, etc.)

机构的缩写

DEPT. 系、部、局 （DEPARTMENT）
MIN. （政府的）部门 （MINISTRY）
ORGN. 组织 （ORGANIZATION）
SCH. 学校 （SCHOOL）
UNIV. 大学 （UNIVERSITY）
INST. 协会/研究所 （INSTITUTION/INSTITUTE）
GOVT. 政府 （GOVERNMENT）
CO. 公司、商号 （COMPANY）
LTD.(CO., LTD) 股份有限公司 (LIMITEDLIABILITY COMPANY）
CORP. 法人、公司 （CORPORATION）
INC. （美）股份有限公司（INCORPORATED）

其它方面的简称

DR. 博士、医生 （DOCTOR）
PROF. 教授 （PROFESSOR）

INT'L 国际的 （INTERNATIONAL）
NAT'L 国家的、国内的 （NATIONAL）

HT. 高度、海拔 （HEIGHT）
NO. 号码、数字、序号 （NUMBER）

M. 公尺 （METRE）
CM. 公分、厘米 （CENTIMETRE）
KG. 公斤 （KILOGRAMME）
 
常用汽车英文缩写

1
 ABC
 车身主动控制系统
 
2
 ABS
 防死锁制动系统
 
3
 Ap
 恒时全轮驱动
 
4
 ASM
 动态稳定系统
 
5
 ASR
 加速防滑系统
 
6
 AS
 转向臂
 
7
 A TRC
 车身主动循迹控制系统
 
8
 AYC
 主动偏行系统
 
9
 Az
 接通式全轮驱动
 
10
 BAS
 制动辅助系统
 
11
 BCM
 车身控制模块~
 
12
 BF
 钢板弹簧悬挂
 
13
 B
 水平对置式排列多缸发动机
 
14
 CVTC
 连续可变气门正时机构
 
15
 DAC
 下坡行车辅助控制系统
 
16
 DB
 减震器支柱
 
17
 DCS
 车身动态控制系统
 
18
 DD
 缸内直喷式柴油发动机
 
19
 DD
 德迪戎式独立悬架后桥
 
20
 DOHC
 顶置气门，双上置凸轮轴
 
21
 DQL
 双横向摆臂
 
22
 DSC
 车身稳定控制系统
 
23
 DS
 扭力杆
 
24
 Dynamic.Drive
 主动式稳定杆
 
25
 D
 柴油发动机（共轨）
 
26
 EBA
 紧急制动辅助系统
 
27
 EBD
 电子制动力分配系统
 
28
 EDS
 电子差速锁
 
29
 ED
 缸内直喷式汽油发动机
 
30
 EGR
 废气循环再利用
 
31
 EM
 多点喷射汽油发动机
 
32
 ESP
 电子稳定程序系统
 
33            
 ES
 单点喷射汽油发动机
 
34
 FB
 弹性支柱
 
35
 FF
 前置引擎前轮驱动
 
36
 FF
 前轮驱动
 
37
 Fi
 前置发动机（纵向）
 
38
 Fq
 前置发动机（横向）
 
39
 FR
 前置引擎后轮驱动
 
40
 FR
 后轮驱动
 
41
 FSI
 直喷式汽油发动机
 
42
 GF
 橡胶弹簧悬挂
 
43
 GPS
 车载卫星定位导航系统
 
44
 HAC
 坡道起车控制系统
 
45
 HBA
 液压刹车辅助系统
 
46
 HDC
 坡道控制系统
 
47
 HF
 液压悬架
 
48
 Hi
 后置发动机（纵向）
 
49
 HP
 液气悬架阻尼
 
50
 Hq
 后置发动机（横向）
 
51
 ICM
 点火控制模块~
 
52
 i Drive
 智能集成化操作系统
 
53
 LF
 空气弹簧悬挂
 
54
 LL
 纵向摆臂
 
55
 MAP
 空气流量计
 
56
 MA
 机械增压
 
57
 Mi
 中置发动机（纵向）
 
58
 ML
 多导向轴
 
59
 Mq
 中置发动机（横向）
 
60
 Multitronic
 多极子无级自动变速器
 
61
 NOS
 氧化氮气增压系统
 
62
 OHC
 顶置气门，上置凸轮轴
 
63
 OHV
 顶置气门，侧置凸轮轴
 
64
 PCM
 动力控制模块~
 
65 PD
 泵喷嘴
 
66 QL
 横向摆臂
 
67 QS
 横向稳定杆
 
68 Quattro
 全时四轮驱动系统
 
69 RR
 后置引擎后轮驱动
 
70 R
 直列多缸排列发动机
 
71 SAHR
 主动性头枕
 
72 SA
 整体式车桥
 
73 SDi
 自然吸气式超柴油发动机
 
74 SFI
 连续多点燃油喷射发动机
 
75 SF
 螺旋弹簧悬挂
 
76 Si
 内通风盘式制动
 
77 SL
 斜置摆臂
 
78 SRS
 双安全气囊
 
79 ST
 无级自动变速器
 
80 ST
 无级自动变速器
 
81 S
 盘式制动
 
82 TA
 Turbo（涡轮增压）
 
83 TCS
 牵引力控制系统
 
84 TDi
 Turbo直喷式柴油发动机
 
85 Tiptronic
 轻触子自动变速器
 
86 TRC
 牵引力控制系统
 
87 T
 鼓式制动
 
88 VL
 复合稳定杆式悬架后桥
 
89 VSC
 车身稳定控制系统
 
90 VVT- i
 气门正时机构
 
91 VVTL- i
 气门正时机构
 
92 V
 V型汽缸排列发动机
 
93 V
 化油器
 
94 WA
 汪克尔转子发动机
 
95 W
 W型汽缸排列发动机-缸内直喷式发动机（分层燃烧/均质燃烧
 
常用服装英语缩写

A.H. ARMHOLE 夹圈
ABS AREA BOUNDED STAPLE FABRIC 面粘非织造布
ADL ACCEPTABLE DEFECT LEVEL 允许疵点标准
AQL ACCEPTABLE QUALITY LEVEL 验收合格标准
ATTN. ATTENTION 注意
AUD. AUDIT 稽查
B. BACK 后
B.H. BUTTON HOLE 钮门/扣眼
B.L. BACK LENGTH 后长
B.P. BUST POINT 胸点
BK. BLACK 黑色
BL BUST LINE 胸围线
BMT BASIC MOTION TIME 基本动作时间
BNL BACK NECKLINE 后领圈线
BNP/BNPT BACK NECK POINT 后领点
BR BACK RISE 后浪
BSP BACK SHOULDER POINT 后肩颈点
BTM. BOTTOM 衫脚
BTN. BUTTON 钮扣
C.V.C. CHIEF VALUE OF COTTON 棉为主的混纺物
C/B (C.B.) CENTER BACK 后中
C/F (C.F.) CENTER FRONT 前中
CAD COMPUTER AIDED DESIGN 电脑辅助设计
CAE COMPUTER AIDED ENGINEERING 电脑辅助工程
CAL COMPUTER AIDED LAYOUT 电脑辅助排料
CAM COMPUTER AIDED MANUFACTURE 电脑辅助制造
CAP COMPUTER AIDED PATTERN 电脑辅助画样
CBF CENTER BACK FOLD 后中对折
CBL CENTER BACK LINE 后中线
CBN-W CENTER BACK NECK POINT TO WAIST 后颈点至腰
CFL CENTER FRONT FOLD 前中对折
CI CORPORATE IDENTIFY 企业标识
CIF COST, INSURANCE & FREIGHT 到岸价
CLR. COLOR 颜色
CMT CUTTING, MAKING, TRIMMING 来料加工
COL. COLOR 颜色
CORD. CORDUROY 灯心绒
CS COMMERCIAL STANDARDS 商业标准
CTN. COTTON 棉
CTN. NO. CARTON NO. 纸箱编号
D. DENIER 旦
D. & K. DAMAGED & KEPT 染厂对疵布的认赔
D.B. DOUBLE-BREASTED 双襟
D/Y DELIVERY 出货, 交付
DBL DOUBLE 双
DBL NDL DOUBLE NEEDLE 双针
DEPT. DEPARTMENT 部门
DK. DARK 深色
DOZ. DOZEN 打
E.G. EXAMPLI GRATIA / FOR EXAMPLE 例如
EL ELBOW LINE 手肘线
EMB. EMBROIDERY 绣花, 车花
ETC. ET CETERA=AND SO FORTH 等等
EXP. EXPORT 出口
F. FRONT 前
FAB. FABRIC 布料
FAQ FAIR AVERAGE QUALITY 中等品
FB FREIGHT BILL 装货清单
FNP FRONT NECK POINT 前颈点
FOB FREE ON BOARD 离岸价
FQC FIELD QUALITY CONTROL 现场质量控制
FTY. FACTORY 工厂
G. GREEN 绿色
G.W. GROSS WEIGHT 毛重
GL GRAIN LINE 布纹
H. HIPS 坐围
HL HIPS LINE 坐围线
IN. INCH 英寸
JKT. JACKET 夹克
K KNIT 针织
L. LARGE 大号
L. LINE 莱尼/号(纽扣大小单位)
L. LENGTH 长度
L. LEFT 左
L.G. LENGTH GRAIN 经向, 直纹
LB. POUND 磅
LBL LABEL 唛头, 商标
LOA LENGTH OVER ALL 全长
M MEDIUM 中码
M/B MUST BE 必须
M/C MACHINE 机械
MAT. MATERIAL 物料
MEAS. MEASUREMENT 尺寸
MHL MIDDLE HIPS LINE 中臀围线
MKT. MARKET 市场
MMTS. MEASUREMENTS 尺寸
N. to W.(N.-W.) NAPE TO WAIST 腰直
N.P. NECK POINT 肩颈点
NDL. NEEDLE 针
NIL NOTHING 无
NK. NECK 颈圈
O/N ORDER NO. 定单号
OJT ON-THE-JOB TRAINING 在职培训
OS OVER SIZE 超大号
OVRLK. OVERLOCK 及骨, 包缝
P. PURPLE 紫色
P.O. NO. PRODUCTION ORDER NO. 生产制造单编号
P.O.B. POST OFFICE BOX 邮箱
P.P. PAPER PATTERN 纸样
P.S.I. PER SQUARE INCH 每平方英寸
P/C POLYESTER/COTTON 涤棉混纺织物
PA POLYAMIDE 聚酰胺
PAP POSTERIOR ARMPIT POINT 腋窝后点
PB PRIVATE BRAND 个人商标
PC. PRICE 价格
PCS. PIECES 件, 个
PKG. PACKAGE 包装
PKT. POCKET 口袋
PLS. PLEASE 请
PNT POINT 点
P-O-R PRODUCT-O-RIAL SYSTEM 吊挂系统
POS. POSITION 位置
PP POLY PROPYLENE 聚丙烯
PV POLYVINYL FIBRE 聚乙烯纤维
PVC POLYVINYL CHLORIDE 聚氯乙烯
QC QUALITY CONTROL 质量控制
QLY. QUALITY 质量
QPL QUALIFIED PRODUCTS LIST 合格产品目录
QTY. QUANTITY 数量
R. RIGHT 右
R.S. RIGHT SIDE 正面
R.T.W. READY TO WEAR 成衣
REF. REFERENCE 参考, 参照
REJ. REJECT 拒绝
RM. ROOM 场所
RN. RAYON 人造丝
S SMALL 小码
S.A. SEAM ALLOWANCE 止口
S.B. SINGLE BREASTED 单排纽扣, 单襟
S.P. SHOULDER POINT 肩端点
S.P.I. STITCH PER INCH 每英寸线迹数
S.P.M. STITCH PER MINUTES 每分钟线迹数
S/B SHOULD BE 应该
SC SHOPPING CENTER 购物中心
SGL NDL SINGLE NEEDLE 单针
SLV. SLEEVE 袖子
SMPL SAMPLE 样板
SNL SINGLE 单
SNP SIDE NECK POINT 颈侧点
SPEC. SPECIFICATION 细则
SQ. FT. SQUARE FEET 平方英尺
STY. STYLE 款式
SZ. SIZE 尺码
T/C TERYLENCE/COTTON 涤棉织物
T/S TOP STITCHES 间面线
TQC TOTAL QUALITY CONTROL 全面质量控制
TQM TOTAL QUALITY MANAGEMENT 全面质量管理
T-S T-SHIRT T恤衫
UBL UNDER BUST LINE 下胸围线
V. VIOLET 紫色
W WOVEN 梭织
W. WAIST 腰围
W. WIDTH 宽度
W.B. WAISTBAND 裤头
W.I.P. Work In Process 半成品
W.L. WAIST LINE 腰线
W.S. WRONG SIDE 反面
W/ WITH
WMSP. WORKMANSHIP 手工, 车工
WT. WEIGHT 重量
X KING SIZE 特大号
XL EXTRA LARGE 特大号
XXL EXTRA EXTRA LARGE 超特大号
Y. YELLOW 黄色
YD. YARDAGE 码数
FYI = For Your Information
For Your Reference = 供参考
TBA = To Be Advise 待复
TBC = To Be Confirm 待确认
ASAP = As Soon As Possible = 尽快
ETD = Estimated To Departure = 预计开船时间
ETA = Estimated To Arrival = 预计到达时间
L/C = Letter of Credit = 信用证
Consignee = 收货人/收件人
Notify = 通知人
B/L = Bill of Lading = 提单
C/O = Country of Origin = 产地证
Port of Loading = 装运港
Port of Discharge = 卸运港
Vessel Name/Vessel No. = 船名/船航班号
Total/Sub-total/Grand Total = 合计/小计/总计
Date of Dispatch = 出货日期 ≠ Ex-Factory Date = 离厂日期
AWB No. = Air Way Bill No. = 运单号
P/P Sample = Pre-Production Sample = 产前样
C/O Label = Country of Origin Label = 产地唛
Forwarder = Shipping Agent = 货代/船公司
Solid Pack = 单色单码装箱
Shop Pack = 商店包装（一般为按配比单色混码）
Mini Markers = 小唛架
Fabric Consumption = 布料用量
Seal Tape = 热封/压胶
Measurement Discrepancy = 尺寸差异（一般指实际量度结果）
Measurement Allowance = 允许公差范围
Hangtagng Tag = 挂牌/吊牌
Waterproof = 防水
Water repellent = 泼水处理
Air Freight = 空运费
Freight Prepaid/Freight Collect = 预付/到付
On Board = 上船
DTMSA = Dye To Match Surrounding Area = 配所在部位颜色
GWS garment wash sample 成衣洗水样板
RN # REFERENCE NUMBER 参考号
LCL LESS CONTAINER LOADED 拼柜？
P/C POLYESTER/COTTON 涤纶/棉
T/C TERYLENE/COTTON 涤纶/棉
EXT. extension number分机号
CELL. cellular phone 手机
upc universal product code 通用产品码，通用货单代码
CMPT cut/make/pack/trim
IQ INCLUDING QUOTA
EQ EXCLUDING QUOTA
s/y sample yardage
LSAW. 穿后左侧骨（LEFT SIDE AS WEARED）
SKU Stock Keeping Unit为储存单位。8位数代码为最小级商品单位。
coo label: country of origin label 原产唛
GOH Garment On Hanger 走挂装
FCL full container load 走整柜
TBD To Be Determined 待定
L/S LONG SLEEVE 长袖
CFS CONTAINER FREIGHT STATION 走拼箱
CY CONTAINER YARD 走整柜
WHK whisker 猫须
H/S 手擦
T/P TECK PACK 技??案
T/C POLYESTER / COTTON
T/R POLYESTER / RAYON
F.O.A. feed off arm 埋夹
T/T TELEGRAPHIC TRANSFER 电汇
CVC chief value of cotton
IRRE.L/C irrevocable L/C 不可撤销信用证
IMAG.LINE imaginary line 参考线
C 棉
V 维纶
T 涤纶
R 粘胶
A 腈纶
O 丙纶
N 锦纶
F 麻
S 丝
W 毛
N/A NOT AVAILABLE
ETA Estimated Time of Arrival 估计到达时间
ETD Estimated Time of Delivery
MOP mother of peral 仿珍珠钮
S/S SHORT SLEEVE 短袖
LDP：landed duty paid.据我了解好像是要空运，负责运费，保险费，出口清关，送至指定地点而且还要负担出口商品在进口国的捐税，是所有的贸易术语里出口方义务最重的一个，现在在美国比较流行。

常用成衣工业的缩写

AH.(Armhole)袖笼
A.S.(ARM SIZE)肘围
B.(BUST)胸围
(BOTTOM)脚口,下摆
B.C.(BICEPS CIRCUMFERENCE) 上臂围；袖宽
B.D.(BUST DEPTH)胸高
(BACK DEPTH)后腋深
B.L.(BACK LENGTH)后长
(BUST LINE)胸围线
B.N.(BACK NECK)后领围
B.N.P.(BACK NECK POINT)后颈点
B.P.(BUST POINT)胸高点，乳峰点
B.R.(BACK RISE)后(直)裆
(BODY RISE)股上
B.S.L.(BACK SHOULDER LINE)后肩线
B.T.(BUST TOP)乳围
B.W.(BACK WIDTH)后背宽
C.(CHEST)胸围
C.B.(CENTRE BACK)后中长
C.F. (CENTRE FRONT)前中长
C.L. (COAT LENGTH)衣长
C.P.L.(COLLAR POINT LENGTH)领尖长
C.P.W.(COLLAR POINT WIDTH)领尖宽
C.W.(CUFF WIDTH)袖口宽
D.B.(DOUBLE BREAST)双排钮
E.C.(ELBOW CIRCUMFERENCE)肘围
E.L.(ELBOW LENGTH)肘围
(ELBOW LINE)肘线
E.P.(ELBOW POINT)肘点
F.D.(FRONT DEPTH)前腋深
F.L.(FRONT LENGTH)前长
F.N.(FRONT NECK)前领围
F.N.P.(FRONT NECK POINT)前颈点
F.R.(FRONT RISE)前浪
F.S.(FIST SIZE)手头围
F.W.(FRONT WIDTH)前胸宽
H.(HIP)臀围
H.L.(HIP LINE) 臀围线
(HEAD LENGTH)头长
H.S.(HEAD SIZE)头围
I.(INSEAM)内长
I.L.(INSIDE LENGTH)股下,下裆长
K.L.(KNEE LINE)膝围线
L.(LENGTH)衣(裤,裙等)长
M.H.(MIDDLE HIP)中臀围
M.H.L.(MIDDLE HIP LINE)中臀围线
N.(NECK)领,颈
N.H.(NECK HOLE)领圈,领口
N.L.(NECK LENGTH)领长
N.L.(NECK LINE)领围线,领口线
N.P.(NECK POINT)颈点;肩顶
N.R.(NECK RIB)领高
N.S.(NECK SIZE)颈围
N.S.P.(NECK SHOULDER POINT)颈肩点
N.W.L.(NECK WAIST LENGTH)背长
O.S.(OUTSIDE SEAM)外长
P.S.(PALM SIZE)掌围
P.W.(POINT WIDTH)乳间宽,乳中
S.(SLEEVE)袖长
(SHOULDER)肩宽
S.B.(SINGLE BREAST)单排钮
(SLACK BOTTOM) 裤脚口
S.C.(STAND COLLAR) 领座
S.D.(SCYE DEPTH) 腋深
S.L.(SLEEVE LENGTH)袖长
(SKIRT LENGTH) 裙长
S.N.P.(SHOULDER NECK POINT)肩颈点
(SIDE OF NECK POINT)旁颈点
S.P.(SHOULDER POINT)肩点
S.S.(SLEEVE SLOPE)肩斜
S.S.P.(SHOULDER SLEEVE POINT)肩袖点
S.T.(SLEEVE TOP)袖山
S.W.(SHOULDER WIDTH)肩宽
T.L.(TROUSERS LENGTH)裤长
T.R.(TROUSER RISE)裤（直）裆
T.S.(THIGH SIZE)腿围
W.(WAIST)裤（裙）腰，腰节；腰围
W.L.(WAIST LINE)腰围线，腰节线

常用色相（HUE）的缩写

R.(RED)红
O.(ORANGE)橙
Y.(YELLOW)黄
G.(GREEN)绿
B.(BLUE)蓝
P.(PURPLE)紫
YG.(YELLOW GREEN)黄绿
BG.(BLUE GREEN)蓝绿
PB.(PURPLE BLUE)蓝紫
RP.(RED PURPLE)红紫
pR.(PURPLISH RED)紫调红
yR.(YELLOWISH RED)黄调红
rO.(REDDISH ORANGE)红调橙
yO.(YELLOWISH ORANGE)黄调橙
rY.(REDDISH YELLOW)红调黄
gY.(GREENISH YELLOW)绿调黄
yG.(YELLOWISH GREEN)黄调绿
bG.(BLUEISH GREEN)蓝调绿
gB.(GREENISH BLUE)绿调蓝
pB.(PURPLISH BLUE) 紫调蓝

常用色调(TONE)的缩写

l.(light)浅的
p.(pale)淡的
b.(bright)明亮的
d.(dull)浊的
s.(strong)强烈的
v.(vivid)鲜艳的
g.(grayish)灰调的
dk.(dark)暗的
dp.(deep)深的
lg.(light grayish)明灰调的
dg.(dark grayish)暗灰调的

其它有关常用缩写词

a/c acc.(account)账单
Add. add.(address)地址
agt.(agent)代理商,代理人
a.m.(ante meridiem)上午
amt.(amount)总计,合计,总额
approx.(approximately)约计
Apr.(April)四月
AQL(Acceptable Quality Level)质量合格标准
a/r.(all-round)共计
art.(artcle)物品,商品;条款
Aug.(August)八月
av.(average)平均
a/w. aw(actual weight)实际重量
a.w.(all-wool)全毛
bh.(buttonhole)钮孔,扣眼
B/L b/l(bill of lading)提货单
BMS(body measurement system)人体尺寸测量系统
B.O.(branch office) 分公司
BOC.(Band of China) 中国银行
bx.(boxes)箱,盒(复数)
C/-(case)箱
CAD.(computer aided design)计算机辅助设计
C.A.D.(cash against documents)凭单据付款
CAM.(computer aided manufacture)计算机辅助生产
cat.(catalogue)样品目录
CBD.(cash before delivery)付款交货
C/D.( (certificate of delivered)交货证明书
C.&D. ( collected and delivered)货款两清
CECF(Chine Export Commodities Fair)中国出口商品交易会(广交会)
Cert.(certificate)证书;执照
C.F. c.f.(coat and freight)离岸加运费价格

常用原料的缩写

C：Cotton 棉
W：Wool 羊毛
M：Mohair 马海毛
RH：Rabbit hair 兔毛
AL：Alpaca 羊驼毛
S：Silk真丝
J：Jute 黄麻
L：linen 亚麻
Ts：Tussah silk 柞蚕丝
YH：Yark hair 牦牛毛
Ly：lycra莱卡
Ram：Ramine 苎麻
Hem：Hemp 大麻
T：Polyester 涤纶
WS：Cashmere 羊绒
N：Nylon 锦纶（尼龙）
A：Acrylic 腈纶
Tel：Tencel 天丝,是Lyocell莱赛尔纤维的商品名
La：Lambswool 羊羔毛
Md：Model 莫代尔
CH：Camel hair 驼毛
CVC：chief value of cotton涤棉倒比（涤含量低于60％以下）
Ms：Mulberry silk 桑蚕丝
R：Rayon 粘胶

常用纤维缩写

　　　　　纤维名称　　　　　　　　　缩写代号
天然纤维　　　丝　　　　　　　　　　　　S
　　　　　　　麻　　　　　　　　　　　　L
人造纤维　粘胶纤维　　　　　　　　　　　R
　　　　　醋酯纤维　　　　　　　　　　　CA
　　　　　三醋酯纤维　　　　　　　　　　CTA
　　　　　铜氨纤维　　　　　　　　　　　CVP
　　　　　富强纤维　　　　　　　　　　　Polynosic
　　　　　蛋白纤维　　　　　　　　　　　PROT
　　　　　纽富纤维　　　　　　　　　　　Newcell
合成纤维　碳纤维　　　　　　　　　　　　CF
　　　　　聚苯硫醚纤维　　　　　　　　　PPS
　　　　　聚缩醛纤维　　　　　　　　　　POM
　　　　　酚醛纤维　　　　　　　　　　　PHE
　　　　　弹性纤维　　　　　　　　　　　PEA
　　　　　聚醚酮纤维　　　　　　　　　　PEEK　　　　
　　　　　预氧化腈纶　　　　　　　　　　PANOF
　　　　　改性腈纶　　　　　　　　　　　MAC
　　　　　维纶　　　　　　　　　　　　　PVAL
　　　　　聚乙烯醇缩乙醛纤维 　　　 　　PVB
　　　　　氨纶　　　　　　　　　　　　　PU
　　　　　硼纤维　　　　　　　　　　　　EF
　　　　　含氯纤维　　　　　　　　　　　CL
　　　　　高压型阳离子可染聚酯纤维　　　CDP
　　　　　常压沸染阳离子可染纤维　　　　ECDP
　　　　　聚乳酸纤维　　　　　　　　　　PLA
　　　　　聚对苯二甲酸丙二醇酯纤维　　　PTT
　　　　　聚对苯二甲酸丁二醇酯纤维　　　PBT
　　　　　聚萘二甲酸乙二醇酯纤维　　　　PEN
　　　　　聚乙烯、聚丙烯共混纤维　　　　ES
　　　　　氯纶　　　　　　　　　　　　　Pvo
　　　　　聚对本二氧杂环已酮纤维　　　　PDS
　　　　　弹性二烯纤维　　　　　　　　　ED
　　　　　同位芳香族聚酰胺纤维　　　　　PPT
　　　　　对位芳香族聚酰胺纤维　　　　　PPTA
　　　　　芳砜纶　　　　　　　　　　　　PDSTA
　　　　　聚酰亚胺纤维　　　　　　　　　Pi
　　　　　超高强高模聚乙烯纤维　　　　　CHMW-PE
其他　　　金属纤维　　　　　　　　　　　MTF
　　　　　玻璃纤维　　　　　　　　　　　GE
 
 

___________________________________________________________________________________

EVE 常用英文缩写
AB 推进器 AfterBurner 120%-150%

AP 自动航行 Autopilot

Apoc AMARR的Apocalypse战舰

BB CALDARI 黑鸟CRUISER Blackbird

BM 宇宙坐标记录 Bookmark

BP 蓝图 Blueprint

BPC 蓝图拷贝 Blueprint Copy

BPO 蓝图原本 Blueprint Original

BS 战舰 Battleship

CPR Capacitor Power Relay (+20%能量恢复)

CCP 运行EVE的公司名 Crowd Control Productions

Domi GALLENTE Dominix 战舰

ECM 电子雷达干涉波 Electronic Counter Measures

Eff 效率 Efficiency

EW 电子战斗 Electronic Warfare

Harv Harvester 高级挖矿 Drone

ISK 不会不知道吧… Interstellar Kredits

M1, M2, ... Miner1, Miner2, ... (采矿激光1和2)

MAPC ????

ME 原料效率（造东西时，这个数字越大越好） Mineral Efficiency

Mega GALLENTE Megathron 战舰 / Megacyte矿物

MWD 微级WARP装置 Micro Warp Drive 500% (orz)

PE 生产效率 Production Efficiency

phoon MIMMATAR台风战舰

Pyro Pyroxeres矿石

Rat 电脑海盗 NPC Pirate

Rax Thorax Cruiser

RCU Reactor Control Unit （加船的Power Grid用）

RE 精炼效率 Refining Efficiency

RoF 攻击速度 Rate of Fire

Sco Scordite矿石

Scram WARP防碍装置 Warp scrambler

SS 个人的安全水平: 警方(+1.0)-(-1.0)大海盗 Security Status

SL 星系安全水平： 请看“关于防盗”贴子 Security Level

Scorp Scorpion战舰

SB 智能炸弹 Smart bomb

T2，TL2 2级技术 高科技 Tech Level 2

Veld Veldspar矿石

Web 电子网 Statis Webiffier (-60%~90%速度)

Zyd Zydrine矿物


手机
常用术语表
序号 英文标识 中文解释 英文解释
1 ACI 附件控制接口 Accessory Control Interface
2 ADC 模拟数字转换器 Analog Digital Connector
3 AEC 回声消除器 　
4 AFC 自动频率控制 　
5 AGC 自动增益控制 　
6 AIF 应用接口 　
7 AES 自动电子快门 　
8 ALG 光线指南 　
9 ALS 光线感应器 　
10 ALWE 背景噪声抑制器 　
11 AMS 售后服务 　
12 API 应用遍程接口 　
13 ARM 高级处理器结构 Advanced RISC Machines
14 ASIC 专用集成电路 Application Specific Integrated Circuit
15 ATR 复位应答 Answer To Reset
16 AUX 辅助设备 　
17 AWB 自动白色平衡 　
18 BB 基带 Baseband
19 BSI 电池类型识别 Battery size Indicator
20 CACHE 高速缓冲存储器 　
21 CBUS 将UPP_WD2与AEM和UEM连接的控制总线 control bus(internal phone interface between UPP-UEM
22 CCI 照相机控制接口 　
23 CCP 内置的照相机口 　
24 CDS 相关的双重取样 　
25 CIF 通用中间格式 　
26 CIS PCMCIA卡信息结构 　
27 CMT 蜂窝式移动电话(MCU和DSP) 　
28 CTSI 休眠的时钟定时中断 Clock Time Sleep and Interrupt
29 COG 玻璃上的芯片 clip on glass
30 CSP 芯片定标组件 clip scale package
31 CSTN 颜色超级的扭曲向列相畸变 color super twisted nematic
32 DAI 数字音频接口 　
33 DBUS DSP控制总线 DSP controlled bus(internal phone interface between UPP-UEM)
34 DCN 偏移消除的控制信号 　
35 DLL 动态链接库 　
36 DIF 显示屏接口 　
37 DMA 直接存储器存取 　
38 DRC 动态范围控制器 　
39 DSP 数字信号处理器 Digital Signal Processor
40 EAD 外部附件检测 External Accessory Detection
41 EMC 电磁兼容性 Electro Magnetic Compatibility
42 EQ 均衡器 　
43 EFR 增强型全速率 　
44 EMI 电磁干扰 　
45 ESD 静电释放 Electro Static Discharge
46 FBUS 异步全双工串行总线 Fast Bus,asynchronous message bus connected to DSP(communications bus)
47 FCI 　 Functional cover interface
48 FPC 柔韧的印刷电路 Flexible printed circuit
49 FR 全速率 Full Rate
50 GENIO 常规使能输入输出 　
51 GPIO 通用输入输出 General Purpose Input/Output
52 HF 集成有"免提" 　
53 HSCSD 高速电路交换数据 　
54 IF 接口 InterFace
55 IHF 集成免提 Integrated Hands Face
56 IRDA 红外数据 　
57 IRED 红外线发射二极管 　
58 LED 发光二级管 Light Emitting Diode
59 LNA 低噪音放大器 　
60 LPRF 低功率无线频率 Low Power Radio Frequency
61 LVDS 低压差分信号 　
62 MALT 　 Medium And Loud Transducer
63 MBUS 单线半双工串行总线 Asynchronous message bus connected to MCU (phone control interface).Slow message bus for control data
64 MCU 微控制器装置 Micro Control Unit
65 MDI MCU-DSP接口,经过ASIC寄存器的信息接口 　
66 MFI 调制器和滤波器接口 　
67 MUX 多路复用器，多路转换器 　
68 NTC 负的温度系数，用于温度感应器的温度感应电阻 Negative temperature Coefficient,temperature sensitive resistor used as a temperature sensor
69 PA 功放 Power Amplifier
70 PCI 话机控制接口软件 　
71 PCM 脉宽代码调制 　
72 PCM SIO PCM音频传输用的异步串总线 　
73 PDA 个人数字助理 Personal Digital Assistant
74 PDM 脉冲密度调制 Pulse Density Modulation
75 PDRAM 程序/数据 RAM Program/Data RAM
76 PIFA 平面反向的F天线 　
77 PLL 锁相环 Phase locked loop
78 PnPHF 即插即用免提 Plug and Play Handfree
79 PUP 通用接口，USARTS和脉冲宽度调制 General Purpose IO(PIO),USARTS and Pulse Width Modulators
80 PWM 脉宽调制 　
81 RTC 实时时钟 Real Time Clock
82 SARAM 单通道RAM Single Access RAM
83 SDRAM 同步动态随机存取存储器 　
84 SIM 用户身份识别模块 　
85 SG 同步发生器 　
86 SMART PCMCIA接口ASIC 　
87 SMPS 开关式电源供电 Switch Mode Power SUPPLY
88 SPR 标准产品需求 Standard Product Requirements
89 STI 串路接口 Serial Trace Interface
90 TG 定时发送器 　
91 TXP 功率放大器使能 　
92 TXA 功率控制回路使能 　
93 TXC 发送器功率电平和斜坡控制 　
94 VCM 电压控制模块 　
95 VGA 视频图形阵列 　
96 VCXO 电压控制的晶体振荡器 　
97 VCTCXO 温度补偿的电压控制的晶体振荡器 　
98 VCHARDET 充电器检测的门限级 Charger detection threshold level 

______________________________________________________________________________

 

A 
英文缩写 全称 
A/MMA 丙烯腈/甲基丙烯酸甲酯共聚物 
AA 丙烯酸 
AAS 丙烯酸酯-丙烯酸酯-苯乙烯共聚物 
ABFN 偶氮(二)甲酰胺 
ABN 偶氮(二)异丁腈 
ABPS 壬基苯氧基丙烷磺酸钠 
B  
英文缩写 全称 
BAA 正丁醛苯胺缩合物 
BAC 碱式氯化铝 
BACN 新型阻燃剂 
BAD 双水杨酸双酚A酯 
BAL 2，3-巯(基)丙醇 
BBP 邻苯二甲酸丁苄酯 
BBS N-叔丁基-乙-苯并噻唑次磺酰胺 
BC 叶酸 
BCD β－环糊精 
BCG 苯顺二醇 
BCNU 氯化亚硝脲 
BD 丁二烯 
BE 丙烯酸乳胶外墙涂料 
BEE 苯偶姻乙醚 
BFRM 硼纤维增强塑料 
BG 丁二醇 
BGE 反应性稀释剂 
BHA 特丁基-4羟基茴香醚 
BHT 二丁基羟基甲苯 
BL 丁内酯 
BLE 丙酮-二苯胺高温缩合物 
BLP 粉末涂料流平剂 
BMA 甲基丙烯酸丁酯 
BMC 团状模塑料 
BMU 氨基树脂皮革鞣剂 
BN 氮化硼 
BNE 新型环氧树脂 
BNS β－萘磺酸甲醛低缩合物 
BOA 己二酸辛苄酯 
BOP 邻苯二甲酰丁辛酯 
BOPP 双轴向聚丙烯 
BP 苯甲醇 
BPA 双酚A 
BPBG 邻苯二甲酸丁(乙醇酸乙酯)酯 
BPF 双酚F 
BPMC 2-仲丁基苯基-N-甲基氨基酸酯 
BPO 过氧化苯甲酰 
BPP 过氧化特戊酸特丁酯 
BPPD 过氧化二碳酸二苯氧化酯 
BPS 4，4’-硫代双(6-特丁基-3-甲基苯酚) 
BPTP 聚对苯二甲酸丁二醇酯 
BR 丁二烯橡胶 
BRN 青红光硫化黑 
BROC 二溴(代)甲酚环氧丙基醚 
BS 丁二烯-苯乙烯共聚物 
BS-1S 新型密封胶 
BSH 苯磺酰肼 
BSU N，N’-双(三甲基硅烷)脲 
BT 聚丁烯-1热塑性塑料 
BTA 苯并三唑 
BTX 苯-甲苯-二甲苯混合物 
BX 渗透剂 
BXA 己二酸二丁基二甘酯 
BZ 二正丁基二硫代氨基甲酸锌 
C  
英文缩写 全称 
CA 醋酸纤维素 
CAB 醋酸-丁酸纤维素 
CAN 醋酸-硝酸纤维素 
CAP 醋酸-丙酸纤维素 
CBA 化学发泡剂 
CDP 磷酸甲酚二苯酯 
CF 甲醛-甲酚树脂,碳纤维 
CFE 氯氟乙烯 
CFM 碳纤维密封填料 
CFRP 碳纤维增强塑料 
CLF 含氯纤维 
CMC 羧甲基纤维素 
CMCNa 羧甲基纤维素钠 
CMD 代尼尔纤维 
CMS 羧甲基淀粉 
D  
英文缩写 全称 
DAF 富马酸二烯丙酯 
DAIP 间苯二甲酸二烯丙酯 
DAM 马来酸二烯丙酯 
DAP 间苯二甲酸二烯丙酯 
DATBP 四溴邻苯二甲酸二烯丙酯 
DBA 己二酸二丁酯 
DBEP 邻苯二甲酸二丁氧乙酯 
DBP 邻苯二甲酸二丁酯 
DBR 二苯甲酰间苯二酚 
DBS 癸二酸二癸酯 
DCCA 二氯异氰脲酸 
DCCK 二氯异氰脲酸钾 
DCCNa 二氯异氰脲酸钠 
DCHP 邻苯二甲酸二环乙酯 
DCPD 过氧化二碳酸二环乙酯 
DDA 己二酸二癸酯 
DDP 邻苯二甲酸二癸酯 
DEAE 二乙胺基乙基纤维素 
DEP 邻苯二甲酸二乙酯 
DETA 二乙撑三胺 
DFA 薄膜胶粘剂 
DHA 己二酸二己酯 
DHP 邻苯二甲酸二己酯 
DHS 癸二酸二己酯 
DIBA 己二酸二异丁酯 
DIDA 己二酸二异癸酯 
DIDG 戊二酸二异癸酯 
DIDP 邻苯二甲酸二异癸酯 
DINA 己二酸二异壬酯 
DINP 邻苯二甲酸二异壬酯 
DINZ 壬二酸二异壬酯 
DIOA 己酸二异辛酯< lan> 
E  
英文缩写 全称 
E/EA 乙烯/丙烯酸乙酯共聚物 
E/P 乙烯/丙烯共聚物 
E/P/D 乙烯/丙烯/二烯三元共聚物 
E/TEE 乙烯/四氟乙烯共聚物 
E/VAC 乙烯/醋酸乙烯酯共聚物 
E/VAL 乙烯/乙烯醇共聚物 
EAA 乙烯-丙烯酸共聚物 
EAK 乙基戊丙酮 
EBM 挤出吹塑模塑 
EC 乙基纤维素 
ECB 乙烯共聚物和沥青的共混物 
ECD 环氧氯丙烷橡胶 
ECTEE 聚(乙烯-三氟氯乙烯) 
ED-3 环氧酯 
EDC 二氯乙烷 
EDTA 乙二胺四醋酸 
EEA 乙烯-醋酸丙烯共聚物 
EG 乙二醇 
2-EH ：异辛醇  
EO 环氧乙烷 
EOT 聚乙烯硫醚 
EP 环氧树脂 
EPI 环氧氯丙烷 
EPM 乙烯-丙烯共聚物 
EPOR 三元乙丙橡胶 
EPR 乙丙橡胶 
EPS 可发性聚苯乙烯 
EPSAN 乙烯-丙烯-苯乙烯-丙烯腈共聚物 
EPT 乙烯丙烯三元共聚物 
EPVC 乳液法聚氯乙烯 
EU 聚醚型聚氨酯 
EVA 乙烯-醋酸乙烯共聚物 
EVE 乙烯基乙基醚 
EXP 醋酸乙烯-乙烯-丙烯酸酯三元共聚乳液 
F  
英文缩写 全称 
F/VAL 乙烯/乙烯醇共聚物 
F-23 四氟乙烯-偏氯乙烯共聚物 
F-30 三氟氯乙烯-乙烯共聚物 
F-40 四氟氯乙烯-乙烯共聚物 
FDY 丙纶全牵伸丝 
FEP 全氟(乙烯-丙烯)共聚物 
FNG 耐水硅胶 
FPM 氟橡胶 
FRA 纤维增强丙烯酸酯 
FRC 阻燃粘胶纤维 
FRP 纤维增强塑料 
FRPA-101 玻璃纤维增强聚癸二酸癸胺(玻璃纤维增强尼龙1010树脂) 
FRPA-610 玻璃纤维增强聚癸二酰乙二胺(玻璃纤维增强尼龙610树脂) 
FWA 荧光增白剂 
G  
英文缩写 全称 
GF 玻璃纤维 
GFRP 玻璃纤维增强塑料 
GFRTP 玻璃纤维增强热塑性塑料促进剂 
GOF 石英光纤 
GPS 通用聚苯乙烯 
GR-1 异丁橡胶 
GR-N 丁腈橡胶 
GR-S 丁苯橡胶 
GRTP 玻璃纤维增强热塑性塑料 
GUV 紫外光固化硅橡胶涂料 
GX 邻二甲苯 
GY 厌氧胶 
H  
英文缩写 全称 
H 乌洛托品 
HDI 六甲撑二异氰酸酯 
HDPE 低压聚乙烯(高密度) 
HEDP 1-羟基乙叉-1，1-二膦酸 
HFP 六氟丙烯 
HIPS 高抗冲聚苯乙烯 
HLA 天然聚合物透明质胶 
HLD 树脂性氯丁胶 
HM 高甲氧基果胶 
HMC 高强度模塑料 
HMF 非干性密封胶 
HOPP 均聚聚丙烯 
HPC 羟丙基纤维素 
HPMC 羟丙基甲基纤维素 
HPMCP 羟丙基甲基纤维素邻苯二甲酸酯 
HPT 六甲基磷酸三酰胺 
HS 六苯乙烯 
HTPS 高冲击聚苯乙烯 
I  
英文缩写 全称 
IEN 互贯网络弹性体 
IHPN 互贯网络均聚物 
IIR 异丁烯-异戊二烯橡胶 
IO 离子聚合物 
IPA 异丙醇 
IPN 互贯网络聚合物 
IR 异戊二烯橡胶 
IVE 异丁基乙烯基醚 
J  
英文缩写 全称 
JSF 聚乙烯醇缩醛胶 
JZ 塑胶粘合剂 
K  
英文缩写 全称 
KSG 空分硅胶 
L  
英文缩写 全称 
LAS 十二烷基苯磺酸钠 
LCM 液态固化剂 
LDJ 低毒胶粘剂 
LDN 氯丁胶粘剂 
LDPE 高压聚乙烯(低密度) 
LDR 氯丁橡胶 
LF 脲 
LGP 液化石油气 
LHPC 低替代度羟丙基纤维素 
LIM 液体侵渍模塑 
LIPN 乳胶互贯网络聚合物 
LJ 接体型氯丁橡胶 
LLDPE 线性低密度聚乙烯 
LM 低甲氧基果胶 
LMG 液态甲烷气 
LMWPE 低分子量聚乙稀 
LN 液态氮 
LRM 液态反应模塑 
LRMR 增强液体反应模塑 
LSR 羧基氯丁乳胶 

 

旅游英语常用单词



standard rate 标准价
en-suite 套房
family suite 家庭套房
twin room you 带两张单人床的房间
double room 带一张双人床的房间
advance deposit 定金
reservation 订房间
registration 登记
rate sheets 房价表
tariff 价目表
cancellation 取消预定
imperial suite 皇室套房
presidential suite 总统套房
suite deluxe 高级套房
junior suite 简单套房
mini suite 小型套房
honeymoon suite 蜜月套房
penthouse suite 楼顶套房
unmade room 未清扫房
on change 待清扫房
valuables 贵重品
porter 行李员
luggage/baggage 行李
registered/checked luggage 托运行李
light luggage 轻便行李
baggage elevator 行李电梯
baggage receipt 行李收据
trolley 手推车
storage room 行李仓
briefcase 公文包
suit bag 衣服袋
travelling bag 旅行袋
shoulder bag 背包
trunk 大衣箱
suitcase 小提箱
name tag 标有姓名的标签
regular flight 正常航班
non-scheduled flight 非正常航班
international flight 国际航班
domestic flight 国内航班
flight number 航班号
airport 机场
airline operation 航空业务
alternate airfield 备用机场
landing field 停机坪
international terminal 国际航班候机楼
domestic terminal 国内航班候机楼
control tower 控制台
jetway 登机道
air-bridge 旅客桥
visitors terrace 迎送平台
concourse 中央大厅
loading bridge 候机室至飞机的连接通路
airline coach service 汽车服务
shuttle bus 机场内来往班车
___________________________________________________________________

 

A 
英文缩写 全称 
A/MMA 丙烯腈/甲基丙烯酸甲酯共聚物 
AA 丙烯酸 
AAS 丙烯酸酯-丙烯酸酯-苯乙烯共聚物 
ABFN 偶氮(二)甲酰胺 
ABN 偶氮(二)异丁腈 
ABPS 壬基苯氧基丙烷磺 



 

 

中文名称对照表 
O 　 
英文缩写 全称 
OBP 邻苯二甲酸辛苄酯 
ODA 己二酸异辛癸酯 
ODPP 磷酸辛二苯酯 
OIDD 邻苯二甲酸正辛异癸酯 
OPP 定向聚丙烯(薄膜) 
OPS 定向聚苯乙烯(薄膜) 
OPVC 正向聚氯乙烯 
OT 气熔胶 
P 　 
英文缩写 全称 
PA 聚酰胺(尼龙) 
PA-1010 聚癸二酸癸二胺(尼龙1010) 
PA-11 聚十一酰胺(尼龙11) 
PA-12 聚十二酰胺(尼龙12) 
PA-6 聚己内酰胺(尼龙6) 
PA-610 聚癸二酰乙二胺(尼龙610) 
PA-612 聚十二烷二酰乙二胺(尼龙612) 
PA-66 聚己二酸己二胺(尼龙66) 
PA-8 聚辛酰胺(尼龙8) 
PA-9 聚9-氨基壬酸(尼龙9) 
PAA 聚丙烯酸 
PAAS 水质稳定剂 
PABM 聚氨基双马来酰亚胺 
PAC 聚氯化铝 
PAEK 聚芳基醚酮 
PAI 聚酰胺-酰亚胺 
PAM 聚丙烯酰胺 
PAMBA 抗血纤溶芳酸 
PAMS 聚α－甲基苯乙烯 
PAN 聚丙烯腈 
PAP 对氨基苯酚 
PAPA 聚壬二酐 
PAPI 多亚甲基多苯基异氰酸酯 
PAR 聚芳酰胺 
PAR 聚芳酯(双酚A型) 
PAS 聚芳砜(聚芳基硫醚) 
PB 聚丁二烯-［1，3］ 
PBAN 聚(丁二烯-丙烯腈) 
PBI 聚苯并咪唑 
PBMA 聚甲基丙烯酸正丁酯 
PBN 聚萘二酸丁醇酯 
PBR 丙烯-丁二烯橡胶 
PBS 聚(丁二烯-苯乙烯) 
PBS 聚(丁二烯-苯乙烯) 
PBT 聚对苯二甲酸丁二酯 
PC 聚碳酸酯 
PC/ABS 聚碳酸酯/ABS树脂共混合金 
PC/PBT 聚碳酸酯/聚对苯二甲酸丁二醇酯弹性体共混合金 
PCD 聚羰二酰亚胺 
PCDT 聚(1，4-环己烯二亚甲基对苯二甲酸酯) 

 

 

A 
英文缩写 全称 
A/MMA 丙烯腈/甲基丙烯酸甲酯共聚物 
AA 丙烯酸 
AAS 丙烯酸酯-丙烯酸酯-苯乙烯共聚物 
ABFN 偶氮(二)甲酰胺 
ABN 偶氮(二)异丁腈 
ABPS 壬基苯氧基丙烷磺酸钠 
B  
英文缩写 全称 
BAA 正丁醛苯胺缩合物 
BAC 碱式氯化铝 
BACN 新型阻燃剂 
BAD 双水杨酸双酚A酯 
BAL 2，3-巯(基)丙醇 
BBP 邻苯二甲酸丁苄酯 
BBS N-叔丁基-乙-苯并噻唑次磺酰胺 
BC 叶酸 
BCD β－环糊精 
BCG 苯顺二醇 
BCNU 氯化亚硝脲 
BD 丁二烯 
BE 丙烯酸乳胶外墙涂料 
BEE 苯偶姻乙醚 
BFRM 硼纤维增强塑料 
BG 丁二醇 
BGE 反应性稀释剂 
BHA 特丁基-4羟基茴香醚 
BHT 二丁基羟基甲苯 
BL 丁内酯 
BLE 丙酮-二苯胺高温缩合物 
BLP 粉末涂料流平剂 
BMA 甲基丙烯酸丁酯 
BMC 团状模塑料 
BMU 氨基树脂皮革鞣剂 
BN 氮化硼 
BNE 新型环氧树脂 
BNS β－萘磺酸甲醛低缩合物 
BOA 己二酸辛苄酯 
BOP 邻苯二甲酰丁辛酯 
BOPP 双轴向聚丙烯 
BP 苯甲醇 
BPA 双酚A 
BPBG 邻苯二甲酸丁(乙醇酸乙酯)酯 
BPF 双酚F 
BPMC 2-仲丁基苯基-N-甲基氨基酸酯 
BPO 过氧化苯甲酰 
BPP 过氧化特戊酸特丁酯 
BPPD 过氧化二碳酸二苯氧化酯 
BPS 4，4’-硫代双(6-特丁基-3-甲基苯酚) 
BPTP 聚对苯二甲酸丁二醇酯 
BR 丁二烯橡胶 
BRN 青红光硫化黑 
BROC 二溴(代)甲酚环氧丙基醚 
BS 丁二烯-苯乙烯共聚物 
BS-1S 新型密封胶 
BSH 苯磺酰肼 
BSU N，N’-双(三甲基硅烷)脲 
BT 聚丁烯-1热塑性塑料 
BTA 苯并三唑 
BTX 苯-甲苯-二甲苯混合物 
BX 渗透剂 
BXA 己二酸二丁基二甘酯 
BZ 二正丁基二硫代氨基甲酸锌 
C  
英文缩写 全称 
CA 醋酸纤维素 
CAB 醋酸-丁酸纤维素 
CAN 醋酸-硝酸纤维素 
CAP 醋酸-丙酸纤维素 
CBA 化学发泡剂 
CDP 磷酸甲酚二苯酯 
CF 甲醛-甲酚树脂,碳纤维 
CFE 氯氟乙烯 
CFM 碳纤维密封填料 
CFRP 碳纤维增强塑料 
CLF 含氯纤维 
CMC 羧甲基纤维素 
CMCNa 羧甲基纤维素钠 
CMD 代尼尔纤维 
CMS 羧甲基淀粉 
D  
英文缩写 全称 
DAF 富马酸二烯丙酯 
DAIP 间苯二甲酸二烯丙酯 
DAM 马来酸二烯丙酯 
DAP 间苯二甲酸二烯丙酯 
DATBP 四溴邻苯二甲酸二烯丙酯 
DBA 己二酸二丁酯 
DBEP 邻苯二甲酸二丁氧乙酯 
DBP 邻苯二甲酸二丁酯 
DBR 二苯甲酰间苯二酚 
DBS 癸二酸二癸酯 
DCCA 二氯异氰脲酸 
DCCK 二氯异氰脲酸钾 
DCCNa 二氯异氰脲酸钠 
DCHP 邻苯二甲酸二环乙酯 
DCPD 过氧化二碳酸二环乙酯 
DDA 己二酸二癸酯 
DDP 邻苯二甲酸二癸酯 
DEAE 二乙胺基乙基纤维素 
DEP 邻苯二甲酸二乙酯 
DETA 二乙撑三胺 
DFA 薄膜胶粘剂 
DHA 己二酸二己酯 
DHP 邻苯二甲酸二己酯 
DHS 癸二酸二己酯 
DIBA 己二酸二异丁酯 
DIDA 己二酸二异癸酯 
DIDG 戊二酸二异癸酯 
DIDP 邻苯二甲酸二异癸酯 
DINA 己二酸二异壬酯 
DINP 邻苯二甲酸二异壬酯 
DINZ 壬二酸二异壬酯 
DIOA 己酸二异辛酯< lan> 
E  
英文缩写 全称 
E/EA 乙烯/丙烯酸乙酯共聚物 
E/P 乙烯/丙烯共聚物 
E/P/D 乙烯/丙烯/二烯三元共聚物 
E/TEE 乙烯/四氟乙烯共聚物 
E/VAC 乙烯/醋酸乙烯酯共聚物 
E/VAL 乙烯/乙烯醇共聚物 
EAA 乙烯-丙烯酸共聚物 
EAK 乙基戊丙酮 
EBM 挤出吹塑模塑 
EC 乙基纤维素 
ECB 乙烯共聚物和沥青的共混物 
ECD 环氧氯丙烷橡胶 
ECTEE 聚(乙烯-三氟氯乙烯) 
ED-3 环氧酯 
EDC 二氯乙烷 
EDTA 乙二胺四醋酸 
EEA 乙烯-醋酸丙烯共聚物 
EG 乙二醇 
2-EH ：异辛醇  
EO 环氧乙烷 
EOT 聚乙烯硫醚 
EP 环氧树脂 
EPI 环氧氯丙烷 
EPM 乙烯-丙烯共聚物 
EPOR 三元乙丙橡胶 
EPR 乙丙橡胶 
EPS 可发性聚苯乙烯 
EPSAN 乙烯-丙烯-苯乙烯-丙烯腈共聚物 
EPT 乙烯丙烯三元共聚物 
EPVC 乳液法聚氯乙烯 
EU 聚醚型聚氨酯 
EVA 乙烯-醋酸乙烯共聚物 
EVE 乙烯基乙基醚 
EXP 醋酸乙烯-乙烯-丙烯酸酯三元共聚乳液 
F  
英文缩写 全称 
F/VAL 乙烯/乙烯醇共聚物 
F-23 四氟乙烯-偏氯乙烯共聚物 
F-30 三氟氯乙烯-乙烯共聚物 
F-40 四氟氯乙烯-乙烯共聚物 
FDY 丙纶全牵伸丝 
FEP 全氟(乙烯-丙烯)共聚物 
FNG 耐水硅胶 
FPM 氟橡胶 
FRA 纤维增强丙烯酸酯 
FRC 阻燃粘胶纤维 
FRP 纤维增强塑料 
FRPA-101 玻璃纤维增强聚癸二酸癸胺(玻璃纤维增强尼龙1010树脂) 
FRPA-610 玻璃纤维增强聚癸二酰乙二胺(玻璃纤维增强尼龙610树脂) 
FWA 荧光增白剂 
G  
英文缩写 全称 
GF 玻璃纤维 
GFRP 玻璃纤维增强塑料 
GFRTP 玻璃纤维增强热塑性塑料促进剂 
GOF 石英光纤 
GPS 通用聚苯乙烯 
GR-1 异丁橡胶 
GR-N 丁腈橡胶 
GR-S 丁苯橡胶 
GRTP 玻璃纤维增强热塑性塑料 
GUV 紫外光固化硅橡胶涂料 
GX 邻二甲苯 
GY 厌氧胶 
H  
英文缩写 全称 
H 乌洛托品 
HDI 六甲撑二异氰酸酯 
HDPE 低压聚乙烯(高密度) 
HEDP 1-羟基乙叉-1，1-二膦酸 
HFP 六氟丙烯 
HIPS 高抗冲聚苯乙烯 
HLA 天然聚合物透明质胶 
HLD 树脂性氯丁胶 
HM 高甲氧基果胶 
HMC 高强度模塑料 
HMF 非干性密封胶 
HOPP 均聚聚丙烯 
HPC 羟丙基纤维素 
HPMC 羟丙基甲基纤维素 
HPMCP 羟丙基甲基纤维素邻苯二甲酸酯 
HPT 六甲基磷酸三酰胺 
HS 六苯乙烯 
HTPS 高冲击聚苯乙烯 
I  
英文缩写 全称 
IEN 互贯网络弹性体 
IHPN 互贯网络均聚物 
IIR 异丁烯-异戊二烯橡胶 
IO 离子聚合物 
IPA 异丙醇 
IPN 互贯网络聚合物 
IR 异戊二烯橡胶 
IVE 异丁基乙烯基醚 
J  
英文缩写 全称 
JSF 聚乙烯醇缩醛胶 
JZ 塑胶粘合剂 
K  
英文缩写 全称 
KSG 空分硅胶 
L  
英文缩写 全称 
LAS 十二烷基苯磺酸钠 
LCM 液态固化剂 
LDJ 低毒胶粘剂 
LDN 氯丁胶粘剂 
LDPE 高压聚乙烯(低密度) 
LDR 氯丁橡胶 
LF 脲 
LGP 液化石油气 
LHPC 低替代度羟丙基纤维素 
LIM 液体侵渍模塑 
LIPN 乳胶互贯网络聚合物 
LJ 接体型氯丁橡胶 
LLDPE 线性低密度聚乙烯 
LM 低甲氧基果胶 
LMG 液态甲烷气 
LMWPE 低分子量聚乙稀 
LN 液态氮 
LRM 液态反应模塑 
LRMR 增强液体反应模塑 
LSR 羧基氯丁乳胶 

 





 

中文名称对照表 
O 　 
英文缩写 全称 
OBP 邻苯二甲酸辛苄酯 
ODA 己二酸异辛癸酯 
ODPP 磷酸辛二苯酯 
OIDD 邻苯二甲酸正辛异癸酯 
OPP 定向聚丙烯(薄膜) 
OPS 定向聚苯乙烯(薄膜) 
OPVC 正向聚氯乙烯 
OT 气熔胶 
P 　 
英文缩写 全称 
PA 聚酰胺(尼龙) 
PA-1010 聚癸二酸癸二胺(尼龙1010) 
PA-11 聚十一酰胺(尼龙11) 
PA-12 聚十二酰胺(尼龙12) 
PA-6 聚己内酰胺(尼龙6) 
PA-610 聚癸二酰乙二胺(尼龙610) 
PA-612 聚十二烷二酰乙二胺(尼龙612) 
PA-66 聚己二酸己二胺(尼龙66) 
PA-8 聚辛酰胺(尼龙8) 
PA-9 聚9-氨基壬酸(尼龙9) 
PAA 聚丙烯酸 
PAAS 水质稳定剂 
PABM 聚氨基双马来酰亚胺 
PAC 聚氯化铝 
PAEK 聚芳基醚酮 
PAI 聚酰胺-酰亚胺 
PAM 聚丙烯酰胺 
PAMBA 抗血纤溶芳酸 
PAMS 聚α－甲基苯乙烯 
PAN 聚丙烯腈 
PAP 对氨基苯酚 
PAPA 聚壬二酐 
PAPI 多亚甲基多苯基异氰酸酯 
PAR 聚芳酰胺 
PAR 聚芳酯(双酚A型) 
PAS 聚芳砜(聚芳基硫醚) 
PB 聚丁二烯-［1，3］ 
PBAN 聚(丁二烯-丙烯腈) 
PBI 聚苯并咪唑 
PBMA 聚甲基丙烯酸正丁酯 
PBN 聚萘二酸丁醇酯 
PBR 丙烯-丁二烯橡胶 
PBS 聚(丁二烯-苯乙烯) 
PBS 聚(丁二烯-苯乙烯) 
PBT 聚对苯二甲酸丁二酯 
PC 聚碳酸酯 
PC/ABS 聚碳酸酯/ABS树脂共混合金 
PC/PBT 聚碳酸酯/聚对苯二甲酸丁二醇酯弹性体共混合金 
PCD 聚羰二酰亚胺 
PCDT 聚(1，4-环己烯二亚甲基对苯二甲酸酯) 


常见E文缩写.txt
AA Auto Answer
AAA Authentication, Authorization and Accounting
AAB All-to-All Broadcast
AAL Asynchronous Transfer Mode Adaption Layer
AAM Automatic Acoustic Management
AAP Applications Access Point (DEC)
AARP AppleTalk Address Resolution Protocol
AAS All-to-All Scatter
AASP ASCII Asynchronous Support Package
AAT Average Access Time
AATP Authorized Academic Training Program (Microsoft)
.ABA Address Book Archive (dosya adı uzantısı) (Palm)
ABEND Abnormal End
ABI Application Binary Interface
ABIOS Advanced BIOS
ABIST Automatic Built-In Self-Test (IBM)
ABLE Adaptive Battery Life Extender
ABM Asynchronous Balanced Mode
ABR Available Bit Rate
ABRD Automatic Baud Rate Detection
ABT Abort
ABTS ASCII Block Terminal Services
AC Autocheck + Automatic Computer + Alternating Current
ACAP Application Configuration Access Protocol
ACC Accumulator
ACCMAIL Accessing the Internet Via Email
ACD Automatic Call Distribution
ACDI Asynchronous Communications Device Interface
ACE Access Control Encryption/Entry +
ACE Adobe Certified Expert +
ACE Advanced Computing Environment (SCO) +
ACE Automatic Computing Engine
ACF Access Control Field +
ACF Advanced Communications Function
ACH Automated Clearing House
ACIAS Automated Calibration Interval Analysis System
ACIS American Committee for Interoperable Systems
ACK Acknowledgment
ACL Access Control List + Asynchronous Connection-Less (link)
ACM Association for Computing Machinery
ACM Audio Compression Manager (Microsoft)
ACMS Application Control Management System
ACP Ancillary Control Program + Auxiliary Control Process
ACPI Advanced Configuration and Power Interface
ACR Allowed Cell Rate
ACROSS Automated Cargo Release and Operations Service System
ACS Access + Access Control Set + Access Control System +
ACS Advanced Computer System (IBM) +
ACS Anti Curl System + Asynchronous Communication Server
ACSS Audio Cascading Style Sheets
ACTS Automated Computer Time Service
ACU Automatic Calling Unit
ACVC Ada Compiler Validation Capacity
A/D Analog to Digital
ADA Automatic Data Acquisitions +
ADB Apple Desktop Bus
ADC Adaptive Data Compression (protocol) (Hayes) +
ADC Add with Carry + Analog to Digital Converter
ADCCP Advanced Data Communication Control Procedures/Protocol
ADD Automatic Document Detection (WordPerfect)
ADF Automatic Document Feeder +
ADF Automatically Defined Function
.ADF Adapter Description File (dosya adı uzantısı)
ADI AutoCad/AutoDesk Device Interface (driver)
ADL Address Data Latch
ADLAT Adaptive Lattice Filter
ADLC Adaptive Lossless Data Compression (IBM) +Asynchronous Data Link Control
ADMACS Apple Document Management And Conrol System
ADMD Administrative Management Domain (X.400)
ADO ActiveX Data Objects
ADP AOLserver Dynamic Pages + Automatic Data Processing
ADPCM Adaptive Differential Pulse Code Modulation
ADR Address
ADS Application Development Solutions (AT&T) +
ADS Application Development System +
ADS Automatic Distribution System
第 1 页
常见E文缩写.txt
ADSC Address Status Changed +
ADSC Adobe Document Structuring Conventions
ADSI Active Directory Service Interface (Microsoft) +
ADSI Analog Display Services Interface
ADSP AppleTalk Datastream Protocol
ADSR Attack, Decay, Sustain, Release
ADT Abstract Data Type + Application Data Types
ADT Automatic Dialing Unit
AE Above or Equal
AEB Analog Expansion Bus (Dialogic)
AEC Architecture, Engineering, Construction
.AERO Aviation Industry (Domain Name) (Internet)
AES Advanced Encryption Standard
AESA ATM End System Address
AF Auxiliary carry Flag
AFA Accelerated File Access
AFC Antiferro-Magnetically Coupled (media) (IBM) +
AFC Automatic Font Change + Automatic Frequency Control
AFD Automatic File Distribution
AFDW Active Framework for Data Warehousing (Microsoft)
AFI Authority and Format Identifier
AFII Association for Font Information Interchange
AFIRM Automated Fingerprint Image Reporting and Match
AFIS Automated Fingerprint Identification System
.AFM Adobe Font Metrics (dosya adı uzantısı) (Adobe Systems)
AFP Advanced Function Presentation (IBM) +
AFP Advanced Function Printing +
AFP Appletalk Filing Protocol (Macintosh)
AFS Andrew File System (protocols)
AFTP Advanced/Anonymous File Transfer Protocol
AGA Advanced Graphics Adapter
AGC Automatic Gain Control
AGP Accelerated/Advanced Graphics Port
AGRAS Antiglare-Antireflective-Antistatic
AGU Address-Generation Unit
AH Authentication Header (protocol)
AHS Automated Highway Systems
AI Analog Input + Artificial Intelligence
AIA Applications Integration Architecture (DEC)
AIC AIXwindows Interface Composer (IBM)
AIFF Audio Interchange File Format
AIIM Association for Information and Image Management
AIM AOL Instant Messenger
AIN Advanced Intelligent Network (Bell Atlantic)
AIP Application Infrastruture Provider
AIR Architecture Implementation Review
AIS Automated Information Systems
AISB Association of Imaging Service Bureaus
AISP Association of Information Systems Professionals
AIX Advanced Interactive Executive (IBM)
ALAT Advanced Load Address Table
ALC Arithmetic and Logic Circuits +Automatic Level Control
ALE Address Latch Enable +Application Linking and Embedding
ALGOL Algorithmic Oriented Language (bakınız IAL)
ALICE Artificial Linguistic Internet Computer Entity
ALINK Active Link (HTML)
ALIWEB Archie Like Indexing in the Web (Internet)
ALN Asynchronous Learning Network
ALP Automatic Language Processing
ALR Advanced Logic Research, Inc.
ALT Alternate (mode)
ALT. Alternate lifestyle (USENET Newsgroup Category)
ALU Arithmetic Logic Unit
AMA Automatic Message Accounting
AMANDDA Automated Messaging and Directory Assistance
AMASS Archival Management and Storage System
AMD Active Matrix Display + Advanced Micro Devices, Inc.
AMI Alternate Mark Inversion + American Megatrends, Inc. +Application Messaging Interface
AMMA Advanced Memory Management Architecture
AMPS Advanced Mobile Phone Service
AMR Audio Modem Riser
ANCOVA Analysis of Covariance
ANDF Architecture-Neutral Distribution Format
ANI Automatic Number Identification
.ANI Animated Cursor (dosya adı uzantısı) (Microsoft)
ANN Artificial Neural Network
第 2 页
常见E文缩写.txt
.ANN Annotations (dosya adı uzantısı) (IBM)
ANOVA Analysis Of Variance
ANSI American National Standards Institute
AO Analog Output
AOCE Apple Open Collaboration Environment
AO/DI Always On/Dynamic ISDN
AOE Application Operating Environment (AT&T)
AOL America Online
AOS Add Or Subtract
AP Adjunct Processor + Application Processor
A/P Accounts Payable
APA Adaptive Packet Assembly +
APA All Points Addressable +
APA Arithmetic Processing Accelerator
APAR Authorized Program Analysis Report (IBM)
APAREN Address Parity Enable (IBM)
APCUG Association of PC User Groups
APDU Application Protocol Data Units
API Application Program Interface
APIC Advanced Programmable Interrupt Controller (bus) (Intel)
APIS Advanced Passenger Information System
APL A Programming Language (Mathematics)
APM Advanced Power Management (IBM)
APNIC Asia-Pacific Network Information Center (Internet)
APOP Authenticated Post Office Protocol
.APP Application (dosya adı uzantısı)
APPC Advanced Program-to-Program Communications (IBM)
APPI Advanced Peer-to-Peer Internetworking
APPLETS Applications
APPN Advanced Peer-to-Peer Networking (IBM)
APPS Applications
APRP Adaptive Pattern Recognition Processing
APS Advanced Photo System + Advanced Printing Service (IBM)+ Asynchronous Protocol Specification
APSE ADA Programming Support Environment
APT Address Pass Through +Advanced Parallel Technology +Automatically Programmed Tools
A/R Accounts Receivable
ARA AppleTalk Remote Access
ARAG Antireflective-Antiglare
ARAS Antireflective-Antistatic
.ARC Archive (dosya adı uzantısı)
ARCA Advanced RISC Computing Architecture
ARCnet Attached Resource Computer Network
.ARJ Compressed File (dosya adı uzantısı)
ARL Adjusted Ring Length
ARLL Advanced Run Length Limited
ARM Advanced RISC Machine (processor) +
ARM Annotated Reference Manual +
ARM Asynchronous Response Mode
ARMA Association of Records Managers and Administrators
ARP Address Resolution Protocol
ARPANET Advanced Research Projects Agency Network
ARPL Adjust Requested Privilege Level
ARS Activity Reporting System (Unisys)
ARTA Apple Real Time Architecture
ARTIC A Real-Time Interface Coprocessor (IBM)
ARTS Asynchronous Remote Takeover Server
.ARTS Cultural Groups (Domain Name) (Internet)
ARTT Asynchronous Remote Takeover Terminal
ARQ Automatic Repeat Request
ARU Audio Response Unit
AS Autonomous System (Internet)
ASAI Adjunct Switch Application Interface (AT&T)
ASAP As Soon As Possible +Automatic Switching And Processing
AS3AP ANSI SQL Standard Scalable and Portable
ASB Advanced System Buffering (Intel)
.ASC ASCII text (dosya adı uzantısı)
ASCC Automatic Sequence Controlled Calculator (IBM)
ASCII American Standard Code for Information Interchange
ASD Application Structure Database (Microsoft) +Automatic Skip Driver (Microsoft)
ASF Active/Advanced Streaming Format (Microsoft)
ASIC Application-Specific Integrated Circuit
ASIT Advanced Security and Identification Technology
ASL Adaptive Speed Levelling
ASLM Apple Shared Library Manager (Macintosh)
.ASM Assembler Source Language (dosya adı uzantısı)
ASMP Asymmetric Multprocessing
第 3 页
常见E文缩写.txt
ASN Abstract Syntax Notation + Autonomous System Number
ASO Automated Systems Operations
ASP Active Server Page (Microsoft) +
ASP Application/Authorized Service Provider +
ASP Aspect Oriented Programming +
ASP Association of Shareware Professionals
.ASP Active Server Page (dosya adı uzantısı)
ASPI Advanced SCSI Programming Interface (Adaptec)
ASPS Advanced Signal Processing System
ASP Address Space Register + Automatic Send-Receive +
ASP Automatic Speech Recognition
AS/U Advanced Server for Unix
ASYNC Asynchronous
AS/400 Application System/400 (IBM)
AT Advanced Technology + Attention
ATAPI Advanced Technology Attachment Packet Interface
ATC Advanced Transfer Cache
ATDP Attention Dial Pulse
ATDT Attention Dial Tone
ATE Automated Test Equipment
ATG Advanced Technology Group
ATH Attention Hang-Up (Modem command)
ATL Active Template Library
ATM Adobe Typeface Manager + Air Traffic Management +
ATM Asynchronous Transfer Mode + Automated Teller Machine
ATPS AppleTalk Printing Services (Macintosh)
ATR Automatic Terminal Recognition
ATS Administrative Terminal System +
ATS Apple Terminal Services
AT&T American Telephone and Telegraph
ATTN Attention
ATTRIB Attribute (bakınız. ATR)
ATX Advanced Technology Extended (Intel)
.AU Audio (dosya adı uzantısı)
AUDIT Automated Data Input Terminal
AUI Attachment/Autonomous Unit Interface
AUP Acceptable Use Policy (Internet)
AUTO Automatic
AUTOEXEC Automatic Execution
AUX Auxiliary + (First Serial Port)
AV Audio/Video + Audiovisual + Authenticity Verification
AVA Audio Visual Authoring (IBM)
AVC Audio Visual Connection (IBM)
AVD Alternating Voice and Data
AVG Average
AVI Audio Visual Interleave (Microsoft)
AVP Attribute-Value Pair
AVR Automatic Voice Recognition
AVT Applied Voice Technology
AVVID Architecture for Voice Video & Integrated Data (Cisco)
AWE Advanced Wave Effects (Creative Lab)
AWG American Wire Gage
AWS Advanced Workstations and Systems (group) (IBM)
AWT Abstract Window Toolkit (Java)
AX Architecture Extended + Automatic Transmission
BACP Bandwidth Allocation Control Protocol
BAK Binary Adaptation Kit (Microsoft)
.BAK Backup (dosya adı uzantısı)
BAL Basic Assembly Language
BAM Boyan Action Module
BAPI Business Application Programming Interface (SAP)
BARTS Bell Atlantic Regional Timesharing
.BAS Basic Language (dosya adı uzantısı)
BASH Bourne Again Shell (Unix)
BASIC Beginner's All-purpose Symbolic Instruction Code
BASM Built-In Assembler
BAT Block Address Translation
.BAT Batch Processing (dosya adı uzantısı)
B2B Business-To-Business
BBS Bulletin Board System
B2C Business To Consumer
BCC Block Check Character
BCC: Blind Carbon Copy
BCD Binary Coded Decimal
B-CHANNEL Bearer Channel
BCL Base Class Libraries + Batch Command Language
第 4 页
常见E文缩写.txt
BCN Beacon
BCNF Boyce-Codd Normal Form
BCP Best Current Practice + Bulk Copy Program
BCPL Basic Computer Programming Language
BCR Byte Count Register
BCS Bar Code Sorter
BDA Bios Data Area
BDC Backup Domain Controller
BDE Borland Database Engine (Borland)
BDLS Bidirectional Loop Switching
BDOS Basic Disk Operating System
BDR Bus Device Request
BDSL (Bakınız DSL)
BE Below or Equal
B2E Business To Employees
BECN Backward Explicit Congestion Notification
BEDO Burst Extended Data Out
BEEP Blocks Extensible Exchange Protocol
BEL Bell
BELLCORE Bell Communications Research
BER Basic Encoding Rules + Bit Error Rate
BERT Bit Error Rate Test/Tester
BF Bad Flag
B/F Background/Foreground
.BFC Briefcase (dosya adı uzantısı) (Microsoft)
BFF Binary File Format (IBM)
BFT Binary File Transfer
BFTP Batch FTP
BGA Ball Grid Array
BGCOLOR Background Color (HTML)
BGE Branch if Greater or Equal
.BGI Borland Graphic Interface (dosya adı uzantısı)
BGP Border Gateway Protocol
BGT Branch if Greater Than
BHI Branch if Higher
BHIS Branch if Higher or Same
BI Binary Input
.BIB Bibliography (dosya adı uzantısı)
BiDi Bi-Directional
BIFET Bipolar Field Effect Transistor
BIFF Binary Interchange File Format
BIM Beginning of Information Marker
.BIN Binary (dosya adı uzantısı)
BINAC Binary Automatic Computer
BIND Berkeley Internet Name Domain
BINHEX Binary Hexadecimal
BIOS Basic Input/Output System
BIS Business Information System
BISDN Broadband Integrated Services Digital Network
BIST Built-In Self-Test
BiSYNC (Bakınız BSYNC)
BIT Binary Digit
BITNET Because It's Time Network
BITNIC Bitnet Network Information Center
BIU Bus Interface Unit
BIW Business Intelligence Warehouse (SAP)
BIX Byte Information Exchange (BBS)
.BIZ Businesses (Domain Name) (Internet)
.BK! Backup (dosya adı uzantısı) (WordPerfect)
.B~K Backup (dosya adı uzantısı)
BKSP Backspace
BL Backlit + Bit Line
BLAST Bell Labs Layered Space Time +
BLAST Blocked Asynchronous Transmission (protocol)
.BLD BASIC Bload Graphics (dosya adı uzantısı)
BLE Branch if Less or Equal
BLER Block Error
BLK Block
BLMC Buried Logic Macrocell
BLOB Binary Large Object
BLOS Branch if Lower Or Same
BMI Branch if Minus
BMIC BusMaster Interface Controller (Intel)
BMP Basic Mapping Support + Basic Multilingual Plane +
BMP Batch Message Processing Program
.BMP Bitmap (dosya adı uzantısı) (Paintbrush Format)
第 5 页
常见E文缩写.txt
BNC Bayonet Neill-Concelman (Mr. Neill-Concelman tarafından bulunan konnektör) +
BNC British Naval Connector
BNE Branch if Not Equal
BNS Backbone Network Service
BO Binary Output
BOA Basic Object Adapter
BOB Break-out Box
BOC Basic Operator Console
BOF Beginning Of File
BOM Basic Online Memory (IBM) + Beginning Of Message
BOND Bandwidth On Demand
BOOTP Bootstrap Protocol (Internet)
BOPS Billion Operations Per Second
BORPQU Borland Pro Quattro
BORQU Borland Quattro
BOS Basic Operating System
BOT Beginning Of Table + Beginning of Tape + Robot
BP Base Pointer
BPB BIOS Parameter Block
BPDU Bridge Protocol Data Unit
BPDU Berkeley Packet Filter
BPI Bits Per Inch
BPL Branch if Plus
BPP Bits Per Pixel
BPR Business Process Re-engineering (Linux)
BPS Bits Per Second + Bytes Per Second
BPSK Binary Phase Shift Keying
BR Bad Register
BRGC Binary Reflected Gray Code
BRI Basic Rate Interface + Brain Response Interface
BS Backspace
BSAM Basic Sequential Access Method
BSC Binary Synchronous Communication
BSCS Bachelor of Science (Degree) in Computer Science
BSD Berkely Software/Standard Distribution
BSF Bit Scan Forward
BSI British Standards Institute
BSM Basic Storage Module (IBM)
BSP Bulk Synchronous Parallelism
BSR Bit Scan Reverse
BS-RAM Burst Static RAM
BSS Block Started by Symbol
BST Binary Search Tree
BSY Busy
BSYNC Binary Synchronous Communications (protocol)
BT Bit Test
BTAM Basic Telecommunications Access Method (IBM)
BTB Branch Target Buffer
BTC Bit Test and Complement
BTI Business Type Identifier
BTOA Binary To ASCII
BTP Batch Transfer Program
BTR Bit Test and Reset
BTS Bit Test and Set
BU Branch Unit
BUBL Bulletin Board for Libraries (Janet)
BUF Buffer
BUS Broadcast and Unknown Server
BVH Base Video Handler
BWM Block-Write Mode
B2X Binary To Hexadecimal (REXX)
BYTE Binary Element String
C C Programming Language
.C C source code (dosya adı uzantısı) (C)
CA Certification Authority + Collision Avoidance
CAB Compressed Application Binary (Microsoft)
.CAB Cabinet (dosya adı uzantısı) (Microsoft)
CACLS Command-Line Access Control Lists (Microsoft)
CAD Computer Aided Design
CADD Computer Aided Design and Drafting
CADE Client/server Application Development Environment
CAE Client Application Enabler + Common Applications
CAE Environment + Computer Aided Engineering
CAEN Chemically Assembled Electronic Nanocomputer
CAEX Computer Aided Exploration
CAG Column Address Generator
第 6 页
常见E文缩写.txt
CAI Computer Aided Instruction
CAIRN Collaborative Advanced Interagency Research Network
CAL Client Access License +Computer Aided Learning
CALS Computer-Aided Acquisition in Logistic Support
CAM Common Access Method + Computer Aided Manufacturing +
CAM Contents Addressable Memory
CAN Cancel + Controller Area Network
CANBUS Conroller Area Network Bus
CAP Carrierless Amplitude and Phase-Modulation +
CAP Central Arbitration Point +
CAP Communication Application Platform +
CAP Competitive Access Provider +
CAP Computer Aided Publishing
.CAP Capture (dosya adı uzantısı)
CAPE Concurrent Art-to-Product Environment
CAPS Capitals (Upper Case Letters) +
CAPS Cassette Programming System
CAR Committed Access Rate (Cisco)
CARL Colorado Alliance of Research Libraries (Internet)
CART Computer-Assisted Radar Tomography
CAS Column Address Select/Strobe +
CAS Communications Application Specification +
CAS Computer Aided Styling
CASE Computer Aided Software Engineering
CASL Crosstalk Application Scripting Language (DCA)
CASS Computer Assisted Search Service
CASSIS Classified and Search Support Information System
CAT Computer Adaptive Test + Computer Aided Testing +
CAT Computer Aided Tomography +
CAT Computer Aided Transcription + Concatenate
.CAT Catalog (dosya adı uzantısı)
CATS Computer Assisted Training System
CAT SCAN Computerized Axial Tomography Scan
CATV Community Antenna Television (Cable TV)
CAU Controlled Access Unit
CAV Constant Angular Velocity
CAVE Computer Automatic Virtual Environment
CBC Cipher Block Chaining
CBCR Channel Byte Count Register
CBDS Connectionless Broadband Data Service
CBEMA Computer and Business Equipment Manufacturers Association
CBGA Ceramic Ball Grid Array
CBI Computer Based Instruction\Instrumentation
CBL Computer Based Learning
.CBL COBOL source code (dosya adı uzantısı)
CBMS Computer-Based Mail System
CBR Case Based Reasoning + Constant Bit Rate
CBT Computer Based Training
CBW Convert Byte to Word
CBX Computer-Controlled Branch Exchange
CC Cluster Controller
CC: Carbon Copy
CCD Charged-Coupled Device
CCFT Cold Cathode Fluorescent Tube
CCI Common Client Interface
CCIE Cisco Certified Internetwork Expert (Cisco)
CCL Connection/Cursor Control Language
CCM Corba Component Mode
CCNA Cisco Certified Network Associate
CCNP Cisco Certified Network Professional
CCP Certified Computing Professional + Console Command Processor
CCS Common Command Set + Common Communications Services +
CCS Common Communications Support +
CCS Continuous Composite Servo + Cryptographic Checksum
.CCS Color Calibration System (dosya adı uzantısı)
CCSD Cellular Circuit-Switched Data
CCTLD Country Code Top-Level Domain
CD Carrier Detect + Change Directory +
CD Collision Detection + Color Display + Compact Disk
C/D Control Data
C2D Character To Decimal (REXX)
CDA Compound Document Architecture (DEC)
.CDA CD Audio Track (dosya adı uzantısı)
CDBT Compact Disk-Based Training
CDC Connected Device Configuration + Control Data Corporation
CD_CHRDY Card Channel Ready (IBM)
第 7 页
常见E文缩写.txt
CD-DA Compact Disk -Digital Audio
CDDI Copper Distributed Data Interface
CDE Common Desktop Environment + Complex Data Entry
CD-E Compact Disk - Erasable
CDF Channel Definition Format
.CDF Comma Delimited Format (dosya adı uzantısı)
CDFS Compact Disc File System (Microsoft)
CD+G Compact Disk plus Graphics
CD-I Compact Disk - Interactive
CDIA Certified Document Imaging Architect
CDL Computer Design Language
CDMA Code Division Multiple Access
CDMF Commercial Data Masking Facility (IBM)
CD-MO Compact Disk - Magneto Optical
CDO Collaboration Data Objects (Microsoft)
CDOS Concurrent Disk Operating System
CDPD Cellular Digital Packet Data
CDR Call Detail Record + Call Detail Recording +
CDR Common Data Representation
.CDR CorelDRAW (dosya adı uzantısı) (Corel)
CD-R Compact Disk - Recordable
CD-RAM Cached RAM
CD-RDx Compact Disk - Read Only Memory Data Exchange Standard
CDRL Contract Data Requirements List
CD-ROM Compact Disk - Read Only Memory
CD-RTOS Compact Disk - Real Time Operating System
CD-RW Compact Disk - Rewritable
CDS Current Directory Structure
CDSA Common Data Security Architecture
CDSL (Bakınız DSL)
.CDT Corel Draw Template (dosya adı uzantısı)
CD-V Compact Disk - Video
CD-WO Compact Disk - Write Once
.CDX Compound Index (dosya adı uzantısı) (Fox Pro)
CD-XA Compact Disk - Extended Architecture
CE Cache Enable + Chip Enable + Collision Elimination +
CE Convert Enable
CEC Certified E-Commerce Consultant
CEG Continuous Edge Graphics
CEI Conducted Electromagnetic Interference
CELP Card Edge Low Profile (socket) (Intel)
CEMS Constituent Electronic Mail System
CEOP Conditional End Of Page
CER Canonical Encoding Rules
CERN The European Particle Physics Laboratory
CERT Computer Emergency Response Team
CFB Cipher Feedback + Configurable Function Block
.CFG Configuration (dosya adı uzantısı)
CFML ColdFusion Markup Language
CFR Computerized Facial Recognition
CFS Caching/Common File System
CFV Call For Votes (Bitnet)
CG Control Gate
CGA Color Graphics Adapter
CGE Common Graphics Environment
CGI Computer Generated Images + Computer Graphics Interface
CGI-BIN Common Gateway Interface - Binary
.CGM Computer Graphics Metafile (dosya adı uzantısı) + Graph (dosya adı uzantısı) (Lotus 1-2-3)
(LDC)
CGS Continuous-Grain Silicon
CHAP Challenge-Handshake Authentication Protocol
CHAR Character
CHAT Conversational Hypertext Access Technology (Internet)
CHCK Channel Check
CHCP Change Code Page
CHDIR Change Directory
CHFN Change Finger (Unix)
CHGRP Change Group
CHIPS Clearinghouse Interbank Payments System
.CHK CHKDSK (dosya adı uzantısı)
CHKDSK Check Disk
CHMOD Change Mode
CHOWN Change Owner
CHP Chapter
CHR Character
第 8 页
常见E文缩写.txt
CHRP Common Hardware Reference Platform
CHS Cylinder Head Sector
CHTML Compressed HTML
CI Component Interface
CIA Current Instruction Address
CIAC Computer Incident Advisory Capability
CICS/VS Customer Information Control System / Virtual Storage (IBM)
CID Charge-Injection Device + Configuration/Installation/Distribution
CIDR Classless Inter-Domain Routing
CIF Common Interchange/Intermediate Format + Crystallographic Information File
CIFS Common Internet File System
CIL Common Intermediate Language (ECMA)
CIM Common Information Model + CompuServe Information Manager +Computer Integrated Manufacturing
CIO Chief Information Officer
CIOCS Communication Input/Output Control System
CIP Command Interface Port + Common Indexing Protocol
CIR Committed Information Rate
CIRC Circular Reference + Cross-Interleaved Reed-Solomon Code
CIS Card Information Structure + Client Information System +
CIS CompuServe Information Service +
CIS Computer Information Systems + Contact Image Sensor +
CIS Customer Information System
CISC Complex Instruction Set Computing
CIT Computer-Integrated Telephony
CIVR Computer and Interactive Voice Response
CIW Certified Internet Webmaster
CIX Commercial Internet Exchange + Compulink Information Exchange
CJLI Command Job Language Interpreter
CKD Count Key Data (device)
CLAR Channel Local Address Register
CLASS Client Access to Systems and Services +
CLASS Cooperative Library Agency for Systems and Services +
CLASS Custom Local-Area Signaling Services
CLC Clear Carry Flag
CLD Clear Direction Flag
CLDC Connected Limited Device Configuration
CLEC Competitive Local Exchange Carrier
CLI Call-Level Interface + Clear Interrupt Flag +
CLI Client Library Interface + Command Line Interface +
CLI Common Language Infrastructure/Interface
CLIB C Library
CLID Calling Line Identification
CLIST Command List
CLK Clock
CLNP Connectionless Network Protocol
CLOS Common Lisp Object System
CLP Cell Loss Priority + Constraint Logic Programming
.CLP Clipboard (dosya adı uzantısı) (Microsoft)
CLR Common Language Runtime (Microsoft)
CLS Clear Screen + Common Language Support
CLSID Class Identifier
CLTP Connectionless Transport Protocol
CLTS Clear Task Switch Flag
CLTV Constant Linear Time Velocity
CLUI Command Line User Interface
CLUT Color Look-Up Table
CLV Constant Linear Velocity
CM Centimeter + Control Mark + Corrective Maintenance
CMA Concert Multi-thread Architecture
CMC Common Mail Calls + Common Messaging Calls +
CMC Communication Management Configuration +
CMC Complement Carry Flag +
CMC Computer-Mediated Communication (Internet)
CMD Circuit Mode Data
.CMD Command (dosya adı uzantısı)
CMF Creative Music Format
CNIDR Clearinghouse for Network Information and Discovery and Retrieval (Internet)
CMIP Common Management Information Protocol
CMIS Common Management Information Services/System
CML Chemical Markup Language + Conceptual Modelling Language +
CML Computer Managed Learning + Current Mode Logic
CMM Capability Maturity Model
CMMS Computerized Maintenance Management Software
CMMU Cache/Memory Management Unit (Motorola)
CMOS Coats-Mellon Operational Specification +
CMOS Complementary Metal-Oxide Semiconductor
第 9 页
常见E文缩写.txt
CMOV Conditional Move
CMP Compare + Computer
CMPS Compare Word String
CMS Call Management Server + Code Management System +
CMS Compiler Monitor System + Conversation Monitor System
CMTS Cable Modem Termination System
CMVC Configuration Management Version Control (IBM)
CMW Compartmented Mode Workstation
CMY Cyan-Magenta-Yellow (color model)
CMYK Cyan-Magenta-Yellow-Black (color model)
CNA Certified NetWare/Network Administrator
CNAPS Co-Processing Node Architecture for Parallel Systems
CNC Computerized Numerical Control
CNE Certified NetWare Engineer
.CNF Configuration (dosya adı uzantısı)
CNG Calling (tone)
CNI Certified Novell Instructor (Novell)
CNIDR Clearinghouse for Networked Information and Discovery and Retrieval (Internet)
CNN Composite Network Node
CNR Carrier to Noise Ratio + Communication Network Riser
CNSS Core Nodal Switching Subsystem (Internet)
.CNT Contents (dosya adı uzantısı)
CNV Conventional (pertaining to Memory)
CNVT Convert
CNX Certified Network Expert
CO Central Office + Command Output + Convert Out
COAST Card On A Stick (module)
COAX Coaxial Cable
COB Chip-On-Board
.COB COBOL source code (dosya adı uzantısı)
COBOL Common Business-oriented Language (Bakınız HLL)
.COD Code List (dosya adı uzantısı)
CODASYL Conference on Data System Languages (Group thatdesigned COBOL)
CODE Client-Server Open Development Environment
CODEC Coder/Decoder + Compression/Decompression
COEM Commercial Original Equipment Manufacturer
COFF Common Object File Format (Unix)
COGO Coordinate Geometry (Programming Language)
COL Collision + Computer Oriented Language
COLD Computer Output to Laser Disk
COLL Collision
COM Component Object Model (Microsoft) + Computer Output Microfilm
.COM Command (dosya adı uzantısı) + Commercial Business (Domain Name) (Internet)
COM1 First serial Port (asynchronous port)
COM2 Second serial Port
COM3 Third serial Port
COM4 Fourth serial Port
COMDEX Computer Dealers Exposition
COMET Cornell Macintosh Terminal Emulator
COMM Communications
COMP Compare
COMP. Computers (USENET Newsgroup Category)
COMSAT Communications Satellite Corporation
CON Console (includes Keyboard and Screen)
COND Condition
CONFIG Configuration
CONS Connection-Oriented Network Service
CONTONE Continuous Tone
.COOP Cooperatives-Business (Domain Name) (Internet)
COPICS Communications Oriented Production Information and Control System (IBM)
COR Common Object Runtime
CORBA Common Object Request Broker Architecture
COREN Corporation for Research and Enterprise Network
COS Compatible Operating System
COSE Combined Office Standard Environment + Common Open Software/Systems Environment
COSMIC Computer Software Management and Information Center (NASA)
COSMOS Computer System for Mainframe Operations
COSS Common Object Services Specification
COTS Commercial Off-The-Shelf (software)
CP Copy Protected
CPA Certified Public Accountant + Cost Per Action
CPAN Comprehensive Perl Archive Network
CPC Constant Point Calculation + Cost Per Click
CPCS Check Processing Control System (IBM)
CPE Central Processing Element + Customer Premises Equipment +Customer Provided Equipment
.CPE Cover Page (dosya adı uzantısı)
第 10 页
常见E文缩写.txt
CPFR Collaborative Planning, Forecasting and Replenishment
CPG Clock Pulse Generator
CPI Characters Per Inch + Clock Per Instruction + Common Programming Interface (IBM)
.CPI Code Page Information (dosya adı uzantısı) (MS-DOS)
CPI-C Common Programming Interface for Communications (IBM)
CPIO Copy In and Out (Unix)
CPL Current Privilege Level
.CPL Control Panel (dosya adı uzantısı)
CPLD Complex Programmable Logic Device
CPM Critical Path Method
CP/M Control Program for Microcomputers (Digital Research)
CPO Chief Privacy Officer
CPRM Content Protection for Recordable Media
CPS Characters Per Second + Cycles Per Second
CPT Command Pass Through
CPU Central Processing Unit
CPW Commercial Processing Workload (IBM)
CR Carriage Return
CRAM Challenge-Response Authentication Mechanism +Cyberspatial Reality Advancement Movement
CRAYON Create Your Own Newspaper
CRC Cyclic Redundancy Check
.CRD Cardfile (dosya adı uzantısı) +
.CRD Chord (music dosya adı uzantısı)
CREN Computer Research Education Network +Corporation for Research and Education Networking
CRF Cable Retransmission Facility + Cross Reference File
CRI Color Reproduction Indices
CRL Certificate Revocation List
CR/LF Carriage Return/Line Feed
CRM Customer Relationship Management
CROM Control Read Only Memory
CRT Cathode Ray Tube
CRTC CRT Controller
CRUD Create, Retrieve, Update, Delete
CS Chip Select + Clear to Send + Code Segment
C/S Client/Server
CSA Calendaring and Scheduling API (IBM)
CSAR Channel System Address Register
CSCW Computer Supported Cooperative Work
CSD Circuit-Switched Data +Computer Services Department + Corrective Service Diskette (IBM)
CSDS Circuit Switched Data Service
CSE Certified System Engineer
CSFI Communication Subsystem For Interconnection
CSG Constructive Solid Geometry +Consulting Services Group (Lotus)
CSI Command Sequence Introducer + CompuServe Incorporated
CSID Call Subscriber Identification
CSL Computer Sensitive Language
CSLIP Compressed Serial Line Interface Protocol (Internet)
CSM Code Set Map (file) + Communications Services Manager
CSMA/CA Carrier Sense Multiple Access/with Collision Avoidance
CSMA/CD Carrier Sense Multiple Access/with Collision Detection
CSMS Customer Support Management System
CSN Card-Select Number
CSNET Computer Science Network
CSO Central Services Organization
CSP Certified Systems Professional +Chip-Scale Packaging +Commercial Service Provider +
CSPDN Circuit Switched Public Data Network
CSRAM Custom Static RAM
CSS Continuous System Simulator (Language)
CSS Cascading Style Sheet (Microsoft) +Contact Start-Stop + Content Scrambling System
CSSM Client-Server Systems Management (IBM)
CS/SS Card Service/Socket Service
CSTA Computer-Supported Telephony Applications
CSU Channel Service/Switching Unit
CSV Circuit-Switched Voice +Comma-Separated Value/Variable +Common Services Verbs (interface)
(Microsoft)
C2T Cable Changing Technology
C&T Chips and Technologies
CTB Cipher Type Byte
CTC Channel To Channel + Counter/Timer Chip
CTCP Client-To-Client Protocol
CTI Computer-Telephony Integration
CTL Complex Text Layout
CTOS Cassette Tape Operating System +Computerized Tomography Operating System +
CTPA Coax-to-Twisted-Pair Adapter
CTRL Control
第 11 页
常见E文缩写.txt
CTS Clear To Send + Computer Telephony Solution (IBM) +Customer Telephone System
CTSS Compatible Time Sharing System
CUA Common User Access (IBM)
CUB Cursor Backward
CUD Cursor Down
CUE Custom Updates and Extras (card) (Egghead Software)
CUF Cursor Forward
CUI Character-Oriented User Interface +Common User Interface (IBM)
CUP Cursor Position
CUPID Completely Universal Processor I/O Design (AST)
.CUR Cursor (dosya adı uzantısı)
CUT Control Unit Terminal
CUTE Clarkston University Terminal Emulator
CUU Cursor Up
CVF Compressed Volume File
CVGA Color Video Graphics Array
CVIA Computer Virus Industry Association
CVS Concurrent Versions System
CVT Convert
CVW CodeView for Windows
CWA Competitive Web Analysis
CWD Convert Word to Double Word +Change Working Directory (Internet)
CWIS Campus Wide Information Service/System (Internet) +
CWIS Community Wide Information Service/System (Internet)
C2X Character To Hexadecimal (REXX)
CXML Commerce Extensible Markup Language
CYL Cylinder
CYMK Cyan-Yellow-Magenta-Black (color model)
D/A Digital to Analog
DAA Data Access Arrangement +Decimal Adjust for Addition
DAB Digital Audio Broadcasting
DAC Data Acquisition and Control + Device Access Code +Digital to Analog Converter
DACL Discretionary Access Control List
DAD Desktop Application Director (Borland)
DAE Digital Audio Extraction
DAI Distributed Artificial Intelligence
DAL Data Access Language (Apple Computer) +Data Access Layer + Disk Access Lockout
DAM Data Acquisition and Monitoring
DAMPS Digital AMPS
DAO Data Access Object (Microsoft)
DAP Data Access Protocol (DEC) +Developer Assistance Program
DAPIE Developers Application Programming Interface Extensions
DARI Database Application Remote Interface (IBM)
DARMS Digital Alternate Realization of Musical Symbols
DART Digital Audio Reconstruction Technology
DAS Decimal Adjust for Subtraction +Dual-Attached Station
DASD Direct Access Storage Device (IBM)
DAT Digital Audio Tape + Disk Array Technology
.DAT Data (dosya adı uzantısı)
DATACOM Data Communications
DAV Digital Audio-Video +Distributed Authoring and Versioning
DAVIC Digital Audio-Visual Council
dB Decibel
DB Data Base + Data Buffer + Device Bay
dBA Adjusted Decibel
.dba Date Book Archive (dosya adı uzantısı) (Palm)
DBC Device Bay Controller
DBCS Delivery Bar Code Sorter + Double-Byte Character Set
.DBF Database Format (dosya adı uzantısı)
DBIS Dun & Bradstreet Information Services
.DBK Docbook (format) (dosya adı uzantısı)
DBM Data Base Manager
DBMS Data Base Management System
DBR DOS Boot Record
DBS Data Base Server + Direct (to home) Broadcast (satellite) System
DBV Digital Broadcast Video
DBWR Database Writer (Oracle)
DB2 Database 2
DC Data Collection + Data Communication + Data Control +
DC Device Control + Direct Current + Domain Control
D2C Decimal To Character (REXX)
DCA Digital Communications Associates +Document Content Architecture (IBM)
DCAF Distributed Console Access Facility (IBM)
DCAM Digital Camera + Direct Chip Attach Module
DCB Device Control Block + Disk Coprocessor Board (Novell)
DCC Data Country Code + Digital Command Control +
第 12 页
常见E文缩写.txt
DCC Digital Compact Cassette + Direct Cable/Client Connection
DCD Data Carrier Detect
DCE Data Circuit-Terminating Equipment +Data Communications Equipment +Distributed Computing
Equipment
DCED Distributed Computing Environment Daemon
DCF Data Communication Facility (IBM) +Data Compression Facility +Data Count Field (IBM) +
D-CHANNEL Data Channel
DCI Display Control Interface
DCL Data Control Language + Declaration +Device Clear + Digital Control Logic
DCML Dynamic Configuration Markup Language
DCOM Distributed Component Object Model
DCP Device Control Protocol +Digital Light Processing (TI)
DCS Data Collection System + Data Control System +
DCS Desktop Color Separation + Distributed Control System
DCT Discrete Cosine Transform
.DCT Dictionary (dosya adı uzantısı)
DCU Data-Cache Unit
DD Day + Digital Display + Double Density
DDA Distributed Data Access + Domain-Defined Attribute
DDB Device Dependent Bitmap + Device Descriptor Block
DDC Digital Data Channel (VESA) + Display Data Channel
DDCMP Digital Data Communications Message Protocol (DEC)
DDC1 Display Data Channel One
DDCS Distributed Database Connection Services (IBM)
DDD Direct Distance Dialing
DDE Direct Data Entry + Dynamic Data Exchange (Microsoft)
DDEML Dynamic Data Exchange Manager Library (Microsoft)
DDF Display Data Channel + Dynamic Data Formatting (IBM)
DDI Device Driver Interface +
Digital Document Interchange + Direct Dial In
DDK Device Driver Kit (Microsoft Windows)
DDL Data Definition Language + Data Description Language
DDM Distributed Data Management
DDN Defense Data Network
DDNS Dynamic Domain Naming System
DDOS Distributed Denial Of Service
DDP Datagram Delivery Protocol +Distributed Data Processing
DDR Dynamic Document Review (Symantec)
DDR-SDRAM Double Data Rate-SDRAM
DDS Data Description Specification +Digital Dataphone Service (AT&T) + Design Data Sheet
DDX Digital Data Exchange
DE Device End
DEA Data Encryption Algorithm + Disposable Email Address
DEC Decrement + Device Clear + Digital Equipment Corporation
DECNET Digital Equipment Corporation Networking (protocol)
DEF Desktop Functional Equivalent (Compaq)
.DEF Definitions + Defaults (dosya adı uzantısıs)
DEFRAG Defragment
DEK Data Encryption Key
DEL Delete
DELSTR Delete String (REXX)
.DEM Demonstration (dosya adı uzantısı)
DEN Directory Enabled Network +Document Enabled Networking (Novell-Xerox)
DER Distinguished Encoding Rules
DES Data Encryption Standard + Data Entry Sheet
.DES Description (dosya adı uzantısı)
DET Device Execute Trigger
DEV Device
DF Data Field + Default + Destination Field +Device Flag + Double Flag
DFC Data Flow Control
DFD Data Flow Diagram
DFDR Digital Flight Data Recorder
DFM Design For Manufacturability (IBM)
DFP Digital Flat Panel
DFS Distributed File System
DFSMS Data Facility Storage Management Subsystem (IBM)
DFT Design For Testability + Diagnostic Function Test
DFU Data File Utility
DGIS Direct Graphics Interface Standard
DHCP Dynamic Host Configuration Protocol
DHL Dynamic Head Loading
.DHP Dr. Halo PIC (dosya adı uzantısı)
DHTML Dynamic HTML
DI Data In + Destination Index
DIA Document Interchange Architecture (IBM)
第 13 页
常见E文缩写.txt
DIB Device Independent Bitmap +Directory Information Base +Dual Independent Bus (Intel)
DIBOL DEC Business Oriented Language
.DIC Dictionary (dosya adı uzantısı)
DICOM Digital Imaging and Communications in Medicine
DID Direct Inward Dialing
DIDS Distributed Intrusion Detection System
DIF Data Interchange Format
DIFFSENS Differential Sense
DIIP Direct Interrupt Identification Port
DIME Direct Internet Message Encapsulation
DIMM Dual In-Line Memory Module
DIN Deutsche Industrie Norm (German equivalent of EIA)
DIO Data Input-Output
DIP Dialup Internet Protocol (Internet) +Digital Imaging Processing +Dual In-line Package + Dual
In-line Pin
DIR Directory (file)
DIS Draft International Standard +Dynamic Impedance Stabilization (CompuCom)
DISA Data Interchange Standards Association +Direct Inward System Access
DISP Displacement (offset)
DIT Directory Information Tree
DIV Divide
DIVE Direct Interface Video Extension (OS/2 Warp)
DIVX Digital Video Express
DIW D-Inside Wire (AT&T)
DIX Digital-Intel-Xerox (Original Ethernet Standard)
.DIZ Description In Zip (dosya adı uzantısı)
DL Download (also D/L)
DL/1 Data Manipulation Language 1 (IBM)
DLB Dynamic Load Balancing
DLC Data Link Control (protocol) (IBM) +Distributed Loop Carrier
DLCI Data Link Connection Identifier
DLD Display List Driver
DLE Data Link Escape
DLL Dynamic Link Library
DLM Distributed Lock Manager + Dynamic Link Module
DLP Digital Light Processing (TI)
DLPI Data Link Provider Interface
DLR DOS LAN Requester
DLS Data Link Switching (IBM)
DLT Digital Linear Tape
DM Distributed Memory
DMA Direct Memory Access/Addressing +Document Management Alliance
DMAC DMA Controller
DMACS Distributed Manufacturing Automation & Control Software
DMD Digital Micromirror Device (TI)
DME Direct Memory Execution +Distributed Management Environment
DMF Distribution Media Format (Microsoft)
DMI Desktop Management Interface
DML Data Manipulation Language +Dialog Markup Language (W3C)
DMM Digital Multimeter
DMMS Dynamic Memory Management System
DMOS Double-diffused Metal-Oxide Semiconductor
DMP Dot Matrix Printer
DMPC Distributed Memory Parallel Computer
DMPP Distributed Memory Parallel Processor
DMQS Display Mode Query and Set (IBM)
DMS Data Management Software + Data/Document Management System
DMSD Digital Multistandard Decoding
DMSDK Digital Media Software Development Kit (SGI)
DMSS Distributed Mass Storage System
DMT Digital/Discrete Multi-Tone
DMTF Desktop Management Task Force
DMY Day Month Year
DN Down
DNA Deoxyribonucleic Acid
DNC Direct Numerical Control
DNIC Data Network Identification Code
DNIS Dialed Number Identification Service
DNS Domain Naming System
DO Data Out + Distributed Objects
DOA Dead On Arrival
.DOC Document + Documentation (dosya adı uzantısıs)
DOCSIS Data Over Cable-Service Interface Specification
DOCSV Data Over Circuit-Switched Voice
DOE Distributed Objects Environment/Everywhere
第 14 页
常见E文缩写.txt
DOIP Dial Other Internet Providers (IBM)
DO-IT Disabilities, Opportunities, Internetworking and Technology
DOLAP Desktop OLAP
DOM Document Object Model (W3C)
DOMF Distributed Object Management Facility
DOS Denial Of Service + Disk Operating System
DOSEM DOS Emulation
.DOT Document Template (dosya adı uzantısı)
DOV Data Over Voice
DOW Day Of Week
DP Data Processing
DPA Demand Protocol Architecture (3Com) +Document Printing Architecture
DPAM Demand Priority Access Method
DPAREN Data Parity Enable (IBM)
Bu kısaltmalar faruk çubukçu tarafından derlenmiştir.
DPB Drive Parameter Block
DPC Direct Program Control
DPI Distributed Protocol Interface + Dots Per Inch
DPL Descriptor Privilege Level
DPM Digital Panel Meter
DPMA Data Processing Management Association
DPMI DOS Protected Mode Interface (Microsoft)
DPMS Digital Power Management Signaling +Display Power Management Support
DPO Data Phase Optimization
DPS Document Processing System
DPSK Differential Phase Shift Keying
DQDB Distributed Queue Dual Bus
DQL Data Query Language
DR Data Received
D/R Direct or Reverse
DRAM Dynamic Random Access Memory
DRAW Direct Read After Write
DR.BOND Dial-up Router Bandwidth On Demand (NEC)
DRDA Distributed Relational Database Algorithm/Architecture (IBM)
DR-DOS Digital Research-Disk Operating System
DRDW Direct Read During Write
DRI Declarative Referential Integrity +Digital Research Incorporated
DRM Digital Rights/Distributed Resource Management
DRO Data Request Output + Destructive Read-Out
DRS Document Registration System
.DRS Driver Resource (dosya adı uzantısı) (WordPerfect)
DRV Drive
.DRV Device Driver (dosya adı uzantısı) (Also bakınız .DVR)
.DRW Draw + Drawing (dosya adı uzantısıs)
DS Data Segment + Data Send + Data Server + Double Sided
D/S Dhrystone Per Second
DSA Digital Signature Algorithm + Directory System Agent
DSAP Destination Service Access Point
DSD Direct Stream Digital (Sony-Philips)
DSDD Double Sided, Double Density (diskette)
DSE Data Storage Equipment
DSEA Display Station Emulation Adapter
DSECT Dummy Control Section
DSHD Double Sided, High Density (diskette)
DSIG Digital Signature
DSIS Distributed Support Information Standard
DSL Digital Subscriber Line
ADSL Asymmetric DSL
BDSL Broadband DSL
CDSL Consumer DSL (Rockwell)
FDSL Fixed Directory Subscriber List
HDSL High-Bit-Rate DSL +High-Data-Rate DSL
IDSL Integrated Services Digital Network DSL
RDSL Rate-Adaptive DSL
SDSL Single-Line DSL +Symmetric DSL
VDSL Very-High-Bit-Rate DSL
VADSL Very-High-Rate Asymmetric DSL
VDSL Very-High-Data-Rate DSL
DSL Dynamic Simulation Language
DSLAM Digital Subscriber Line Access Multiplexer
DSM Distributed Shared Memory
DSMA Digital Sense Multiple Access
DSML Directory Services Markup Language
DSN Delivery Service Notification
DSOM Distributed System Object Model
DSP Delivery Service Partner +Digital Signal Processing/Processor +Digital Sound Processor
第 15 页
常见E文缩写.txt
DSPT Display Station Pass-Thru (IBM)
DSQD Double Sided, Quad Density (diskette)
DSR Data Set Ready + Device Status Register +Device Status Report
DSS Decision Support System + Digital Signature Standard +Direct Station Selector
DSSI Digital Standard Systems Interconnect (DEC)
DSSS Direct-Sequencing Spread Spectrum
DSSSL Document Style Semantics and Specifications Language
DSTN Double Supertwisted Nematic
DSU Data Service/Switching Unit + Digital Service Unit
DSVD Digital Simultaneous Voice and Data
DSW Data Status Word + Device Status Word
DSX Digital Signals Cross-Connect
D2T2 Dye Diffusion Thermal Transfer (printing)
DTA Disk Transfer Area
.DTA Data (dosya adı uzantısı)
DTC Desktop Conferencing
DTD Document Type Definition
DTE Data Terminal Equipment + Dumb Terminal Emulator
DTF Distributed Test Facility
DTL Dialogue Tag Language (IBM) + Diode-Transistor Logic
DTM Digital Terrain Mapping
DTMF Data Tone Multiple Frequency + Dual Tone Multifrequency
DTP Desktop Publishing + Distributed Transaction Process
DTR Data Terminal Ready + Data Transfer Rate
DTS Distributed Traffic Shaping (Cisco)
DTSS Dartmouth Time Sharing System
DTV Desktop Video + Digital Television
DTVC Desktop Video Conferencing
DU Disk Usage
DUA Directory User Agent
DUAT Direct User Access Terminal
DUN Dial-Up Networking (Microsoft)
DUNCE Dial Up Network Connection Enhancement
DV Digital Video
.DV DESQview Script (dosya adı uzantısı)
DVC Desktop Video Conferencing + Digital Video Camera
DVD Digital Video Disk
DVD-A Digital Video Disk-Audio
DVD-R Digital Video Disk-Recordable
DVD-RAM Digital Versatile Disc-RAM
DVD-ROM Digital Versatile Disc-ROM
DVE Digital Video Effect
DVI Digital Video Interactive + Digital Visual Interface
.DVI Device Independent (dosya adı uzantısı)
DVM Digital Volt Meter
DVMRP Distance Vector Multicast Routing Protocol (Internet)
DVOF Digital Video Over Fiber
DVR Digital Video Recorder
.DVR Device Driver (dosya adı uzantısı) (Also bakınız .DRV)
DW Data Warehousing
DWDM Dense Wavelength Division Multiplexer
DWG Drawing
DWMT Discrete Wavelet Multitone
DWT Discrete Wavelet Transform
D2X Decimal To Hexadecimal (REXX)
.DXB Drawing Interchange Binary (dosya adı uzantısı)
(AutoCAD)
DXC Data Exchange Control
DXF Data Exchange File + Drawing Exchange Format
DXI Data Exchange Interface
DYNSLT Dynamic Select (IBM)
DYNSRC Dynamic Source
EA Effective Address + Extended Attribute (OS/2)
EAI Enterprise Application Integration
EAP Extensible Authentification Protocol
EAR External Access Register
EARN European Academic Research Network
EAROM Electrically Alterable Read Only Memory
EARS Electronic Access to Reference Services +Electronic Authoring and Routing System (DEC)
EATA Enhanced AT Bus Attachment
Bu kısaltmalar faruk çubukçu tarafından derlenmiştir.
EAX Environmental Audio Extensions (Creative)
EB Exabyte (1,024 petabytes)
EBASIC Extended BASIC
EBC EISA Bus Controller
EBCT Electron Beam Computed Tomography
第 16 页
常见E文缩写.txt
EBCDIC Extended Binary Coded Decimal Interchange Code (IBM)
EBI Equivalent Background Input +Extended Background Investigation
EBNF Extended Backus-Naur Form
EBOOK Electronic Book
EBPP Electric Bill Presentment and Payment
EBT Electronic Benefits Transfer
EC Electronic Commerce + Error Control
ECAL Enjoy Computing And Learn
ECAT Electronic Card Assembly and Test (IBM)
ECB Electronic Codebook + Event Control Block
ECC Elliptic Curve Crypto + Error Check Code +Error Checking and Correction + Error Correction Code
ECD Enhanced Color Display + Enhanced Compact Disk
ECDL European Computer Driving Licence
ECHO European Commission Host Organization (Internet)
ECI External Call Interface
ECL Emitter Coupled Logic
ECM Electronic Control Module
ECMA European Computer Manufacturers Association
ECN Electronic Communications Network
ECNE Enterprise Certified NetWare Engineer (Novell)
ECP Enhanced/Extended Capabilities Port (Microsoft)
ECS Enhanced Chip Set
ECTL Electronic Communal Temporal Lobe
ECU EISA Configuration Utility
ED Erase Display
EDA Electronic Design Automation +
EDB Embedded Database
EDC Electronic Digital Computer +Enhanced Data Correction +Error Detection and Correction
EDDC Extended Distance Data Cable
EDE Encrypt-Decrypt-Encrypt
EDGAR Electronic Data Gathering, Analysis and Retrieval
Bu kısaltmalar faruk çubukçu tarafından derlenmiştir.
EDGE Enhanced Data-Rates for Global Evolution
EDI Electronic Data Interchange +Electronic Document Interchange (DEC)
EDIF Electronic Design Interchange Format
EDIFACT EDI for Administration Commerce and Transport
EDL Edit Decision List
EDLC Ethernet Data Link Control
EDLIN Editor (Line Text)
EDMS Electronic Document Management System
EDO Extended Data Out
EDOS Enhanced DOS for Windows
EDP Electronic Data Processing
EDPM Electronic Data Processing Machine
EDRAM Enhanced/Eraseable/Extended Dynamic Random Access Memory
EDS Electronic Data Systems (corporation)
EDSAC Electronic Delay Storage Automatic Computer
.EDU Educational Institutions (Domain Name) (Internet)
EDVAC Electronic Discrete Variable Automatic Computer
(First stored-program digital computer)
EE Extended Edition (IBM)
EEC Extended Error Correction
EEG Electroencephalogram
EEL Epsilon Extension Language
EEM Extended Memory Management
EEMAC Electrical & Electronic Manufacturers of Canada
EEMS Enhanced Expanded Memory Specification
EEPROM Electrically Erasable Programmable Read-Only Memory
EES Escrow Encryption Standard
EFA Extended File Attribute
EFF Electronic Frontier Foundation
EFI Electromechanical Frequency Interference +Electronics For Imaging
EFIGS English, French, Italian, German, Spanish
EFL Emitter Follower Logic
E-FORM Electronic Form
EFS Encrypting File System
EFTS Electronic Funds Transfer System
EGA Enhanced Graphics Adapter
EGP Exterior Gateway Protocol
EGREP Extended Global Regular Expression Print (Unix)
EHCI Enhanced Host Controller Interface
EHLLAPI Emulator High Level Language Application Programming Interface (IBM)
EIA Electronic Industries Association
EIDE Enhanced Integrated Drive Electronics
EIM Electronic Image Management
EIS Executive Information System
第 17 页
常见E文缩写.txt
EISA Extended Industry Standard Architecture
EJB Enterprise JavaBeans
EL Electroluminescent (display) + Erase Line
ELAN Emulated Local Area Network
ELC Embedded Linking and Control
ELD Electronic License Distribution
ELEC Enterprise Local Exchange Carrier
ELF Executable and Linking Format +Extremely Low Frequency
ELS Entry Level System
EM Electronic Mail + Emphasized + End of Medium +Expanded Memory
EMA Electronic Mail Association +Enterprise Management/Memory Architecture
EMACS Editing Macros (Unix)
E-MAIL Electronic Mail
EMB Extended Memory Block (LIM/AST)
EMC Electromagnetic Compatibility + Enhanced Memory Chip +E-Mail Connection + Extended Math
Coprocessor
EMF Extended Metafile Format (Microsoft)
EMI Electromagnetic Interference
.EML Electronic Mail (dosya adı uzantısı)
EMM Expanded Memory Manager
EMR Electro-Magnetic Radiation +Enhanced Metafile Record
EMS Electronic Mail System +Electronic Message Service + Energy Management System +Enhanced
Messaging Service
EMSAPI Extended Messaging Services Application Programming Interface
EMWAC European Microsoft Windows NT Academic Centre
.ENC Encoded (dosya adı uzantısı)
ENDEC Encoder/Decoder
ENDS Ends Segment
ENIAC Electronic Numerical Integrator Analyzer and Computer
ENQ Enquiry
ENSS Exterior Nodal Switching Subsystem (Internet)
EOA End Of Address
EOB End Of Block
EOC End Of Conversion
EOF End Of File + Enterprise Objects Framework
EOI End Of Interrupt + End Or Identify
EOJ End Of Job
EOL End Of Line + End Of List
EOM End Of Message
EOR Exclusive OR (Also XOR)
EOS Earth Observing System (NASA) + End Of String +Error Correction Code on SIMM
EOSDIS Earth Observing System Data and Information System (NASA)
EOT End Of Table + End Of Tape (marker) + End Of Text +End Of Transmission
EP Electrophotographic Engine
EPIC Explicitly Parallel Instruction Computing (chip) (Intel)
EPL Effective Privilege Level
EPLD Electrically Programmable Logic Device
EPM Enhanced Editor for Presentation Manager (IBM) +Enterprise Process Management (IBM)
EPP Enhanced Parallel Port
EPROCESS Executive Process
EPROM Electrically Programmable Read Only Memory +Erasable Programmable Read Only Memory
.EPS Encapsulated PostScript (dosya adı uzantısı)
EPSF Encapsulated PostScript Files
ERA Extended Registry Attributes
ERD Emergency Repair Disk + Entity Relationship Diagram
ERIC Educational Resources Information Center (Internet)
ERLL Enhanced Run Length Limited
EROM Erasable Read Only Memory
ERP Enterprise Resource Planning
ERR Error
ER/RC Extended Result/Response Code
ERU Emergency Recovery Utility (Microsoft)
ES Extra Segment
ESA Enterprise Systems Architecture (IBM) +European Space Agency
ESC EISA System Component + Escape
ESCD Extended System Configuration Data
ESCM Extended Services Communications Manager (IBM)
ESCON Enterprise System Connection (Architecture) (IBM)
ESC/P Epson Standard Code for Printers
ESD Electronic Software Distribution +Electrostatic Discharge + Emergency Startup Disk
ESDI Enhanced Small/System Device Interface
ESDRAM Enhanced SDRAM
ESF Extended Superframe
ESI End System Identifier +Enhanced Serial Interface (specification) (Hayes)
第 18 页
常见E文缩写.txt
ESMR Enhanced Specialized Mobile Radio
ESN Electronic Security/Serial Number
ESP Emulation Sensing Processor +Encapsulating Security Payload (header) +Enhanced Serial Port
(Hayes) + Enhanced Service Provider +
ESR Event Service Routine
ESS Electronic Switching System
ESU Electro-Static Unit
ET Enhancement Technology
ETACS Extended Total Access Communication System (IBM)
ETANN Electrically Trainable Analog Neural Network (chip) (Intel)
ETB End of Transmission Block
ETC Electronic Toll Collection + Enhanced Throughput Cellular (modem protocol) (AT&T)
E-TEXT Electronic Text
ETF Enriched Text Format
ETOM Electron-Trapping Optical Memory
ETPL Endorsed Tempest Products List
ETS Econometric Time Series
ETX End Of Text
EU Execution Unit
EUC End User Computing + Extended Unix Code (IBM)
EUI End-User Interface
EULA End-User License Agreement
EUVL Extreme Ultraviolet Lithography
EVE Extensible VAX Editor
EVGA Extended Video Graphics Array +Extended Video Graphics Adapter
EWAN Emulator Without A Good Name (Internet)
EWS Employee Written Software (IBM)
ExCA Exchangeable Card Architecture (Intel)
.EXE Executable (dosya adı uzantısı)
EXE2BIN Program used to convert an (.EXE) file to binary format (.COM) file
EXIF Exchangeable Image File Format
EXM Enterprise Messaging Exchange (Lotus)
EXP Exponent
EXT External
EXTRN External Reference
E-ZINE Electronic Magazine
FAB Computer-Chip Fabrication Plant
FAC File Access Code
FAMOS Floating Gate Avalanche MOS
FANS Future Air Navigation System
FAP File Access Protocol
FAPI Family Application Program Interface
FAQ Frequently Asked Question
FARNET Federation of American Research Networks (Internet)
FASIC Function and Algorithm-Specific Integrated Circuit
FAT File Allocation Table
FAX Facsimile
.FAX Fax (dosya adı uzantısı)
FBC Find By Content
FC/AL Fiber Channel/Arbitrated Loop
FCB File Control Block
FCC Federal Communications Commission
FCC: File Carbon Copy
FCCSET Federal Coordinating Council for Science, Engineering and Technology
FC/EL Fiber Channel/Enhanced Loop
FCI Flux Changes per Inch
FCL Fibre Channel Loop
FCPGA Flip Chip Pin Grid Array (Intel)
FCR FIFO Control Register
FCRAM Fast-Cycle RAM
FCS Fiber Channel Standard + Frame Check Sequence
FD Floppy Disk + Floppy Drive + Full Duplex
FDC Floppy Disk Controller
FDDI Fiber Digital Device Interface +Fiber Distributed Data Interface
FDHD Floppy Drive High Density
FDISK Fixed Disk
FDM Frequency Division Multiplexing
FDMA Frequency Division Multiple Access
FDSL (Bakınız DSL)
FDX Full Duplex
FEC Forward Error Correction
FECN Forward Explicit Congestion Notification
FED Field Emission/Emitter Display
Bu kısaltmalar faruk çubukçu tarafından derlenmiştir.
FEFO First-Ended, First-Out
第 19 页
常见E文缩写.txt
FEP Front End Processor
FEPI Front End Programming Interface
FEPROM Flash EPROM
FERAM Ferroelectric RAM
FESDK Far East Software Development Kit (Microsoft)
FET Field Effect Transistor
FF Flip-Flop + Form Feed
FFDC First Failure Data Capture (IBM)
FFS Fast File System
FFST First Failure Support Technology (IBM)
FFT Fast Fourier Transform + Final Form Text (IBM)
FG Floating Gate
FGREP Fixed Global Regular Expression Print (Unix)
FHS Fan Heat-Sink
FHSS Frequency-Hopping Spread Spectrum
FIA File Integrity Assessment
FIB Forwarding Information Base
FIF Fractal Image Format
FIFO First-In, First-Out
FILO First-In, Last-Out
FINDSTR Find Strings
FIP File Processor Buffering
FIPS Federal Information Processing Standard
FIR Fast Infrared + Finite Impulse Response
.FIRM Business or Firm (Domain Name) (Internet)
FIRST Forum of Incident Response and Security Teams
FITS Flexible Image Transport System
FIU Fingerprint Identification Unit (Sony)
FIX Federal Internet Exchange
FK Foreign Key
FLA Four Letter Acronym
FLC Ferro-electric Liquid Crystal
FLD Field
FLL FoxPro Link Library (Microsoft Fox Pro)
FLOPS Floating Point Operations Per Second
.FLR Folder (dosya adı uzantısı)
FMD Fluorescent Multilayer Disk
FMRI Functional Magnetic Resonance Imaging
FMS Forms Management System
FMT Format
FMV Full Motion Video
FNT Font
FOCUS Forum of Control Data Users
FOD Fax On Demand
FOG First Osborne Group
FOIP Fax Over Internet Protocol
FOIRL Fiber Optic Inter Repeater Link (IEEE)
FOLDOC Free On-Line Dictionary Of Computing
.FON Font + Phone + Phone Directory (dosya adı uzantısı)
.FOR Fortran source code (dosya adı uzantısı)
FORTH (Programming Language)(Bakınız HLL)
FORTRAN Formula Translator (Programming Language)(Bakınız HLL)
FOSE Federal Office Systems Exposition
FOSI Format Option Specification Instance
FOSSIL Fido/Opus/Seadog Standard Interface Layer
FPC Floating Point Calculation
FPCE Floating-Point C Extension (specification)
FPGA Field Programmable Gate-Array
FPLA Field Programmable Logic-Array
FPM Fast Page Mode
FPP Fixed Path Protocol + Floating Point Processor
FPR Floating-Point Register
FPS Favorite Picture Selection + Frames Per Second
FPT Forced Perfect Termination
FPU Floating Point Unit
FPX FlashPix (format) (Kodak)
FQDN Fully Qualified Domain Name (Internet)
FRAD Frame Relay Access Device +Frame Relay Assembler/Disassembler
FRAG Fragment + Fragmentation
FRAM Ferroelectric Random-Access Memory
FRC Functional Redundancy Checking
FRED Frame Editor + Front-End to Dish
FRPI Flux Reversals Per Inch
.FRS WordPerfect Graphics Driver (dosya adı uzantısı)
FS File Separator
FSB Front Side Bus
第 20 页
常见E文缩写.txt
FSD File System Driver (OS/2)
FSE Full Screen Editor
FSF Free Software Foundation (Internet)
FSK Frequency Shift Keying
FSN Full Service Network
FSO Free Space Optics
FSP File Service Protocol
FSR Free System Resources
FST Flat Square Tube (monitor)
F/T Full Time
FTAM File Transfer, Access and Management +File Transfer and Access Method
FTL Flash Transition Layer (Intel)
FTM Flat Tension Mask (Zenith)
FTP File Transfer Protocol (Internet)
FTPD File Transfer Protocol Daemon
FTTB Fiber To The Basement
FTTC Fiber To The Curb
FTTN Fiber To The Neighborhood
FTS Federal Telecommunication System
FTX Fault Tolerant Unix
FUI File Update Information
FUNC Function
FVT Full Video Translation
FWTK Firewall Toolkit
FXP File Exchange Protocol
FYI For Your Information
GA General Availability
GAAP Generally Accepted Accounting Principles
GAL Generic Array Logic
GAPI Gateway Application Programming Interface
GART Graphics Address Relocation Table
GATT Graphics Address Translation Table
Gb Gigabit (1,024 megabits) +
GB Gigabyte (1,024 megabytes) +
GCC GNU C-Compiler (Unix)
GCCD Glass-Passivated Ceramic Chip Diode
GCR Group Code Recording
GDA Global Data Area + GNOME Data Access
GDDM Graphics Data Display Manager
GDG Generation Data Group (IBM)
GDI Graphical Device Interface
GDLC Generic Data Link Control (IBM)
GDP Graphic Draw Primitive
GDT Geometric Dimensioning and Tolerancing +Global Descriptor Table +Graphics Development Toolkit
GECOS General Electric Comprehensive Operating System
GEIS General Electric Information Service (company)
GEM Graphics Environment Manager (DRI Program)
GENIE General Electric Network for Information Exchange
GEO Geostationary Earth Orbit
GEOS Global Entity Ordering System +
GEOS Graphic Environment Operating System (Geoworks)
GET Get Execute Trigger
GFI General Format Identifier + Ground-Fault Interceptor
GGP Gateway-Gateway Protocol (Internet)
GHZ Gigahertz
.GID Topics (dosya adı uzantısı) (Microsoft)
.GIF Graphics Interchange Format (dosya adı uzantısı)
GIG-E Gigabit Ethernet
GIGO Garbage In, Garbage Out
GII Global Information Infrastructure
GILS Government Information Locator Service
GIMP GNU Image Manipulation Program
GIMPS Great Internet Mersenne Prime Search
GINA Graphical Identification and Authentication
GIS Geographic Information System +
GIX Global Internet Exchange (Internet)
GKS Graphical Kernel System
GL Graphics Language
G/L General Ledger
GLIS Global Land Information System (US Geological Survey)
GLM General Linear Models
GLOBE Global Learning by Observations to Benefit the Environment (Internet)
.GLY Glossary (dosya adı uzantısı) (Microsoft Word)
GMDI Gigabit Media-Dependent Interface
GML Generalized Markup Language
GMP Global Mobile Professional
第 21 页
常见E文缩写.txt
GMR Giant Magneto-Resistive (read head technology)
GMS Global Management System + Global Messaging Service (Novell)
GMT Greenwich Mean Time
GND Ground (signal/system)
GNN Global Network Navigator
GNU Gnu's Not Unix (işletim sistemi)
GNOME GNU Network Object Model Environment
GOAD GNOME Object Activation Directory
GOSIP Government Open Systems Interconnection Profile
.GOV Governmental (Domain Name) (Internet)
GP Gas Plasma + General Purpose
GPF General Protection Fault
GPI Graphics Programming Interface
GPIB General Purpose Information/Interface Bus
GPIO General Purpose Input/Output
GPL General Public License
GPR General Purpose Register (IBM)
GPRC Glass Passivated Rectifier Chip
GPRS General Packet Radio Service
GPS Global Positioning Satellite/System +Global Product Specification
GPSS General Purpose Systems Simulator (language)
GPU Graphics Processing Unit
GRADD Graphics Adapter Device Driver (IBM)
GRE Generic Routing Encapsulation + Graphics Engine
GREP Global Regular Expression Print
.GRF Graph (dosya adı uzantısı)
.GRP Group (dosya adı uzantısı)
GS Group Separator
GSI General Server Interface
GSM Global Shared Memory +Global System for Mobile-Communications (network)
GSNW Gateway Service for NetWare (Microsoft)
GSP Generic Server Passer + Global Service Provider
GSR Gigabit Switch Router
GSTN General Switched Telephone Network
Bu kısaltmalar faruk çubukçu tarafından derlenmiştir.
GTE General Telephone Electronics (corporation)
GTF Generalized Timing Format
GTL Gunning Transceiver Logic
GTO Guide To Operations (IBM)
GTS Generic Traffic Shaping (Cisco)
GUI Graphical User Interface
GUID Globally Unique Identifier +Global Universal Identifier
GVT Global Virtual Time
GW-BASIC Gee Whiz BASIC
GWES Graphic, Windowing and Event Subsystem
.gz Compressed dosya uzantısı
GZIP GNU Zip
.H Header (dosya adı uzantısı) (C)
HACMP High Availability Cluster Multi-Processing (IBM)
HAL Hard Array Logic + Hardware Abstraction Layer +House-Programmed Array Logic
HAL Heuristically Programmed Algorithmic (computer)
HAP Host Access Protocol
HARP-MRI Harmonic Phase MRI
HASP Houston Automatic Spooling Priority (System)
HBA Host Bus Adapter
HCL Hardware Compatibility List
HCSS High Capacity Storage System
HCU Home Computer User
HD Hard Disk + High Density
HDA Head Disk Assembly
HDC High Dependability Computing (Carnegie Mellon)
HDCD High Definition Compatible Digital
HDD Hard Disk Drive
HDF Hierarchical Data Format (NCSA)
HDI Head to Disk Interference
HDL Hardware Description Language
HDLC High-Level Data Link Control
HDM Hardware Device Module
HDML Handheld Device Markup Language
HDR Header + High Data Rate
HDSC High Density Signal Carrier (DEC)
HDSL (Bakınız DSL)
HDSS Holographic Data Storage System
HDT Host Digital Terminal
HDTV High Definition Television
HDVD High Definition Volumetric Display
第 22 页
常见E文缩写.txt
HDW Hardware
HDX Half Duplex
HEOS High Earth Orbiting Satellite
HERC Hercules
HEX Hexadecimal
HFC Hybrid Fiber-Coaxial
HFS Hierarchical File System (Macintosh)
HFT High Function Terminal (IBM)
HGA Hercules Graphics Adapter
HGCP Hercules Graphics Card Plus
HH Hour
HIDS Host-Based Intrusion Detection System
HIF Hyper-G Interchange Format
HIFD High-Density Floppy Disk
HIL Human Interface Link (HP)
HIMEM High Memory
HIPPI High Performance Parallel Interface
HLCO High Low Close Open
HLL High Level Language
HLLAPI High Level Language Application Programming Interface
.HLP Help (dosya adı uzantısı)
HLQ High Level Qualifier
HLS Hue, Luminance, Saturation (color model)
HLT Halt
HMA High Memory Area (Microsoft) +Hub Management Architecture
HMD Head Mounted Display
HMI Human-Machine Interface
HMM Hidden Markov Model
HMMP Hyper-Media Management Protocol
HMOS High Density Metal Oxide Semiconductor +High Speed Metal Oxide Semiconductor
HMP Host Monitoring Protocol
HOL High Order Logic
HOLAP Hybrid OLAP
HOTT Hot Off The Tree (electronic newsletter)
HOV High Occupancy Vehicle
HP Hewlett-Packard (Company)
HPC Handheld Personal Computer
HPCC High Performance Computing and Communications
HPDJ Hewlett-Packard Desk Jet
HPFS High-Performance File System
HPG Hewlett-Packard Graphics
HPGL Hewlett-Packard Graphics Language
HPIB Hewlett-Packard Interface Bus
HPLJ Hewlett-Packard Laser Jet
HPOM Home Page Objects Model (Microsoft)
HPPA Hewlett-Packard Precision Architecture
HPPI High Performance Parallel Interface
HPR High Performance Routing (IBM)
HPSB High Performance Serial Bus
HPUX Hewlett-Packard Unix
HPW High Performance Workstation (Sun)
.HQX BinHex (dosya adı uzantısı) (Macintosh)
HRIS Human Resource Information System
HRG High Resolution Graphics
HRMS Human Resource Management System
HRTF Head Related Transfer Function
HS High Speed
HSB Hue, Saturation, Brightness (color model)
HSC Hierarchical Storage Controller + High Speed Channel
HSI Hue, Saturation, Intensity
HSM Hierarchical Storage Management
HSP High Speed Printer/Processor
HSSI High Speed Serial Interface
HST High Speed Technology (U.S. Robotics)
.HST History + Host (dosya adı uzantısıs)
HSV Hue Saturation Value
HTML HyperText Markup Language
HTTP HyperText Transfer Protocol
HTTP-NG HTTP Next Generation
HTTPS HyperText Transfer Protocol Secure
HUD Heads Up Display
HUT Hopkins Ultraviolet Telescope
H/V Horizontal/Vertical
HVP Horizontal & Vertical Position
H/W Hardware
HWCP Hardware Code Page
第 23 页
常见E文缩写.txt
HWD Height-Width-Depth
HWDM Hyperfine Wave Division Multiplexing
.HYP Hyphenation (dosya adı uzantısı)
HYTELNET Hypertext-browser for Telnet Accessible Sites
Hz Hertz
IA Intel Architecture (Intel)
IAB Internet Architecture Board
IAC Inter-Application Communication (Macintosh)
IAD Integrated Access Device
IAEC International Address Element Code
IAG Instruction Address Generation
IAK Internet Access Kit (IBM)
IAL International Algebraic Language
IANA Internet Assigned Numbers Authority
IAP Internet Access Provider
IAS Internet Access Server
IAT Import Address Table
IAUP Internet User Account Provider
IBC Instrument Bus Computer
iBCS Intel Binary Compatibility Specification
IBIP Information Based Indicia Program (U.S. Postal Service)
IBM International Business Machines (Corporation)
IBM-GL IBM Graphics Language
IC Input Circuit + Integrated Circuit + Interrupt Controller
ICA Intelligent Console Architecture +Intra-application Communications Area
ICANN International Corporation for Assigned Names and Numbers
ICAP Internet Calendar Access Protocol (Lotus)
ICAS Intel Communicating Applications Specifications
ICB Internet Citizen's Band
ICCP Institute for the Certification of Computing Professionals
ICD International Code Designator
ICE In-Circuit Emulator (Intel)
ICES Interference-Causing Equipment Standard
ICI Image Component Information + Inter-CPU Interrupts
ICL Interface Clear
ICLID Incoming-Call Line Identification
ICM Image Color Matching (Kodak) + Incoming Message
.ICM Image Color Management (dosya adı uzantısı)
ICMP Internet Control Message Protocol (Novell)
.ICO Icon (dosya adı uzantısı)
iCOMP Intel Comparative Microprocessor Performance (Intel)
ICP Image Coprocessor + Integrated Channel Processor
ICQ I Bakınızk You (messaging program0
ICR Intelligent Character Recognition
ICS Internet Connection Sharing (Microsoft) +Intuitive Command Structure
ICSAPI Internet Connection Services API
ICU Instruction-Cache Unit +Intel Configuration Utility (Microsoft) +ISA Configuration Utility
ID Identification + Identifier
IDA Integrated Digital Access + Intelligent Disk Array +Intelligent Drive Array
IDAPI Integrated Database Application Programming Interface
IDC Integrated Database/Desktop Connector +Internet Database Connector (Microsoft) +Internet Data
Center
IDDE Integrated Development & Debugging Environment (Symantec)
IDE Imbedded Drive Electronics +Integrated Development Environment (Microsoft, Borland, ..) +
IDE Integrated Drive Electronics +Intelligent Drive Electronics +
IDEA International Data Encryption Algorithm
IDEN Integrated Data Enhanced Network
IDF Intermediate Distribution Frame
IDI Initial Domain Identifier
IDIV Integer Divide
IDL Interactive Data Language +Interface Definition Language
IDM Integrated Document Management
IDMS Integrated Data Base Management System
IDNX Integrated Digital Network Exchange (IBM)
IDP Integrated Data Processing
IDR Intelligent Document Recognition
IDS Intrusion Detection System
IDSL (Bakınız DSL)
IDT Interface Design Tool + Interrupt Descriptor Table
.IDX Index (dosya adı uzantısı)
IE Internet Explorer (Microsoft)
IEC International Electrotechnical Commission
IEEE Institute of Electrical and Electronics Engineers
IEF Information Engineering Facility
IEMSI Interactive Electronic Mail Standard Identification
第 24 页
常见E文缩写.txt
IEN Internet Engineering Notes
IETF Internet Engineering Task Force
IESG Internet Engineering Steering Group
I/F Interface
IFC Internet Foundation Classes
IFD Image File Directory
IFF Interchangeable File Format (Amiga)
IFG Incoming Fax Gateway
IFP Instruction Fetch Pipeline
IFS Installable/Integated File System
IFSM Information Systems Management
IGA Integrated Graphics Array
IGC Integrated Graphics Controller
IGES Initial Graphics Exchange Standard
IGFET Insulated-Gate Field Effect Transistor
IGMP Internet Group Multicast Protocol
IGP Interior Gateway Protocol
IGRP Interior Gateway Routing Protocol (Cisco)
IGS Internet Go Server
IHD Integrated Help Desk (IBM)
IHV Independent Hardware Vendor
IIF Immediate Interface
III Interstate Identification Index (NCIC)
IIOP Internet Inter-ORB Protocol
IIR Immediate Impulse Response
IIS Internet Information Server/Services (Microsoft)
IITF Information Infrastructure Task Force
IKE Internet Key Exchange
IKMP Internet Key Management Protocol
IKP Keyed Payments (IBM)
ILA Image Light Amplifier
ILE Integrated Language Environment (IBM)
ILEC Incumbent Local Exchange Carrier
ILP Instruction-Level Parallelism
ILS International Language Support
IM Instant Messenger
IMAC Internet Macintosh (Apple)
IMACS Image Management and Communication System
IMAP Internet Message Access Protocol
IMAX Maximum Image
IMDB In-Memory Database
IMDS Image Data Stream (format) (IBM)
IME Input Method Editor
IMG Image
IML Initial Microcode Load (IBM)
IMP Information/Interface Message Processor
IMPA Intelligent Multi-Port Adapter (DCA)
IMPP Internet Messaging and Presence Protocol
IMR Internet Monthly Report
IMS Information Management System +Intermediate Maintenance Standards
IMSI International Mobile Subscriber Identity
IMSP Internet Message Support Protocol
IMTC International Multimedia Teleconferencing Consortium
IMTV Interactive Multimedia Television
IMUL Integer Multiply
IMUX Inverse Multiplexer
IN Input
INC Increment
.IND Index (dosya adı uzantısı)
.INF Information (dosya adı uzantısı)
.INFO Information Services (Domain Name) (Internet)
INFS Internet Network File System
.INI Initialize (dosya adı uzantısı)
INIT Initialization + Initialize
INM Integrated Network Management
INND Internet News Daemon
INS Input String + Integrated Network Server
INT Integer + Internal + Interrupt + International
INTA Interrupt Acknowledge
InterNIC Internet Network Information Center
INTO Interrupt if Overflow occurs
I2O Intelligent Input/Output
I/O Input/Output
IOC Inter-Office Channel
IOCC Input/Output Channel Converter +Input/Output Controller Chip
IOCS Input/Output Control System
第 25 页
常见E文缩写.txt
IOCTL Input/Output Control
IOF Infrared Optical Film
IOP Input/Output Processor
IOPL Input/Output Privilege Level
IOR Interoperable Object Reference
IOSGA Input/Output Support Gate Array
IP Instruction Pointer + Intellectual Property +Internet Protocol
IPBF Installed Peripheral Base Flexibility
IPC Instructions Per Clock + Interprocess Communication
IPCMOS Interlocked Pipeline CMOS (IBM)
IPCP Internet Protocol Control Protocol
IPCS Integrated PC Server
IPDC Internet Protocol Device Control
IPDS IBM Personal Dictation System (IBM) +Intelligent Printer Data Stream (IBM)
IPF Invalid Page Format
IPFC Information Presentation Facility Compiler (IBM)
IPI Intelligent Peripheral Interface
IPL Initial Program Load/Loader +Ion Projection Lithography
IPL Information Programming Language
IPM Images Per Minute + Interpersonal Message
IPMI Intelligent Platform Management Interface
IPNG Internet Protocol, next generation
IPP Internet Printing Protocol
IPR Intellectual Property Rights
IPSE Integrated Project Support Environment
IPSEC Internet Protocol Security
IPTC International Press Telecommunications Council
IPX Internetwork Packet Exchange (Novell)
IQL Interactive Query Language
IR Infrared
IRC Internet Relay Chat
IRD Integrated Receiver/Descrambler
IRDA Infrared Data Association
IRDS Information Resource Dictionary System
IRET Interrupt Return
IRF Intermediate Routing Function +
IRL Interactive Reader Language + Inter-Repeater Link
IRLAP Infrared Link Access Protocol
IRLED Infrared Light Emitting Diode
IRM Information Resource Management + Inherent Rights Mask
IRQ Interrupt Request
IRQL Interrupt Request Level
IRTF Internet Research Task Force
IRX Information Retrieval Experiment
IS Information System + Interrupt Status
ISA Industry Standard Architecture (bus) (IBM) +Instruction-Set Architecture
ISAKMP Internet Security Association and Key Management Protocol
ISAM Indexed Sequential-Access Management/Method
ISAPI Internet Server API (Microsoft)
ISBN International Standard Book Number
ISC Instruction Set Computer + Inter-SystemsCommunication (IBM)
ISD Image Section Descriptor +Instructional Systems Design
ISDN Integrated Services Digital Network
ISH Information Super Highway
ISI Internally Specified Index
ISIS Integrated Systems and Information Services
ISKM Internet Starter Kit for the Macintosh
ISL Interactive System Language +Inter Switch Link (Cisco)
ISM Integrated Services Model (IETF) +Internet Service Manager (Microsoft)
ISMF Interactive Storage Management Facility
ISOC Internet Society
ISO International Organization for Standardization
ISP Internet Service Provider + Interrupt Stack Pointer +Interrupt Status Port
ISPF Interactive System Programming Facility
ISR Information Storage and Retrieval +Interrupt Service Routine +Interrupt Status Register
ISS Internet Sharing Software
ISSN International Standard Serial Number
ISV Independent Software Vendor
IT Information Technology
ITB Information Technology Branch + Intermediate Text Block
ITC International Typeface Corporation
ITE Information Technology Equipment
ITF Interactive Test Facility
ITN Identification Tasking and Networking
ITP Internet Transaction Processing
ITR Information Technology Research (NSF) +
第 26 页
常见E文缩写.txt
Input Transaction Record + Internet Talk Radio
ITU International Telecommunication Union
ITUG International Telecommunications User Group
ITU-TIES ITU-Telecom Information Exchange Services
ITU-TSS ITU-Telecommunication Standards Section
ITV Interactive Television
ITX Intermediate Text Block
IU Integer Unit
IUAP Internet User Account Provider
IUS/ITB Interchange Unit Separator/Intermediate Transmission Block
IVDS Integrated Voice and Data Systems
IVIS Interactive Video Information System
IVL Independent Vendor League + Intel Verification Lab
IVR Interactive Voice Response
IVS Interactive Videodisk System
IVT Interrupt Vector Table
IV&V Independent Verification & Validation
I-WAY Information Highway
IXC Interexchange Carrier
JA Jump Address + Jump if Above
JAD Joint Application Design/Development
JADE Java Addition to the Default System
JAE Jump if Above or Equal
JANET Joint Academic Network
Bu kısaltmalar faruk çubukçu tarafından derlenmiştir.
JAR Java Archive (file format)
JBE Jump if Below or Equal
JC Jump if Carry set
JCA Java Cryptography Architecture
JCL Job Control Language
JDBC Java Database Connectivity
JDF Job Description format
JDK Java Development Kit
JDSL Java Data Structures Library
JE Jump if Equal
JEDEC Joint Electronic Devices Engineering Council
JEIDA Japanese Electronics Industry Development Association
JEPI Joint Electronic Payment Initiative
JES Job Entry System
JFC Java Foundation Classes
JFET Junction Field Effect Transistor
JFIF JPEG File Interchange Format
JFS Journaled File System (IBM)
JG Jump if Greater
JGE Jump if Greater or Equal
JIPS JANET Internet Protocol Service
JIT Just-In-Time (compiler)
JL Jump if Less
JLE Jump if Less than or Equal to
JLIP Joint Level Interface Protocol
JMAPI Java Management Application Program Interface
JMF Java Media Framework (Sun)
JMI Java Metadata Interface
JMP Jump
JMS Java Message Service
JNA Jump if Not Above
JNAE Jump if Not Above or Equal
JNB Jump if Not Below
JNBE Jump if Not Below or Equal
JNG Jump if Not Greater
JNGE Jump if Not Greater or Equal
JNI Java Native Interface
.JNK Junk (dosya adı uzantısı)
JNLE Jump if Not Less or Equal
JNO Jump if No Overflow
JNP Jump if No Parity
JNS Jump if No Sign
JOE Java Objects Everywhere
JPE Jump if Parity Even
JPEG Joint Photographic Experts Group
JPL Jet Propulsion Laboratory
JPNF Join-Projection Normal Form
JPO Jump if Parity Odd
JRE Java Runtime Environment
JS Jump if Sign
JSP Java Server Page
第 27 页
常见E文缩写.txt
JSSE Java Secure Socket Extension
JTAG Joint Test Action Group (IEEE)
JTAPI Java Telephony Application Programming Interface
JZ Jump if Zero
JNZ Jump if Not Zero
JSS Java-Script Style Sheet
JVM Java Virtual Machine
K-12 Kindergarten through 12th Grade (US Education System)
KAM Keep Alive Memory
Kb Kilobit
KB Keyboard + Kilobyte (1,024 bytes)
KBD Keyboard (also KEYB)
KBD$ Keyboard (OS/2)
KBE Knowledge Based Engineering
Kbps Kilobits Per Second
KBps Kilobytes Per Second
KDT Key Definition Table
KEFIR Key Findings Reporter (GTE)
KEYBBE Foreign language KEYBoard program - Belgium
KEYBBR Foreign language KEYBoard program - Brazil
KEYBCF Foreign language KEYBoard program - Canadian-French
KEYBCZ Foreign language KEYBoard program - Czechoslovakia(Czech)
KEYBDK Foreign language KEYBoard program - Denmark
KEYBFR Foreign language KEYBoard program - France
KEYBGR Foreign language KEYBoard program - Germany
KEYBHU Foreign language KEYBoard program - Hungary
KEYBIT Foreign language KEYBoard program - Italy
KEYBLA Foreign language KEYBoard program - Latin America
KEYBNL Foreign language KEYBoard program - Netherlands
KEYBNO Foreign language KEYBoard program - Norway
KEYBPL Foreign language KEYBoard program - Poland
KEYBPO Foreign language KEYBoard program - Portugal
KEYBSF Foreign language KEYBoard program - Swiss-French
KEYBSG Foreign language KEYBoard program - Swiss-German
KEYBSP Foreign language KEYBoard program - Spain
KEYBSU Foreign language KEYBoard program - Finland
KEYBSV Foreign language KEYBoard program - Sweden
KEYBT Foreign language KEYBoard program - Turkish
KEYBUK Foreign language KEYBoard program - United Kingdom
KEYBUS Foreign language KEYBoard program - United States
KEYBYU Foreign language KEYBoard program - Yugoslavia
KHz Kilohertz
KIF Knowledge Interchange Format
KIS Knowbot Information Service (Internet)
KPI Kernel Programming Interface
KQML Knowledge Query and Manipulation Language
KRS Knowledge Retrieval System
KSDS Keyed Sequential Data Set
KSH Korn Shell (program) (Unix)
KSPH Keystrokes Per Hour
KSR Keyboard Send Receive
KVM Keyboard, Video, Mouse (switch) +Kilobyte Virtual Machine
L2F Layer Two Forwarding (Cisco)
L2TP Layer Two Tunneling Protocol
LADDR Layered Device Driver Architecture (Microsoft)
LALL Longest Allowed Lobe Length
LAN Local Area Network
LANACS Local Area Network Asynchronous Connection Server
LANDP LAN Distributed Platform
LANE Local Area Network Emulation
LANG Language
LAP Linux Application Platform
LAPB Link Access Procedure Balanced (protocol)
LAPD Link Access Procedure on the D-Channel (protocol)
LAPM Link Access Procedure for Modems
LAR Load Access Rights
LASER Light Amplification by Stimulated Emission of Radiation
LASTport Local Area Storage Transport (protocol) (DEC)
LAT Local Access Terminal +Local Area Transport (DEC)
LATA Local Access and Transport Area
LAVC Local Area VAX Cluster
LAWN Local Area Wireless Network
LB Left Button (of 2 or 3 button Mouse)
LBA Logical Block Addressing
LBL Label
LBR Librarian
第 28 页
常见E文缩写.txt
.LBR Library (dosya adı uzantısı)
LBT Listen Before Talk
LBX Local Bus Accelerator
LCA Lotus Communications Architecture (Lotus)
LCC Leadless Chip Carrier
LCCM LAN Client Control Manager (IBM)
LCD Liquid Crystal Display + Lowest Common Denominator
LCF Low Cost Fiber
LCK Library Construction Kit (Microsoft FoxPro)
LCP Link Control Protocol
LCR Least Cost Routing + Line Control Register
LCSD Laminate Chip Signal Diode
LCU Last Cluster Used
LDA Logical Device Address
LDAP Lightweight Directory Access Protocol (IBM)
LDC Lotus Development Corporation
LDDS Long Distance Discount Services (company)
LDM Logical Disk Manager + Long Distance Modem
LDP Label Distribution Protocol
LDT Local Descriptor Table
LE Less or Equal
LEA Load Effective Address
LEAD Live Early Adoption and Demonstration (W3C)
LEAF Law Enforcement Access Field
LEC Local Area Network Emulation Client +Local Exchange Carrier
LED Light Emitting Diode
LEL Link, Embed and Launch-to-edit (Lotus)
LEM Language Extension Module
LEN Low Entry Networking
LEO Low Earth Orbit
LEP Light-Emitting Polymers
LES Local Area Network Emulation Server
.LET Letter (dosya adı uzantısı)
LEX Lexicon
LF Line Feed
L2F Layer 2 Forwarding (protocol) (Cisco)
LFAP Lightweight Flow Admission Protocol
LFI Last File Indicator
LFM Log File Monitor
LFN Long File Name
LFT Low Function Terminal (IBM)
LFU Least Frequently Used
LGA Leadless Grid Array
LGDT Load Global Descriptor Table
LGPL Lesser General Public License
LIAS Library Information Access System
.LIB Library (dosya adı uzantısı)
LIC Line Interface Coupler (IBM)
LICS Lotus International Character Set (LDC)
LIDT Load Interrupt Descriptor Table
LIEP Large Internet Exchange Packet (Novell)
LIF Low Insertion Force
LIFO Last In, First Out
LILO Last In, Last Out
LIM Lotus/Intel/Microsoft
LIMA Lotus/Intel/Microsoft/AST
LIMDO Light Intensity Modulation Direct Overwrite
LIMM Light Intensity Modulation Method
LIMS Library Information Management System
LINUX (Operating system named after Linus Torvalds)
LIP Large Internet Packet
LIPS Lightweight Internet Person Schema +Logical Inferences Per Second
LISP List Processing (Language)(Bakınız HLL)
LISTSERV List Server (Internet)
LIU LAN Interface Unit
LIW Long Instruction Word
LLC Logical Link Control
LLDT Load Local Descriptor Table
LLF Low Level Format
LMB Left Mouse Button
LMBCS Lotus Multi-Byte Character Set (Lotus)
LMD Last Modification Date
LMDS Local Multipoint Distribution Service
LMI Link/Local Management Interface
LMOS Leave Mail On Server
LMS Lotus Messaging Switch (Lotus)
第 29 页
常见E文缩写.txt
LMSW Load Machine Status Word
LMU LAN Management Utilities (IBM) +
LAN Manager for Unix
LN Load Number + Logarithm (Natural)
LN:DI Lotus Notes:Document Imaging
LNK Link
LOB Line of Business
LOC Lines Of Code + Loop On-Line Control
LOCIS Library of Congress Information System
LOD Letter Of Destruction + Level Of Detail
LODSB Load String Byte
LOG Logarithm (Base 10)
LOGO (Programming Language)(Bakınız HLL)
LON Local Operating Network
LOOPE Loop while Equal
LOOPNE Loop while Not Equal
LOOPNZ Loop while Not Zero
LOOPZ Loop while Zero
LORE Line Oriented Editor
LPAR Logic Programming and Automated Reasoning
LPC Local Procedure Call
LPD Line Printer Daemon (protocol) (Berkley)
LPDU Logical Protocol Data Unit
LPI Lines Per Inch
LPL Lotus Programming Language (Lotus 1-2-3) (LDC)
LPM Lines Per Minute
LPN Logical Page Number
LPR Line Printer + Line Printer Remote
LPS Low-Power Schottky
LPT Line Printer Terminal
LPT1 First Parallel Printer Port
LPT2 Second Parallel Printer Port
LPT3 Third Parallel Printer Port
LQ Letter Quality
LQM Link Quality Monitoring (protocol)
LR Link Register
LRC Local Register Cache +
Longitudinal Redundancy Check
LRL Least Recently Loaded
LRM Language Reference Manual + Least Recently-Used Master
.LRS Language Resource (dosya adı uzantısı) (WordPerfect)
LRU Least Recently Used
LSA LAN and SCSI Adapter (IBM) + Line Sharing Adapter +Local Security Authority (Microsoft)
LSAPI License Services Application Program Interface
LSB Least Significant Bit
LSC Least Significant Character
LSD Least Significant Digit
LSI Large Scale Integration
LSL Link Support Layer + Load Segment Limit
LST List
.LST List (dosya adı uzantısı)
LTO Linear Tape Open
L2TP Layer 2 Transport/Tunneling Protocol
LTPS Low-Temperature Polysilicon
LTR Left-To-Right + Letter + Load Task Register
LU Logical Unit (Also LUN)
LUA Logical Unit Application (interface)
LUI Local User Input
LUIS Library User Information Service
LUN Logical Unit Number
LUT Lookup Table
LV Logical Volume (IBM)
LVDS Low-Voltage Differential Signaling
LVM Logical Volume Management (IBM)
LW Lazy Write
.LYR Lyrics (music dosya adı uzantısı)
LZW Lempel-Ziv-Welch (algorithm)
mA Milliampere
MAC Macintosh (Apple Macintosh Computer) +Mandatory/Media/Medium Access Control
MAC Multiple Access Computers
.MAC MacPaint (dosya adı uzantısı) +Macro (dosya adı uzantısı)
MACH Multilayer Actuator Head (Epson)
MADE Manufacturing and Automated Design Engineering
MADYMO Mathematical Dynamic Modeling (TNO)
MAE Merit Access Exchange + Metropolitan Area Ethernet
MAGMA Minimal Architecture for Generalized Markup Applications
第 30 页
常见E文缩写.txt
mAh Milliampere-Hour
MAI Multiple Applications Interface
.MAI Mail (dosya adı uzantısı)
MAJC Microprocessor Architecture for Java Computing (Sun)
MAN Manual (Unix) + Metropolitan Area Network
MANIAC Mathematical Analyzer Numerical Integrator and Computer
MANPAGE Manual Page (Unix)
MAP Maintenance Analysis Procedures +Manufacturing Automation Protocol + Memory Allocation Map
.MAP Linker Map (dosya adı uzantısı)
MAPI Mail/Messaging Applications Programming Interface (Microsoft)
MAPICS Manufacturing, Accounting and Production Information Control System (IBM)
MARC Machine Readable Cataloging +Multi-Technology Automated Reader Card
MARVEL Machine-Assisted Realization of the Virtual Electronic Library (Library of Congress)
MASM Macro Assembler (Microsoft)
MAT Maintenance Access Terminal
MAU Media Access/Adapter Unit + Multistation Access Unit
MAVDM Multiple Application VDM
MAX Maximum
MB Megabyte (1,024 kilobytes) +Middle Button (farenin 3. düğmesi)
MBASIC Microsoft BASIC (Microsoft)
MBCS Multi-Byte Character Set (IBM)
MBONE Multicast Backbone (Internet)
MBps Megabytes Per Second
Mbps Megabits Per Second
MBR Master Boot Record
MBX Mailbox
MCA Micro Channel Adapter/Architecture (IBM)
MCAD Mechanical Computer Aided Design
MCB Memory Control Block
MCF Meta Content Framework
MCGA Multicolor Graphics Array
MCH Memory Controller Hub (Intel)
MCI Media Control Interface (Microsoft)
MCL Microsoft Compatibility Labs (Microsoft)
MCM Multi-Chip Module
MCNE Master Certified Novell Engineer (Novell)
MC-PGA Metallized Ceramic - Pin Grid Array
MCP Microsoft Certified Professional
MCPS Microsoft Certified Product Specialist (Microsoft)
Bu kısaltmalar faruk çubukçu tarafından derlenmiştir.
MC-QFP Metallized Ceramic - Quad Flat Pack
MCR Modem Control Register
MCSD Microsoft Certified Systems Developer (Microsoft)
MCSE Microsoft Certified Systems Engineer (Microsoft)
MCU Microcontroller Unit + Multi-Chip Unit (DEC) +Multipoint Control Unit
MD Make Directory + Mini Disk (Sony) + Monochrome Display
MDA Model Drive Architecture + Monochrome Display Adapter +Multidimensional Analysis
MDDBMS Multidimensional Data Base Management System
.MDF Menu Definition File (dosya adı uzantısı)
MDI Memory Display Interface +Multiple Document Interface
MDIC Manchester Decoder and Interface Chip (AT&T)
MDK Multimedia Developers Kit (Microsoft)
MDLP Mobile Data Link Protocol
MDR Metadata Repository + Minimum Design Requirement
MDX Multi-Dimensional Expressions
MDY Month Day Year
.ME Opening Information (dosya adı uzantısı) (As in READ.ME)
MEB Memory Expansion Board
MED Minimum Expected Delay
MEG Megabyte
MEM Memory
MEMS Micro-Electro-Mechanical System
.MEN Menu (dosya adı uzantısı)
MERCI Multimedia European Research Conferencing Integration
MES Manufacturing Execution System
MESI Modified, Exclusive, Shared and Invalid (protocol)
MET Memory Enhancement Technology (Hewlett-Packard)
.MET Metafile (dosya adı uzantısı)
MFC Microsoft Foundation Class (Microsoft)
MFFS Microsoft Flash File System (Microsoft)
MFI Multifunction Interpreter
MFIOP Multifunction I/O Processor
MFLOPS Million Floating Point Operations Per Second
MFM Modified Frequency Modulation
MFP Multi-Function Peripheral/Printer/Product
MFPI Multifunction Peripheral Interface
第 31 页
常见E文缩写.txt
MFS Macintosh File System (Macintosh) +Magnetic Tape Field Search + Memory File System
MFT Master File Table +Multiprogramming with a Fixed number of Tasks
MGA Monochrome Graphics Adapter
MGCP Media Gateway Control Protocol
MGE Modular GIS Environment
MGET Multiple Get (Unix)
MGML Minimal Generalized Markup Language
MGR Manager
MHS Message Handling Service + Message Handling System
MHz Megahertz
MI Management Interface
MIB Management Information Base
MIC Message Integrity Check
MICR Magnetic Ink Character Recognition
MICRO One-millionth
MICS Macro Interpretive Commands
MID Mobile Information Device
MIDI Musical Instrument Digital Interface
MIDP Mobile Information Device Profile
MIF Management Information Format
.MIF Management Information Files (dosya adı uzantısı)
MIG Metal In Gap
MII Microsoft/IBM/Intel
MIL Machine Interface Layer (Go Corporation) +
.MIL Military (Domain name) (Internet)
MIM Map Image Metafile + Metal-Insulator-Metal (screen)
MIMD Multiple Instruction Multiple Data Stream (processor)
MIME Multimedia Internet Message Extensions +Multipurpose Internet Mail Extensions
MI/MIC Mode Indicate/Mode Indicate Common
MIN Minimum + Mobile Identification Number
MIND Microsoft Internet Developer (Microsoft)
MINUET Minnesota Internet Users Essential Tools (Internet)
MIPS Million Instructions Per Second
MIS Management Information System +Multimedia Information Sources (Internet)
MISC Miscellaneous
MIX Member Information Exchange
.MIX Microsoft Picture It! (format)
MKDIR Make Directory
ML Machine Language + Meta Language
MLAPI Multilingual Application Programming Interface
MLC Multilayer Ceramic +Multilevel Cell (program) (Internet)
MLE Multi-Line Editor
MLID Multi-Link Interface Driver
MLM Mailing List Manager (Internet)
MLP Meridian Lossless Packing
MLPPP Multilink PPP
MM Minutes + Month
MMA Microcomputer Managers Association
MMC Matched Memory Cycle + Microcomputer Marketing Council +Microsoft Management Console
(Microsoft)
MMCD MultiMedia Compact Disk
MMCX Multimedia Communication Exchange (Lucent Technologies)
MMDS Multi-channel Multipoint Distribution Service
MMF Multi Mode Fiber (cable)
MMI Man-Machine Interface
MMIS Materials Manager Information System
MMPM Multi Media Presentation Manager
MMS Multimedia Messaging Service
MMU Memory Management Unit
MMVF Multimedia Video File (NEC)
MMX Matrix Manipulation Extensions (Intel) +Multimedia Extensions
MNOS Metal Nitride Oxide Semiconductor
MNP Microcom Networking Protocol (Microcom)
.MNU Menu (fine name extension)
MO Magneto-Optical (disk drive)
MOB Memory-Order Buffer
MOBO Mother Board
MOD Module + Modulus
MODEM Modulator Demodulator
MOHLL Machine Oriented High Level Language
MOLAP Multidimensional On-Line Analytical Processing
MOM Manufacturing Operations Management +Message-Oriented Middleware +Microsoft Office Manager
(Microsoft)
MONET Multiwavelength Optical Networking
第 32 页
常见E文缩写.txt
MONO Monaural
MOO MUD, Object Oriented (Internet)
MOP Maintenance Operations Protocol
MOPS Million Operations Per Second
MOS Magneto-Optic Storage + Mean Opinion Score +Metal Oxide Semiconductor
MOSFET Metal Oxide Semiconductor Field Effect Transistor
MOTD Message Of The Day
MOV Metal Oxide Varistor + Move
MOVS Move String
MP Massively Parallel (processing) + Multiple Processors
MP3 MPEG Audio Layer 3
.MPA Memo Pad Archive (dosya adı uzantısı) (Palm)
MPC Multimedia Personal Computer + Multipath Channel
MPCS Mission Planning and Control Station (Software)
MPE Multiple Programming Executive (HP)
MPEG Moving Picture Experts Group
MPI Message Passing Interface + Multiprecision Integer
MPLS Multi Protocol Label Switching (Cisco)
MPM Message Passing Library (IBM)
MPMD Multiple Processor/Multiple Data
MPOA Multi-Protocol over Asynchronous-Transfer-Mode
MPP Massively Parallel Processing/Processors +Message Posting Protocol + Message Processing Program
MPQP Multi-Protocol Quad Port (IBM)
MPR Multipart Repeater + Multi Protocol Router (Novell)
MPS Multiprocessor Specification
MPTN Multi-Protocol Transport Network
MPTS Multi-Protocol Transport Services
MPU Microprocessor Unit
MQI Messaging and Queuing Interface (IBM)
MR Magneto Resistive + Modem Ready
MRAM Magnetic Random Access Memory
MRCF Microsoft Realtime Compression Format
MRCI Microsoft Realtime Compression Interface
MRI Magnetic Resonance Imaging
MRM Most Recently-Used Master
MRO Multi-Region Operation
MRP Manufacturing Resources Planning +Materials Requirement Planning
MRPL Main Ring Path Length
MRS Media Recognition System
MRT Mean Repair Time
MRU Maximum Receive Unit + Most Recently Used
MS Memory System + Message Store + Microsecond +Microsoft Corporation + Millisecond
MSACM Microsoft Audio Compression Manager (Microsoft)
MSAU Multi-Station Access Unit
MSAV Microsoft Anti Virus (Microsoft)
MSB Most Significant Bit
MSBF Mean Swaps Between Failures
MSCDEX Microsoft Compact Disc Extensions (Microsoft)
MSCE Microsoft Certified Software Engineer (Microsoft)
MSCHAP Microsoft Challenge Handshake Authentication Protocol (Microsoft)
MSCS Microsoft Cluster Server (Microsoft)
MSD Mass Storage Device + Most Significant Digit +Microsoft System Diagnostics (Microsoft)
MSDE Microsoft Data Engine (Microsoft1)
MSDN Microsoft Developer Network (Microsoft)
MS-DOS Microsoft - Disk Operating System (Microsoft)
MSDR Multiplexed Streaming Data Request
MSDS Microsoft Developer Support (Microsoft)
MSFR Minimum Security Function Requirements (IBM)
MSG Message
.MSG Program Message (dosya adı uzantısı)
MSI Medium Scale Integration
MSIE Microsoft Internet Explorer (Microsoft)
MSIMN Microsoft Internet Mail and News (Microsoft)
MSL Map Specification Library + Mirrored Server Link
MSMQ Microsoft Message Queue-Server (Microsoft)
MSN Microsoft Network (Microsoft)
MSO Multiple Service/Systems Operator
.MSP Microsoft Paint (dosya adı uzantısı) (Microsoft)
MSQL Mini SQL
MSR Microsoft Reserved Partition (Microsoft)
MSRP Manufacturer Suggested Retail Price
MSS Mass Storage System +Multiprotocol Switched Services (IBM)
MSTS Microsoft Terminal Server (Microsoft)
MSW Machine Status Word
MSXML Microsoft XML (Microsoft)
MTA Message Transfer Agent + Multimedia Terminal Adapter +Multiple Terminal Access
第 33 页
常见E文缩写.txt
MTBB Mean Time Between Breakdowns
MTBF Mean Time Between Failures
MTBJ Mean Time Between Jams
MTF Microsoft Tape Format (Microsoft) +Modulation Transfer Function
MTH Memory Translator Hub
MTRP Maximum Transfer Rate Performance
MTS Message Transfer Service/System +Microsoft Transaction Server (Microsoft) +
MTSO Mobile Telephone Switching Office
MTST Magnetic Tape Selectric Typewriter (IBM)
MTT Multi-Transaction Timer
MTTD Mean Time To Diagnose
MTTF Mean Time To Failure
MTTR Mean Time To Repair
MTU Maximum Transmission Unit
MUA Mail User Agent
MUD Multi-User Dialogue/Dimension/Domain/Dungeon (Internet)
MUG Multiuser Game
MUL Multiply
MULTICS Multiplexed Information and Computing Service
MUMPS Massachusetts General Hospital Utility Multi-Programming System (Programming Language)
MUSE Multi-User Shared Environment
.MUSEUM Museums (Domain Name) (Internet)
MUSIC Multiparty Multimedia Session Control
MUT Monitor Under Test
MUX Multiplexer
mV Millivolt
MVB Multimedia Viewer Book
MVC Multimedia Viewer Compiler
MVD Multivalued Dependencies
MVDM Multiple Virtual DOS Machines
MVGA Monochrome Video Graphics Array
MVIP Multi-Vendor Integration Protocol
MVP Multimedia Video Processor
MVS Multiple Virtual Storage
MVT Multiprogramming with a Variable number of Tasks
MX Mail Exchanger (Internet)
MXS Microsoft Exchange Server (Microsoft)
MZR Multiple Zone Recording
NAC Network Adapter Card
NACD National Association of Computer Dealers
Bu kısaltmalar faruk çubukçu tarafından derlenmiştir.
NACS National Advisory Committee on Semiconductors
NAE Not Above or Equal
NAK Negative Acknowledgment
NAL Novell Application Launcher (Novell)
NAM Number Assignment Module
.NAME Names-Individuals (Domain Name) (Internet)
NAMPS Narrow-Band Analog Mobile Phone Service (Motorola)
NAND Not And
NANO One thousand-millionth
NAP Network Access Point
NAS Network Access Server + Network Application Support (DEC) +Network Attached Storage
NASA National Aeronautics and Space Administration
NASDAQ National Association of Securities Dealers Automatic Quotation
NASI NetWare Asynchronous Services Interface (Novell)
NASIRC NASA Automated Systems Internet Response Capability
NASKER NASA Ames Kernel (benchmark)
NAT Network Address Transformation/Translators
NAU Network Addressable Unit
NAV Navigator
NAVSTAR Navigation Satellite Timing and Ranging
NAWS Negotiate About Window Size
NBE Not Below or Equal
NBI Nothing But Initials
NBMA Non-Broadcast Multi Access
NBS Narrowband Socket + National Bureau of Standards +Numeric Backspace
NCA Network Communications Adapter +Network Computing Architecture (Oracle)
NCC Network Control Center
NCD Network Computing Device
.NCF Netware Command File (Novell)
NCGA National Computer Graphics Association
NCIC National Crime Information Center
NCMT Numerical Control for Machine Tools
NCOS Network Computer Operating System
NCP NetWare Core Protocol + Not Copy Protected +Network Control Processor/Program/Protocol
NCR National Cash Register (Company)
第 34 页
常见E文缩写.txt
NCSA National Center for Supercomputing Applications
NCSC National Computer Security Center
NDB Non-Directional Beacon
NDDK Network Device Development Kid (Microsoft)
NDEF Not to be Defined
NDIS Network Device/Driver Interface Specification
NDL Network Data Language
NDMP Network Data Management Protocol
NDN Non-Delivery Notice
NDP Numeric Data Processor
NDR Network Data Representation
NDRO Non-Destructive Read Out
NDS NetWare Directory Service (Novell)
.NDX Index (dosya adı uzantısı)
NEC Nippon Electric Company
NED NASA Extragalactic Database (NASA)
NEG Negative + Negate
NEMA National Electrical Manufacturers Association
NEP Network Entry Point
NES National Education Supercomputer
NEST Novell Embedded Systems Technology (Novell)
.NET Networks (Domain Name) (Internet)
NetBIOS Network Basic Input/Output System (IBM)
NetBEUI NetBIOS Extended User Interface (IBM)
NETMON Network Monitor
.NEW New Information (dosya adı uzantısı)
NEWS NetWare Early Warning System (Frye Computer) +Network Extensible Window System
NEWS. Current events (USENET Newsgroup Category)
NEXT Near-End Crosstalk
NFF No Fault Found
NFS Network File System (Sun)
NG No Good
NGE Not Greater or Equal
NGI Next-Generation Internet
NHC National Hurricane Center
NHR National Handwriting Recognition
NHRP Next Hop Resolution Protocol
N/I Non-Interlaced
NIA Next Instruction Address
NIC Network Information Center (Internet) +Network Interface Card +Numeric Intensive Computing
NICAD Nickel-Cadmium
NID New Interactive Display (NEC) + Next ID
NIDS Network Intrusion Detection System (Unisys)
NII National Information Infrastructure
NIM Network Installation Management (IBM)
NIMH Nickel-Metal Hydride
NIO Native Input/Output
NIPS Network I/Os Per Second
NIR Network Information Retrieval
NIS Network Information Service (Unix)
N-ISDN Narrowband ISDN + National ISDN
NISO National Information Standards Organization
NISP Networked Information Services Project
NIST National Institute for Standards and Technology
NITC National Information Technology Center
NIU Network Interface Unit
NJE Network Job Entry (protocol) (IBM)
NL New Line
NLB Network Load Balancing (Microsoft)
NLE Not Less or Equal
NLM NetWare Loadable Module (Netware)
NLP Natural-Language Processing
NLQ Near Letter Quality
NLSFUNC National Language Support Function
NLV National Language Version (IBM)
NMI Non-Maskable Interrupt
NMM NetWare Management Map (NetWare)
NMOS Negative Channel Metal-Oxide Semiconductor
NMP Network Management Protocol (AT&T)
NMS Network Management System (Novell)
NN Network Node + No News (Internet)
NNI Network to Network Interface
NNM Network Node Manager
NNTP Network News Transfer Protocol (Internet)
NOC Network Operations Center
.NOM Individual with Personal Site (Domain Name) (Internet)
第 35 页
常见E文缩写.txt
NOP No Operation
NOPAC Network OPAC
NOR Not Or
NOS Network Operating System
NPA Network Printer Alliance + Numbering Plan Area
NPI Network Printer Interface
NPL Nonprocedural Language
NPS Novell Productivity Specialist (Novell)
NPT Non-Programmable Terminal
NPTN National Public Telecomputing Network
NPU Natural Processing Unit
NPX Numeric Processor Extension
NQS Network Queuing System (Cray)
NRC National Research Council (Canada)
NREN National Research and Education Network
NRM Network Resource Manager
NRZ Not Return to Zero
NRZI Non Return to Zero Inverted
NS Nanosecond (one-billionth of a second) +Network Supervisor + Non Stop
NSAP Network Service Access Point
NSAPI Netscape Server API (Netscape)
NSA POLY National Security Agency Polygraph
NSF National Science Foundation
NSFNET National Science Foundation Network
NSI NASA Science Internet
NSLOOKUP Name Server Lookup (Unix)
NSM Netscape Server Manager (Netscape)
NSP Native Signal Processing (Intel) + Network Service Provider
NSSC NASA Standard Spacecraft Computer
NSTC National Science and Technology Council
NSTL National Software Testing Labs
NT New Technology (Microsoft)
NT-1 Network Terminator Type 1
NTAS NT Advanced Server (Microsoft)
NTF No Trouble Found
NTFS New Technology File System (Microsoft)
NTIA National Telecommunications and Information Administration
NTIS National Technical Information Service
NTP Network Time Protocol
NTRAS NT Remote Access Services (Microsoft)
NTSA NetWare Telephony Services Architecture (Novell)
NTSC National Television Standards Committee
NTU Network Termination Unit
NUI Network User Identification +Network User Interface +
NUL Null + (dummy device) + (no device)
NUMA Non-Uniform Memory Access
NV No Overflow
NVM Non-Volatile Memory
NVOD Near-Video On Demand
NVP Nominal Velocity of Propagation
NVRAM Non-Volatile Random Access Memory
NVT Network Virtual Terminal +Novell Virtual Terminal (Novell)
NWS NetWare Web Server (Netware)
NYM Anonymous
OAB One-to-All Broadcast
OAD Open Architecture Driver (Bernoulli)
OAG Official Airline Guide + Online Air Guide
OAI Open Applications Interface
OAS One-to-All Scatter
OBD On Board Diagnostics
OBEX Object Exchange (Borland)
OBJ Object
OC Optical Carrier
OCE Open Collaborative Environment (Apple)
OCF Objects Components Framework (Borland)
OCL Object Constaint Language + Operation Control Language + Operator Control Language
OCR Optical Character Recognition
OCS On-Card Sequencer
OCX OLE Custom Control
ODA Open Document Architecture
ODAPI Open Database Application Programming Interface (Borland)
ODBC Object-Oriented Database Connectivity +Open Data Base Connectivity (Microsoft)
ODBMS Object-Oriented Database Management System (bakınız OODMS)
ODI Open Datalink Interface (Novell) +Open Device Interconnect (NetWare)
ODIF Open Document Interchange Format
ODL Object Definition Language
第 36 页
常见E文缩写.txt
ODM Object Data Manager (IBM) +Optimized Distribution Model (Compaq)
ODMA Open Document Management API
ODP Open Distributed Processing
ODS Open Data Services (Microsoft) +Operational Data Store
ODSI Open Directory Service Interface (Microsoft)
ODT Open Desktop
OEM Original Equipment Manufacturer
OEP Operand Execution Pipeline
OF Overflow Flag
OFB Output Feedback (mode)
OFDM Orthogonal Frequency Division Multiplexing
OFMT Output Format for Numbers
OFS Object File System (Microsoft) + Output Field Separator
OFX Open Financial Exchange
OH Off Hook
OHCI Open Host Controller Interface
OID Object Identifier
OIDL Object Interface Definition Language
OIS Office Information System
OLAP Online Analytical Processing
OLCP Online Complex Processing
.OLD Old version (dosya adı uzantısı)
OLE Object Linking and Embedding (Microsoft)
OLED Organic Light Emitting Diode
OLGA Online Guitar Archive
OLI Optical Line Interface (AT&T)
OLMC Output Logic Macrocell
OLSP Online Service Provider
OLTP Online Transaction Processing
OM Object Manager
OMA Object Management Architecture (Microsoft)
OME Open Messaging Environment (protocol)
OMF Object Module Format (Microsoft) +Open Media Framework + Open Message Format
OMG Object Management Group
OMI Open Messaging Interface (Lotus)
OML Object Manipulation Language
OMR Optical Mark Recognition
ONC Open Network Computing (Sun)
ONDS Open Network Distribution Services (IBM)
ONE Open Network Environment (Netscape)
ONMS Open Network Management System
ONU Optical Network Unit
OOAD Object-Oriented Analysis and Design
OOB Out Of Band
OODB Object-Oriented Database
OODMS Object-Oriented Database Management System (bakınız ODBMS)
OOL Object-Oriented Language
OOOS Object-Oriented Operating System
OOPL Object-Oriented Programming Language
OOPS Object Oriented Programming and Systems
OOS Object-Oriented Systems +Off-line Operating Simulator
OOT Object-Oriented Technology
OOUI Object Oriented User Interface
OP Operation + Optical + Output
OPAC Online Public Access Catalog (Internet)
OPC Open Process Control + Organic/Optical Photoconductor
OPCODE Operational Code
OPD Operand
OPI Open Prepress Interface
OPM Operations Per Minute
OPS Open Profiling Standard + Oracle Parallel Server (Oracle)
OPT Open Protocol Technology
.OPT Options (dosya adı uzantısı)
OPUS Octal Program Updating System
OQL Object Query Language
ORACLE On-Line Inquiry and Report Generator (UNIX DB program)
ORB Object Request Broker (Microsoft)
ORDVAC Ordnance Variable Automatic Computer
.ORG Non-Profit Organizations (Domain name) (Internet)
ORI Online Retrieval Interface
.ORI Original (dosya adı uzantısı)
ORL Optical Return Loss
OROM Optical Read-Only Memory
ORS Output Record Separator
OS Operating System
OS/2 Operating System/2 (IBM)
第 37 页
常见E文缩写.txt
OSA Open Scripting/System Architecture
OSD On Screen Display +Open Software Description/Distribution
OSE Office Server Extensions (Microsoft)
OS/E Operating System/Environment
OSF Open Software Foundation
OSI Open Systems Interconnection
OSM Off-Screen Model
OSP On-Screen Programming + Optical Storage Processor
OSPF Open Shortest Path First
OSQL Object Structured Query Language
OSR2 OEM Service Release 2 (Microsoft)
OSS Open Source Software
OT Object Technology
OTA Operation-Triggered Architecture
OTDR Optical Time Domain Reflectometer
OTF Open Token Foundation
OTI Object Technology International (IBM)
OTP One-Time Programmable
OUI Organizational Unique Identifier
OURS Open Users Recommended Solutions
.OUT Outlines (dosya adı uzantısı)
OUTS Output String
OV Overflow
OVAL Object-Based Virtual Application Language (Psion)
.OVL Program Overlay (dosya adı uzantısı)
.OVR Program Overlay (dosya adı uzantısı)
OWL Object/Open Windows Library (Borland)
P3P Platform for Privacy Preferences Project
PAB Personal Address Book
PABX Private Automatic Branch Exchange
PACE Priority Access Control Enabled (3Com)
PACS Picture Archiving and Communication System
PACS-L Public Access Computer Systems List (Internet)
PAD Packet Assembler/Disassembler
PADS Pen Application Development System (Slate Corporation)
PAIH Public-Access Internet Host (Internet)
PAIS Public-Access Internet Site (Internet)
.PAK Packed (compressed dosya adı uzantısı)
PAL Paradox Applications Language (Borland) +Programming Assembly Language
.PAL Palette (dosya adı uzantısı)
PALC Plasma-Addressed Liquid Crystal (display)
PALS Principles of the Alphabet Literacy System
PAM Pluggable Authentication Module (library) +Pulse Amplitude Modulation
PAN Personal Area Network (GTE)
PAP Packet-level Procedure +Password Authentication Protocol +Printer Access Protocol
PAR Personal Animation Recorder + Parallel
PARA Paragraph
PARC Palo Alto Research Center (XEROX)
PA-RISC Precision Architecture-RISC (HP)
.PAS PASCAL source code (dosya adı uzantısı)
PASCAL (Programming Language named for Blaise Pascal)
PAT Port Address Translation
.PAT Patch + Pattern (dosya adı uzantısıs)
PATN Promotional Port Access Telephone Number
PAX Portable Archive Exchange (Unix)
PB Petabyte (1,024 terabytes)
PBA Printed Board Assembly
PBC Plain-Text Block Chaining
PBE Prompt By Example
PBGA Plastic Ball Grid Array
PBR Policy-Based Routing (Cisco)
PBX Private Branch Exchange
PC Personal Computer + Printed Circuit + Program Counter
PCACIAS Personal Computer Automated Calibration Interval Analysis System
PCB Printed Circuit Board + Program Control Block
PCBC Plain/Propagating Cipher Block Chaining
PCC Proof Carrying Code
PCD Photo Compact Disk
PC-DOS Personal Computer - Disk Operating System (IBM)
PCEB PCI to EISA Bridge (Intel)
PCI Peripheral Component Interconnect/Interface
PCIC PC-Card Interrupt Controller
PC-I/O Program Controlled I/O
PCL Printer Command Language (HP) + Process Control Language
PCM Personal Computer Manufacturer +Printer Cartridge Metric (HP) +Pulse Code Modulation
PCMA Paired Carrier Multiple Access
第 38 页
常见E文缩写.txt
PCMC PCI, Cache, Memory Controller (Intel)
PCMCIA Personal Computer Memory Card International Association
PCMIM Personal Computer Media Interface Module
PCN Personal Computer Network
PCNFS Personal Computer Network File System
PCO Point of Control and Observation
PCS Patchable Control Store +Personal Communication Services/System +Personal Conferencing
Specification +
PCT Private Communications Technology
.PCT Picture (dosya adı uzantısı)
.PCX Picture Image (dosya adı uzantısı)
PD Phase-Change Dual + Public Domain
PDA Personal Digital Assistant
.PDB Palm Database (dosya adı uzantısı) +Program Database (dosya adı uzantısı)
PDC Primary Domain Controller
PDD Physical Device Driver + Portable Digital Document
PDF Package Definition File + Portable Document Format +Program Development Facility
.PDF Printer Description (dosya adı uzantısı)(Borland,Lotus)
PDH Plesiosynchronous Digital Hierarchy
PDIAL Public Dialup Internet Access List (Internet)
PDL Page Description Language + Program Description Language+ Program Design Language
PDM Product Data Management
PDN Public Data Network
PDO Portable Distributed Objects (Next)
PDP Parallel Data Processing + Plasma Display Panel +Programmable Data Processor
PDS Packet Driver Specification + Partitioned Data Set
PDSS Post Development and Software Support
PDT Performance Diagnostic Tool (IBM) +Programmable Drive Table
PDU Plug Distribution Unit + Protocol Data Unit
.PDX Paradox files (dosya adı uzantısı) (Borland) +Printer Description Extension (dosya adı
uzantısı)
PE Parity Even + Processing Element + Protect Enable
PEA Pocket Ethernet Adapter
PEL Picture Element (IBM)
PEM Privacy-Enhanced Mail (Internet)
PEN SDK Pen Computing Software Development Kit
PEP Packet Exchange Protocol
PERC Power Edge RAID Controller
PERL Practical Extraction and Report Language (Unix)
PERT Program Evaluation and Review Technique
PES Positioning Error Signal + Processor Enhancement Socket+Processor Upgrade Socket
PET Print Enhancement Technology (Compaq)
.PFB Printer Font Binary (dosya adı uzantısı)
PFE Programmer's File Editor
.PFM Printer Font Metrics (dosya adı uzantısı) (Windows)
PFN Page Frame Number
PFR Portable Font Resource + Power-Fail Restart
PGA Pin Grid Array + Professional Graphics Adapter (IBM)
PGC Program Group Control (Microsoft)
PGDN Page Down
.PGL Graphics (dosya adı uzantısı) (Hewlett-Packard)
PGM Program
PGML Precision Graphics Markup Language
PGP Pretty Good Privacy (name of encryption program)
.PGP ProGram Parameter (dosya adı uzantısı) (AutoCAD)
PGUP Page Up
PHF Perfect Hash Function
PHIGS Programmers' Hierarchical Interactive Graphics Standards
.PHO Phone List (dosya adı uzantısı)
PHP Personal Home Pages
PHS Personal Handyphone System
PI Program Interruption
PIA Peripheral Interface Adapter
PIC Personal Information Carrier +Personal Intelligent Communicator
PICS Platform for Internet Content Selection (W3C)
PICT Picture
PID Process Identification Number + Product ID
PIER Procedures for Internet/Enterprise Renumbering
PIF Picture Interchange Format File +Program Information File
PII Program Integrated Information
PILOT Programmed Inquiry Learning Or Teaching
Bu kısaltmalar faruk çubukçu tarafından derlenmiştir.
PIM Personal Information Manager +Primary Interface Module +Protocol-Independent Multicast
PIN Personal Identification Number +
第 39 页
常见E文缩写.txt
Process Identification Number (Unix)
PINE Pine Is Not Elm (original usage) +
Program for Internet News & Email (present usage)
PING Packet Internet Groper
PIO Parallel Input/Output + Processor Input/Output +
Programmed Input/Output
PIP Pattern and Information Processing +
Picture In Picture + Problem Isolation Procedure +
Programmable Interconnect Point
PIPO Parallel In, Parallel Out
PIR Protocol Independent Routing
PIT Programmable Interval Timer
PIXEL Picture Element
PJPEG Progressive JPEG
PK Primary Key
PKC Public Key Cryptography
PKI Public Key Infrastructure
PL Plus
.PL Perl Language (dosya adı uzantısı)
PLA Programmable Logic-Array
PLATO Programmed Logic for Automatic Teaching Operations
PLC Programmable Logic Controller
PLCC Plastic Leadless Chip Carrier
PLD Programmable Logic Device
PLDS Pilot Land Data System (NASA)
PLL Phase Locked Loop
.PLL Prelinked Library (dosya adı uzantısı) (Clipper)
PL/M Programming Language for Micros
PLS Primary Link Station
PLV Production Level Video
PL/1 Programming Language One
PM Presentation Manager (IBM) +Preventative Maintenance + Process Manager
.PM6 PagerMaker6 (dosya adı uzantısı) (Corel)
P-MAIL Paper Mail
PMD Packet Mode Data
PMMU Paged Memory Management Unit
PMOS Positive Channel Metal Oxide Semiconductor
PMR Problem Management Report (IBM)
PMS Policy Management System
PN Processing Node
P/N: Part Number
PNA Programmable Network Access
PNG Portable Network Graphics
PNNI Private Network-to-Network Interface
PNP Plug And Play
PO Parity Odd
POA Portable Object Adapter
POC Point Of Contact
POC-IT Point Of Care-Information Technology (Johns Hopkins)
POD Piece Of Data + Plain Old Documentation (Perl) +Plain Old Dos + Publishing On Demand
POE Power Open Environment
POH Power-On Hours
POL Problem Oriented Language
POP Point Of Presence + Pop from Stack + Post Office Protocol
POP3 Post Office Protocol, Version 3
POPA Pop All Registers
POPF Pop Flags
POR Power-On-Reset
POS Packet Over Sonet + Point of Sale + Positive +Programmable Object Select
POSE Palm Operating System Emulator
POSIX Portable Operating System Interface for Unix
POST Power-On Self Test
POSTNET Postal Numeric Encoding Technique (bar code)
POTS Plain Old Telephone Service + Plain Old Time-Sharing
POWER Performance Optimization with Enhanced RISC (IBM)
PowerPC Performance Optimization with Enhanced RISC-Performance Computing
PP Parallel Port
P2P Peer To Peer + People To People
P3P Platform for Privacy Preferences
PPA Pixel Processing Accelerator
.PPD PostScript Printer Description (dosya adı uzantısı)
PPDS Personal Printer Data Stream (IBM)
PPGA Plastic Pin Grid Array
PPI Precise Pixel Interpolation
PPM Pages Per Minute
PPP Point-to-Point Protocol (Internet)
第 40 页
常见E文缩写.txt
PPPOE Point-to-Point Protocol Over Ethernet
PPS Packets Per Second + Power Personal Systems (IBM)
PPTP Point-to-Point Tunneling Protocol (Microsoft)
PQA Palm Query Application
PQFP Plastic Quad Flat Pack
PQO Parallel Query Option
PRACSA Public Remote Access Computer Standards Association
PRAM Parallel Random-Access Machine +Parameter Random Access Memory
.PRC Pilot Resource (dosya adı uzantısı) (Palm Pilot)
.PRD Printer Driver (dosya adı uzantısı) (Microsoft)
PRE Preformatted (HTML)
PREP Power PC Reference Platform (IBM/Motorola)
PRF Pulse Repetition Frequency
.PRF Preferences (dosya adı uzantısı) (Grammatik IV)
.PRG Program (dosya adı uzantısı)
PRI Primary-Rate Interface
PRINTF Print with Formatting (C Programming Language)
PRISM Photo-Refractive Information Storage Material
.PRJ Project (dosya adı uzantısı) (Borland)
PRMD Private Management Domain (X.400)
PRML Partial-Response Maximum-Likelihood
.PRO Professionals (Domain Name) (Internet) +Profile (dosya adı uzantısı)
PROC Procedure
PROFS Professional Office System (IBM)
PROG Program + Programmer
PROLOG Programming In Logic (Programming Language)(Bakınız HLL)
PROM Programmable Read Only Memory
PRN Printer
PRNG Pseudo-Random Number Generation (algorithm)
.PRS Printer (dosya adı uzantısı) (WordPerfect)
PRTSC Print Screen
PS Proportional Spacing
.PS PostScript (dosya adı uzantısı)
PS/2 Programming System 2 (IBM)
PSAPI Presentation Space Application Programming Interface
PSC Personal Super Computer + Print Server Command +Product Service Center
PSDN Packet-Switched Data Network
PSDS Packet-Switched Data Service
PSERVER Print Server (NetWare)
PSF Permanent Swap File
PSID PostScript Image Data
PSM Printing Systems Manager
PSN Packet Switching Network +Processor Serial Number
PSP Personal Software Products (group) (IBM) +Program Segment Prefix
PSPDN Packet-Switched Public Data Network
PSRAM Pseudo-Static Random Access Memory
PSRT PostScript Round Table (GEnie)
PSS Process Status Structure
PSTN Public Switched Telephone Network
PSU Power Supply Unit
PSW Program Status Word
.ps.Z Compressed PostScript (dosya adı uzantısı) (Unix)
PT Page Table
P/T Part Time
PTD Parallel Transfer Disk Drive
PTE Page Table Entry
PTF Problem Temporary/Trouble Fix (IBM)
PTH Plated Through Hole
PTI Packet Type Identifier
PTT Postal Telephone & Telegraph
PUB Public (directory) (Internet) + Publish
.PUB Publication (dosya adı uzantısı) (Ventura)
PUN Physical Unit Number
PUP PARC Universal Packet (protocol)
PURL Persistent URL
PUS Processor Upgrade Socket
PUSHA Push All Registers
PUSHF Push Flags
PVC Permanent Virtual Circuit + Polyvinyl Chloride
PVM Parallel Virtual Machine +Pass-through Virtual Machine (protocol) (IBM)
PVP Parallel Vector Processing
PVR Personal Video Recorder
PVS Parallel Visualization Server
PW Password
PWB Printed Wire Board +Programmer's Workbench (Microsoft)
PWD Print Working Directory (Unix)
第 41 页
常见E文缩写.txt
PWR Power
PWSCS Programmable Workstation Communication Services (IBM)
.PX Primary Index (dosya adı uzantısı) (Paradox)
QA Quality Assurance
QAM Quadrature Amplitude Modulation
QBE Query By Example
QBF Query by Form
QBIC Query By Image Content (IBM)
QC Quality Control
QD Querty/Dvorak
QDA Qualitative Data Analysis
QDOS Quick and Dirty Operating System
.QDI Quicken Dictionary (dosya adı uzantısı) (Intuit)
.QDT Quicken Data (dosya adı uzantısı) (Intuit)
QEMM Quarterdeck Expanded Memory Manager (Quarterdeck Corp.)
QFA Quick File Access
QFE Quick-Fix Engineering (Microsoft)
QFP Quad Flat Pack
QIC Quality Information Using Cycle Time (Hewlett-Packard) +Quarter-Inch Cartridge
.QIF Quicken Import File/Interchange Format (dosya adı uzantısı)
.QMT Quicken Memorized List (dosya adı uzantısı) (Intuit)
.QNX Quicken Indexes to Data (dosya adı uzantısı) (Intuit)
QOS Quality Of Service
QPG Quantum Phase Gate
QPSK Quadrature Phase Shift Keying
QSAM Queued Sequential Access Method
QTC Quicktime Conferencing (Macintosh)
RA Remote Assistance + Return Authorization
.RA Real Audio (dosya adı uzantısı)
RACF Resource Access Control Facility
RAD Rapid Application Development
RADAR Radio Detection And Ranging
RADB Routing Arbiter Data Base
RADIUS Remote Authentication Dial-In User Service
RADSL Rate Adaptive Digital Subscriber Line
RAG Row Address Generator
RAID Redundant Arrays of Independent Disks
RAIS Redundant Arrays of Inexpensive Systems
RALU Register Arithmetic Logic Unit
RAM Random Access Memory
.RAM Real Audio Metafile (dosya adı uzantısı)
RAMP Remote Access Maintenance Protocol (Internet)
RAN Radio Access Network
RAND Random
RAP Rapid Application Prototyping
RARP Reverse Address Resolution Protocol
RAS Random Access Storage +Remote Access Service + Row Address Select
RASAPI Remote Access Service Application Programming Interface (Microsoft)
.RAT Rating (dosya adı uzantısı)
.RAW Raw Data (dosya adı uzantısı)
RB Right Button (of 2 or 3 button Mouse)
RBBS Remote Bulletin Board System
RBCS Remote Bar Code System
RBOC Regional Bell Operating Company
.RC Resource (dosya adı uzantısı)
RCL Rotate Carry Left
RCP Remote Control Panel + Remote Copy (Internet) +Restore Cursor Position
RCPT Recipient
RCR Rotate Carry Right
RCS Records Communications Switching System +
Revision Control System (Unix)
RD Receive Data + Remove Directory
R&D Research and Development
RDA Remote Database Access
RDB Receive Data Buffer + Relational Database
RDBMS Relational Database Management System
RDCLK Received Timing Clock
RDF Resource Description Framework (W3C)
RDN Relative Distinguished Name
RDO Remote Data Object
RDP Reliable Datagram Protocol + Remote Desktop Protocol
RDR Remote Data Recovery
RDRAM Rambus DRAM
RDSL (Bakınız DSL)
RDSR Receiver Data Service Request
RDTO Receive Data Transfer Offset (IBM)
第 42 页
常见E文缩写.txt
RDX Realistic Display Mixer
.REC Recorder (dosya adı uzantısı)
REC. Recreation (USENET Newsgroup Category)
.REF Reference (dosya adı uzantısı)
REG Register
REGAL Rigid Epoxy Glass Acrylic Laminate
REGEDIT Registry Editor (Microsoft)
RELSECT Relative Sector
REM Remark + Remote + Ring Error Monitor
REN Rename + Ringer Equivalence Number
REP Repeat
REPE Repeat while Equal
REPNE Repeat while Not Equal
REPNZ Repeat while Not Zero
REPZ Repeat while Zero
REQ Request
REREG Re-Register
RES Remote Execution Service + Reset + Resolution
.RES Resource (dosya adı uzantısı)
RET Resolution Enhancement Technology (HP) + Return
RETR Retrieve
REX Relocatable Executable
REXEC Remote Execution
REXX Restructured Extended Executor (language) (IBM)
RF Radio Frequency
RFC Request For Comments (Internet)
RFD Request for Discussion (Internet)
RFI Radio Frequency Interference + Request for Information
RFID Radio Frequency Identification
RFP Request for Proposal
RFQ Request for Quotation
RFS Remote File Sharing + Remote File System
RFT Revisable Form Text + Rich Text Format
RFU Reserved For Future Use
RGB Red-Green-Blue (color model)
RI Referential Integrity + Ring Indicate
RID Relative Identifier
RIFF Resource Interchange File Format (Microsoft)
RIM Remote Installation and Maintenance (Microsoft)
RIME RelayNet International Message Exchange
RIP Raster Image Processor + Remote Imaging Protocol +Routing Information Protocol
RIPEM Riordan's Internet Privacy Enhanced Mail
RIPS Raster Image Processing System
RISC Reduced Instruction Set Computing
RIT Raw Input Thread (Microsoft)
RJE Remote Job Entry
RLD Received Line Detect
RLE Run Length Encoded
RLL Run Length Limited
RLN Remote LAN Node (DCA)
RLOGIN Remote Login
RLSD Received Line Signal Detected
RLSI Ridiculously Large-Scale Integration
RM Reset Mode
RMA Return Material Authorization +Return to Manufacturer Authorization
RMB Right Mouse Button
RMC Raptor Management Console (Symantec)
RMDIR Remove Directory
RMI Remote Messaging Interface +Remote Method Invocation (Sun)
RMON Remote Monitor/Monitoring
RMP Remote Maintenance Processor (IBM)
RMS Record Management Services + Root Mean Square
RMW Read-Modify-Write
RN Read News (Internet)
RNA Remote Network Access (Microsoft)
RNC Radio Network Controller
RND Random
RNG Random Number Generator
RNP Regional Network Provider
R-O Read Only
ROB Reorder Buffer (Intel)
ROI Return On Investment
ROL Rotate Left
ROLAP Relational On-Line Analytical Processing
ROM Read Only Memory
ROOM Real-Time Object-Oriented Modeling
第 43 页
常见E文缩写.txt
ROP Raster Operation + RISC Operation
ROPES Rapid Object-Oriented Process for Embedded Systems
ROR Rotate Right
ROS Read-Only Storage (IBM)
ROSCOE Remote Operating System Conversational Online Environment
ROT Running Object Table
RPC Remote Procedure Call
RPG Report Program Generator (Programming Language)
RPL Resident Programming Language +Requested Privilege Level
RPN Real Page Number + Reverse Polish Notation
RPRINTER Remote Printer (NetWare)
RPPROM Reprogrammable PROM
RPR Relative Performance Rating
RPT Repeat
RPQ Request for Price Quotation
RQBE Relational Query By Example (Fox Pro)
RR Real Reality
RRP Recommended Retail Price
RS Radio Shack +Recommended Standard (RS-232 de olduğu gibi) (EIA) +Record Separator + Request to
Send
RSAC Recreational Software Advisory Council
RSCS Remote Spooling Communications System
RSD Route Server Daemon
RSH Remote Shell
RSI Repetitive Strain Injury (Carpal Tunnel Syndrome)
RSL Request-and-Status Link
RSP Required Space Character
RSPX Remote Sequenced Packet Exchange
RSS Rich Site Summary
RST Reset + Restart
RSTS Resource Sharing Time Sharing (Digital)
RSVP Resource Reservation Protocol
RSX Realistic Sound Experience +Real Time Resource Sharing Executive
RT Real Time + RISC Technology + Run Time
R/T Receive/Transmit
RTAM Remote Terminal Access Method
RTC Real-Time Clock
RTCP Real-Time Control Protocol
RTDM Real-Time Data Migration
RTEL Reverse Telnet (Internet)
RTF Rich Text Format
RTL Raster Transfer Language +Register Transfer Language/Level +Resistor Transistor Logic + Right-
To-Left +
RTM Response Time Monitor + Runtime Manager (Borland)
RTMP Routing Table Maintenance Protocol
RTN Reuters Transaction Network
RTOS Real-Time Operating System
RTP Rapid Transport Protocol + Real Time Protocol +Real-Time Transport Protocol
RTS Remote Takeover System + Request To Send
RTSP Real-Time Streaming Protocol
RTTI Runtime Type Information
RTTY Radio Teletypewriter (Communications)
RTV Real Time Video
RTX Run Time Extension
RUN Rewind/Unload (IBM)
RVA Relative Virtual Address
RVI Reverse Interrupt
R/W Read/Write
RWIN Receive Window
RWM Read-Write Memory
RX Receiver
RXD Receive Data
SA Selective Availability
SAA Systems Application Architecture (IBM)
SABRE Semi-Automatic Business Research Environment
SAC Single Attachment Concentrator
SACD Super Audio Compact Disk
SACL System Access Control List
SADL Synchronous Data Link Control (Racal-Vadic)
SAINT Symbolic Automatic Integrator
SAL Shift Arithmetic Left + Spatial Aggregation Language
SAM Serial Access Memory + Sequential Access Method +Security Accounts Manager (Microsoft) +Single
Application Mode (Microsoft)
第 44 页
常见E文缩写.txt
SAML Security Assertion Markup Language
SAN Storage/System Area Network
SANE Standard Apple Numeric Environment
SAP Second Audio Program + Service Access Point (DEC) +Session Announcement Protocol +Service
Advertising Protocol +
SAPI Speech Application Program Interface (Microsoft)
SAR Segmentation and Reassembly +Shift Arithmetic Right + Specific Absorption Rate + Successive
Approximation Register +
SARG Search Argument
SAS Sales Accounting System + Single Attached Station +Single Audio System + Statistical Analysis
System
SATA Serial Advanced Technology Attachment
SATAN Security Administrator Tool for Analyzing Networks
.SAV Saved (dosya adı uzantısı)
SAVDM Single Application VDM
SAX Simple API for XML
SB Sound Blaster (Creative Labs) + Sound Board
SBAS Satellite Based Augmentation System
SBB Subtract With Borrow
SBC Single-Board Computer
SBCS Single-Byte Character Set
SBI Sound Blaster Instrument
.SBR Source Browser (dosya adı uzantısı) (Borland)
SBS Small Business Server
.SC Script (dosya adı uzantısı)
SCA Scalable Computing Architecture (HP)
SCADA Supervisory Control and Data Acquisition
SCAM SCSI Configuration Automatically
SCAS Scan String
SCB Subsystem Control Block (IBM)
SCC Serial Communications Controllers +Serial Controller Chip +Synchronous Channel Check (IBM)
SCCP Simple Conference Control Protocol
SCCS Source Code Control System
SCD Standard Color Display
S-CDMA Synchronous Code-Division Multiple Access
SCF System Control Facility
SCI Scalable Coherent Interface +Serial Communications Interface
SCI. Science (USENET Newsgroup Category)
SCIL Serial Control Interface Logic
SCLM Software Configuration and Library Management (IBM)
SCM Service Control Manager + ScreenCam Format (Lotus) +Software Configuration Management + Station
Class Mark
SCO Santa Cruz Operation (Software Company) +Synchronous Connection-Oriented (link)
SCOPE Simple Communications Programming Environment(Hayes)
SCP Save Cursor Position + Subsystem Control Port +System Control Program
SCR Silicon Controlled Rectifier
.SCR Script (dosya adı uzantısı)
SCRAM Software Configuration, Release and Management
SCRN Screen (video display)
SCRS Scalable Cluster of RISC Systems
SCSA Signal Computing System Architecture (Dialogic)
SCSI Small Computer Systems Interface
SCTP Stream Control Transmission Protocol
SD Send Data + Super Density
SDA Software Delivery Agent (IBM) + Software Disk Array + Source Data Automation + System Display
Architecture (Digital)
SDAM Single DOS Application Mode
SDB Symbolic Debugger (Unix)
SDD Software Description Database (Internet) +Subscriber Data Document +System Distribution
Directory
SDF Space Delimited File + Space Delimited Format
.SDF Standard Data Format (dosya adı uzantısı)
SDH Synchronous Digital Hierarchy
SDI Selective Dissemination of Information +Single Document Interface
SDK Software Development Kit (Microsoft)
SDL Specification and Description Language
SDLC Synchronous Data Link Control (protocol)
SDM System Development Multitasking
SDMI Secure Digital Music Initiative/Interface
SDMMC Secure Digital Multi Media Card
第 45 页
常见E文缩写.txt
SDMS SCSI Device Management System (NCR)
SDN Software Defined Network (AT&T)
SDNS Secure Data Network Service
SDR Streaming Data Request
SDRAM Synchronous DRAM
SD-ROM Super Density ROM
SDS Sysops Distribution System
SDSL (Bakınız DSL)
SD_STB Streaming Data Strobe (IBM)
SDTV Standard Definition Television
SDV Switched Digital Video (AT&T)
SDX Storage Data Acceleration
SDXF Structured Data Exchange Format
SEA Standard Extended Attribute (OS/2)
.SEA Self Extracting Archive (dosya adı uzantısı) (Macintosh)
SEC Single Error Correction
SECC Single Edge Contact Cartridge
SED Stream Editor + Stream-Oriented Editor
SEG Segment
SEH Structured Exception Handling
SEL Select
SEM Scanning Electron Microscope +Standard Electronic Module +Strategic Enterprise Management (SAP)
SEPP Secure Encryption Payment Protocol
SER Serial
SERCOS Serial Real-Time Communications System
SET Secure Electronic Transaction +Softwave Engineering Technology
.SET Driver Set (dosya adı uzantısı) (Lotus 1-2-3) (LDC)
SETEXT Structure Enhanced Text (Internet)
SEU Single Event Upset + Smallest Executable Unit
SF Sign Flag
SFC System File Checker
SFD Start Frame Delimiter
SFDR Spurious-Free Dynamic Range
SFI Software Fault Isolation
SFN Short File Name
SFQL Structured Full-text Query Language
SFS System File Server
SFT System Fault Tolerance
SFX Self Extracting + Sound Effect(s)
SGA Shared Global Area
SGCP Simple Gateway Control Protocol
SGEN Signal Generator + System Generator
SGDT Store Global Descriptor Table
SGI Silicon Graphics, Inc.
SGM Shaded Graphics Modeling
SGML Standard Generalized Markup Language
SGR Set Graphics Rendition
SGRAM Synchronous Graphics RAM
S/H Sample and Hold
SHA Secure Hash Algorithm (NSA)
SHAR Shell Archive
SHED Segmented Hypergraphic Editor
SHG Segmented Hypergraphics
SHL Shift Logical Left
SHOE Simple HTML Ontology Extension
SHR Shift Logical Right
SHTML Server-Side Include HyperText Markup Language
S-HTTP Secure Hypertext Transfer Protocol
SHV Standard High-Volume
.SHW Show (dosya adı uzantısı)
SI Shift-In + Source Index + System Information +System Integration
SIC Standard Industrial Code
SID Security Identifier + Serial Input Data +Station Identification (AT&T) +Symbolic Interactive
Debugger + System ID
SIDF System Independent Data Format
SIDH System Identification for Home Systems
SIDT Store Interrupt Descriptor Table
SIFT Stanford Information Filtering Tool
SIG Special Interest Group
SIGCAT Special Interest Group on CD-ROM Applications and Technology
SIM Simulator + Subscriber Identity Module
SIMD Single Instruction, Multiple Data-stream (processor)
SIMM Single In-line Memory Module
SIMTEL Simulation and Teleprocessing
SIMULA Simulation (language)
第 46 页
常见E文缩写.txt
SIO Serial Input/Output (communications driver)
SIP Session Initiation Protocol + Single In-line Package
SIPC Simply Interactive Personal Computer (Microsoft)
SIPO Serial In, Parallel Out
SIPP Single In-line Pin Package
SIR Serial Infrared (Hewlett-Packard)
SIRDS Single-Image Random Dot Stereogram
SISL System Interrupt Steering Logic
SISNET Signal In Space Through The Internet
SI/SO Serial In/Serial Out + Shift In/Shift Out
SIT Special Information Tones
.SIT Stuff-It (compressed dosya adı uzantısı) (Macintosh)
SIU System Interface Unit
SIV System Integrity Verifier
SKIP Simple Key-Management for Internet Protocols (Sun)
SKU# Stock Keeping Unit Number
SLA Service Level Agreement
SLB Static Load Balancing
SLC Subscriber Line Concentrator
SLD Second-Level Domain (name)
SLDT Store Local Descriptor Table
SLED Single Large Expensive Disk
SLIC System Level Integration Circuit +System Licensed Internal Code (IBM)
SLIM Structured Language for Internet Markup
SLIP Serial Line Interface Protocol
SLM Spatial Light Modulator
SLMR Silly Little Mail Reader
SLOT Scanned Laser Output Terminal
SLP Service Location Protocol
SLR Single Lens Reflex
SLSI Super Large-Scale Integration
SLSS Systems Library Subscription Service (IBM)
SLU Spoken Language Understanding
SM Set Mode + Shared Memory
SMA Software Migration Assistant (IBM)
SMART Self-Monitoring Analysis and Reporting Technology
SMB Server Message Block (protocol) (MII)
SMD Surface Mounted Device
SMDR Station Message Detail Recording
SMDS Switched Multimedia/Multi-Megabit Data Service
SMF Single Mode Fiber + System Manager Facility (Compaq)
SMI System Management Interrupt (Intel)
SMIF Standard Mechanical Interface
SMIL Synchronized Multimedia Integration Language
S-MIME Secure MIME
SMIT System Management Interface Tool (IBM)
SMK Software Migration Kit (Microsoft)
SML Standard Meta Language
SMM System Management Mode (Intel)
SMOBC Solder Mask Over Bare Copper
SMP Simple Management Protocol + Symbolic Manipulation Program + Symmetrical Multi-Processing
+Symmetric Multiprocessor
.SMP Sample (dosya adı uzantısı)
SMPC Shared Memory Parallel Computer
SMPS Switching Mode Power Supply
SMRAM System Management Random Access Memory
SMS Short Message Service + Small Messaging System +Storage Management Services (NetWare) +Systems
Management Server (Microsoft)
SMSW Store Machine Status Word
SMT Station Management (protocol) +Surface-Mount Technology
SMTP Simple Mail Transfer Protocol
SMU System Management Utility
SN Serial Number
S/N Signal-to-Noise (Ratio)
SNA Systems Network Architecture (IBM)
SNAP Sub-Network Access Protocol +Sub-Network Attachment Point
SNAPI Structured N-Dimensional Application Program Interface (Oracle)
SND Sound
SNEWS Secure News Server (Internet)
SNMP Simple Network Management Protocol
SNOBOL String Oriented Symbolic Language (Programming Language)
SNP Serial Number/Password (Omen Technology)
SNR Signal-to-Noise Ratio
SOA Start Of Authority
第 47 页
常见E文缩写.txt
SOAP Simple Object Access Protocol
SOC System On a Chip
SOC. Social Issues (USENET Newsgroup Category)
SOCKS Socket Secure (server) (Internet)
SO-DIMM Small Outline DIMM
SOE Standard Operating Environment
SOH Start of Header
SOHO Small Office/Home Office
SOI Silicon-On-Insulator (IBM)
SOJ Small-Outline J-Lead
SOL Simulation Oriented Language
SOM Start of Message + System Object Model (IBM)
SONAR Sound Navigation and Ranging
SONET Synchronous Optical Network
SOP Small Outline Package + Standard Operating Procedures
SOS Silicon On Sapphire + Sophisticated Operating System +Standards and Open Systems
SOTA State Of The Art
SOX Sound Exchange
SP Service Pack (IBM) + Stack Pointer + System Product
SPA Secure Password Authentication (Microsoft) +Software Publishers Association
SPAN Space Physics Analysis Network
SPAP Shiva Password Authentification Protocol
SPARC Scalable Processor Architecture
SPC Small Peripheral Controller + Statistical Process Control
SPCL Spectrum Cellular Corporation
SPCS Stored Program Controlled Switch
SPD Serial Presence Detect
SPEC Systems Performance Evaluation Cooperative
SPF Shortest Path First + System Programming Facility
SPGA Staggered Pin-Grid Array
SPI Security Parameters Index + Service Provider Interface +SCSI Parallel Interface + Stateful
Packet Inspection
.SPI Spool (dosya adı uzantısı)
SPID Service Profile/Provider Identifier
SPIKE Science Planning Intelligent Knowledge-Based Environment (STScI)
SPL Spooler + System Programming Language (HP)
.SPL Spell Checker (dosya adı uzantısı)
SPLD Simple Programmable Logic Device
SPM System Performance Monitor (IBM)
SPOOL Simultaneous Peripheral Operations On Line
SPOT Shared Product Object Tree (IBM)
SPP Sequenced Packet Protocol + Standard Printer Port
SPPS Scalable Power Parallel System (IBM)
SPR Special Purpose Register +Statistical Pattern Recognition +Symmetrical Phase Recording
SPREAD Systems Programming, Research, Engineering and Development (IBM)
SPS Secure Packet Shield + Shock Protection System +Standby Power System
SPSS Statistical Package for the Social Sciences
SPT Sectors Per Track
SPX Sequenced Packet Exchange (Novell)
SQ Squeezed (files)
SQE Signal Quality Error (test)
SQL/DS Structured Query Language/Data System (IBM)
SQOS Secure Quality Of Service
SQRT Square Root
SR Shift Register
SRAM Shadow Random Access Memory +Static Random Access Memory
SRAPI Speech Recognition API
SRB Source-Route Bridge
SRC System Resource Controller
.SRC Source (dosya adı uzantısı)
SRD Screen Reader System
SRDRAM Self-Refreshed DRAM
SRGB Sustained RGB (values)
SRM Security Reference Monitor
SRO Sharable and Read Only
SRP Suggested Retail Price
.SRP Script (dosya adı uzantısı)
SRPI Server-Requester Programming Interface
SRQ Service Request
SRR Serially Reusable Resource
SRS Sound Retrieval System
SS Stack Segment + Single Sided + Seconds
SS7 Signaling System 7 (Bellcore)
SSA Serial Storage Architecture
SSAD Structured System Analysis and Design
第 48 页
常见E文缩写.txt
SSAP Source Service Access Point
SSCP Systems Service Control Point (IBM)
SSD Solid State Disk
SSEC Selective Sequence Electronic Calculator (IBM)
SSGA System Support Gate Array
SSH Secure Shell (protocol)
SSI Server Side Includes + Single System Image +Small Scale Integration
SSL Secure Sockets Layer
SSO Single Sign On
SSPI Security Service Provider Interface (Microsoft)
SSRP Simple Server Redundancy Protocol (Cisco)
SST Spread-Spectrum Technology +Systems Services and Technology
STA Spanning Tree Algorithm
STAR Self Defining Text Archival
STB Strobe
STC Set Carry Flag
STD Set Direction Flag + Standard
STDA StreetTalk Directory Assistance (Banyan)
STDAUX Standard Auxilary
STDERR Standard Error
STDIN Standard Input
STDIO.H Standard Input/Output Header (C Programlama Dili)
STDM Statistical Time Division Multiplexer
STDOUT Standard Output
STDPRN Standard Printer
STEP Standard for Exchange of Product
.STF Structured File (dosya adı uzantısı) (Lotus Agenda)
STI Set Interrupt Flag
S/TK Sectors Per Track
STL Standard Template Library
STM Scanning Tunneling Microscope
STN Super-Twist Nematic
.STORE Businesses Offering Goods (Domain Name) (Internet)
STOS Store String
STP Secure Transfer Protocol + Shielded Twisted Pair (cable) +Signal Transfer Point +
STR Store Task Register + Synchronous Transmitter Receiver
STRESS Structural Engineering System Solver (Programlama Dili)
STRUDL Structural Design Language (Programlama Dili)
STScI Space Telescope Science Institute
STT Secure Transaction Technology (Microsoft)
STX Start of Text
.STY Style (dosya adı uzantısı) (Ventura, Word, WordPerfect)
SUB Subroutine + Substitute + Subtract
SUN Sun Microsystems, Inc.
.SUP Supplemental Dictionary (dosya adı uzantısı) (WordPerfect)
SVC Switched Virtual Circuit
SVF Simple Vector Format
SVG Scalable Vector Graphics
SVGA Super Video Graphics Array
S-VHS Super VHS
SVM System Virtual Machine (Microsoft) +System Volume Mangement
SVN Switched Virtual Network (IBM)
SVR Server
SVR# System V Release Number (AT&T)
S/W Software
SWAIS Simple Wide Area Information Server (Internet)
SWAP Shared Wireless Access Protocol
SWIG Simplified Wrapper and Interface Generator
SWISH Simple Web Indexing System for Humans
SWP Simple Web Printing
.SWP Swap (dosya adı uzantısı)
.SYL Syllabus (dosya adı uzantısı)
SYLK Symbolic Link
.SYM Symbols (dosya adı uzantısı)
.SYN Synonym (dosya adı uzantısı)
SYNC Synchronous
SYS System
.SYS System Configuration (dosya adı uzantısı) +System Device Driver (dosya adı uzantısı)
SYSADMIN System Administrator
SYSGEN System Generator
SYSLOG System Log
SYSMOD System Modification
SYSOP System Operator
SYSREQ System Request
SZ Send ZModem (Unix)
TAB Tape Automated Bonding
第 49 页
常见E文缩写.txt
TACS Total Access Communication System
TAD Telephone Answering Device
TAG Technical Advisory Group
TAL Typed Assembly Language
TAP Telelocator Alphanumeric Protocol
TAPCIS The Access Program for the CompuServe Information Service
TAPI Telephony Applications Programming Interface
.tar Tape Archive (archived dosya adı uzantısı) (Unix)
.tar.Z Compressed Archived files (dosya adı uzantısı) (Unix)
TAS Telephone Access Server + Total Access System
TASM Turbo Assembler (Borland)
TAXI Transparent Asynchronous Transceiver/Receiver Interface
TB Terabyte (1,024 gigabytes)
T/B Top and Bottom
TBBS The Bread Board System (BBS)
TBGA Tape Ball Grid Array
.TBK Toolbook (dosya adı uzantısı)
TBU Tape Backup Unit
TC Test Control + Transmission Control
TCL Tool Command Language
TCM Trellis-Coded Modulation
TCO Total Cost of Ownership
TCP Tape-Carrier Package
TCPA Trusted Computing Platform Alliance (Intel)
TCP/IP Transmission Control Protocol/Internet Protocol
TD Transmit Data
.TDA To Do Archive (dosya adı uzantısı) (Palm)
TDC Tabular Data Control
TDD Telecommunications Device for the Deaf
TDE Terminal Display Editor
.TDF Trace Definition File (dosya adı uzantısı) (OS/2) +Typeface Definition File (dosya adı
uzantısı)
TDI Transport Device Interface
TDM Technical Document Management +Time Division Multiplexing
TDMA Time Division Multiple Access
TDMS Terminal Display Management System
TDP Tag Distribution Protocol (Cisco) +Telelocator Data Protocol
TDSR Transmitter Data Service Request
TDR Time Domain Reflectometry
TE/2 Terminal Emulator/2 (Oberon)
TEB Thread Environment Block
TEC Tokyo Electronics Corporation
TED Tiny Editor + Transient Electromagnetic Device
TEI Terminal Endpoint Identifier
TELCO Telephone Company
TEML Turbo Editor Macro Language (Borland)
TEMP Temporary
TER Thermal Eclipse Reading (Sony)
TERMPWR Terminator Power
TFDD Text File Device Driver
TFEL Thin-Film Electroluminescent
.TFM Tagged Font Metric (dosya adı uzantısı)
TFT Thin-Film Transistor (screens)
TFTP Trivial File Transfer Protocol
.TGA Taga Bitmap (dosya adı uzantısı)
THD Total Harmonic Distortion
.THD Thread (dosya adı uzantısı)
THINNET Thin Ethernet
THOR Tandy High-Performance Optical Recording
THR Transmit Holding Register
.THS Thesaurus (dosya adı uzantısı)
TI Texas Instruments, Inc.
TIA Telecommunications Industry Association +The Internet Adapter (Internet)
TIB Tag Information Base
TID Target ID
TIES Time Independent Escape Sequence
.TIF Tagged Image File (dosya adı uzantısı)
TIFF Tagged Image File Format
TIGA Texas Instruments Graphics Architecture
TIGER Topologically Integrated Geographic Encoding and Referencing
TIIAP Telecommunications and Information Infrastructure Assistance Program (NII)
TIL Tech Info Library (Macintosh)
TIM Technical Information Memo (Compaq)
TIMI Technology Independent Machine Interface (IBM)
TIMS Text Information Management Systems
第 50 页
常见E文缩写.txt
TINA Telecommunication Information Networking Architecture
TIP Terminal Interface Processor +Transaction Internet Protocol
TITOFET Tunneling-In, Tunneling-Out Field Effect Transistor
TK/TK Track to Track
TLA Three-Letter Acronym
TLB Translation Lookaside Buffer
.TLB Table (dosya adı uzantısı)
TLD Top Level Domain (name)
TLI Transport Layer Interface
TLS Transport Layer Security
TLU Table Lookup
.TLX Telex (dosya adı uzantısı)
TM Trademark
TMDS Transition Minimized Differential Signaling
.TML Template (dosya adı uzantısı)
TMP Temporary
TMS Traffic Management System (BA)
TN Twisted Nematic
TNC Terminal Node Controller
TNEF Transport Neutral Encapsulation Format
TOC Table Of Contents
TOD Time Of Day
TOF Tiny Open Firmware
TOP Technical and Office Protocol
TOS Terms Of Service
TPC Transaction-Processing Performance Council
TPF Transactions Processing Facility (IBM)
TPI Tracks Per Inch
TPL Table Producing Language +Transaction Processing Language
TPM Transactions Per Minute
TPORT Twisted Pair Port Transceiver (AT&T)
TP-PMD Twisted Pair-Physical Medium Dependent (cable)
TPS Transactions Per Second +Transaction Processing System
TPW Turbo Pascal for Windows
TQFP Thin Quad Flat Pack
TQM Total Quality Management
TR Terminal Ready
T/R Transmit/Receive
TRACERT Trace Route (Microsoft)
.TRM Terminal (dosya adı uzantısı)
TRN Threaded Read News (Internet) + Token Ring Network
TRON The Real-Time Operating System Nucleus
TS Top Secret
TSA Target Service Agent + Technical Support Alliance +Telephony Services Architecture
TSAPI Telephony Services Application Program
TSB Termination Status Block
TSD Type-Specific Driver
TSE The Semware Editor
TSID Transmitting Subscriber Identification (Microsoft)
TSO Time Sharing Option
TSOP Thin Small-Outline Package
TSP Telephony Service Provider
TSR Terminate and Stay Resident
TSS Task State Segment + Time Sharing System
TS/SI Top Secret/Sensitive Information
.TST Test (dosya adı uzantısı)
TSTN Triple Supertwisted Nematic
TSV Tab Separated Values
TT Typewriter Text
TTA Transport-Triggered Architecture
TTCN Tree and Tabular Combined Notation
.TTF TrueType Font (dosya adı uzantısı)
TTL Transistor-Transistor Logic
TTP Thermal-Transfer Printing
TTS Text-To-Speech + Transaction Tracking System
TTY Teletype
TUCOWS The Ultimate Collection of Winsock Software
TUI Text-Based User Interface (WordPerfect)
TUMS Table Update and Management System (Stanford University)
.TUT Tutorial (dosya adı uzantısı)
TVF Table of contents Verbosely from File (UNIX)
TVFS Toronto Virtual File System (IBM)
TVI Television Interference
TVOL Television On-Line
TWEAKUI Tweak User Interface
TWX Teletypewriter Exchange Service
第 51 页
常见E文缩写.txt
TXD Transmit Data
.TXF Tax Exchange Format (dosya adı uzantısı)
TXT Text
TXT2STF Text To Structured File (Lotus Agenda)
TZ Time Zone (Unix)
UA User Agent + User Area
UAE Unrecoverable Application Error
UAM User Authentication Method
UART Universal Asynchronous Receiver/Transmitter
UAS User Application Software
UBR Unspecified Bit Rate
.UC2 Compressed File (dosya adı uzantısı) (UltraCompressor)
UCE Unsolicited Commercial Email
UCL Universal Communications Language
UCS Unicode Conversion Support + Universal Character Set +User Coordinate System
UCT Universal Coordinated Time
UDA Universal Data Access (Microsoft)
UDB Universal Data Base
UDC Universal Decimal Classification + User Defined Commands
UDD User Data Document
UDDI Universal Description, Discovery and Integration
UD-DVD Ultra-Definition Digital Video Disk
UDE Universal Data Exchange
UDF Universal Disk Format + User Defined Functions
UDG User Defined Gateway
UDMA Ultra Direct Memory Access
UDP User Datagram Protocol
UDT Uniform Data Transfer + User-Defined Type
UFS Unix File System
UG User Group
UHCI Universal Host Controller Interface
UHF Ultra-High Frequency
UHL Universal Hypertext Link
UI Unix International + User Interface
UIC User Identification Code
UID User Identifier
UIMS User Interface Management System
UL Underwriters Laboratories +Unordered List + Upload
ULA Uncommitted Logic Array
ULN Universal Link Negotiation
ULSI Ultra Large Scale Integration
UMA Unified Memory Architecture
UMB Upper Memory Block (LIM/AST)
UML Unified Modeling Language
UMS User Mode Scheduler
UMTS Universal Mobile Telecommunications System
UNC Universal Naming Convention
UNCOL Universal Computed Oriented Language
UNEP Unbundled Network Platform
UNI User-Network Interface
UNICOM Universal Integrated Communication (System)
UNICOS Universal Compiler FORTRAN compatible
UNII Unlicensed National Information Infrastructure
UNIVAC Universal Automatic Computer
UNIX (AT&T Bell Laboratories Operating System)
UNMA Unified Network Management Architecture
UNSPSC Universal Standard Products and Services Classification
UP Uniprocessor
UPC Universal Product/Program Code + User Parameter Control
UPG Upgrade
UPL User Program Language
UPM Unix Programmer's Manual +User Profile Management (IBM)
UPS Uninterruptible Power Supply/System
URC Uniform Resource Characteristics +Uniform Resource Citation
UREP Unix RSCS Emulation Protocol (protocol)
URI Uniform Resource Identifier
URL Uniform Resource Locator
URN Uniform Resource Name/Number
US Unit Separator
USART Universal Synchronous-Asynchronous Receiver/Transmitter
USB Universal Serial Bus (Intel)
USENET User's Network (Internet)
USERID User Identification
USOC Universal Service Ordering Code
USQ Unsqueezed (files)
USR US Robotics (corporation)
第 52 页
常见E文缩写.txt
USRT Universal Synchronous Receiver/Transmitter
USSA User Supported Software Association (United Kingdom)
UT User Terminal
UTC Coordinated Universal Time
UTF Unicode Transformation Format
UTI Universal Text Interchange/Interface
UTP Unshielded Twisted-Pair (cable)
UU Uuencode/Uudecode
UUCP Unix-To-Unix Copy Protocol
UUD UUDecoding (Unix)
UUDECODE Unix-To-Unix Decoding
UUE UUEncoding (Unix)
UUENCODE Unix-To-Unix Encoding
UUI User-To-User Information (AT&T)
UUID Universal Unique Identifier
UV Ultraviolet
UWR Ultra Wideband Radio
UXGA Ultra Extended Graphics Array
VA Virtual Address + Visual Age (IBM)
VAD Value Added Dealer
VADD Value Added Disk Driver
VADSL (Bakınız DSL)
VAI Video As Input
VAL Value + Voice Application Language
.VAL Validity Checks (dosya adı uzantısı) (Paradox)
VAM Virtual Access Method
VAN Value Added Network
VAP Value Added Process
VAR Value Added Reseller + Value Added Retailer + Variable
VAST Variable Array Storage Technology
VAX/VMS Virtual Address Extension/Virtual Memory System (DEC)
VB Variable Block + Visual Basic (Microsoft)
VBA Visual Basic for Applications (Microsoft)
VBE/AI Vesa Bios Extension/Audio Interface
VBI Vertical Blanking Interval
VBNS Very High Speed Backbone Network Service (MCI + NSF)
VBR Variable Bit Rate
VBRUN Visual Basic Runtime
VBS Visual Basic Script
.VBX Visual Basic Extension (dosya adı uzantısı)
VCC Virtual Channel Connection
VCD Video Compact Disk + Virtual Communications Driver
VCI Virtual Circuit Identifier
VCL Visual Component Library
VCM Virtual Channel Memory
VCN Virtual Cluster Number
VCOS Visual Caching Operating System (AT&T)
VCPI Virtual Control Program Interface
VCR Video Cassette Recorder
VDD Virtual Device Driver
VDDM Virtual Device Driver Manager
VDE Video Display Editor + Visual Development Environment
VDI Virtual Device Interface
VDISK Virtual Disk
VDM Virtual DOS Machine (IBM)
VDMAD Virtual Direct Memory Access Device (Microsoft)
VDS Virtual DMA Services
VDSL (Bakınız DSL)
VDT Video Dial Tone + Video Display Terminal
VDU Video Display Unit + Visual Display Unit
VEGA Video-7 Enhanced Graphics Adapter (Video-7, Inc.)
VEMM Virtual Expanded Memory Manager
VEMMI Versatile Multimedia Interface
VER Verify + Version
VERONICA Very Easy Rodent-Oriented Net-Wide Index to Computer Archives (Internet)
VERR Verify Read Access
VERW Verify Write Access
VES Video Encoding Standard (Oracle)
VESA Video Electronics Standards Association
VF Virtual Floppy
VFAT Virtual File Allocation Table (Microsoft)
V.FC Version.First Class (communications standard)
VFD Vacuum Fluorescent Display
VFW Video For Windows (Microsoft)
VGA Video Graphics Array
VGC Video Graphics Controller
第 53 页
常见E文缩写.txt
VHDL VHSIC Hardware Description Language
VHF Very-High Frequency
VHS Very High Speed + Video Home System +Virtual Host Storage
VHSIC Very High Speed Integrated Circuit
VI Visual Interactive (editor) (UNIX)
VIA Virtual Interface Architecture (Intel)
VIE Virtual Information Environment
VIF Virtual Interface + Virtual Interrupt Flag
VIM Vendor Independent Mail +Vendor Independent Messaging + Video Interface Module
VIO Video Input/Output + Virtual Input/Output
VINES Virtual Networking System (Banyan)
ViP Visual Programming (Lotus)
VIP Variable Information Processing +Video Information Provider +Virtual Interrupt Pending +Visual
Interactive Parser
VIPER Verifiable Integrated Processor for Enhanced Reliability
VIS Video Information System (Tandy) +Viewable Image Size +Voice Information System
VLA Variable Length Array
VLAN Virtual Local Area Network
VL-BUS Vesa Local-Bus (VESA)
VLD Variable-Length Decoder
VLF Very Low Frequency
VLINK Visited Link (HTML)
VLIW Very Large Instruction Word
VLM Virtual Loadable Module
VLSI Very Large Scale Integration
VLSIPS Very Large Scale Immobilized Polymer Synthesis
VLT Variable List Table
VM Virtual Machine + Virtual Memory
VMA Virtual Memory Address
VMB Virtual Machine Boot
VME Versa Module Eurocard +Virtual Memory Environment
VML Vector Markup Language (Microsoft)
VMM Virtual Machine/Memory Manager
VMOS Vertical MOS
VMP Virtual Modem Protocol
VMS Virtual Machine Storage + Virtual Memory System +Voice Message System
VMT Virtual Memory Technique
VNA Virtual Network Architecture
VNOS Visual Network Operating System
VOC Creative Voice (format) (Sound Blaster)
VOD Video On Demand
VOIP Voice Over Internet Protocol
VOL Volume
VOM Volt-Ohm-Milliammeter
VOR Visions Of Reality
VOS Verbal/Voice Operating System
VP Virtual Path
VPD Virtual Printer Device + Vital Product Data (IBM)
VPDN Virtual Private Data Network
VPDS Virtual Private Data Service (MCI)
VPE Video Port Extensions (Microsoft) +Visual Programming Environment
VPL Virtual Programming Language
VPM Video Port Manager
VPN Virtual Page Number + Virtual Private Network
VPS Voice Processing System
VPSC Vault, Process, Structure, Configuration
VPT Virtual Print Technology (Dataproducts)
VR Virtual Reality + Voltage Regulated/Regulator
VRAM Video Random Access Memory
VRD Virtual Retinal Display
VRE Voltage Regulated Extended
VRM Vendor Relationship Management + Voltage Regulator Module
VRML Virtual Reality Modeling Language
VROOMM Virtual Real-time Object Oriented Memory Manager (Borland)
VRRP Virtual Router Redundancy Protocol
.VRS WordPerfect Graphics Driver (dosya adı uzantısı)
VRT Voltage Regulation Technology (Intel)
VRU Voice Response Unit
VS Virtual Storage
VSAM Video Surveillance and Monitoring +Virtual Storage Access Method
VSAT Very Small Aperture Terminal
VSE Virtual Storage Extended
VSF Vertical Scanning Frequency
VSI Virtual Socket/Switch Interface
VSIO Virtual Serial Input Output
第 54 页
常见E文缩写.txt
VSM Virtual Shared Memory + Virtual Storage Management +Visual System Management (IBM)
VSN Volume Serial Number
VSOS Virtual Storage Operating System
VSYNC Vertical Sync
VT Vertical Tab
VTAM Virtual Telecommunications Access Method (IBM)
VTNS Virtual Telecommunications Network Service
VTS Volume Tracking Driver
VUI Video User Interface
VUP VAX Unit of Performance
VWB Visual WorkBench (Microsoft)
VWM Virtual Window Manager
VXA Variable-Speed Architecture (Ecrix)
VxD Virtual Extended Driver (Microsoft)
.VXD Virtual Device (dosya adı uzantısı) (Microsoft)
VXML Voice Extensible Markup Language
V&V Verification and Validation
W/ With
W3 (bakınız WWW)
W3A World Wide Web Applets
W3C World Wide Web Consortium
W4 What-Works-With-What
WAAS Wide Area Augmentation System
WABI Windows Application Binary Interface (SunSoft)
WAI Web Accessibility Initiative +
WAIS Wide Area Information Server
WAITI Wait-For-Interrupt
WAITS Wide Area Information Transfer System
WAN Wide Area Network
WAP Wireless Application Protocol
WARP Web Service Aggregtion, Rely and Propogation
WATS Wide Area Telecommunications Service
.WAV Waveform Audio (dosya adı uzantısı)
WBEM Web-Based Enterprise Management
WC Word Count
W-CDMA Wideband CDMA
WCS World Coordinate System
WD-40 Water Displacement-40th Attempt
WDL Windows Driver Library (Microsoft)
WDM Wavelength Division Multiplexing +Windows Driver Model (Microsoft)
WDRAM Windows Dynamic Random Access Memory
WEA Web Enabled Application
.WEB Entities Emphasizing the WWW (Domain Name) (Internet)
WEBDAV Web Based Distributed Authoring and Versioning
WEBNFS Web Network File System (Sun)
WELL Whole Earth 'Lectronic Link (BBS)
WEP Wired Equivalent Privacy
WFM Wired For Management (Intel)
WFQ Weighted Fair Queuing (Cisco)
WFW Windows For Workgroups (Microsoft)
WGS Work Group System
WHAM Waveform Hold and Modify (Microsoft)
WHC Workstation Host Connection
WIFI (Wi-Fi) Wireless Fidelity
WIMP Windows, Icons, Menus and Pulldowns
WIN 9.X Windows95/Windows98
WINDBG Windows Debugger (Microsoft)
WINE Windows Emulator
WINForum Wireless Information Networks Forum
WIN...ME Windows Millennium Edition (Microsoft)
WINS Windows Internet Naming Service (Microsoft)
WIN...SE Windows Second Edition (Microsoft)
WINSOCK Windows Open Systems Architecture (Microsoft) +Windows Sockets
WINWORD Word For Windows (Microsoft)
WIN...XP Windows The "Experience" (Microsoft)
WISE WordPerfect Information System Environment
WIT Web Interactive Talk (Internet)
.WKB Workbook (dosya adı uzantısı) (WordPerfect)
.WKE Worksheet (dosya adı uzantısı) (Lotus 1-2-3) (LDC)
.WKQ Spreadsheet (dosya adı uzantısı) (BORQU)
.WKS Worksheet (dosya adı uzantısı) (Lotus 1-2-3) (LDC)
.WKZ Compressed Spreadsheet (dosya adı uzantısı) (BORQU)
.WK1 Worksheet (dosya adı uzantısı) (Lotus 1-2-3) (LDC)
WL Word Line
WLAN Wireless Local Area Network
.WLG Dr. Watson Log (dosya adı uzantısı)
第 55 页
常见E文缩写.txt
WLL Wireless Local Loop
.WMA Windows Media Audio (dosya adı uzantısı) (Microsoft)
WMC Workflow Management Coalition
.WMF Windows Metafile Format (dosya adı uzantısı) (Microsoft)
WMFSDK Windows Media Format Software Development Kit (Microsoft)
WML Wireless Markup Language
WMP Windows Media Player (Microsoft)
WMRM Write Many, Read Many
WMT Windows Media Technologies (Microsoft)
WNIC Wide-Area Network Interface Co-Processor
WNIM Wide-Area Network Interface Module
W/O Without
WORM Write Once, Read Many
WOS Workstation Operating System
WOSA Windows Open Services/Systems Architecture (Microsoft)
WOW Window On Windows (Microsoft)
WP WordPerfect + Word Processing + Write Protected
.WPD Windows Printer Description (dosya adı uzantısı)
.WPG WordPerfect Graphics (dosya adı uzantısı)
WPHD Write-Protect Hard Disk
.WPK Keyboard (dosya adı uzantısı) (WordPerfect)
WPM Words Per Minute
.WPM Macro (dosya adı uzantısı) (WordPerfect)
WPOS Workplace Operating System
WPS Windows Printing System (Microsoft) +Workplace Shell (OS2)
WPVM Windows Parallel Virtual Machine
.WQ1 Spreadsheet (dosya adı uzantısı) (BORPQU)
WRAM Windows Random Access Memory
WRE Weighted Random Early Detection (Cisco)
.WRI Write (dosya adı uzantısı)
WRK Windows Resource Kit (Microsoft)
WS WordStar + Workstation
WSAPI Web Site Application Program Interface (O'Reilly)
WSDL Web Services Definition/Description Language (IBM/Microsoft)
WSH Windows Scripting Host (Microsoft)
WSUI Web Services User Interface
WT Write Through
WTLS Wireless Transport Layer Security
WTM Wired For Management
WWIS World Wide Information System (Internet)
WWW World-Wide Web (Internet)
WYSBYGI What You Bakınız Before You Get It
WYSIWYG What You Bakınız Is What You Get
XA Extended Architecture + Extended Attribute
XAPIA X.400 Application Program Interface Association
X2B Hexadecimal to Binary (REXX)
.XBM X-Windows Bitmaps (dosya adı uzantısı) (black and white)
.XPM X-Windows Pixelmaps (dosya adı uzantısı) (color)
X2C Hexadecimal to Character (REXX)
XCHG Exchange
XCMD External Command
XCOPY Extended Copy
X2D Hexadecimal to Decimal (REXX)
XDF Extended Density Format (IBM)
XDR Extended/External Data Representation
XFCN External Function
XFDL Extensible forms Description Language
XGA Extended Graphics Array (IBM)
XHTML Extensible HyperText Markup Language
XID Exchange Identifier
XIOS Extended Input/Output System
.XLA Add-In (dosya adı uzantısı) (Microsoft-Excel)
XLAT Translate
XLF Exceptional Fortran (IBM)
.XLK Backup (dosya adı uzantısı) (Microsoft-Excel)
XLL Extensible Link Language
XLM Excel Macro Language (Microsoft)
.XLT Template (dosya adı uzantısı) (Microsoft-Excel)
XMIT Transmit
XML Extensible Markup Language
XMM Extended Memory Manager (LIM/AST)
XMS Extended Memory Specification (LIM/AST)
XNS Xerox Network System (protocol) (Xerox)
XOFF Transmitter Off
XON Transmitter On
XOR Exclusive OR (Also EOR)
第 56 页
常见E文缩写.txt
XP Extreme Performance (Compaq)
XPCOM Cross Platform Component Object Model (Mozilla)
XPE XP Embedded (bakınız WIN...XP) (Microsoft)
XPRM Xerox Print Resources Manager (Xerox)
XRNS Extensible Resource Name System
XRT Extensions for Real-Time
XSL Extensible Style Language
XSLT Extensible Stylesheet Transformation
XSMD Extended Storage Module Drive (interface)
XSSI Extended Server Side Includes
XTAL Crystal
XTCLK External Transmit Clock
XUL Extensible User-Interface Language (Netscape)
YAM Yet Another Modem (Omen Technology)
YAHOO Yet Another Hierarchically Officious Oracle (Internet)
Y2K Year 2000
YTD To Date
.z Packed file (dosya adı uzantısı - Pack/Unpack
program)..lower case z..(Unix)
.Z Compressed file (dosya adı uzantısı - using
Compress/Uncompress program)..upper case Z..(Unix)
ZAK Zero Administration Kit (Microsoft)
ZAW Zero Administration for Windows (Microsoft)
ZBR Zone-Bit Recording (IBM)
Z-CAV Zoned Constant Angular Velocity
ZDL Zero Delay Lockout
ZDS Zenith Data Systems
ZIF Zero-Insertion Force (socket)
ZIP Zigzag In-Line Package +Zone Improvement Plan (ZIPcode)
.ZIP Compressed File (dosya adı uzantısı) (PKWare)
.ZOO Compressed File (dosya adı uzantısı) (Dhesi)
ZPV Zoomed Port Video (Toshiba)
ZSL Zero Slot LAN
第 57 页
 
