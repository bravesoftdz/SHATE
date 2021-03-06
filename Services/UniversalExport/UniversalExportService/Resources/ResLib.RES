        ��  ��                  V   <   T E X T   S Q L M A G I C W O R D       0         EXEC [sp_setapprole] '$ndo$shadow', 'FF5EC4E40F67BD4EDF3D04F8B84364DAD0', 'none', 0, 0  �  X   T E X T   S Q L S E L E C T _ C L I E N T _ D I S C O U N T S       0         SELECT ##IDCLIENT##  as IDClient
       ,CASE Code 
			WHEN '��������' THEN 1
			WHEN '��' THEN 2 
			ELSE 0 
        END * ISNULL(SIGN(LEN("Item Group Code")),0)  as IDTYPE
        ,"Item Group Code" as ItemsGroupCode,  "Line Discount %" 
		,  1-SQUARE(SIGN("Special Terms"-5)) as "Force", 
		"Customer No_", "Cust_ Price Group Code","Type", "Code", "Currency Code", "Starting Date", 
		/*,[Line Discount %],*/"Minimum Quantity","Ending Date","Unit of Measure Code","Variant Code","Item No_ 2" ,"Item Search Description" ,"Item Group Code"
		,"Unit Price" ,"Calc_ Date","Location Code" ,"Agreement No_","Special Terms" ,"Allow Line Disc_" , "Allow Invoice Disc_"
FROM "##DATABASE##"."dbo"."##FIRM##$Cust_ Price Group Discount" 
WHERE  "Type" = 2  AND 
       (
       	[Starting Date]<GETDATE() AND (GETDATE()<[Ending Date] OR [Ending Date]<0)
       ) AND ("Line Discount %" IS NOT NULL) AND "Customer No_"='##CLIENTNAV##'
ORDER BY IDTYPE DESC
   T   T E X T   S Q L I N S E R T D I S C O U N T S V A L U E S       0         INSERT INTO [DISCOUNTS] ([ID_CLIENT], [ID_TYPE], [ItemsGroupCode], [VAL], [Force], [Customer No.], [Cust. Price Group Code],[Type], [Code], [Currency Code], [Starting Date] 
,[Minimum Quantity],[Ending Date],[Unit of Measure Code],[Variant Code],[Item No. 2] ,[Item Search Description] ,[Item Group Code]
 ,[Unit Price] ,[Calc. Date],[Location Code] ,[Agreement No.],[Special Terms] ,[Allow Line Disc.] , [Allow Invoice Disc.])
     VALUES (:ID_CLIENT, :ID_TYPE,:ItemsGroupCode, :VAL, :Force, :CustomerNo, :CustPriceGroupCode,:Type, :Code, :CurrencyCode, :StartingDate 
,:MinimumQuantity,:EndingDate,:UnitofMeasureCode,:VariantCode,:ItemNo2 ,:ItemSearchDescription ,:ItemGroupCode
 ,:UnitPrice,:CalcDate,:LocationCode,:AgreementNo,:SpecialTerms,:AllowLineDisc, :AllowInvoiceDisc)
    D   T E X T   S Q L Q U E R Y M A R K Z E R O       0         UPDATE [Exports]
   SET 
      [LAST_EXPORT] = ISNULL(CASE weekdays & POWER(2,(DATEPART(dw, GETDATE())-(1-@@DATEFIRST)) % 7) WHEN  1-SIGN(weekdays) THEN [LAST_EXPORT] ELSE 0 END,0)
	,[NEXT_EXPORT] = CASE WHEN GETDATE()>[NEXT_EXPORT] THEN DATEADD(mi,[INTERVAL],[NEXT_EXPORT])   ELSE [NEXT_EXPORT] END    
WHERE GETDATE()>[NEXT_EXPORT] 
		OR (
			 SIGN([INTERVAL])*DATEDIFF(mi,[LAST_EXPORT],GETDATE())>[INTERVAL]
			 AND ISNULL(weekdays & POWER(2,(DATEPART(dw, GETDATE())-(1-@@DATEFIRST)) % 7),0)=0
		   )
      D   T E X T   S Q L Q U E R Y M A R K T I M E       0         UPDATE [EXPORTS] 
