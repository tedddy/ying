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

        
 
