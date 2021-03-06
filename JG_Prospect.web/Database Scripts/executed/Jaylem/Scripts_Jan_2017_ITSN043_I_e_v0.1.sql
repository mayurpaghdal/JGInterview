USE [JGBS_Dev]
GO
/****** Object:  StoredProcedure [dbo].[sp_vendorNotes]    Script Date: 30-01-2017 07:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- Modified By : Jaylem
-- Modified Date : 30-01-2017
-- =============================================
ALTER PROCEDURE [dbo].[sp_vendorNotes]
	@action int=null,
	@NotesId int= null,
	@VendorId nvarchar(50)=null,
	@userid nvarchar(250)=null,
	@Notes nvarchar(max)=null,
	@TempId nvarchar(250)=null
AS
BEGIN
	IF(@action=1)
	BEGIN
		DECLARE @CreatedOn DATETIME=null;
		SET @CreatedOn=GETDATE();
		INSERT INTO tbl_VendorNotes(VendorId,userid,Notes,CreatedOn,TempId)
		VALUES (@VendorId,@userid,@Notes,@CreatedOn,@TempId)
	END

	IF(@action=2)
	BEGIN
		IF(@TempId<>'')
		BEGIN
			SELECT NotesId,userid,Notes,CreatedOn 
			FROM tbl_VendorNotes 
			WHERE VendorId=@VendorId and TempId=@TempId
		END
		ELSE
		BEGIN
			SELECT NotesId,userid,Notes,CreatedOn 
			FROM tbl_VendorNotes 
			WHERE VendorId=@VendorId and VendorId>0
		END
	END
END

GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- Modified By : Jaylem
-- Modified Date : 30-01-2017
-- =============================================
ALTER PROCEDURE [dbo].[UDP_GetVendorNotes]
@VendorId nvarchar(50)=null
AS
BEGIN

	SELECT NotesId,userid,Notes,CreatedOn 
	FROM tbl_VendorNotes
	WHERE VendorId != 0 
	AND VendorId=ISNULL(@VendorId,0)
	 
END

GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- Modified By : Jaylem
-- Modified Date : 31-01-2017
-- =============================================
ALTER PROCEDURE [dbo].[UDP_SaveVendor]  
	@vendor_id int,  
	@vendor_name varchar(100) = NULL,  
	@vendor_category int = NULL,  
	@contact_person varchar(100) = NULL,  
	@contact_number varchar(20) = NULL,  
	@fax varchar(20) = NULL,  
	@email varchar(50) = NULL,  
	@address varchar(100) = NULL,  
	@notes varchar(500) = NULL,  
	@ManufacturerType varchar(70)  = NULL,  
	@BillingAddress varchar(MAX)  = NULL,  
	@TaxId varchar(50)  = NULL,  
	@ExpenseCategory varchar(50)  = NULL,  
	@AutoTruckInsurance varchar(50)  = NULL,  
	@VendorSubCategoryId int,  
	@VendorStatus nvarchar(50) = NULL,  
	@Website nvarchar(100) = NULL,  
	@ContactExten nvarchar(6) = NULL,
	@Vendrosource nvarchar(500)=null,
	@AddressID int=null,
	@PaymentTerms nvarchar(500)=null,
	@PaymentMethod nvarchar(500)=null,
	@TempID nvarchar(500)=null, 
	@NotesTempID nvarchar(250)=null ,
	@VendorCategories nvarchar(max)=null,
	@VendorSubCategories nvarchar(max)=null,
	@DeliveryFee decimal(18,4), 
	@StockingReturnFee decimal(18,4), 
	@MiscFee decimal(18,4), 
	@DeliveryMethod nvarchar(max), 
	@FreightTerms  nvarchar(max), 
	@Tax  decimal(18,4), 
	@VendorQuote  nvarchar(max), 
	@AttachVendorQuote nvarchar(max), 
	@Revision  nvarchar(max), 
	@VendorInvoice nvarchar(max), 
	@JGCustomerPO  nvarchar(max), 
	@LeadTimeDueDate datetime, 
	@EconimicalOrderQuantity int, 
	@DiscountPerUnit  decimal(18,4), 
	@ReOrderPoint decimal(18,4), 
	@OrderQTY int,
	@GeneralPhone nvarchar(max),
	@HoursOfOperation nvarchar(max),
	@ContactPreferenceEmail bit,
	@ContactPreferenceCall bit,
	@ContactPreferenceText bit,
	@ContactPreferenceMail bit,
	@UserID varchar(100)  = NULL,

	@outVendorID int out

AS  
BEGIN

	IF EXISTS(SELECT 1 FROM tblVendors WHERE VendorId=@vendor_id)  
	BEGIN  
		UPDATE tblVendors  
		SET  
			VendorName = @vendor_name,  
			VendorCategoryId = @vendor_category,  
			ContactPerson = @contact_person,  
			ContactNumber = @contact_number,  
			Fax = @fax,  
			Email = @email,  
			[Address] = @address,  
			Notes = @notes,  
			ManufacturerType = @ManufacturerType,  
			BillingAddress = @BillingAddress,  
			TaxId = @TaxId,  
			ExpenseCategory = @ExpenseCategory,  
			AutoTruckInsurance = @AutoTruckInsurance,  
			VendorSubCategoryId = @VendorSubCategoryId,  
			VendorStatus = @VendorStatus,  
			Website = @Website,  
			ContactExten = @ContactExten,
			Vendrosource = @Vendrosource,
			AddressID = @AddressID,
			PaymentTerms = @PaymentTerms,
			PaymentMethod = @PaymentMethod,
			DeliveryFee = @DeliveryFee,
			StockingReturnFee = @StockingReturnFee,
			MiscFee = @MiscFee,
			DeliveryMethod = @DeliveryMethod,
			FreightTerms = @FreightTerms,
			Tax = @Tax,
			VendorQuote = @VendorQuote,
			AttachVendorQuote = @AttachVendorQuote,
			Revision = @Revision,
			VendorInvoice = @VendorInvoice,
			JGCustomerPO = @JGCustomerPO,
			LeadTimeDueDate = @LeadTimeDueDate,
			EconimicalOrderQuantity = @EconimicalOrderQuantity,
			DiscountPerUnit = @DiscountPerUnit,
			ReOrderPoint = @ReOrderPoint,
			OrderQTY = @OrderQTY,
			GeneralPhone = @GeneralPhone,
			HoursOfOperation = @HoursOfOperation,
			ContactPreferenceEmail = @ContactPreferenceEmail,
			ContactPreferenceCall = @ContactPreferenceCall,
			ContactPreferenceText = @ContactPreferenceText,
			ContactPreferenceMail = @ContactPreferenceMail
		WHERE VendorId = @vendor_id  
		
		IF @VendorCategories IS NOT NULL
		BEGIN
			
			DELETE FROM tbl_Vendor_VendorCat WHERE VendorId = @vendor_id
			INSERT INTO tbl_Vendor_VendorCat(VendorId,VendorCatId)
			SELECT @vendor_id,Item FROM dbo.SplitString(@VendorCategories, ',')

		END
		
		IF @VendorSubCategories IS NOT NULL
		Begin
			
			DELETE FROM tbl_Vendor_VendorSubCat WHERE VendorId = @vendor_id
			INSERT INTO tbl_Vendor_VendorSubCat(VendorId,VendorSubCatId)
			SELECT @vendor_id,Item FROM dbo.SplitString(@VendorSubCategories, ',')

		End

		IF ISNULL(@notes,'') != ''
		Begin
			INSERT INTO tbl_VendorNotes (userid,Notes,CreatedOn,VendorId)
			VALUES(@UserID,(CASE WHEN ISNULL(@notes,'')='' THEN 'Vendor is updeted.' ELSE @notes END),GETDATE(),@vendor_id)
		End

		Set @outVendorID=@vendor_id
	
	END
	ELSE
	BEGIN		
		INSERT INTO tblVendors
		(
			VendorName,VendorCategoryId,ContactPerson,ContactNumber,Fax,Email,[Address],Notes,ManufacturerType,BillingAddress,
			TaxId,ExpenseCategory,AutoTruckInsurance,VendorSubCategoryId,VendorStatus,Website,ContactExten,Vendrosource,
			AddressID,PaymentTerms,PaymentMethod,DeliveryFee,StockingReturnFee,MiscFee,DeliveryMethod,FreightTerms,
			Tax,VendorQuote,AttachVendorQuote,Revision,VendorInvoice,JGCustomerPO,LeadTimeDueDate,EconimicalOrderQuantity,
			DiscountPerUnit,ReOrderPoint,OrderQTY,GeneralPhone,HoursOfOperation,ContactPreferenceEmail,ContactPreferenceCall,
			ContactPreferenceText,ContactPreferenceMail
		)   
		VALUES(
			@vendor_name,@vendor_category,@contact_person,@contact_number,@fax,@email,@address,@notes,@ManufacturerType,
			@BillingAddress,@TaxId,@ExpenseCategory,@AutoTruckInsurance,@VendorSubCategoryId,@VendorStatus,@Website,
			@ContactExten,@Vendrosource,@AddressID,@PaymentTerms,@PaymentMethod,@DeliveryFee,@StockingReturnFee,
			@MiscFee,@DeliveryMethod,@FreightTerms,@Tax,@VendorQuote,@AttachVendorQuote,@Revision,@VendorInvoice,
			@JGCustomerPO,@LeadTimeDueDate,@EconimicalOrderQuantity,@DiscountPerUnit,@ReOrderPoint,@OrderQTY,
			@GeneralPhone,@HoursOfOperation,@ContactPreferenceEmail,@ContactPreferenceCall,@ContactPreferenceText,@ContactPreferenceMail
		) 
		
		SELECT @vendor_id = SCOPE_IDENTITY()

		UPDATE tblVendorEmail SET VendorID=@vendor_id WHERE TempID=@TempID
		
		UPDATE tblVendorAddress SET	VendorId=@vendor_id	WHERE TempID=@TempID

		INSERT INTO tbl_VendorNotes (userid,Notes,CreatedOn,VendorId)
		VALUES(@UserID,(CASE WHEN ISNULL(@notes,'')='' THEN 'Vendor is added.' ELSE @notes END),GETDATE(),@vendor_id)

		IF @VendorCategories IS NOT NULL
		BEGIN
			IF @VendorCategories IS NOT NULL
			BEGIN
				
				INSERT INTO tbl_Vendor_VendorCat(VendorId,VendorCatId)
				SELECT @vendor_id,Item 
				FROM dbo.SplitString(@VendorCategories, ',')

			END
		END
		
		IF @VendorSubCategories IS NOT NULL
		BEGIN		
			IF @VendorSubCategories IS NOT NULL
			BEGIN
				
				INSERT INTO tbl_Vendor_VendorSubCat(VendorId,VendorSubCatId)
				SELECT @vendor_id,Item 
				FROM dbo.SplitString(@VendorSubCategories, ',')	

			END
		END		

		Set @outVendorID=@vendor_id
	END

	return @outVendorID;

END