SET 	[Last_Export]=GetDate()
	   ,[NEXT_EXPORT]=	CASE 
							WHEN NEXT_EXPORT<GETDATE() THEN  DATEADD(mi,[INTERVAL]*(DATEDIFF(mi, NEXT_EXPORT, GETDATE())/Interval),[NEXT_EXPORT]) 
							ELSE NEXT_EXPORT 
						END 
WHERE [ID] = 
D   P   T E X T   S Q L S E L E C T E X P O R T C L I E N T S       0         SELECT DISTINCT [ID_Client]
  FROM [Exports]
WHERE [LAST_EXPORT]=0;  L   T E X T   S Q L Q U E R Y S E L E C T B Y Z E R O       0         SELECT Exp.[ID]
      ,Exp.[ID_Client]
      ,Exp.[ID_WH]
      ,Exp.[CY]
      ,Exp.[NAV_Client]
      ,Exp.[INTERVAL]
      ,Exp.[LAST_EXPORT]
      ,Exp.[FILE_NAME]
      ,Exp.[ID_TEMPL]
      ,Exp.[EMAILFLAG]
      ,Exp.[EMAIL]
      ,Exp.[EMAILSUBJ]
      ,Exp.[EMAILBODY]	
	  
	,COALESCE(Cl.[pricegroup],Cl.[DOM])
 	,Exp.[EMAILZIP]
/*,DATEDIFF(mi,[LAST_EXPORT],GETDATE()) as midiff*/
  FROM [Clients] Cl LEFT JOIN [Exports] Exp   ON Exp.[ID_Client]=Cl.[ID] 
