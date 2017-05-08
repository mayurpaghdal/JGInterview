using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using JG_Prospect.DAL;
using JG_Prospect.Common.modal;
namespace JG_Prospect.BLL
{
    public class VendorBLL
    {
        private static VendorBLL m_VendorBLL = new VendorBLL();
        private VendorBLL()
        {
        }
        public static VendorBLL Instance
        {
            get { return m_VendorBLL; }
            set {; }
        }
        public bool AddVendorQuotes(string soldJobId, string originalFileName, string temporaryFileName, int vendorId)
        {
            return VendorDAL.Instance.AddVendorQuotes(soldJobId, originalFileName, temporaryFileName, vendorId);
        }
        public void RemoveAttachedQuote(string file)
        {
            VendorDAL.Instance.RemoveAttachedQuote(file);
        }
        public bool UpdateAttachedQuote(string soldJobId, string originalFileName, string temporaryFileName, int vendorId)
        {
            return VendorDAL.Instance.UpdateAttachedQuote(soldJobId, originalFileName, temporaryFileName, vendorId);
        }
        public DataSet GetAllAttachedQuotes(string soldJobId)
        {
            DataSet ds = VendorDAL.Instance.GetAllAttachedQuotes(soldJobId);
            return ds;
        }

        public DataSet GetMaterialListData(string soldJobId, int CustomerId)
        {
            DataSet ds = VendorDAL.Instance.GetMaterialListData(soldJobId, CustomerId);
            return ds;
        }
        public DataSet GetVendorQuoteByVendorId(string soldJobId, int vendorId)
        {
            return VendorDAL.Instance.GetVendorQuoteByVendorId(soldJobId, vendorId);
        }

        public DataSet fetchallvendordetails()
        {
            return VendorDAL.Instance.fetchallvendorDetails();
        }
        public DataSet fetchallvendorcategory()
        {
            return VendorDAL.Instance.fetchallvendorcategory();
        }
        public DataSet fetchAllVendorCategoryHavingVendors()
        {
            return VendorDAL.Instance.fetchAllVendorCategoryHavingVendors();
        }
        public DataSet fetchMaterialListForEmail(string vendorCategory)
        {
            return VendorDAL.Instance.fetchMaterialListForEmail(vendorCategory);
        }

        public DataSet fetchVendorNamesByVendorCategory(int vendorCategoryId)
        {
            return VendorDAL.Instance.fetchVendorNamesByVendorCategory(vendorCategoryId);
        }
        public DataSet fetchVendorDetailsByVendorId(int vendorId)
        {
            return VendorDAL.Instance.fetchVendorDetailsByVendorId(vendorId);
        }
        public DataSet getVendorEmailId(string vendorName)
        {
            return VendorDAL.Instance.getVendorEmailId(vendorName);
        }

        public DataSet getVendorDetails(string VendorIds)
        {
            return VendorDAL.Instance.getVendorDetails(VendorIds);
        }

        public DataSet fetchVendorListByCategoryForEmail(int category)
        {
            return VendorDAL.Instance.fetchVendorListByCategoryForEmail(category);
        }
        /// <summary>
        /// This method will return one or more Vendors/
        /// </summary>
        /// <param name="pVendorIDs">Command separated vendor ids</param>
        /// <returns></returns>
        public DataSet GetVendors(string pVendorIDs)
        {
            return VendorDAL.Instance.GetVendors(pVendorIDs);
        }
        public bool deletevendor(int vendorid)
        {
            return VendorDAL.Instance.deletevendor(vendorid);
        }
        public bool deletevendorcategory(int vendorcategogyid)
        {
            return VendorDAL.Instance.deletevendorcategory(vendorcategogyid);
        }
        public Int32 savevendor(Vendor objvendor)
        {
            return VendorDAL.Instance.savevendor(objvendor);
        }
        public DataSet FetchvendorDetails(int vendorid)
        {
            return VendorDAL.Instance.FetchvendorDetails(vendorid);
        }
        public bool savevendorcatalogdetails(Vendor_Catalog objcatalog)
        {
            return VendorDAL.Instance.savevendorcatalogdetails(objcatalog);
        }
        public DataSet GetProductCategoryByVendorCatID(string VendorCategoryId)
        {
            return VendorDAL.Instance.GetProductCategoryByVendorCatID(VendorCategoryId);
        }
        public DataSet GetAllvendorDetails()
        {
            return VendorDAL.Instance.GetAllvendorDetails();
        }


