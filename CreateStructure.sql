-- create DB
--create DATABASE Viking_OLTP
--create DATABASE Viking_OLAP
-- HR Tables
		DROP TABLE if exists Viking_OLTP.dbo.Categ
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.Categ
		(
		CategID smallint IDENTITY Primary KEY
		,CategName varchar(50) UNIQUE
		);

		DROP TABLE if exists Viking_OLTP.dbo.Title
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.Title
		(
		TitleID smallint IDENTITY Primary KEY
		,TitleCode smallint UNIQUE
		,TitleName varchar(50) UNIQUE
		);

		DROP TABLE if exists Viking_OLTP.dbo.Gender
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.Gender
		(
		GenderID smallint IDENTITY Primary KEY
		,GenderCode varchar(5) UNIQUE
		,GenderName varchar(25) UNIQUE
		);

		DROP TABLE if exists Viking_OLTP.dbo.MaritalStatus
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.MaritalStatus
		(
		MaritalStatusID smallint IDENTITY Primary KEY
		,MaritalStatusCode smallint UNIQUE
		,MaritalStatusName varchar(25) UNIQUE
		);

		DROP TABLE if exists Viking_OLTP.dbo.WorkMode
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.WorkMode
		(
		WorkModeID int IDENTITY Primary KEY
		,WorkModeCode int UNIQUE
		,WorkModeName varchar(50) UNIQUE
		);

		ALTER TABLE Viking_OLTP.dbo.City DROP CONSTRAINT FK_City_ATDType 
		ALTER TABLE Viking_OLTP.dbo.Street DROP CONSTRAINT FK_Street_ATDType 
		ALTER TABLE Viking_OLTP.dbo.[Address] drop CONSTRAINT FK_Address_Street
		ALTER TABLE Viking_OLTP.dbo.Street drop CONSTRAINT FK_Street_City
		ALTER TABLE Viking_OLTP.dbo.City drop CONSTRAINT FK_City_LocalRegion
		ALTER TABLE Viking_OLTP.dbo.LocalRegion drop CONSTRAINT FK_LocalRegion_Country
		ALTER TABLE Viking_OLTP.dbo.Country drop CONSTRAINT FK_Country_Region

		DROP TABLE if exists Viking_OLTP.dbo.Region
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.Region
		(
		RegionID int IDENTITY Primary KEY
		,RegionName varchar(50) UNIQUE
		);

		DROP TABLE if exists Viking_OLTP.dbo.ATDType
		CREATE TABLE Viking_OLTP.dbo.ATDType
		(
		ATDTypeID int IDENTITY Primary KEY
		,ATDTypeName varchar(50) UNIQUE NOT NULL
		,ATDTypeSName varchar(10)
		)

		DROP TABLE if exists Viking_OLTP.dbo.Country
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.Country
		(
		CountryID int IDENTITY Primary KEY
		,CountryCode varchar(5) UNIQUE
		,CountryName varchar(50) UNIQUE
		,cRegionID int
		);

		DROP TABLE if exists Viking_OLTP.dbo.LocalRegion
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.LocalRegion
		(
		LocalRegionID int IDENTITY Primary KEY
		,LocalRegionCode int UNIQUE
		,LocalRegionName varchar(50) UNIQUE
		,cCountryID int
		,cATDTypeID int
		);
		
		DROP TABLE if exists Viking_OLTP.dbo.City
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.City
		(
		CityID int IDENTITY Primary KEY
		,CityCode smallint
		,CityName varchar(50) UNIQUE
		,cLocalRegionID int
		,cATDTypeID int
		);

		DROP TABLE if exists Viking_OLTP.dbo.Street
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.Street
		(
		StreetID int IDENTITY Primary KEY
		,StreetName varchar(150)
		,cCityID int
		,cATDTypeID int
		);

		DROP TABLE if exists Viking_OLTP.dbo.[Address]
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.[Address]
		(
		AddressID int IDENTITY Primary KEY
		,Building varchar(10)
		,Appartments varchar(10)
		,cStreetID int
		);

