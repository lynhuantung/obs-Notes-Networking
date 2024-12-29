========================================== IIS ====================================
----------------- start iis web ---------------------------
Start-WebSite -Name "HRM8_HR_Service_6414"
Start-WebSite -Name "HRM8_Main_6412"
Start-WebSite -Name "HRM8_System_Service_6415"


----------------- stop iis web ---------------------------
Stop-WebSite -Name "HRM8_HR_Service_6414"
Stop-WebSite -Name "HRM8_Main_6412"
Stop-WebSite -Name "HRM8_System_Service_6415"


============================= HRM6 ==============================
Chi tiet nhan vien (tinh cong): ProfileDetail_AttendanceTableItem.ascx

============================= HRM7 ==============================

================ aspnet control register =============================================
<%@ Register Assembly="VnResource.WebControls" Namespace="VnResource.WebControls"       TagPrefix="vnr" %>
<%@ Register Src="~/BaseControls/Forms/VnrFileUpload.ascx" TagName="VnrFileUpload"              TagPrefix="vnr"  %>
<%@ Register Src="~/BaseControls/Forms/VnrTextBoxList.ascx" TagName="VnrTextBoxList"            TagPrefix="vnr"  %>
<%@ Register Src="~/BaseControls/Forms/VnrDropDownTree.ascx" TagName="VnrDropDownTree"   TagPrefix="vnr" %>
<%@ Register Src="~/BaseControls/Forms/VnrSearchControl.ascx" TagName="VnrSearchControl" TagPrefix="vnr"  %>
<%@ Register Src="~/BaseControls/Forms/VnrListControl.ascx" TagName="VnrListControl"                TagPrefix="vnr"  %>
   
   
prudential
<%@ Register Src="~/BaseControls/Forms/VnrAutoCompleteBox.ascx" TagPrefix="vnr" TagName="VnrAutoCompleteBox" %>

===========================================================
***create query string******
tao string[] : 

-UIController.CreateQueryString : dung để tạo query string

***get query string **********
 object shiftItemType = UIController.GetRequestValue(this.QueryObjectInfo, "ten tham so querystring");
 string id = Request.QueryString["ID"];
=======================

//QueryObjectInfo - chứa tất cả các keys của querystring trong đó có một số keys cố định 

// ben trang edit(man hinh moi) - get querystring
 object nameEntity = UIController.GetRequestValue(this.QueryObjectInfo, ClassNames.Cat_NameEntity);
 
 
 
 
 
 
================================ javascript ===================================

 
 
 =============================================================
 ** UIController: *****
Get querystring : GetRequestValue

//properties
- ObjectSource//1 record (dùng cho view)
- DataSource ; //nhieu record (dùng cho list)

//OnSaveChange - modify flow 
-  OnValidateData(..) //Kiểm tra tính hợp lệ của dữ liệu trước khi lưu.
-  OnBeforeSave(..);//Khai báo những việc cần làm trước khi lưu. 
-  OnAfterSave(..);//Khai báo những việc làm sau khi lưu thành công.


 
 ==============================================================

// Edit 
  void ListControl1_EditButtonClick(object sender, System.ComponentModel.CancelEventArgs e)
        {
            //    Session["NameEntity"] = EntityType.E_COMPUTING_TYPE.ToString();
            //    string[] strings = new string[] { QueryObjects.EntityType + "=" + ClassNames.Cat_NameEntity };
            //    string querystring = Common.GetQueryString("NameEntity", ID, FormEditStyle.E_EDIT_OBJECT, strings);
            //    string title = LanguageManager.GetString(ClassNames.Cat_NameEntity);
            //    UIController.CreateWindow(UIController.CreateEditWindowUrl(querystring), title);

				List<Guid> listSelectedID = (List<Guid>)sender;
				if (listSelectedID != null && listSelectedID.Count() > 0)
				{
					string[] strings = new string[] { ClassNames.Cat_NameEntity + "=" + EntityType.E_COMPUTING_TYPE.ToString() };
					string querystring = UIController.CreateQueryString(EditFormType.Modify, typeof(Cat_NameEntity), listSelectedID.FirstOrDefault(), strings);
					UIController.CreateWindow(UIController.CreateModifyWindowUrl(querystring), typeof(Cat_NameEntity).Name );
				}
        }

// TAO MOI 		
        void ListControl1_CreateButtonClick(object sender, System.ComponentModel.CancelEventArgs e)
        {           
	            string[] strings = new string[] { ClassNames.Cat_NameEntity + "=" + EntityType.E_COMPUTING_TYPE.ToString() };
	            string querystring = UIController.CreateQueryString(EditFormType.Create, typeof(Cat_NameEntity), Guid.Empty, strings);
	            UIController.CreateWindow(UIController.CreateModifyWindowUrl(querystring),  typeof(Cat_NameEntity).Name);
        }
		
		
		
	++++++++++++ modify +++++++++++++
 protected override void InitDataBinding()
        {
            base.InitDataBinding();
            Cat_NameEntity entity = ObjectSource as Cat_NameEntity;
            
            if (entity != null)
            {
                object nameEntity = UIController.GetRequestValue(this.QueryObjectInfo, ClassNames.Cat_NameEntity);
                entity.NameEntityType = nameEntity.GetString();                
            }
        }	
		
		
///////////////////////////// VnrListControl /////////////////////////////////////////////////////////
event :
- ManualPredicate : su kien sua lai predicate bằng tay		
		

///////////////////// khoi tao cho report ////////////////////////////////////////
//ban 7 
   VnrSearchControl.ShowSearchButton = true;
   VnrSearchControl.ShowExportButton = true;
   VnrListControl.ShowSearchControl = false;
   VnrListControl.ShowRowDeleteCommand = false;
   VnrListControl.ShowRowEditCommand = false;
   VnrListControl.ShowTopCommandBar = false;
   VnrListControl.ShowChangeColumnButton = false;
   VnrListControl.ShowCreateButton = false;
   VnrListControl.ShowDeleteButton = false;
   VnrListControl.ShowEditButton = false;
   VnrListControl.ShowMarkLabelButton = false;
   VnrListControl.Properties.ShowRowDeleteCommand = false;
   VnrListControl.Properties.ShowRowEditCommand = false;
   VnrListControl.GridPanel.RemotePaging = false;
   VnrListControl.Properties.AutoLoad = false;



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		file Messages chứa các const thông báo,
		file DefaultFieldNames chứa các định danh là tên column thường sử dụng chung nhu ID, ProfileID…, 
		sub-class FieldNames trong mỗi Db-class chứa các biến định danh là column, field…,
		file InstanceNames chứa những biến định danh khác…
		file UserDatObject : luu cac class custom của user
		
		
		
		
		
================================= PHAN QUYEN arts ====================================================
** officeNumber : List<int>
- Nếu officeNumber count ==0 : tất cả các quyền (branch:0x)
- Nếu officeNumber[0] == 0 : khong co quyền vào van phong (branch :0x01)
		
============================================================ JS ===========================================================
KHI VAO FUNCTION
this.originalValue (value cũ)
this.value (value mới

/////////////////////////////// screen_info Name //////////////////////////////////////////////////////

		
////////////////////////////////////////////////////////////////////////////////////////////////	
 $(document).ready(function() {
    $.get('review_list.html')
             .success(function(data) {
                 $('#revw').html(data);
             });
    });