        public DataSet GetVendorList(string FilterParams, string FilterBy, string ManufacturerType, string VendorCategoryId, string VendorStatus)
        {
            return VendorDAL.Instance.GetVendorList(FilterParams, FilterBy, ManufacturerType, VendorCategoryId, VendorStatus);
        }

        public DataSet GetVendorList(string strVendorStatus, bool IsRetailWholesale, string iProductCategoryID, string iVendorCategoryID, string iVendorSubCategoryID)
        {
            return VendorDAL.Instance.GetVendorList(strVendorStatus, IsRetailWholesale, iProductCategoryID, iVendorCategoryID, iVendorSubCategoryID);
        }

        public DataSet GetSearchedVendorByAutoSuggestion(string strCategorySelected, string strCategorySearchValue)
        {
            return VendorDAL.Instance.GetSearchedVendorByAutoSuggestion(strCategorySelected, strCategorySearchValue);
        }

        public string SaveNewVendorCategory(NewVendorCategory objNewVendorCat)
        {
            return VendorDAL.Instance.SaveNewVendorCategory(objNewVendorCat);
        }

        public bool SaveNewVendorProduct(NewVendorCategory objNewVendorCat)
        {
            return VendorDAL.Instance.SaveNewVendorProduct(objNewVendorCat);
        }
        public bool SaveNewVendorSubCat(VendorSubCategory objVendorsubCat)
        {
            return VendorDAL.Instance.SaveNewVendorSubCat(objVendorsubCat);
        }
        public bool UpdateVendorCategory(NewVendorCategory objVendorCat)
        {
            return VendorDAL.Instance.UpdateVendorCategory(objVendorCat);
        }
        public bool UpdateVendorSubCat(VendorSubCategory objVendorsubCat)
        {
            return VendorDAL.Instance.UpdateVendorSubCat(objVendorsubCat);
        }
        public bool DeleteVendorSubCat(VendorSubCategory objVendorsubCat)
        {
            return VendorDAL.Instance.DeleteVendorSubCat(objVendorsubCat);
        }
        public bool DeleteVendorDetail(string VendorId)
        {
            return VendorDAL.Instance.DeleteVendorDetail(VendorId);
        }
        public DataSet GetVendorSubCategory()
        {
            return VendorDAL.Instance.GetVendorSubCategory();
        }
        public bool InsertVendorEmail(DataTable tblVendorEmail, int addressID)
        {
            return VendorDAL.Instance.InsertVendorEmail(tblVendorEmail, addressID);
        }
        public DataSet GetVendorEmail(Vendor objVendor)
        {
            return VendorDAL.Instance.GetVendorEmail(objVendor);
        }

        public DataSet GetVendorEmailByAddress(Vendor objVendor)
        {
            return VendorDAL.Instance.GetVendorEmailByAddress(objVendor);
        }

        public int InsertVendorAddress(DataTable objvendor)
        {
            return VendorDAL.Instance.InsertVendorAddress(objvendor);
        }
        public DataSet GetALLVendorAddress(string manufacturer, string productId, string vendorCatId, string vendorSubCatId)
        {
            return VendorDAL.Instance.GetALLVendorAddress(manufacturer, productId, vendorCatId, vendorSubCatId);
        }
        public DataSet GetVendorAddress(int VendorId)
        {
            return VendorDAL.Instance.GetVendorAddress(VendorId);
        }

        public DataSet GetVendorAddress(int VendorId, string TempID)
        {
            return VendorDAL.Instance.GetVendorAddress(VendorId, TempID);
        }

        public DataSet GetVendorAddressByVendorID(int VendorId)
        {
            return VendorDAL.Instance.GetVendorAddressByVendorID(VendorId);
        }