ALTER TABLE Viking_OLTP.dbo.Country ADD CONSTRAINT FK_Country_Region FOREIGN KEY (cRegionID) References Viking_OLTP.dbo.Region(RegionID)
ALTER TABLE Viking_OLTP.dbo.LocalRegion ADD CONSTRAINT FK_LocalRegion_Country FOREIGN KEY (cCountryID) References Viking_OLTP.dbo.Country(CountryID)
ALTER TABLE Viking_OLTP.dbo.City ADD CONSTRAINT FK_City_LocalRegion FOREIGN KEY (cLocalRegionID) References Viking_OLTP.dbo.LocalRegion(LocalRegionID)
ALTER TABLE Viking_OLTP.dbo.City ADD CONSTRAINT FK_City_ATDType FOREIGN KEY (cATDTypeID) References Viking_OLTP.dbo.ATDType(ATDTypeID)
ALTER TABLE Viking_OLTP.dbo.Street ADD CONSTRAINT FK_Street_City FOREIGN KEY (cCityID) References Viking_OLTP.dbo.City(CityID)
ALTER TABLE Viking_OLTP.dbo.Street ADD CONSTRAINT FK_Street_ATDType FOREIGN KEY (cATDTypeID) References Viking_OLTP.dbo.ATDType(ATDTypeID)
ALTER TABLE Viking_OLTP.dbo.[Address] ADD CONSTRAINT FK_Address_Street FOREIGN KEY (cStreetID) References Viking_OLTP.dbo.Street(StreetID)


		DROP TABLE if exists Viking_OLTP.dbo.Department
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.Department
		(
		DepartmentID int IDENTITY Primary KEY
		,DepartmentCode varchar(20)
		,DepartmentName varchar(150)
		,cDepartmentManagerID int
		,cAddressID int 
		);

		DROP TABLE if exists Viking_OLTP.dbo.Person
		USE Viking_OLTP
		CREATE TABLE Viking_OLTP.dbo.Person
		(
		 PersonID int IDENTITY Primary KEY
		,PersonTabN int UNIQUE
		,PersonDateIN date
		,PersonDateOut date
		,PersonFirstName varchar(50)
		,PersonLastName varchar(50)
		,cGenderID int
		,cMaritalStatusID int
		,PersonBirthDate date
		,cDepartmentID int
		,cCategID int
		,cTitleID int
		,cWorkModeID int
		);



delete Viking_OLTP.dbo.Categ
INSERT INTO Viking_OLTP.dbo.Categ VALUES ('������������'), ('�����������'), ('��������'), ('������������� ��������')
-- SELECT * FROM Viking_OLTP.dbo.Categ


INSERT INTO Viking_OLTP.dbo.Title VALUES 
 (1001, '��������')
,(1002, '����������� ��������� �� ���������������� ��������')
,(1003, '����������� ��������� �� ������������ ��������')
,(1004, '������� ���������')
,(2001, '����������� �������� ����������')
,(2002, '��������� 1 ���������')
,(2003, '��������� 2 ���������')
,(2004, '���������� �� ��������� � ������')
,(3001, '��������� ������ ������')
,(3002, '���������� �� ������ � ���������� 1 ���������')
,(3003, '���������� �� ������ � ���������� 2 ���������')
,(4001, '���������� �� ����������������')
,(4002, '���������� �� ������ � ���������� (HR)')
,(5000, '������������ ������ ���������� ��')
,(5001, '����������-����������� �� 1 ���������')
,(5002, '����������-����������� �� 2 ���������')
,(5003, '����������-����������� �� 3 ���������')
,(5004, '����������-����������� �� 4 ���������')
,(6000, '������������ ������ ����������� �������� ��')
,(6001, '����������� �� 1 ���������')
,(6002, '����������� �� 2 ���������')
,(6003, '����������� �� 3 ���������')
,(6004, '����������� �� 4 ���������')
,(7000, '��������� ������ ����������� ���������')
,(7001, '���������� ��� 1 ���������')
,(7002, '���������� ��� 2 ���������')
,(7003, '���������� ��� 3 ���������')
,(8000, '��������� ������ ��������� ���������� � �����')
,(8001, '���������� ����� 1 ���������')
,(8002, '���������� ����� 2 ���������')
,(8003, '���������� ����� 3 ���������')
,(9000, '��������� ������ ������')
,(9001, '��������')
-- select * from Viking_OLTP.dbo.Title


INSERT INTO Viking_OLTP.dbo.Gender VALUES
 ('�', '�������')
,('�', '�������')

INSERT INTO Viking_OLTP.dbo.MaritalStatus VALUES
 (1,'������')