WHERE [LAST_EXPORT]=0 AND ISNULL([blocked],0)<>1
ORDER BY COALESCE(priority, Exp.ID) ASC �   <   T E X T   Q U A N T S U P D A T E       0         UPDATE [##DATABASENAME##].[dbo].[##TABLENAME##]
   SET [ID_WH] = -[ID_WH]  
		[Adds] = -##PIRCELISTNO##
 WHERE [ID_WH] = -##WH_ID##  �   <   T E X T   E M A I L S U P D A T E       0         UPDATE [Exports] 
   SET [email] =
	(select [e_mail] from [Clients]
where [Clients].[ID]=[Exports].[ID_Client] )
WHERE [Exports].[emailflag]=1 AND LTrim([Exports].[email])=''    D   T E X T   S Q L P R I C E R E Q U E S T         0         DECLARE @EXPID AS INT
SET @EXPID = ##EXP_ID##

DECLARE @CLID as INT
SET @CLID = ##CLIENT_ID##
DECLARE @CLPRGR AS INT
SET @CLPRGR = ##CLPRGR##
 
DECLARE @DiscPrGrCode AS CHAR(10)
SET @DiscPrGrCode = ISNULL((select SalesCode from PriceGroups where ID = SIGN(ABS((select Clients.Dom from Clients where ID=ABS(@CLID))-@CLPRGR))*@CLPRGR),'')


DECLARE @WHID AS INT
SET @WHID = ##IDWH##
DECLARE @WHDOMAIN AS INT
SET @WHDOMAIN = (select [Domain] from Warehouses where ID = @WHID)
DECLARE @WHLOC AS CHAR(20)
SET @WHLOC = COALESCE((SELECT wh.Code 
					  FROM Warehouses wh 
					  WHERE wh.ID IN (@WHID,(SELECT pl.WarehouseNo  
					                         FROM PriceLists pl 
					                         WHERE pl.ID=-@WHID)
											 )
					  ), ''																   
					 )

DECLARE @CY as CHAR(3)
SET @CY = '##CYCODE##'
					 
DECLARE @FILTER AS CHAR(20)
DECLARE @LINEFILTER AS CHAR(20)
DECLARE @TMFILTER AS SMALLINT
DECLARE @TLFILTER AS SMALLINT
SET @FILTER = '##ABROADFILTER##'
SET @LINEFILTER = '##ABROADLINEFILTER##'
SET @TMFILTER = (SELECT ISNULL(TMFilter,0) FROM EXPORTS WHERE ID = @EXPID)
SET @TLFILTER = (SELECT ISNULL(TLFilter,0) FROM EXPORTS WHERE ID = @EXPID)

;WITH 
  FIE AS (
			SELECT TGF.ExpID, TGF.ID_TYPE
				,CASE HH.TradeGroup 
					WHEN '' THEN TGF.ItemsGroupCode
					ELSE HH.TradeGroup
				END AS TrGr
			FROM [TradeGroupsFilters] TGF LEFT JOIN IERARCHY HH ON  TGF.ItemsGroupCode=HH.Tag AND TGF.ID_TYPE=HH.ID_GroupType
			WHERE TGF.ExpID =@EXPID   	
  	),
  
  BLL AS (SELECT Name FROM BlackList WHERE Tag = @Filter AND (ISNULL([Domain],0) = SIGN(ISNULL([Domain],0)) * @WHDOMAIN) AND @CLPRGR<>@WHDOMAIN),  
  BLLL AS (SELECT Name FROM BlackList WHERE Tag = @LineFilter AND (ISNULL([Domain],0) = SIGN(ISNULL([Domain],0)) * @WHDOMAIN) AND @CLPRGR<>@WHDOMAIN),

  QF AS (
  	SELECT Qq.*	
  	FROM Quants Qq 
  	WHERE  	 
		(Qq.Item_Brand NOT IN ( SELECT NAME FROM BLL ) AND Qq.Line NOT IN ( SELECT NAME FROM BLLL )	) AND
		(
		CASE ABS(@TLFILTER) 
			WHEN 1 
				THEN 1-ISNULL((SELECT TOP 1  (CASE FIE.TrGr WHEN Qq.Line THEN SIGN(1-@TLFILTER) ELSE SIGN(1+@TLFILTER) END)
							FROM FIE		
							WHERE FIE.ID_TYPE = 1 
							ORDER BY (CASE FIE.TrGr WHEN Qq.Line THEN 0 ELSE 1 END) ASC),0)						
			ELSE 1	 
		END		 
		*
		CASE ABS(@TMFILTER)
			WHEN 1 
				THEN 1-ISNULL((SELECT TOP 1  (CASE FIE.TrGr WHEN Qq.Brand THEN SIGN(1-@TMFILTER) ELSE SIGN(1+@TMFILTER) END)
							FROM FIE		
							WHERE FIE.ID_TYPE = 2 
							ORDER BY (CASE FIE.TrGr WHEN Qq.Brand THEN 0 ELSE 1 END) ASC),0)							
			ELSE 1	 
		END	
		<> 0  
		) AND 
  	 (Qq.[CY] = @CY AND PriceGroupDomain = @CLPRGR  AND Qq.[ID_WH] = @WHID AND Adds=0 AND Qq.price>0.0) OR Adds =-@WHID 
  	),
  DIE AS ( 
				SELECT DD.ID_CLIENT
						,CASE ISNULL(HH.TradeGroup,'') WHEN '' THEN DD.ItemsGroupCode ELSE HH.TradeGroup END AS TrGr
						,DD.[Location Code]
						,DD.[Force]
						,DD.VAL 
				FROM [DISCOUNTS] DD 
					LEFT JOIN IERARCHY HH 
					ON  DD.ItemsGroupCode = HH.Tag
				WHERE ID_CLIENT = @CLID	AND
					DD.[Cust. Price Group Code] IN (@DiscPrGrCode,'') AND
					DD.[Location Code] IN (@WHLOC, '')					
),
  Qdsc AS (
  	SELECT ROW_NUMBER() OVER (PARTITION BY QF.ID_Item ORDER BY DIE.[Location Code] DESC, DIE.[Force] DESC, DIE.VAL DESC) AS OrderNo
	--, DIE.Val AS Discount
	,(1-ISNULL((1-QF.[sale]),0)*DIE.VAL*0.01) as DscCoeff
	,ISNULL( QF.Cost / QF.Price , 0) as CostRatio
	, QF.*  	
  	FROM QF 
  		JOIN DIE
  			ON DIE.TrGr IN (QF.Brand, QF.Line, '')  		 	 
  ),
  Qq as (
    SELECT  Qdsc.Price*DscCoeff as DiscountPrice  --*Qdsc.ExternalSaleCoeff    
      ,CASE 
        WHEN SIGN(ABS(@CLPRGR - @WHDOMAIN)) * Qdsc.CostRatio > Qdsc.DscCoeff THEN /*1.05 **/ Qdsc.CostRatio  
        ELSE DscCoeff 
      END  as PriceCoeff
	  ,Qdsc.*
    FROM Qdsc
    WHERE Qdsc.OrderNo = 1     
  )  
  
  SELECT *,  ROUND(Qq.Price*PriceCoeff,2) DscPrice 
  FROM Qq
   �  H   T E X T   S Q L S E L E C T I T E M L I N K S       0         SELECT  LINKS.*,  1-"Allow Line Disc_" as Action /*,1-SQUARE(SIGN(SALESPRICE."Special Terms"-1))   SALESPRICE."Starting Date" as Termin*/ FROM
(
SELECT   TM."Item No_" as ItemID, TM."Item Group Code" as Brand, TL."Item Group Code" as Line  
FROM "##DATABASE##"."dbo"."##FIRM##$Item Item Group" TM, "##DATABASE##"."dbo"."##FIRM##$Item Item Group" TL   
WHERE  TM."Item No_"=TL."Item No_" and (TM."Item Group Type Code" = '��' AND TL."Item Group Type Code" = '��������' )
) LINKS
LEFT JOIN 
( SELECT "Item No_", "Special Terms", "Allow Line Disc_", "Starting Date"
     FROM "##DATABASE##"."dbo"."##FIRM##$Sales Price" 
  WHERE "Sales Code" = '���' /*AND [Currency Code] = ''*/  AND "Starting Date"<=GETDATE() and ("Ending Date">=GETDATE() or "Ending Date" <= "Starting Date")
)SALESPRICE
ON   SALESPRICE."Item No_"=LINKS.ItemID 
WHERE SALESPRICE."Starting Date" = (
  SELECT MAX("Starting Date") FROM "##DATABASE##"."dbo"."##FIRM##$Sales Price" WHERE "Item No_" = LINKS.ItemID AND "Sales Code" = '���'  /*AND [Currency Code] = ''*/  
  AND "Starting Date"<=GETDATE() and ("Ending Date">=GETDATE() or "Ending Date" <= "Starting Date" )
) 
ORDER BY LINKS.ItemID  f   @   T E X T   S Q L S E T B L O C K I N G       0         UPDATE [Exports]
   SET 
      [blocked] = 1 - blocked     
WHERE [INTERVAL]>0 AND [blocked] = 0 
  x   D   T E X T   S Q L R E S E T B L O C K I N G       0         UPDATE [Exports]
   SET  
      [blocked] = 1 - [blocked]      
 WHERE [INTERVAL] >0 AND [blocked] = 1 AND [ID_WH] = �  L   T E X T   S Q L Q U A N T S A C K N O W L E G E         0         UPDATE [Quants]
   SET 
	[ID_WH] = -[ID_WH]
	,[Adds] = COALESCE([Adds],##UNLOADID##)  
	,[PriceGroupDomain] = COALESCE([PriceGroupDomain],  ##PRCGRP##)	
	,[Brand] = COALESCE( [Brand], (select top 1 Items.[Brand] from Items where Items.[ID_Item] = [Quants].ID_Item AND [Items].DomainNo = ##DOMAIN##) )
	,[Line] =  COALESCE( [Line], (select top 1 Items.[Line] from Items where Items.[ID_Item] = [Quants].ID_Item AND [Items].DomainNo = ##DOMAIN##) )
	,[NQNT] = Case when QNTY<10 then cast(QNTY as char) when QNTY<50 then '10>' when QNTY<100 then '50>' else '100>'  End
	,[NQN0] = Case when QNTY0<10 then cast(QNTY0 as char) when QNTY0<50 then '10>' when QNTY0<100 then '50>' else '100>'  End 	
 WHERE [ID_WH] = -##WH_ID## 0  d   T E X T   S Q L D E L E T E Q U A N T S I N S E R T F R O M S E L E C T         0         DECLARE @PRICELISTCY as char(3)
		SET @PRICELISTCY = '##CYCODE##'

DECLARE @IDWH as INT
		SET @IDWH = ##IDWH##

DECLARE @PRICEGROUP as INT
		SET @PRICEGROUP = ##PRCGRP##

DECLARE @DOMAIN as INT
		SET @DOMAIN = ##DOMAIN##		
		
--DECLARE @PRCGRP	as INT	
--		SET @PRCGRP = @IDWH*SIGN(ABS(@IDWH-@PRICEGROUP))
SET NOCOUNT ON;
SET XACT_ABORT ON;
DELETE FROM QUANTS WHERE  [ID_WH]=@IDWH AND [PriceGroupDomain]=@PRICEGROUP  AND [CY]=@PRICELISTCY AND [ADDS] = 0
		
INSERT INTO [Quants]
           ([ID_WH]
           ,[PriceGroupDomain]
           ,[ID_Item]
           ,[QNTY0]
		   ,[QNTY]
		   ,[NQN0]
		   ,[NQNT]
           ,[Price]
		   ,[Cost]
           ,[Item_Name]
           ,[Brand]
           ,[Line]
           ,[Adds]
           ,[Code]
           ,[Item_Brand]
           ,[Shipment]
           ,[Unit]
           ,[length]
           ,[height]
           ,[width]
           ,[weight]
           ,[sale]
           ,[Appl]
           ,[minimum]
           ,[cy]
           ,[Code_Brand])
     SELECT
           @IDWH--<ID_WH, int,>
           ,@PRICEGROUP--<PriceGroupDomain, int,>
           ,ITs.[ID_Item]--<ID_Item, char(20),>
           ,[stock] AS 'QNTY0'		   
		   ,[_stock] AS 'QNTY'--	<QNT, int,>
		   ,[qnt]  AS 'NQN0'
		   ,[_qnt] AS 'NQNT'
           ,Round([price]*(select [rate] from Currencies where [cy]=@PRICELISTCY)/(select [rate] from Currencies where [cy]=Prs.cy),2) AS 'Price'--<Price, money,>
		   ,Round([cost]*(select [rate] from Currencies where [cy]=@PRICELISTCY),2) AS 'Cost'
           ,RTrim([Item_Description]) +' '+ [Item_Appl] AS 'Item_Name'--<Item_Name, nchar(255),>
           ,Brand--NULL--<, nchar(20),>
           ,Line --NULL<, char(20),>
           ,0--<Adds, int,>
           ,[Item_Code]--<Code, char(255),>
           ,[Item_Brand]--<Item_Brand, char(20),>
           ,[Shipment] --,<Shipment, int,>
           ,ITs.[Unit]--<Unit, char(10),>
           ,[length]--<length, float,>
           ,[height]--<height, float,>
           ,[width]--<width, float,>
           ,[weight]--<weight, float,>
           ,[sale]--<sale, int,>
           ,[Item_Appl] AS 'appl'--<Appl, nchar(255),>
           ,[MinQ] AS 'minimum'--<minimum, int,>
           ,@PRICELISTCY AS 'cy'--<cy, char(3),>
           ,RTrim([Item_Code])+'_'+[Item_Brand] AS 'code_brand'--<Code_Brand, char(255),>
    FROM [Items] ITs
		INNER JOIN [Stocks] STs ON ITs.ID_Item=Sts.ID_Item AND Sts.ID_WH=@IDWH AND Sts._stock>0 
		LEFT JOIN [Prices] Prs ON ITs.ID_Item=Prs.ID_Item AND Prs.DomainNo=ITs.DomainNo AND (ITs.Unit=Prs.Unit OR Prs.Unit = '') AND Prs.Price>0
		LEFT JOIN [Costs] Cs ON Cs.ID_Item = Prs.ID_Item AND Cs.DomainNo = Prs.DomainNo
	WHERE /*ITs.assortment>0 AND*/ Prs.price>0 AND PRs.ID_PriceGroup=@PRICEGROUP*SIGN(ABS(@DOMAIN-@PRICEGROUP)) AND Its.DomainNo=@DOMAIN 