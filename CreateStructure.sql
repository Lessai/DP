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
INSERT INTO Viking_OLTP.dbo.Categ VALUES ('Руководители'), ('Специалисты'), ('Служащие'), ('Обслуживающий персонал')
-- SELECT * FROM Viking_OLTP.dbo.Categ


INSERT INTO Viking_OLTP.dbo.Title VALUES 
 (1001, 'Директор')
,(1002, 'Заместитель директора по производственным вопросам')
,(1003, 'Заместитель директора по коммерческим вопросам')
,(1004, 'Главный бухгалтер')
,(2001, 'Заместитель главного бухгалтера')
,(2002, 'Бухгалтер 1 категории')
,(2003, 'Бухгалтер 2 категории')
,(2004, 'Специалист по операциям с банком')
,(3001, 'Начальник отдела кадров')
,(3002, 'Специалист по работе с персоналом 1 категории')
,(3003, 'Специалист по работе с персоналом 2 категории')
,(4001, 'Специалист по делопроизводству')
,(4002, 'Специалист по работе с персоналом (HR)')
,(5000, 'Руководитель отдела разработки ПО')
,(5001, 'Програмист-разработчик ПО 1 категории')
,(5002, 'Програмист-разработчик ПО 2 категории')
,(5003, 'Програмист-разработчик ПО 3 категории')
,(5004, 'Програмист-разработчик ПО 4 категории')
,(6000, 'Руководитель отдела обеспечения качества ПО')
,(6001, 'Тестировщик ПО 1 категории')
,(6002, 'Тестировщик ПО 2 категории')
,(6003, 'Тестировщик ПО 3 категории')
,(6004, 'Тестировщик ПО 4 категории')
,(7000, 'Начальник отдела технической поддержки')
,(7001, 'Специалист ОТП 1 категории')
,(7002, 'Специалист ОТП 2 категории')
,(7003, 'Специалист ОТП 3 категории')
,(8000, 'Начальник отдела системной интеграции и связи')
,(8001, 'Специалист ОСИиС 1 категории')
,(8002, 'Специалист ОСИиС 2 категории')
,(8003, 'Специалист ОСИиС 3 категории')
,(9000, 'Начальник отдела охраны')
,(9001, 'Охранник')
-- select * from Viking_OLTP.dbo.Title


INSERT INTO Viking_OLTP.dbo.Gender VALUES
 ('М', 'мужчина')
,('Ж', 'женщина')

INSERT INTO Viking_OLTP.dbo.MaritalStatus VALUES
 (1,'холост')
,(2,'не замужем')
,(3,'женат')
,(4,'замужем')
,(5,'разведен(а)')
,(6,'вдовец')
,(7,'вдова')

INSERT INTO Viking_OLTP.dbo.WorkMode VALUES
 (1, '5-дневная рабочая неделя 40 ч.')
,(2, '6-дневная рабочая неделя 36 ч.')
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
 ('область', 'обл.')
,('город', 'г.')
,('поселок городского типа', 'пос.')
,('деревня', 'дер.')
,('село', 'с.')
,('хутор', 'хут.')
,('проспект', 'просп.')
,('улица', 'ул.')
,('бульвар', 'бв.')

INSERT INTO Viking_OLTP.dbo.LocalRegion VALUES
 (1,'Брестская', 1,1)
,(2,'Витебская', 1,1)
,(3,'Гомельская', 1,1)
,(4,'Гродненская', 1,1)
,(5,'Минская', 1,1)
,(6,'Могилевская', 1,1)
,(7,'Минск', 1,'')

INSERT INTO Viking_OLTP.dbo.City VALUES
 (16, 'Брест', 1,2)
,(21, 'Витебск', 2,2)
,(23, 'Гомель', 3,2)
,(15, 'Гродно', 4,2)
,(22, 'Могилев', 6,2)
,(17, 'Минск', 7,2)

INSERT INTO Viking_OLTP.dbo.Street VALUES
 ('К. Калиновского',6,8)
,('Громова',6,8)
,('Победителей',6,7)
,('Независимости',6,7)

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
 (1000, 'Руководство','', 1)
,(2000, 'Бухгалтерия','', 1)
,(3000, 'Отдел кадров','', 1)
,(4000, 'Отдел по работе с персоналом','', 2)
,(5000, 'Отдел разработки программного обеспечения','', 3)
,(6000, 'Отдел обеспечения качества ПО','', 3)
,(7000, 'Отдел технической поддержки','', 4)
,(8000, 'Отдел системной интеграции и связи','', 4)
,(9000, 'Отдел охраны','', 1)
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
           ,'Виктория' -- <PersonFirstName, varchar(50),>
           ,'Кравченко' -- <PersonLastName, varchar(50),>
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
           ,'Георгий' -- <PersonFirstName, varchar(50),>
           ,'Чиченков' -- <PersonLastName, varchar(50),>
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
           ,'Антон' -- <PersonFirstName, varchar(50),>
           ,'Лешкович' -- <PersonLastName, varchar(50),>
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
           ,'Анастасия' -- <PersonFirstName, varchar(50),>
           ,'Сподобаева' -- <PersonLastName, varchar(50),>
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
           ,'Атиш' -- <PersonFirstName, varchar(50),>
           ,'Виллабах' -- <PersonLastName, varchar(50),>
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
           ,'Ольга' -- <PersonFirstName, varchar(50),>
           ,'Сцыгайла' -- <PersonLastName, varchar(50),>
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
           ,'Иван' -- <PersonFirstName, varchar(50),>
           ,'Буркат' -- <PersonLastName, varchar(50),>
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
           ,'Денис' -- <PersonFirstName, varchar(50),>
           ,'Авмочкин' -- <PersonLastName, varchar(50),>
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
           ,'Иван' -- <PersonFirstName, varchar(50),>
           ,'Катамаран' -- <PersonLastName, varchar(50),>
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
           ,'Мария' -- <PersonFirstName, varchar(50),>
           ,'Лузова' -- <PersonLastName, varchar(50),>
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
           ,'Лариса' -- <PersonFirstName, varchar(50),>
           ,'Крысова' -- <PersonLastName, varchar(50),>
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
           ,'Иван' -- <PersonFirstName, varchar(50),>
           ,'Дулин' -- <PersonLastName, varchar(50),>
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