,(2,'�� �������')
,(3,'�����')
,(4,'�������')
,(5,'��������(�)')
,(6,'������')
,(7,'�����')

INSERT INTO Viking_OLTP.dbo.WorkMode VALUES
 (1, '5-������� ������� ������ 40 �.')
,(2, '6-������� ������� ������ 36 �.')
-- select * from Viking_OLTP.dbo.WorkMode


INSERT INTO Viking_OLTP.dbo.Region VALUES
 ('Europe')
,('Americas')
,('CIS')
,('APAC')

INSERT INTO Viking_OLTP.dbo.Country VALUES
 ('BY', 'Belarus',3)
,('RU', 'Russia',3)
,('UA', 'Ukraine',3)
,('US', 'USA',2)
,('CAN', 'Canada',2)
,('IN', 'India',4)
,('GER', 'Germany',1)
,('FR', 'France',1)

INSERT INTO Viking_OLTP.dbo.ATDType VALUES
 ('�������', '���.')
,('�����', '�.')
,('������� ���������� ����', '���.')
,('�������', '���.')
,('����', '�.')
,('�����', '���.')
,('��������', '�����.')
,('�����', '��.')
,('�������', '��.')

INSERT INTO Viking_OLTP.dbo.LocalRegion VALUES
 (1,'���������', 1,1)
,(2,'���������', 1,1)
,(3,'����������', 1,1)
,(4,'�����������', 1,1)
,(5,'�������', 1,1)
,(6,'�����������', 1,1)
,(7,'�����', 1,'')

INSERT INTO Viking_OLTP.dbo.City VALUES
 (16, '�����', 1,2)
,(21, '�������', 2,2)
,(23, '������', 3,2)
,(15, '������', 4,2)
,(22, '�������', 6,2)
,(17, '�����', 7,2)

INSERT INTO Viking_OLTP.dbo.Street VALUES
 ('�. ������������',6,8)
,('�������',6,8)
,('�����������',6,7)
,('�������������',6,7)

DROP table IF EXISTS Viking_OLTP.dbo.CrossATDType
create table Viking_OLTP.dbo.CrossATDType
(
ATDTypeID int
,LocalRegionID int 
,CityID int 
,StreetID int 
);

INSERT INTO Viking_OLTP.dbo.CrossATDType 
SELECT DISTINCT 1, LocalRegionID, '', '' FROM Viking_OLTP.dbo.LocalRegion

INSERT INTO Viking_OLTP.dbo.CrossATDType
SELECT DISTINCT 2, '', CityID, '' FROM Viking_OLTP.dbo.City

INSERT INTO Viking_OLTP.dbo.CrossATDType
SELECT DISTINCT 8, '', '', 2

UPDATE Viking_OLTP.dbo.CrossATDType SET dbo.CrossATDType.ATDTypeID = 7 WHERE dbo.CrossATDType.StreetID IN (3,4)

INSERT INTO dbo.Address VALUES
 ('74/1',69,1)
,('26',61,2)
,('12','',3)
,('121','',4)



SELECT * FROM Viking_OLTP.dbo.Categ
SELECT * FROM Viking_OLTP.dbo.Title
SELECT * FROM Viking_OLTP.dbo.Gender
SELECT * FROM Viking_OLTP.dbo.MaritalStatus
SELECT * FROM Viking_OLTP.dbo.Region
SELECT * FROM Viking_OLTP.dbo.LocalRegion
SELECT * FROM Viking_OLTP.dbo.Country
SELECT * FROM Viking_OLTP.dbo.City
SELECT * FROM Viking_OLTP.dbo.Street
SELECT * FROM Viking_OLTP.dbo.ATDType
SELECT * FROM Viking_OLTP.dbo.CrossATDType
SELECT * FROM Viking_OLTP.dbo.Address
SELECT distinct
	    r.RegionName
	   ,c.CountryName	   
	   ,lr.LocalRegionName, atd_lr.ATDTypeName, atd_lr.ATDTypeSName
	   ,ct.CityName, atd_city.ATDTypeName, atd_city.ATDTypeSName	   
	   ,st.StreetName, atd_street.ATDTypeName, atd_street.ATDTypeSName	   
