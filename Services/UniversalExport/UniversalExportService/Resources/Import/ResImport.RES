        ��  ��                  u   `   T E X T   S Q L S E L E C T D A T A V E R S I O N T H R E S H O L D         0         SELECT Threshold 
FROM DataVersions
WHERE Tag = '##Tag##'
	/*##InfoCondition##*/
	AND DomainNo = ##DomainID##
		   �   `   T E X T   S Q L U P D A T E D A T A V E R S I O N T H R E S H O L D         0         UPDATE DataVersions
	SET Threshold = ##THRSHLDValue##
WHERE Tag = '##Tag##'
	/*##InfoCondition##*/
	AND DomainNo = ##DomainID##
		 P   H   T E X T   S Q L S E L E C T T I M E S T A M P       0         SELECT CAST(MAX(TIMESTAMP)as BIGINT) 
FROM  [##Firm##$##Table##]
/*##WHERE##*/�   \   T E X T   S Q L S E L E C T S A L E S P R I C E T I M E S T A M P       0         SELECT COALESCE(MIN(ts),0) FROM
(
	SELECT CAST(MIN(TIMESTAMP) AS BIGINT)-1	as ts FROM [##Firm##$Sales Price] WHERE "Starting Date">GETDATE()
	UNION 
	SELECT CAST(MAX(TIMESTAMP)as BIGINT) AS ts FROM [##Firm##$Sales Price]			
) SalesPriceTimestamps h  D   T E X T   S Q L L O A D I E R A R C H Y         0         SELECT  
		##IDD## AS IDD,
		CASE ig0.[Item Group Type Code] 
			WHEN '��������' THEN 1 
			WHEN '��' THEN 2 
			ELSE 0 
		END AS IDGroupType,
		
		ig0.nodeid AS node0

        ,ig0.Code AS g0		
		,ig0.[level] AS level0
        
        ,ig1.Code AS g1
		,ig1.[level] AS level1        
        
        ,ig2.Code AS g2
		,ig2.[level] AS level2       
         
FROM [##Firm##$Item Group] as ig0
 left join [##Firm##$Item Group] as ig1 on ig1.[parentid] = ig0.[nodeid]
 left join [##Firm##$Item Group] as ig2 on ig2.[parentid] = ig1.[nodeid]
WHERE ig0.[Item Group Type Code] IN ('��','��������')�  H   T E X T   S Q L U P D A T E I E R A R C H Y         0         DECLARE @Domain AS INT
SET @Domain = ##Domain##

 DELETE FROM Ierarchy WHERE ID <=##IDTHRSHLD##  AND Domain=@Domain 
 Update Ierarchy 
	Set [TradeGroup] = Case [level0] 
							when 0 then g2 
							when 1 then g1 
							when 2 then g2 
						End 
       ,[Tag] =  Case [TradeGroup] 
						when g0 then [Tag] 
						else  g0 
					End 
       Where ID >##IDTHRSHLD## AND Domain = @Domain �  <   T E X T   S Q L L O A D I T E M S       0         SELECT  
 It.[No_] as ID_Item
,##DOMAIN## as DomainNo
, tm.[Trade Mark Name] as Item_Brand
, it.[No_ 2] as Item_Code

,ITM."Item Group Code" as Brand
,ITL."Item Group Code" as Line

 , it.[Description] as Description            
 ,it.[Item Comment] as Item_appl
, it.[Sales Order Multiple] as Shipment 
, UM.[CODE]  as 'UNIT'
, UM.LENGTH as 'length'
, UM.HEIGHT AS 'HEIGHT'
, UM.WIDTH AS 'WIDTH'
, UM.WEIGHT AS 'WEIGHT'  

,CASE ITA.[Item Group Code] WHEN '��' THEN 1 ELSE 0 END AS 'assortment' 

 FROM  [##Firm##$Item]  It
left join [tm] as tm on it.[TM Code] = tm.[Trade Mark Code]
inner join [##Firm##$Item Item Group] as ITA on ITA."Item No_" = it.[No_] and ITA."Item Group Type Code" = '������' /*AND ITA.[Item Group Code] = '��'*/ 
left join [##Firm##$Item Item Group] as ITM on ITM."Item No_" = it.[No_] and ITM."Item Group Type Code" = '��'
left join [##Firm##$Item Item Group] as ITL on ITL."Item No_" = it.[No_] and ITL."Item Group Type Code" = '��������'
LEFT JOIN [##Firm##$Item Unit of Measure] as UM on UM."Item No_"=it.[No_] and UM.[CODE]=COALESCE([Sales Unit of Measure],it.[Base Unit of Measure])
WHERE (CAST(it.[timestamp] as BIGINT)> ##THRSHLDItem##) OR (CAST(UM.[timestamp] as BIGINT)> ##THRSHLDUnitOfMeasure##) 
         OR ((CAST(ITM.[timestamp] as BIGINT)> ##THRSHLDItemGroup##) OR (CAST(ITL.[timestamp] as BIGINT)> ##THRSHLDItemGroup##) OR (CAST(ITA.[timestamp] as BIGINT)> ##THRSHLDItemGroup##) )
  O  @   T E X T   S Q L D E L E T E I T E M S       0         DECLARE @DomainNo as int
		Set @DomainNo = ##DOMAIN##
DECLARE @THRESHOLD as int
		Set @THRESHOLD = ##THRSHLD##
DELETE FROM [Items]
      WHERE ID<@THRESHOLD AND DomainNo = @DomainNo AND ID_Item IN
			(
			SELECT ID_Item
			FROM [Items]
			WHERE DomainNo = @DomainNo
			GROUP BY ID_Item, DomainNo
			HAVING count(ID)>1
			)  [  H   T E X T   S Q L L O A D C U R R E N C I E S         0         select  * from
(
select top 1 'EUR' as cy, /*[Exchange Rate Amount] */  1 as rate, -2 as typecode 
from [##Firm##$Currency Exchange Rate]
--where [Currency Code]= 'EUR' 
--ORDER BY [Starting Date] DESC   
) as EUR
UNION
select  * from
(
select top 1 'BYR' as Cy, [Exchange Rate Amount] as rate, 0 as typecode 
from [##Firm##$Currency Exchange Rate]
where [Currency Code]='BYR' 
ORDER BY [Starting Date] DESC
)  as BYR
UNION
select  * from
(
select top 1 'USD' as cy, [Exchange Rate Amount]  as rate, -2 as typecode
from [##Firm##$Currency Exchange Rate]
where [Currency Code]='USD' 
ORDER BY [Starting Date] DESC 
) as USD
UNION
select  * from
(
select top 1 'RUR' as cy, [Exchange Rate Amount] as rate, -2 as typecode 
from [##Firm##$Currency Exchange Rate]
where [Currency Code]='RUB' 
ORDER BY [Starting Date] DESC   
) as RUR �  @   T E X T   S Q L L O A D S T O C K S         0         SELECT  we.[Item No_] as Item_No, ##IDWH## as ID_WH,  we.Entry as EntryWH, re.Entry as EntryRsrv, le.Entry as EntryLdgr  
FROM 
(select [Item No_],[LOCATION CODE], sum([Qty_ (Base)]) as Entry
from [##Firm##$Warehouse Entry] --join [##Firm##$Bin Type] on [code] = [Bin Type Code] and (Ship = 1 or Pick =1)
where [LOCATION CODE] = '##WHLOCATION##' AND [Bin Type Code] IN ('������','������','������')
group by [Item No_],[LOCATION CODE]
)as we  
left join 
(select [Item No_],[LOCATION CODE], Sum([Quantity (Base)]) as Entry 
 from [##Firm##$Reservation Entry]
 where Positive = 1 and [LOCATION CODE] = '##WHLOCATION##' and  
 [Source Subtype] = 0 and [Reservation Status] =0
 group by [Item No_], [LOCATION CODE]
) as re  
on re.[Item No_] = we.[Item No_] and re.[Location Code] = we.[LOCATION CODE]
left join 
(
SELECT [Item No_], [Location Code], Surplus 
      ,CAST(sum([Remaining Quantity]) as INT)as Entry 
  FROM [##Firm##$Item Ledger Entry]
  where Positive = 1 and [Variant Code] = '' and Surplus = 1
  group by [Item No_], [Location Code], Surplus
) as le
on le.[Item No_] = we.[Item No_] and le.[Location Code] = we.[LOCATION CODE]
WHERE we.Entry>0
 �
  @   T E X T   S Q L L O A D P R I C E S         0         DECLARE @RUR AS FLOAT
DECLARE @USD AS FLOAT
DECLARE @BYR AS FLOAT

DECLARE @THRSHLD AS BIGINT
SET @THRSHLD = ##THRSHLDPrices##

DECLARE @DATESTAMP AS CHAR(10)
SET @DATESTAMP = '##DATESTAMP##'

SET @RUR = 1/##RATERUR##
SET @USD = 1/##RATEUSD##
SET @BYR = 1/##RATEBYR## 
 
SELECT ITEM_ID, ##DOMAIN## as DomainNo, ##PRGRPID## as ID_PriceGroup, UNIT, MINQ, SALE, CY, PRICE, TERMLESS 		
  FROM(
	SELECT
	  ROW_NUMBER() OVER(PARTITION BY sp.[Item No_] 
						ORDER BY 
						  CASE WHEN ("Ending Date" >= DATEADD(dd, -1,GETDATE()) OR "Ending Date" < "Starting Date") THEN 1 ELSE 0 END DESC,
						  CASE sp.[Currency Code] 
						   WHEN '' THEN 1 
						   WHEN 'RUB' THEN  @RUR 
						   WHEN 'USD' THEN  @USD 
						   WHEN 'BYR' THEN  @BYR 
						  END*sp.[Unit Price] ASC) AS alt,
	  [Item No_] AS ITEM_ID,
	  [Unit of Measure Code] AS UNIT,
	  CAST([Minimum Quantity] AS int) AS MINQ,
	  1 -[Allow Line Disc_] AS SALE,
	  CASE [Currency Code]
		WHEN '' THEN 'EUR'
		WHEN 'RUB' THEN 'RUR'
		ELSE [Currency Code]
	  END AS CY,
	  sp.[Unit Price]*CASE WHEN ("Ending Date" >= DATEADD(dd, -1,GETDATE()) OR "Ending Date" < "Starting Date") THEN 1 ELSE 0 END AS PRICE,  
	  CASE WHEN "Ending Date" < "Starting Date" THEN 1 ELSE 0 END as TERMLESS,
	  CASE WHEN  "Starting Date" > @DATESTAMP THEN 1 ELSE 0 END AS RECENT	
	FROM
	  [##Firm##$Sales Price] sp join [##Firm##$Item] as it 
		on it.[No_] = sp.[Item No_]
		AND  sp.[Minimum Quantity] <= it.[Sales Order Multiple] 
		and (sp.[Unit of Measure Code] = it.[Sales Unit of Measure]  or sp.[Unit of Measure Code] = '')
	WHERE  
	  sp."Unit Price" >0 AND
	  "Sales Code" = '##PRICEGROUP##' AND
	 "Starting Date" <= GETDATE() 
	  AND
	  ( SIGN(@THRSHLD) * CAST(sp.[timestamp] AS BIGINT)>@THRSHLD
	   OR
		"Starting Date" > @DATESTAMP
	   OR
		"Ending Date" >= DATEADD(dd, -1,GETDATE()) OR "Ending Date" < "Starting Date")) prc
WHERE prc.alt = 1 
	AND (prc.TERMLESS*(1-prc.RECENT)=0 OR EXISTS( 
												SELECT  [Item No_], MIN("Currency Code"), MAX("Currency Code"), Count("Currency Code")
												FROM
												  [##Firm##$Sales Price] 
												WHERE  prc.ITEM_ID =  [Item No_] AND
												  "Unit Price" >0 AND
												  "Sales Code" = '##PRICEGROUP##' AND
												  (
												  ("Starting Date" <= DATEADD(dd, -1,GETDATE()) AND ("Ending Date" >= DATEADD(dd, -1,GETDATE()) OR "Ending Date" < "Starting Date"))
												  OR CAST([timestamp] as BIGINT)>@THRSHLD 
												  )
												GROUP BY [Item No_]
												HAVING MIN("Currency Code")<>MAX("Currency Code") OR CAST(MAX([timestamp])as BIGINT)>@THRSHLD
												)
		)	
								
												
							 Y  D   T E X T   S Q L D E L E T E P R I C E S         0         DECLARE @DomainNo as int
		Set @DomainNo = ##DOMAIN##
DECLARE @PriceGroup as int
		Set @PriceGroup = ##PRGRPID##		
DECLARE @THRESHOLD as int
		Set @THRESHOLD = ##THRSHLD##		
DELETE FROM PRICES WHERE ID_PriceGroup = ##PRGRPID## AND DomainNo = @DomainNo AND
						(
							(ID<=##THRSHLD## AND (TERMLESS=0 OR ID_Item IN
										(
											SELECT ID_Item
											FROM [Prices]
											WHERE DomainNo = @DomainNo AND ID_PriceGroup = @PriceGroup
											GROUP BY ID_Item, DomainNo, ID_PriceGroup
											HAVING count(ID)>1 
										) 		)
						
						)
						) 
						    -   <   T E X T   S Q L L O A D C O S T S       0         Exec [dbo].[ue_cost_threshold_sel] ##DOMAIN##     H   T E X T   S Q L I M P O R T M A R K Z E R O         0         UPDATE [Imports]
   SET 
      [LAST_IMPORT] = 0
	,[NEXT_IMPORT] = CASE WHEN GETDATE()>[NEXT_IMPORT] THEN DATEADD(mi,[INTERVAL],[NEXT_IMPORT])   ELSE [NEXT_IMPORT] END    
WHERE GETDATE()>[NEXT_IMPORT] OR (DATEDIFF(mi,[LAST_IMPORT],GETDATE())>[INTERVAL])
  H   T E X T   S Q L I M P O R T M A R K T I M E         0         UPDATE [Imports]
   SET 
      [LAST_IMPORT] = GETDATE() 
	   ,[NEXT_IMPORT]=	CASE 
							WHEN NEXT_IMPORT<GETDATE() THEN  DATEADD(mi,[INTERVAL]*(DATEDIFF(mi, NEXT_IMPORT, GETDATE())/Interval),[NEXT_IMPORT]) 
							ELSE NEXT_IMPORT 
						END 	  
WHERE [LAST_IMPORT] = 0
   �   P   T E X T   S Q L I M P O R T S S E L E C T B Y Z E R O       0         SELECT CASE [Last_Import] WHEN 0 THEN 'True' ELSE 'False' END 
FROM Imports
WHERE Tablename = '##TABLE##' AND Domain=##DOMAIN##   