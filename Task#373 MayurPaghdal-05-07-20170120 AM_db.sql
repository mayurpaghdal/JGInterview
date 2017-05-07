PRINT N'Altering Procedure dbo.[sp_GetCategoryList]...'
GO
ALTER PROCEDURE [dbo].[sp_GetCategoryList]
  @ProductCategory NVARCHAR(MAX)=NULL,
  @VendorCategory NVARCHAR(MAX)=NULL,
  @action NVARCHAR(20)=NULL
AS

IF @action='1'
BEGIN
  SELECT 
    * 
  FROM 
    [tblProductMaster]
END
IF @action='2'
BEGIN
  SELECT 
    pvm.VendorCategoryId
    ,vc.VendorCategoryNm 
  FROM 
    [tblProductVendorCat] pvm
	INNER JOIN [tblVendorCategory] AS vc 
    ON pvm.VendorCategoryId=vc.VendorCategpryId  
	WHERE 
    ',' + @ProductCategory +',' LIKE '%,' + pvm.ProductCategoryId + ',%'
  GROUP BY 
    pvm.VendorCategoryId
    ,vc.VendorCategoryNm
END
IF @action='3'
BEGIN
	SELECT 
    vsc.VendorSubCategoryId
    ,vsc.VendorSubCategoryName 
  FROM 
    tbl_VendorCat_VendorSubCat AS vvsm 
  INNER JOIN tblVendorSubCategory AS vsc 
		ON vvsm.VendorSubCategoryId=vsc.VendorSubCategoryId 
  WHERE 
    vvsm.VendorCategoryId in (SELECT * FROM dbo.split(@VendorCategory,',')) 
  GROUP BY 
    vsc.VendorSubCategoryId,vsc.VendorSubCategoryName
END

--SELECT * FROM [tblVendorCategory]
--SELECT * FROM [tblProductVendorCat]
--SELECT * FROM tblVendorSubCategory
--SELECT * FROM tbl_VendorCat_VendorSubCat
GO

PRINT N'Altering Procedure dbo.UDP_fetchvendorcategory...'
GO
ALTER PROCEDURE [dbo].[UDP_fetchvendorcategory]
  @IsRetail_Wholesale BIT=NULL
  ,@IsManufacturer BIT=NULL
AS

SELECT 
  VendorCategpryId,
  VendorCategoryNm 
FROM 
  tblVendorCategory 
WHERE 
  (@IsRetail_Wholesale IS NULL OR @IsManufacturer IS NULL)
  OR IsRetail_wholesale =@IsRetail_Wholesale 
  OR IsManufacturer=@IsManufacturer 
ORDER BY 
  VendorCategoryNm