FROM Viking_OLTP.dbo.Country c
     left  JOIN Viking_OLTP.dbo.Region r ON c.cRegionID = r.RegionID
	 left JOIN Viking_OLTP.dbo.LocalRegion lr ON c.CountryID = lr.cCountryID
	 left join Viking_OLTP.dbo.City ct ON ct.cLocalRegionID = lr.LocalRegionID
	 left join Viking_OLTP.dbo.Street st ON st.cCityID = ct.CityID
	 left join Viking_OLTP.dbo.CrossATDType atd_c_lr ON atd_c_lr.LocalRegionID = ct.CityID
	 left join Viking_OLTP.dbo.ATDType atd_lr ON atd_c_lr.ATDTypeID = atd_lr.ATDTypeID
	 left join Viking_OLTP.dbo.CrossATDType atd_c_city ON atd_c_city.CityID = ct.CityID
	 left join Viking_OLTP.dbo.ATDType atd_city ON atd_c_city.ATDTypeID = atd_city.ATDTypeID
	 left join Viking_OLTP.dbo.CrossATDType atd_c_street ON atd_c_street.StreetID = st.StreetID
	 left join Viking_OLTP.dbo.ATDType atd_street ON atd_c_street.ATDTypeID = atd_street.ATDTypeID
	 ;


insert into Viking_OLTP.dbo.Department VALUES
 (1000, '�����������','', 1)
,(2000, '�����������','', 1)
,(3000, '����� ������','', 1)
,(4000, '����� �� ������ � ����������','', 2)
,(5000, '����� ���������� ������������ �����������','', 3)
,(6000, '����� ����������� �������� ��','', 3)
,(7000, '����� ����������� ���������','', 4)
,(8000, '����� ��������� ���������� � �����','', 4)
,(9000, '����� ������','', 1)
-- select * from Viking_OLTP.dbo.Department

/* Address
SELECT 
		 addr.AddressID
		,r.RegionName
		,c.CountryName
		,lr.LocalRegionName
		,ct.CityName
		,st.StreetName		
		,addr.Building
		,addr.Appartments
FROM 
Viking_OLTP.dbo.Address addr
left join Viking_OLTP.dbo.Street st ON addr.cStreetID = st.StreetID
left join Viking_OLTP.dbo.City ct ON st.cCityID = ct.CityID
left JOIN Viking_OLTP.dbo.LocalRegion lr ON ct.cLocalRegionID = lr.LocalRegionID
left join Viking_OLTP.dbo.Country c ON lr.cCountryID = c.CountryID
left join Viking_OLTP.dbo.Region r ON r.RegionID = c.cRegionID
*/
/* Department
SELECT
		 dep.DepartmentName
		,addr.AddressID
		,r.RegionName
		,c.CountryName
		,lr.LocalRegionName
		,ct.CityName
		,st.StreetName
		,addr.Building
		,addr.Appartments
FROM
Viking_OLTP.dbo.Department dep
left join Viking_OLTP.dbo.Address addr on dep.cAddressID = addr.AddressID
left join Viking_OLTP.dbo.Street st ON addr.cStreetID = st.StreetID
left join Viking_OLTP.dbo.City ct ON st.cCityID = ct.CityID
left JOIN Viking_OLTP.dbo.LocalRegion lr ON ct.cLocalRegionID = lr.LocalRegionID
left join Viking_OLTP.dbo.Country c ON lr.cCountryID = c.CountryID
left join Viking_OLTP.dbo.Region r ON r.RegionID = c.cRegionID
*/


-- -Management- insert
INSERT INTO Viking_OLTP.[dbo].[Person]
           ([PersonTabN]
           ,[PersonDateIN]
           ,[PersonDateOut]
           ,[PersonFirstName]
           ,[PersonLastName]
           ,[cGenderID]
           ,[cMaritalStatusID]
           ,[PersonBirthDate]
           ,[cDepartmentID]
           ,[cCategID]
           ,[cTitleID]
           ,[cWorkModeID])
     VALUES
           (1 -- <PersonTabN, int,>
           ,'20180101' -- <PersonDateIN, date,>
           ,NULL -- <PersonDateOut, date,>
           ,'��������' -- <PersonFirstName, varchar(50),>
           ,'���������' -- <PersonLastName, varchar(50),>
           ,2 -- <cGenderID, int,>
           ,4 -- <cMaritalStatusID, int,>
           ,'19990110' -- <PersonBirthDate, date,>
           ,1 -- <cDepartmentID, int,>
           ,1 -- <cCategID, int,>
           ,8 -- <cTitleID, int,>
           ,1 -- <cWorkModeID, int,>
		   );
