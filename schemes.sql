DROP TABLE IF EXISTS schemes;

CREATE TABLE schemes (
id INTEGER PRIMARY KEY AUTOINCREMENT,
scheme_name TEXT,
category TEXT,
scheme_type TEXT,
state TEXT,
gender TEXT,
caste TEXT,
education TEXT,
min_age INTEGER,
max_age INTEGER,
benefits TEXT,
documents TEXT,
apply_link TEXT
);
INSERT INTO schemes VALUES
(NULL,'National Scholarship Portal','Student','Central','All','All','All','School',14,25,'Multiple scholarships for students','Aadhaar,Marksheet','https://scholarships.gov.in'),
(NULL,'INSPIRE Scholarship','Student','Central','All','All','All','UG',17,25,'₹80,000 yearly scholarship','Aadhaar,12th marksheet','https://online-inspire.gov.in'),
(NULL,'AICTE Pragati Scholarship','Student','Central','All','Female','All','UG',17,25,'₹50,000 yearly scholarship','Aadhaar,College ID','https://aicte-india.org'),
(NULL,'AICTE Saksham Scholarship','Student','Central','All','All','All','UG',17,25,'Scholarship for differently abled students','Disability certificate','https://aicte-india.org'),
(NULL,'PM YASASVI Scholarship','Student','Central','All','All','OBC','School',13,18,'Scholarship for OBC students','Caste certificate','https://yet.nta.ac.in'),
(NULL,'Vidya Lakshmi Education Loan','Student','Central','All','All','All','UG',18,30,'Education loan support','Aadhaar,Bank documents','https://vidyalakshmi.co.in'),
(NULL,'PM SHRI Schools','Student','Central','All','All','All','School',10,18,'Quality education support','School ID','https://pmshrischools.education.gov.in'),
(NULL,'Central Sector Scholarship','Student','Central','All','All','All','UG',17,25,'₹20,000 yearly scholarship','Marksheet,Aadhaar','https://scholarships.gov.in'),
(NULL,'Tamil Nadu Free Laptop Scheme','Student','State','Tamil Nadu','All','All','HigherSecondary',16,21,'Free laptop for students','School certificate','https://tn.gov.in'),
(NULL,'Kerala Vidya Samunnathi Scholarship','Student','State','Kerala','All','OBC','UG',17,25,'Scholarship for OBC students','Caste certificate','https://kerala.gov.in');
INSERT INTO schemes VALUES
(NULL,'Pradhan Mantri Kisan Samman Nidhi','Farmer','Central','All','All','All','Any',18,70,'₹6000 yearly support','Aadhaar,Land records','https://pmkisan.gov.in'),
(NULL,'PM Fasal Bima Yojana','Farmer','Central','All','All','All','Any',18,70,'Crop insurance support','Land records','https://pmfby.gov.in'),
(NULL,'Kisan Credit Card','Farmer','Central','All','All','All','Any',18,65,'Low interest agricultural loan','Aadhaar,Bank passbook','https://pmkisan.gov.in'),
(NULL,'PM Krishi Sinchai Yojana','Farmer','Central','All','All','All','Any',18,70,'Irrigation support','Land documents','https://pmksy.gov.in'),
(NULL,'Soil Health Card Scheme','Farmer','Central','All','All','All','Any',18,70,'Free soil testing','Land record','https://soilhealth.dac.gov.in'),
(NULL,'Agriculture Infrastructure Fund','Farmer','Central','All','All','All','Any',18,65,'Loan for agriculture infrastructure','Land proof','https://agriinfra.dac.gov.in'),
(NULL,'National Mission on Natural Farming','Farmer','Central','All','All','All','Any',18,65,'Support for organic farming','Land record','https://naturalfarming.dac.gov.in'),
(NULL,'eNAM Agriculture Market','Farmer','Central','All','All','All','Any',18,65,'Digital agriculture market','Aadhaar','https://enam.gov.in'),
(NULL,'Rythu Bandhu Scheme','Farmer','State','Telangana','All','All','Any',18,65,'Investment support for farmers','Land documents','https://telangana.gov.in'),
(NULL,'YSR Rythu Bharosa','Farmer','State','Andhra Pradesh','All','All','Any',18,65,'Financial support to farmers','Land records','https://ap.gov.in');
INSERT INTO schemes VALUES
(NULL,'Pradhan Mantri Mudra Yojana','Business Owner','Central','All','All','All','Any',18,60,'Loan upto ₹10 lakh','Aadhaar,Business plan','https://mudra.org.in'),
(NULL,'Startup India Scheme','Business Owner','Central','All','All','All','UG',21,60,'Startup funding support','Business registration','https://startupindia.gov.in'),
(NULL,'Stand Up India Scheme','Business Owner','Central','All','All','SC/ST','Any',18,60,'Loan ₹10 lakh to ₹1 crore','Caste certificate','https://standupmitra.in'),
(NULL,'PM Employment Generation Programme','Business Owner','Central','All','All','All','Any',18,60,'Subsidy for new business','Business documents','https://kviconline.gov.in'),
(NULL,'Credit Guarantee Fund Scheme','Business Owner','Central','All','All','All','Any',18,60,'Loan guarantee for MSMEs','Business registration','https://cgfmse.in'),
(NULL,'MSME Loan Scheme','Business Owner','Central','All','All','All','Any',18,60,'Financial assistance for MSMEs','Business proof','https://msme.gov.in'),
(NULL,'Startup Seed Fund Scheme','Business Owner','Central','All','All','All','Any',18,60,'Startup seed funding','Startup registration','https://startupindia.gov.in'),
(NULL,'Tamil Nadu MSME Support Scheme','Business Owner','State','Tamil Nadu','All','All','Any',18,60,'Financial support for MSMEs','Business proof','https://tn.gov.in');
INSERT INTO schemes VALUES
(NULL,'MGNREGA','Worker','Central','All','All','All','Any',18,60,'100 days rural employment','Job card,Aadhaar','https://nrega.nic.in'),
(NULL,'PM Vishwakarma Scheme','Worker','Central','All','All','All','Any',18,60,'Skill training + loan','Occupation proof','https://pmvishwakarma.gov.in'),
(NULL,'eShram Portal','Worker','Central','All','All','All','Any',16,60,'Social security for workers','Aadhaar','https://eshram.gov.in'),
(NULL,'PM Shram Yogi Maandhan','Worker','Central','All','All','All','Any',18,40,'Pension scheme','Aadhaar,Bank details','https://maandhan.in'),
(NULL,'National Career Service','Worker','Central','All','All','All','Any',18,60,'Job portal support','Aadhaar','https://ncs.gov.in'),
(NULL,'Labour Welfare Fund','Worker','State','Tamil Nadu','All','All','Any',18,60,'Financial assistance for workers','Worker ID','https://tn.gov.in');
INSERT INTO schemes VALUES
(NULL,'Pradhan Mantri Jan Dhan Yojana','Other','Central','All','All','All','Any',18,60,'Zero balance bank account','Aadhaar','https://pmjdy.gov.in'),
(NULL,'Ayushman Bharat','Other','Central','All','All','All','Any',0,80,'Free health insurance','Aadhaar','https://pmjay.gov.in'),
(NULL,'PM Awas Yojana','Other','Central','All','All','All','Any',18,60,'Affordable housing','Aadhaar','https://pmaymis.gov.in'),
(NULL,'Atal Pension Yojana','Other','Central','All','All','All','Any',18,40,'Monthly pension scheme','Bank account','https://npscra.nsdl.co.in'),
(NULL,'PM Suraksha Bima Yojana','Other','Central','All','All','All','Any',18,70,'Accident insurance','Bank account','https://jansuraksha.gov.in'),
(NULL,'Kalaignar Magalir Urimai Scheme','Other','State','Tamil Nadu','Female','All','Any',21,60,'₹1000 monthly support','Ration card','https://tn.gov.in');