naming rule 

-- to do list

	order by d  to order by `d`

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
Current* 	CUR* 	
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



        
 