INSERT INTO Viking_OLTP.[dbo].[Person]
           ([PersonTabN]
           ,[PersonDateIN]
           ,[PersonDateOut]
           ,[PersonFirstName]
           ,[PersonLastName]
           ,[cGenderID]
           ,[cMaritalStatusID]
           ,[PersonBirthDate]
           ,[cDepartmentID]
           ,[cCategID]
           ,[cTitleID]
           ,[cWorkModeID])
     VALUES
           (2 -- <PersonTabN, int,>
           ,'20180101' -- <PersonDateIN, date,>
           ,NULL -- <PersonDateOut, date,>
           ,'�������' -- <PersonFirstName, varchar(50),>
           ,'��������' -- <PersonLastName, varchar(50),>
           ,1 -- <cGenderID, int,>
           ,1 -- <cMaritalStatusID, int,>
           ,'19960715' -- <PersonBirthDate, date,>
           ,1 -- <cDepartmentID, int,>
           ,1 -- <cCategID, int,>
           ,9 -- <cTitleID, int,>
           ,1 -- <cWorkModeID, int,>
		   );
INSERT INTO Viking_OLTP.[dbo].[Person]
           ([PersonTabN]
           ,[PersonDateIN]
           ,[PersonDateOut]
           ,[PersonFirstName]
           ,[PersonLastName]
           ,[cGenderID]
           ,[cMaritalStatusID]
           ,[PersonBirthDate]
           ,[cDepartmentID]
           ,[cCategID]
           ,[cTitleID]
           ,[cWorkModeID])
     VALUES
           (3 -- <PersonTabN, int,>
           ,'20180101' -- <PersonDateIN, date,>
           ,NULL -- <PersonDateOut, date,>
           ,'�����' -- <PersonFirstName, varchar(50),>
           ,'��������' -- <PersonLastName, varchar(50),>
           ,1 -- <cGenderID, int,>
           ,1 -- <cMaritalStatusID, int,>
           ,'19990308' -- <PersonBirthDate, date,>
           ,1 -- <cDepartmentID, int,>
           ,1 -- <cCategID, int,>
           ,10 -- <cTitleID, int,>
           ,1 -- <cWorkModeID, int,>
		   );
INSERT INTO Viking_OLTP.[dbo].[Person]
           ([PersonTabN]
           ,[PersonDateIN]
           ,[PersonDateOut]
           ,[PersonFirstName]
           ,[PersonLastName]
           ,[cGenderID]
           ,[cMaritalStatusID]
           ,[PersonBirthDate]
           ,[cDepartmentID]
           ,[cCategID]
           ,[cTitleID]
           ,[cWorkModeID])
     VALUES
           (4 -- <PersonTabN, int,>
           ,'20180101' -- <PersonDateIN, date,>
           ,NULL -- <PersonDateOut, date,>
           ,'���������' -- <PersonFirstName, varchar(50),>
           ,'����������' -- <PersonLastName, varchar(50),>
           ,2 -- <cGenderID, int,>
           ,2 -- <cMaritalStatusID, int,>
           ,'19990308' -- <PersonBirthDate, date,>
           ,1 -- <cDepartmentID, int,>
           ,1 -- <cCategID, int,>
           ,11 -- <cTitleID, int,>
           ,1 -- <cWorkModeID, int,>
		   );
INSERT INTO Viking_OLTP.[dbo].[Person]
           ([PersonTabN]
           ,[PersonDateIN]
           ,[PersonDateOut]
           ,[PersonFirstName]
           ,[PersonLastName]
           ,[cGenderID]
           ,[cMaritalStatusID]
           ,[PersonBirthDate]
           ,[cDepartmentID]
           ,[cCategID]
           ,[cTitleID]
           ,[cWorkModeID])
     VALUES
           (5 -- <PersonTabN, int,>
           ,'20180301' -- <PersonDateIN, date,>
           ,NULL -- <PersonDateOut, date,>
           ,'����' -- <PersonFirstName, varchar(50),>
           ,'��������' -- <PersonLastName, varchar(50),>
           ,1 -- <cGenderID, int,>
           ,3 -- <cMaritalStatusID, int,>
           ,'19920401' -- <PersonBirthDate, date,>
           ,2 -- <cDepartmentID, int,>
           ,2 -- <cCategID, int,>
           ,12 -- <cTitleID, int,>
           ,1 -- <cWorkModeID, int,>
		   );