        //public List<AutoCompleteVendor> SearchVendor(string searchString, string tableName)
        //{
        //    DataTable dt = VendorDAL.Instance.SearchVendor(searchString, tableName);
        //    List<AutoCompleteVendor> lstResult = new List<AutoCompleteVendor>();
        //    foreach (DataRow item in dt.Rows)
        //    {
        //        lstResult.Add(new AutoCompleteVendor
        //        {
        //            id = Convert.ToInt32(item["VendorId"].ToString()),
        //            label = Convert.ToString(item["VendorName"]),
        //            value = Convert.ToString(item["VendorName"]),
        //            addressId = Convert.ToString(item["addressId"])
        //        });
        //    }
        //    return lstResult;
        //}

        public DataSet GetVendorSearchAutoSuggestion(string strSearchString)
        {
            return VendorDAL.Instance.GetVendorSearchAutoSuggestion(strSearchString);
        }

        public DataSet fetchvendorcategory(bool? Isretail_Wholesale, bool? IsManufacturer)
        {
            return VendorDAL.Instance.fetchvendorcategory(Isretail_Wholesale, IsManufacturer);
        }

        public DataSet GETInvetoryCatogriesList(string ManufactureType)
        {
            return VendorDAL.Instance.GETInvetoryCatogriesList(ManufactureType);
        }

        public bool SaveVendorNotes(int VendorId, string UserId, string Notes, string TempId)
        {
            return VendorDAL.Instance.SaveVendorNotes(VendorId, UserId, Notes, TempId);
        }

        public DataSet GetVendorNotes(int VendorId, string TempId)
        {
            return VendorDAL.Instance.GetVendorNotes(VendorId, TempId);
        }

        public DataSet GetVendorNotes(int VendorId)
        {
            return VendorDAL.Instance.GetVendorNotes(VendorId);
        }

        public DataSet GetVendorMaterialList(string ManufacturerType, string VendorId, string ProductCatId, string VendorCatId, string VendorSubCatId, string PeriodStart, string PeriodEnd, string PayPeriod)
        {
            return VendorDAL.Instance.GetVendorMaterialList(ManufacturerType, VendorId, ProductCatId, VendorCatId, VendorSubCatId, PeriodStart, PeriodEnd, PayPeriod);
        }
        public DataSet GetCategoryList(string ProductCategory, string VendorCategory, string action)
        {
            return VendorDAL.Instance.GetCategoryList(ProductCategory, VendorCategory, action);
        }

        public DataSet FetchCategories(string VendorId)
        {
            return VendorDAL.Instance.FetchCategories(VendorId);
        }

        public bool SaveSku(clsSku objsku)
        {
            return VendorDAL.Instance.SaveSku(objsku);
        }
        public bool UpdateSku(clsSku objsku)
        {
            return VendorDAL.Instance.UpdateSku(objsku);
        }


        public DataSet GetSku()
        {
            return VendorDAL.Instance.GetSku();
        }

        public bool DeleteSku(int skuId)
        {
            return VendorDAL.Instance.DeleteSku(skuId);
        }

        public DataSet GetSupplierCatogriesList()
        {
            return VendorDAL.Instance.GetSupplierCatogriesList();
        }

        public bool SaveSupSubCat(clsSupplierCategory obj)
        {
            return VendorDAL.Instance.SaveSupSubCat(obj);
        }
        public bool UpdateSupSubCat(clsSupplierCategory obj)
        {
            return VendorDAL.Instance.UpdateSupSubCat(obj);
        }

        public bool DeleteSupSubCat(clsSupplierCategory objNewSupSubCat)
        {
            return VendorDAL.Instance.DeleteSupSubCat(objNewSupSubCat);
        }

        public DataSet CheckSource(string Source)
        {
            return VendorDAL.Instance.CheckDuplicateSource(Source);
        }

        public DataSet AddSource(string Source)
        {
            return VendorDAL.Instance.AddSource(Source);
        }

        public DataSet GetSource()
        {
            return VendorDAL.Instance.getSource();
        }

        public void DeleteSource(string Source)
        {
            VendorDAL.Instance.DeleteSource(Source);
        }
    }


    public class AutoCompleteVendor
    {
        public int id { get; set; }
        public string value { get; set; }
        public string label { get; set; }
        public string addressId { get; set; }
    }
}
