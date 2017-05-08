using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Common;
using JG_Prospect.DAL.Database;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using JG_Prospect.Common.modal;
using System.Configuration;
using System.Data.SqlClient;
using JG_Prospect.Common;
namespace JG_Prospect.DAL
{
    public class VendorDAL
    {
        private static VendorDAL m_VendorDAL = new VendorDAL();
        private VendorDAL()
        {
        }
        public static VendorDAL Instance
        {
            get { return m_VendorDAL; }
            set {; }
        }
        private DataSet DS = new DataSet();
        public DataSet fetchallvendorDetails()
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_fetchallvendorDetails");
                    command.CommandType = CommandType.StoredProcedure;
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataSet fetchAllVendorCategoryHavingVendors()
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_fetchAllVendorCategoryHavingVendors");
                    command.CommandType = CommandType.StoredProcedure;
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataSet fetchallvendorcategory()
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_fetchAllVendorCategory");
                    command.CommandType = CommandType.StoredProcedure;
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet fetchVendorNamesByVendorCategory(int vendorcategoryId)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_fetchVendorNamesByVendorCategory");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@vendorcategoryId", DbType.Int32, vendorcategoryId);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public bool AddVendorQuotes(string soldJobId, string originalFileName, string temporaryFileName, int vendorId)
        {

            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("UDP_AddVendorQuotes");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@soldJobId", DbType.String, soldJobId);
                    database.AddInParameter(command, "@OriginalFileName", DbType.String, originalFileName);
                    database.AddInParameter(command, "@tempFileName", DbType.String, temporaryFileName);
                    database.AddInParameter(command, "@vendorId", DbType.Int32, vendorId);

                    database.ExecuteNonQuery(command);
                }
                return true;
            }
            catch (Exception ex)
            {
                //LogManager.Instance.WriteToFlatFile(ex);
                return false;
            }
        }
        public void RemoveAttachedQuote(string fileName)
        {

            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("UDP_RemoveAttachedQuotes");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@tempName", DbType.String, fileName);
                    database.ExecuteNonQuery(command);
                }

            }
            catch (Exception ex)
            {

            }

        }
        public DataSet GetVendorQuoteByVendorId(string soldJobId, int vendorId)
        {
            DataSet ds = null;
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("UDP_GetVendorQuotesByVendorId");
                    database.AddInParameter(command, "@soldJobId", DbType.String, soldJobId);
                    //database.AddInParameter(command, "@customerId", DbType.Int16, customerId);
                    //database.AddInParameter(command, "@productId", DbType.Int16, productId);
                    //database.AddInParameter(command, "@productTypeId", DbType.Int16, productTypeId);
                    database.AddInParameter(command, "@vendorId", DbType.Int16, vendorId);
                    command.CommandType = CommandType.StoredProcedure;
                    ds = database.ExecuteDataSet(command);
                }
            }

            catch (Exception ex)
            {
                //LogManager.Instance.WriteToFlatFile(ex);
            }
            return ds;
        }
        public bool UpdateAttachedQuote(string soldJobId, string originalFileName, string temporaryFileName, int vendorId)
        {

            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("UDP_UpdateAttachedQuote");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@soldJobId", DbType.String, soldJobId);
                    //database.AddInParameter(command, "@customerid", DbType.Int32, customerid);
                    //database.AddInParameter(command, "@estimateId", DbType.Int32, productid);
                    database.AddInParameter(command, "@docName", DbType.String, originalFileName);
                    database.AddInParameter(command, "@tempName", DbType.String, temporaryFileName);
                    //database.AddInParameter(command, "@productTypeId", DbType.Int32, productTypeId);
                    database.AddInParameter(command, "@vendorId", DbType.Int32, vendorId);

                    database.ExecuteNonQuery(command);
                }
                return true;
            }
            catch (Exception ex)
            {
                //LogManager.Instance.WriteToFlatFile(ex);
                return false;
            }
        }

        public DataSet GetMaterialListData(string soldJobId, int CustomerId)
        {
            DataSet ds = null;
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("UDP_GetProductCategoryByCustIdandSoldId");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@CustomerId", DbType.String, CustomerId);
                    database.AddInParameter(command, "@SoldJobId", DbType.String, soldJobId);
                    //database.AddInParameter(command, "@customerId", DbType.Int16, customerId);
                    //database.AddInParameter(command, "@estimateId", DbType.Int16, estimateId);
                    //database.AddInParameter(command, "@productTypeId", DbType.Int16, productTypeId);

                    ds = database.ExecuteDataSet(command);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return ds;
        }



        public DataSet GetAllAttachedQuotes(string soldJobId)
        {
            DataSet ds = null;
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("UDP_FetchAttachedQuotes");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@soldJobId", DbType.String, soldJobId);
                    //database.AddInParameter(command, "@customerId", DbType.Int16, customerId);
                    //database.AddInParameter(command, "@estimateId", DbType.Int16, estimateId);
                    //database.AddInParameter(command, "@productTypeId", DbType.Int16, productTypeId);

                    ds = database.ExecuteDataSet(command);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return ds;
        }

        public DataSet GetMaterialListNew(string soldJobId)
        {
            DataSet ds = null;
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("USP_GetMaterialList");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@soldJobId", DbType.String, soldJobId);
                    ds = database.ExecuteDataSet(command);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return ds;
        }


        public DataSet fetchVendorDetailsByVendorId(int vendorId)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_fetchVendorDetailsByVendorId");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@vendorId", DbType.Int32, vendorId);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet fetchMaterialListForEmail(string vendorCategory)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_GetMaterialListForEmail");
                    database.AddInParameter(command, "@vendorCategory", DbType.String, vendorCategory);
                    command.CommandType = CommandType.StoredProcedure;
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet getVendorDetails(string VendorIds)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("USP_GetVendorDetails");
                    database.AddInParameter(command, "@VendorIds", DbType.String, VendorIds);
                    command.CommandType = CommandType.StoredProcedure;
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public DataSet getVendorEmailId(string vendorName)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_GetVendorEmailId");
                    database.AddInParameter(command, "@vendorName", DbType.String, vendorName);
                    command.CommandType = CommandType.StoredProcedure;
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataSet fetchVendorListByCategoryForEmail(int category)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_FetchAllVendorsByCategory");
                    database.AddInParameter(command, "@vendorCategory", DbType.Int16, category);
                    command.CommandType = CommandType.StoredProcedure;
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// This method will return one or more Vendors/
        /// </summary>
        /// <param name="pVendorIDs">Command separated vendor ids</param>
        /// <returns></returns>
        public DataSet GetVendors(string pVendorIDs)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("usp_GetVendors");
                    database.AddInParameter(command, "@VendorIds", DbType.String, pVendorIDs);
                    command.CommandType = CommandType.StoredProcedure;
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool deletevendor(int vendorid)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("UDP_deletevendor");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@vendor_id", DbType.Int32, vendorid);
                    database.ExecuteNonQuery(command);
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }
        public bool deletevendorcategory(int vendorcategoryid)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("UDP_deletevendorcategory");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@vendorcategory_id", DbType.Int32, vendorcategoryid);
                    database.ExecuteNonQuery(command);
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }
        public Int32 savevendor(Vendor objvendor)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {

                    DbCommand command = database.GetStoredProcCommand("UDP_SaveVendor");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@vendor_id", DbType.Int32, objvendor.vendor_id > 0 ? objvendor.vendor_id : (object)DBNull.Value);
                    database.AddInParameter(command, "@vendor_name", DbType.String, !string.IsNullOrEmpty(objvendor.vendor_name) ? objvendor.vendor_name : (object)DBNull.Value);
                    database.AddInParameter(command, "@vendor_category", DbType.Int32, objvendor.vendor_category_id > 0 ? objvendor.vendor_category_id : (object)DBNull.Value);
                    database.AddInParameter(command, "@contact_person", DbType.String, !string.IsNullOrEmpty(objvendor.contract_person) ? objvendor.contract_person : (object)DBNull.Value);
                    database.AddInParameter(command, "@contact_number", DbType.String, !string.IsNullOrEmpty(objvendor.contract_number) ? objvendor.contract_number : (object)DBNull.Value);
                    database.AddInParameter(command, "@fax", DbType.String, !string.IsNullOrEmpty(objvendor.fax) ? objvendor.fax : (object)DBNull.Value);
                    database.AddInParameter(command, "@email", DbType.String, !string.IsNullOrEmpty(objvendor.mail) ? objvendor.mail : (object)DBNull.Value);
                    database.AddInParameter(command, "@address", DbType.String, !string.IsNullOrEmpty(objvendor.address) ? objvendor.address : (object)DBNull.Value);
                    database.AddInParameter(command, "@notes", DbType.String, !string.IsNullOrEmpty(objvendor.notes) ? objvendor.notes : (object)DBNull.Value);
                    database.AddInParameter(command, "@ManufacturerType", DbType.String, !string.IsNullOrEmpty(objvendor.notes) ? objvendor.notes : (object)DBNull.Value);
                    database.AddInParameter(command, "@BillingAddress", DbType.String, !string.IsNullOrEmpty(objvendor.BillingAddress) ? objvendor.BillingAddress : (object)DBNull.Value);
                    database.AddInParameter(command, "@TaxId", DbType.String, !string.IsNullOrEmpty(objvendor.TaxId) ? objvendor.TaxId : (object)DBNull.Value);
                    database.AddInParameter(command, "@ExpenseCategory", DbType.String, !string.IsNullOrEmpty(objvendor.ExpenseCategory) ? objvendor.ExpenseCategory : (object)DBNull.Value);
                    database.AddInParameter(command, "@AutoTruckInsurance", DbType.String, !string.IsNullOrEmpty(objvendor.AutoTruckInsurance) ? objvendor.AutoTruckInsurance : (object)DBNull.Value);
                    database.AddInParameter(command, "@VendorSubCategoryId", DbType.Int16, objvendor.vendor_subcategory_id > 0 ? objvendor.vendor_subcategory_id : (object)DBNull.Value);
                    database.AddInParameter(command, "@VendorStatus", DbType.String, !string.IsNullOrEmpty(objvendor.VendorStatus) ? objvendor.VendorStatus : (object)DBNull.Value);
                    database.AddInParameter(command, "@Website", DbType.String, !string.IsNullOrEmpty(objvendor.Website) ? objvendor.Website : (object)DBNull.Value);
                    database.AddInParameter(command, "@ContactExten", DbType.String, !string.IsNullOrEmpty(objvendor.ContactExten) ? objvendor.ContactExten : (object)DBNull.Value);
                    database.AddInParameter(command, "@Vendrosource", DbType.String, !string.IsNullOrEmpty(objvendor.Vendrosource) ? objvendor.Vendrosource : (object)DBNull.Value);
                    database.AddInParameter(command, "@AddressID", DbType.Int32, objvendor.AddressID > 0 ? objvendor.AddressID : (object)DBNull.Value);
                    database.AddInParameter(command, "@PaymentTerms", DbType.String, !string.IsNullOrEmpty(objvendor.PaymentTerms) ? objvendor.PaymentTerms : (object)DBNull.Value);
                    database.AddInParameter(command, "@PaymentMethod", DbType.String, !string.IsNullOrEmpty(objvendor.PaymentMethod) ? objvendor.PaymentMethod : (object)DBNull.Value);
                    database.AddInParameter(command, "@TempID", DbType.String, !string.IsNullOrEmpty(objvendor.TempID) ? objvendor.TempID : (object)DBNull.Value);
                    database.AddInParameter(command, "@NotesTempID", DbType.String, !string.IsNullOrEmpty(objvendor.NotesTempID) ? objvendor.NotesTempID : (object)DBNull.Value);
                    database.AddInParameter(command, "@VendorCategories", DbType.String, !string.IsNullOrEmpty(objvendor.VendorCategories) ? objvendor.VendorCategories : (object)DBNull.Value);
                    database.AddInParameter(command, "@VendorSubCategories", DbType.String, !string.IsNullOrEmpty(objvendor.VendorSubCategories) ? objvendor.VendorSubCategories : (object)DBNull.Value);

                    database.AddInParameter(command, "@DeliveryFee", DbType.Decimal, objvendor.DeliveryFee);
                    database.AddInParameter(command, "@StockingReturnFee", DbType.Decimal, objvendor.StockingReturnFee);
                    database.AddInParameter(command, "@MiscFee", DbType.Decimal, objvendor.MiscFee);
                    database.AddInParameter(command, "@DeliveryMethod", DbType.String, objvendor.DeliveryMethod);
                    database.AddInParameter(command, "@FreightTerms", DbType.String, objvendor.FreightTerms);
                    database.AddInParameter(command, "@Tax", DbType.Decimal, objvendor.Tax);
                    database.AddInParameter(command, "@VendorQuote",DbType.String, objvendor.VendorQuote);
                    database.AddInParameter(command, "@AttachVendorQuote", DbType.String, objvendor.AttachVendorQuote);
                    database.AddInParameter(command, "@Revision",DbType.String, objvendor.Revision);
                    database.AddInParameter(command, "@VendorInvoice", DbType.String, objvendor.VendorInvoice);
                    database.AddInParameter(command, "@JGCustomerPO",DbType.String, objvendor.JGCustomerPO);
                    database.AddInParameter(command, "@LeadTimeDueDate", DbType.DateTime, objvendor.LeadTimeDueDate);
                    database.AddInParameter(command, "@EconimicalOrderQuantity", DbType.Int32, objvendor.EconimicalOrderQuantity);
                    database.AddInParameter(command, "@DiscountPerUnit",DbType.Decimal, objvendor.DiscountPerUnit);
                    database.AddInParameter(command, "@ReOrderPoint", DbType.Decimal, objvendor.ReOrderPoint);
                    database.AddInParameter(command, "@OrderQTY", DbType.String, objvendor.OrderQTY);
                    database.AddInParameter(command, "@GeneralPhone", DbType.String, objvendor.GeneralPhone);
                    database.AddInParameter(command, "@HoursOfOperation", DbType.String, objvendor.HoursOfOperation);
                    database.AddInParameter(command, "@ContactPreferenceEmail", DbType.Boolean, objvendor.ContactPreferenceEmail);
                    database.AddInParameter(command, "@ContactPreferenceCall", DbType.Boolean, objvendor.ContactPreferenceCall);
                    database.AddInParameter(command, "@ContactPreferenceText", DbType.Boolean, objvendor.ContactPreferenceText);
                    database.AddInParameter(command, "@ContactPreferenceMail", DbType.Boolean, objvendor.ContactPreferenceMail);

                    database.AddInParameter(command, "@UserID", DbType.String, objvendor.UserID);

                    database.AddOutParameter(command, "@outVendorID", DbType.Int32, 0);

                    database.ExecuteScalar(command);
                    int res = Convert.ToInt32(database.GetParameterValue(command, "@outVendorID"));

                    return res;
                }
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public DataSet FetchvendorDetails(int vendorid)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_FetchvendorDetails");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@vendor_id", DbType.Int32, vendorid);
                    DS = database.ExecuteDataSet(command);

                    return DS;
                }
            }

            catch (Exception ex)
            {
                return null;
                //LogManager.Instance.WriteToFlatFile(ex);
            }
        }
        public bool savevendorcatalogdetails(Vendor_Catalog objcatalog)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {

                    DbCommand command = database.GetStoredProcCommand("UPP_savevendorcatalogdetails");
                    command.CommandType = CommandType.StoredProcedure;

                    database.AddInParameter(command, "@catalog_name", DbType.String, objcatalog.catalog_name);
                    database.ExecuteNonQuery(command);
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public DataSet GetAllvendorDetails()
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_FetchAllVendors");
                    command.CommandType = CommandType.StoredProcedure;
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }

            catch (Exception ex)
            {
                return null;
                //LogManager.Instance.WriteToFlatFile(ex);
            }
        }

        public DataSet GetVendorList(string FilterParams, string FilterBy, string ManufacturerType, string VendorCategoryId, string VendorStatus)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("USP_GetVendorList");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@FilterParams", DbType.String, FilterParams);
                    database.AddInParameter(command, "@FilterBy", DbType.String, FilterBy);
                    database.AddInParameter(command, "@ManufacturerType", DbType.String, ManufacturerType);
                    database.AddInParameter(command, "@VendorCategoryId", DbType.String, VendorCategoryId);
                    database.AddInParameter(command, "@VendorStatus", DbType.String, VendorStatus);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet GetVendorList(string strVendorStatus, bool IsRetailWholesale, string iProductCategoryID, string iVendorCategoryID, string iVendorSubCategoryID)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_GetVendors");
                    command.CommandType = CommandType.StoredProcedure;

                    if (!string.IsNullOrEmpty(strVendorStatus))
                    {
                        database.AddInParameter(command, "@VendorStatus", DbType.String, strVendorStatus);
                    }
                    else
                    {
                        database.AddInParameter(command, "@VendorStatus", DbType.String, DBNull.Value);
                    }
                    database.AddInParameter(command, "@IsRetailWholesale", DbType.Boolean, IsRetailWholesale);

                    if (!string.IsNullOrEmpty(iProductCategoryID))
                    {
                        database.AddInParameter(command, "@ProductCategoryID", DbType.String, iProductCategoryID);
                    }
                    else
                    {
                        database.AddInParameter(command, "@ProductCategoryID", DbType.String, DBNull.Value);
                    }
                    if (!string.IsNullOrEmpty(iVendorCategoryID))
                    {
                        database.AddInParameter(command, "@VendorCategoryID", DbType.String, iVendorCategoryID);
                    }
                    else
                    {
                        database.AddInParameter(command, "@VendorCategoryID", DbType.String, DBNull.Value);
                    }
                    if (!string.IsNullOrEmpty(iVendorSubCategoryID))
                    {
                        database.AddInParameter(command, "@VendorSubCategoryID", DbType.String, iVendorSubCategoryID);
                    }
                    else
                    {
                        database.AddInParameter(command, "@VendorSubCategoryID", DbType.String, DBNull.Value);
                    }
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet GetSearchedVendorByAutoSuggestion(string strCategorySelected, string strCategorySearchValue)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("USP_SelectSearchedVendorByAutoSuggestion");
                    command.CommandType = CommandType.StoredProcedure;

                    if (!string.IsNullOrEmpty(strCategorySelected))
                    {
                        database.AddInParameter(command, "@SearchCategory", DbType.String, strCategorySelected);
                    }
                    else
                    {
                        database.AddInParameter(command, "@SearchCategory", DbType.String, DBNull.Value);
                    }

                    if (!string.IsNullOrEmpty(strCategorySearchValue))
                    {
                        database.AddInParameter(command, "@SearchValue", DbType.String, strCategorySearchValue);
                    }
                    else
                    {
                        database.AddInParameter(command, "@SearchValue", DbType.String, DBNull.Value);
                    }

                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public string SaveNewVendorCategory(NewVendorCategory objNewVendorCat)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {

                    DbCommand command = database.GetStoredProcCommand("sp_newVendorCategory");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@vendorCatName", DbType.String, objNewVendorCat.VendorName);
                    database.AddInParameter(command, "@IsRetail_Wholesale", DbType.Boolean, objNewVendorCat.IsRetail_Wholesale);
                    database.AddInParameter(command, "@IsManufacturer", DbType.Boolean, objNewVendorCat.IsManufacturer);
                    database.AddInParameter(command, "@action", DbType.Int16, 1);
                    object VendorId = database.ExecuteScalar(command);
                    return VendorId.ToString();
                }
            }
            catch (Exception ex)
            {
                return "";
            }

        }


        public bool SaveNewVendorProduct(NewVendorCategory objNewVendorCat)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {

                    DbCommand command = database.GetStoredProcCommand("sp_newVendorCategory");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@vendorCatId", DbType.String, objNewVendorCat.VendorId);
                    database.AddInParameter(command, "@productCatId", DbType.String, objNewVendorCat.ProductId);
                    database.AddInParameter(command, "@action", DbType.Int16, 2);
                    database.ExecuteNonQuery(command);
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public bool SaveNewVendorSubCat(VendorSubCategory objVendorSubCat)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("sp_VendorSubCat");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorCategoryId", DbType.String, objVendorSubCat.VendorCatId);
                    database.AddInParameter(command, "@VendorSubCategoryName", DbType.String, objVendorSubCat.Name);
                    database.AddInParameter(command, "@IsRetail_Wholesale", DbType.Boolean, objVendorSubCat.IsRetail_Wholesale);
                    database.AddInParameter(command, "@IsManufacturer", DbType.Boolean, objVendorSubCat.IsManufacturer);
                    database.AddInParameter(command, "@action", DbType.Int16, 1);
                    database.ExecuteNonQuery(command);
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool UpdateVendorCategory(NewVendorCategory objVendorCat)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("sp_VendorCategory");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorCategoryId", DbType.String, objVendorCat.VendorId);
                    database.AddInParameter(command, "@VendorCategoryName", DbType.String, objVendorCat.VendorName);
                    database.AddInParameter(command, "@IsRetail_Wholesale", DbType.Boolean, objVendorCat.IsRetail_Wholesale);
                    database.AddInParameter(command, "@IsManufacturer", DbType.Boolean, objVendorCat.IsManufacturer);
                    database.AddInParameter(command, "@action", DbType.Int16, 1);
                    database.ExecuteNonQuery(command);
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool UpdateVendorSubCat(VendorSubCategory objVendorSubCat)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("sp_VendorSubCat");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorSubCategoryId", DbType.String, objVendorSubCat.Id);
                    database.AddInParameter(command, "@VendorSubCategoryName", DbType.String, objVendorSubCat.Name);
                    database.AddInParameter(command, "@IsRetail_Wholesale", DbType.Boolean, objVendorSubCat.IsRetail_Wholesale);
                    database.AddInParameter(command, "@IsManufacturer", DbType.Boolean, objVendorSubCat.IsManufacturer);
                    database.AddInParameter(command, "@action", DbType.Int16, 4);
                    database.ExecuteNonQuery(command);
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool DeleteVendorSubCat(VendorSubCategory objVendorSubCat)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("sp_VendorSubCat");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorSubCategoryId", DbType.String, objVendorSubCat.Id);
                    database.AddInParameter(command, "@action", DbType.Int16, 2);
                    database.ExecuteNonQuery(command);
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool DeleteVendorDetail(string VendorId)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("sp_deletevendor");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorId", DbType.String, VendorId);
                    database.ExecuteNonQuery(command);
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public DataSet GetVendorSubCategory()
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                DS = new DataSet();
                DbCommand command = database.GetStoredProcCommand("sp_VendorSubCat");
                command.CommandType = CommandType.StoredProcedure;
                database.AddInParameter(command, "@action", DbType.Int16, 3);
                DS = database.ExecuteDataSet(command);
                return DS;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool InsertVendorEmail(DataTable tblVendorEmail, int AddressID)
        {
            try
            {
                string consString = ConfigurationManager.ConnectionStrings[DBConstants.CONFIG_CONNECTION_STRING_KEY].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_VendorEmail"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@tblVendorEmail", tblVendorEmail);
                        cmd.Parameters.AddWithValue("@AddressID", AddressID);
                        cmd.Parameters.AddWithValue("@action", 1);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return true;
                    }
                }
                //SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                //{
                //    DbCommand command = database.GetStoredProcCommand("sp_VendorEmail");
                //    command.CommandType = CommandType.StoredProcedure;
                //    database.AddInParameter(command, "@tblVendorEmail", DbType.Object, objVendor.tblVendorEmail);
                //    database.AddInParameter(command, "@action", DbType.Int16, 1);
                //    database.ExecuteNonQuery(command);
                //    return true;
                //}
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public int InsertVendorAddress(DataTable tblVendorAddress)
        {
            try
            {
                string consString = ConfigurationManager.ConnectionStrings[DBConstants.CONFIG_CONNECTION_STRING_KEY].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_VendorAddress"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@tblVendorAddress", tblVendorAddress);
                        cmd.Parameters.AddWithValue("@action", 1);
                        con.Open();
                        var id = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                        con.Close();
                        return id;
                    }
                }
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        public DataSet GetALLVendorAddress(string manufacturer, string productId, string vendorCatId, string vendorSubCatId)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("sp_VendorAddress");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@manufacturer", DbType.String, manufacturer);
                    database.AddInParameter(command, "@productId", DbType.String, productId);
                    database.AddInParameter(command, "@vendorCatId", DbType.String, vendorCatId);
                    database.AddInParameter(command, "@vendorSubCatId", DbType.String, vendorSubCatId);
                    database.AddInParameter(command, "@action", DbType.Int16, 3);
                    DS = database.ExecuteDataSet(command);
                    return DS;

                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet GetVendorEmail(Vendor objVendor)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("sp_VendorEmail");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorId", DbType.Int16, objVendor.vendor_id);
                    database.AddInParameter(command, "@action", DbType.Int16, 2);
                    DS = database.ExecuteDataSet(command);
                    return DS;

                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet GetVendorEmailByAddress(Vendor objVendor)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("sp_VendorEmail");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorId", DbType.Int16, objVendor.vendor_id);
                    database.AddInParameter(command, "@AddressID", DbType.Int16, objVendor.AddressID);
                    database.AddInParameter(command, "@TempID", DbType.String, objVendor.TempID);
                    database.AddInParameter(command, "@action", DbType.Int16, 3);
                    DS = database.ExecuteDataSet(command);
                    return DS;

                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet GetVendorAddress(int VendorId)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("sp_VendorAddress");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorId", DbType.Int16, VendorId);
                    database.AddInParameter(command, "@action", DbType.Int16, 2);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet GetProductCategoryByVendorCatID(string VendorCategoryId)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("GetProductCategoryByVendorCatID");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorCategoryId", DbType.String, VendorCategoryId);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet GetVendorAddress(int VendorId, string TempID)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("sp_VendorAddress");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorId", DbType.Int16, VendorId);
                    database.AddInParameter(command, "@TempID", DbType.String, TempID);
                    database.AddInParameter(command, "@action", DbType.Int16, 4);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet GetVendorAddressByVendorID(int VendorId)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("UDP_SelectVendorAddressByVendorID");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorID", DbType.Int32, VendorId);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        //public DataTable SearchVendor(string searchString, string tableName)
        //{
        //    //List<string> searchResult = new List<string>();
        //    DataTable dt = new DataTable();
        //    try
        //    {
        //        string consString = ConfigurationManager.ConnectionStrings[DBConstants.CONFIG_CONNECTION_STRING_KEY].ConnectionString;
        //        using (SqlConnection con = new SqlConnection(consString))
        //        {
        //            using (SqlCommand cmd = new SqlCommand("sp_FindStringInTable"))
        //            {
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Connection = con;
        //                cmd.Parameters.AddWithValue("@stringToFind", "%" + searchString + "%");
        //                cmd.Parameters.AddWithValue("@table", "tblVendors");
        //                cmd.Parameters.AddWithValue("@stringToFind", searchString);
        //                SqlDataAdapter da = new SqlDataAdapter(cmd);
        //                da.Fill(dt);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    return dt;
        //}


        /// <summary>
        /// Load auto search suggestion as user types in search box for vendor
        /// </summary>
        /// <param name="strSearchString">string to search</param>
        /// <returns> Categorized search into fields like VendorId, VendorName, VendorCategoryId, ContactPerson, ContactNumber, Fax, Email, Address and BillingAddress </returns>
        public DataSet GetVendorSearchAutoSuggestion(string strSearchString)
        {
            DataSet result = new DataSet();
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("USP_LoadSearchVendorAutoSuggestion");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@stringToFind", DbType.String, strSearchString);
                    result = database.ExecuteDataSet(command);
                }
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public DataSet fetchvendorcategory(bool? Isretail_Wholesale, bool? IsManufacturer)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_fetchvendorcategory");
                    command.CommandType = CommandType.StoredProcedure;

          if(Isretail_Wholesale.HasValue)
                    database.AddInParameter(command, "@IsRetail_Wholesale", DbType.Boolean, Isretail_Wholesale);
          if (IsManufacturer.HasValue)
            database.AddInParameter(command, "@IsManufacturer", DbType.Boolean, IsManufacturer);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet GETInvetoryCatogriesList(string ManufactureType)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("GETInvetoryCatogriesList");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@ManufacturerType", DbType.String, ManufactureType);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool SaveVendorNotes(int VendorId, string UserId, string Notes, string TempId)
        {
            try
            {
                string consString = ConfigurationManager.ConnectionStrings[DBConstants.CONFIG_CONNECTION_STRING_KEY].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_vendorNotes"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@Notes", Notes);
                        cmd.Parameters.AddWithValue("@userid", UserId);
                        cmd.Parameters.AddWithValue("@VendorId", VendorId);
                        cmd.Parameters.AddWithValue("@TempId", TempId);
                        cmd.Parameters.AddWithValue("@action", 1);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public DataSet GetVendorNotes(int VendorId, string TempId)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("sp_vendorNotes");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@action", DbType.String, "2");
                    database.AddInParameter(command, "@TempId", DbType.String, TempId);
                    database.AddInParameter(command, "@VendorId", DbType.Int32, VendorId);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Returns all Vendor Notes based on VendorID 
        /// </summary>
        /// <param name="VendorID">int value</param>
        /// <returns>All Vendor Notes</returns>
        public DataSet GetVendorNotes(int VendorID)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_GetVendorNotes");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorId", DbType.String, VendorID.ToString());
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public DataSet GetVendorMaterialList(string ManufacturerType, string VendorId, string ProductCatId, string VendorCatId, string VendorSubCatId, string PeriodStart, string PeriodEnd, string PayPeriod)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("sp_GetVendorMaterialList");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@ManufacturerType", DbType.String, ManufacturerType);
                    database.AddInParameter(command, "@VendorId", DbType.String, VendorId);
                    database.AddInParameter(command, "@ProductCatId", DbType.String, ProductCatId);
                    database.AddInParameter(command, "@VendorCatId", DbType.String, VendorCatId);
                    database.AddInParameter(command, "@VendorSubCatId", DbType.String, VendorSubCatId);
                    database.AddInParameter(command, "@PeriodStart", DbType.String, PeriodStart);
                    database.AddInParameter(command, "@PeriodEnd", DbType.String, PeriodEnd);
                    database.AddInParameter(command, "@PayPeriod", DbType.String, PayPeriod);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet GetCategoryList(string ProductCategory, string VendorCategory, string action)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("sp_GetCategoryList");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@ProductCategory", DbType.String, ProductCategory);
                    database.AddInParameter(command, "@VendorCategory", DbType.String, VendorCategory);
                    database.AddInParameter(command, "@action", DbType.String, action);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataSet FetchCategories(string VendorId)
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("sp_FetchCategories");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@VendorId", DbType.String, VendorId);
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool SaveSku(clsSku objsku)
        {
            try
            {
                string consString = ConfigurationManager.ConnectionStrings[DBConstants.CONFIG_CONNECTION_STRING_KEY].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Sku"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@skuName", objsku.SkuName);
                        cmd.Parameters.AddWithValue("@TotalCost", objsku.TotalCost);
                        cmd.Parameters.AddWithValue("@UOM", objsku.UOM);
                        cmd.Parameters.AddWithValue("@Unit", objsku.Unit);
                        cmd.Parameters.AddWithValue("@CostDescription", objsku.CostDescription);
                        cmd.Parameters.AddWithValue("@VendorPart", objsku.VendorPart);
                        cmd.Parameters.AddWithValue("@Model", objsku.Model);
                        cmd.Parameters.AddWithValue("@Image", objsku.Image);
                        cmd.Parameters.AddWithValue("@action", "1");
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public DataSet GetSku()
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                DS = new DataSet();
                DbCommand command = database.GetStoredProcCommand("sp_Sku");
                command.CommandType = CommandType.StoredProcedure;
                database.AddInParameter(command, "@action", DbType.String, "2");
                DS = database.ExecuteDataSet(command);
                return DS;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool UpdateSku(clsSku objsku)
        {
            try
            {
                string consString = ConfigurationManager.ConnectionStrings[DBConstants.CONFIG_CONNECTION_STRING_KEY].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Sku"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@Id", objsku.Id);
                        cmd.Parameters.AddWithValue("@skuName", objsku.SkuName);
                        cmd.Parameters.AddWithValue("@TotalCost", objsku.TotalCost);
                        cmd.Parameters.AddWithValue("@UOM", objsku.UOM);
                        cmd.Parameters.AddWithValue("@Unit", objsku.Unit);
                        cmd.Parameters.AddWithValue("@CostDescription", objsku.CostDescription);
                        cmd.Parameters.AddWithValue("@VendorPart", objsku.VendorPart);
                        cmd.Parameters.AddWithValue("@Model", objsku.Model);
                        cmd.Parameters.AddWithValue("@Image", objsku.Image);
                        cmd.Parameters.AddWithValue("@action", "3");
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool DeleteSku(int skuId)
        {
            try
            {
                string consString = ConfigurationManager.ConnectionStrings[DBConstants.CONFIG_CONNECTION_STRING_KEY].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Sku"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@Id", skuId);
                        cmd.Parameters.AddWithValue("@action", "4");
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        public DataSet GetSupplierCatogriesList()
        {
            try
            {
                {
                    SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                    DS = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("GetSupplierCategoriesList");
                    command.CommandType = CommandType.StoredProcedure;
                    DS = database.ExecuteDataSet(command);
                    return DS;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool SaveSupSubCat(clsSupplierCategory obj)
        {
            try
            {
                string consString = ConfigurationManager.ConnectionStrings[DBConstants.CONFIG_CONNECTION_STRING_KEY].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Supplier"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@SupplierId", obj.SupplierId);
                        cmd.Parameters.AddWithValue("@SupplierSubCatName", obj.SupplierSubCatName);
                        cmd.Parameters.AddWithValue("@action", "1");
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool UpdateSupSubCat(clsSupplierCategory obj)
        {
            try
            {
                string consString = ConfigurationManager.ConnectionStrings[DBConstants.CONFIG_CONNECTION_STRING_KEY].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Supplier"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@SupplierId", obj.SupplierId);
                        cmd.Parameters.AddWithValue("@SupplierSubCatId", obj.SupplierSubCatId);
                        cmd.Parameters.AddWithValue("@SupplierSubCatName", obj.SupplierSubCatName);
                        cmd.Parameters.AddWithValue("@action", "2");
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool DeleteSupSubCat(clsSupplierCategory objNewSupSubCat)
        {
            try
            {
                string consString = ConfigurationManager.ConnectionStrings[DBConstants.CONFIG_CONNECTION_STRING_KEY].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Supplier"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@SupplierSubCatId", objNewSupSubCat.SupplierSubCatId);
                        cmd.Parameters.AddWithValue("@action", "3");
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public DataSet CheckDuplicateSource(string Source)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DataSet ds = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_CheckDuplicateSourceProc");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@Source", DbType.String, Source);
                    ds = database.ExecuteDataSet(command);
                    return ds;
                }
            }

            catch (Exception ex)
            {
                return null;

            }
        }

        public DataSet getSource()
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DataSet ds = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_GetSourceProc");
                    command.CommandType = CommandType.StoredProcedure;
                    ds = database.ExecuteDataSet(command);
                    return ds;
                }
            }

            catch (Exception ex)
            {
                return null;

            }
        }
        public DataSet AddSource(string Source)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DataSet ds = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("UDP_AddSourceProc");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@Source", DbType.String, Source);
                    ds = database.ExecuteDataSet(command);
                    return ds;
                }
            }

            catch (Exception ex)
            {
                return null;

            }
        }

        public void DeleteSource(string Source)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("UDP_DeleteSourceProc");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@Source", DbType.String, Source);
                    database.ExecuteScalar(command);
                }
            }
            catch (Exception ex)
            {

            }

        }

    }
}