INSERT INTO Viking_OLTP.[dbo].[Person]
           ([PersonTabN]
           ,[PersonDateIN]
           ,[PersonDateOut]
           ,[PersonFirstName]
           ,[PersonLastName]
           ,[cGenderID]
           ,[cMaritalStatusID]
           ,[PersonBirthDate]
           ,[cDepartmentID]
           ,[cCategID]
           ,[cTitleID]
           ,[cWorkModeID])
     VALUES
           (6 -- <PersonTabN, int,>
           ,'20180401' -- <PersonDateIN, date,>
           ,NULL -- <PersonDateOut, date,>
           ,'�����' -- <PersonFirstName, varchar(50),>
           ,'��������' -- <PersonLastName, varchar(50),>
           ,2 -- <cGenderID, int,>
           ,4 -- <cMaritalStatusID, int,>
           ,'19901026' -- <PersonBirthDate, date,>
           ,2 -- <cDepartmentID, int,>
           ,2 -- <cCategID, int,>
           ,13 -- <cTitleID, int,>
           ,1 -- <cWorkModeID, int,>
		   );
INSERT INTO Viking_OLTP.[dbo].[Person]
           ([PersonTabN]
           ,[PersonDateIN]
           ,[PersonDateOut]
           ,[PersonFirstName]
           ,[PersonLastName]
           ,[cGenderID]
           ,[cMaritalStatusID]
           ,[PersonBirthDate]
           ,[cDepartmentID]
           ,[cCategID]
           ,[cTitleID]
           ,[cWorkModeID])
     VALUES
           (7 -- <PersonTabN, int,>
           ,'20180401' -- <PersonDateIN, date,>
           ,NULL -- <PersonDateOut, date,>
           ,'����' -- <PersonFirstName, varchar(50),>
           ,'������' -- <PersonLastName, varchar(50),>
           ,1 -- <cGenderID, int,>
           ,3 -- <cMaritalStatusID, int,>
           ,'19860626' -- <PersonBirthDate, date,>
           ,2 -- <cDepartmentID, int,>
           ,2 -- <cCategID, int,>
           ,14 -- <cTitleID, int,>
           ,1 -- <cWorkModeID, int,>
		   );
INSERT INTO Viking_OLTP.[dbo].[Person]
           ([PersonTabN]
           ,[PersonDateIN]
           ,[PersonDateOut]
           ,[PersonFirstName]
           ,[PersonLastName]
           ,[cGenderID]
           ,[cMaritalStatusID]
           ,[PersonBirthDate]
           ,[cDepartmentID]
           ,[cCategID]
           ,[cTitleID]
           ,[cWorkModeID])
     VALUES
           (8 -- <PersonTabN, int,>
           ,'20180101' -- <PersonDateIN, date,>
           ,NULL -- <PersonDateOut, date,>
           ,'�����' -- <PersonFirstName, varchar(50),>
           ,'��������' -- <PersonLastName, varchar(50),>
           ,1 -- <cGenderID, int,>
           ,3 -- <cMaritalStatusID, int,>
           ,'19820101' -- <PersonBirthDate, date,>
           ,3 -- <cDepartmentID, int,>
           ,2 -- <cCategID, int,>
           ,16 -- <cTitleID, int,>
           ,1 -- <cWorkModeID, int,>
		   );
INSERT INTO Viking_OLTP.[dbo].[Person]
           ([PersonTabN]
           ,[PersonDateIN]
           ,[PersonDateOut]
           ,[PersonFirstName]
           ,[PersonLastName]
           ,[cGenderID]
           ,[cMaritalStatusID]
           ,[PersonBirthDate]
           ,[cDepartmentID]
           ,[cCategID]
           ,[cTitleID]
           ,[cWorkModeID])
     VALUES
           (9 -- <PersonTabN, int,>
           ,'20180101' -- <PersonDateIN, date,>
           ,NULL -- <PersonDateOut, date,>
           ,'����' -- <PersonFirstName, varchar(50),>
           ,'���������' -- <PersonLastName, varchar(50),>
           ,1 -- <cGenderID, int,>
           ,1 -- <cMaritalStatusID, int,>
           ,'19980810' -- <PersonBirthDate, date,>
           ,3 -- <cDepartmentID, int,>
           ,2 -- <cCategID, int,>
           ,17 -- <cTitleID, int,>
           ,1 -- <cWorkModeID, int,>
		   );
INSERT INTO Viking_OLTP.[dbo].[Person]
           ([PersonTabN]
           ,[PersonDateIN]
           ,[PersonDateOut]
           ,[PersonFirstName]
           ,[PersonLastName]
           ,[cGenderID]
           ,[cMaritalStatusID]
           ,[PersonBirthDate]
           ,[cDepartmentID]
           ,[cCategID]
           ,[cTitleID]
           ,[cWorkModeID])
     VALUES
           (10 -- <PersonTabN, int,>
           ,'20180201' -- <PersonDateIN, date,>
           ,NULL -- <PersonDateOut, date,>
           ,'�����' -- <PersonFirstName, varchar(50),>
           ,'������' -- <PersonLastName, varchar(50),>
           ,2 -- <cGenderID, int,>
           ,4 -- <cMaritalStatusID, int,>
           ,'19970710' -- <PersonBirthDate, date,>
           ,3 -- <cDepartmentID, int,>
           ,2 -- <cCategID, int,>
           ,18 -- <cTitleID, int,>
           ,1 -- <cWorkModeID, int,>
		   );
INSERT INTO Viking_OLTP.[dbo].[Person]
           ([PersonTabN]
           ,[PersonDateIN]
           ,[PersonDateOut]
           ,[PersonFirstName]
           ,[PersonLastName]
           ,[cGenderID]
           ,[cMaritalStatusID]
           ,[PersonBirthDate]
           ,[cDepartmentID]
           ,[cCategID]
           ,[cTitleID]
           ,[cWorkModeID])
     VALUES
           (11 -- <PersonTabN, int,>
           ,'20180101' -- <PersonDateIN, date,>
           ,NULL -- <PersonDateOut, date,>
           ,'������' -- <PersonFirstName, varchar(50),>
           ,'�������' -- <PersonLastName, varchar(50),>
           ,2 -- <cGenderID, int,>
           ,4 -- <cMaritalStatusID, int,>
           ,'19930512' -- <PersonBirthDate, date,>
           ,4 -- <cDepartmentID, int,>
           ,2 -- <cCategID, int,>
           ,19 -- <cTitleID, int,>
           ,1 -- <cWorkModeID, int,>
		   );
INSERT INTO Viking_OLTP.[dbo].[Person]
           ([PersonTabN]
           ,[PersonDateIN]
           ,[PersonDateOut]
           ,[PersonFirstName]
           ,[PersonLastName]
           ,[cGenderID]
           ,[cMaritalStatusID]
           ,[PersonBirthDate]
           ,[cDepartmentID]
           ,[cCategID]
           ,[cTitleID]
           ,[cWorkModeID])
     VALUES
           (12 -- <PersonTabN, int,>
           ,'20180101' -- <PersonDateIN, date,>
           ,NULL -- <PersonDateOut, date,>
           ,'����' -- <PersonFirstName, varchar(50),>
           ,'�����' -- <PersonLastName, varchar(50),>
           ,2 -- <cGenderID, int,>
           ,6 -- <cMaritalStatusID, int,>
           ,'19650924' -- <PersonBirthDate, date,>
           ,4 -- <cDepartmentID, int,>
           ,2 -- <cCategID, int,>
           ,20 -- <cTitleID, int,>
           ,1 -- <cWorkModeID, int,>
		   );
-- select * from Viking_OLTP.[dbo].[Person]
/*
select * from Viking_OLTP.[dbo].Department d
SELECT *
FROM Viking_OLTP.[dbo].[Person] p
LEFT JOIN Viking_OLTP.[dbo].Title t ON p.cTitleID = t.TitleID
*/
UPDATE dbo.Department SET dbo.Department.cDepartmentManagerID = 1 WHERE dbo.Department.DepartmentID = 1
UPDATE dbo.Department SET dbo.Department.cDepartmentManagerID = 4 WHERE dbo.Department.DepartmentID = 2
UPDATE dbo.Department SET dbo.Department.cDepartmentManagerID = 8 WHERE dbo.Department.DepartmentID = 3

