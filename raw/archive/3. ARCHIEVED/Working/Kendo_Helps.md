
========================= Lay danh sach du lieu cua Grid =====================================
var grid = $('#gridAtt_RosterGroup').data("kendoGrid");
var selectedItem = grid.dataItem(grid.select());

===========  Lay gia tri cua dropdownlist =====================
  var MealAllowanceTypeName1 = $("#ten_dropdownlist").data("kendoDropDownList");
 var valueDropdown = MealAllowanceTypeName1.value();

 $("#cmb").data("kendoComboBox").value(null);//clear selected value
 
========= Lay giá trị của DatePicker ==============================================
$('#Year').data("kendoDatePicker").value()
 
===========  Set datasource cho	 multiSelect ===================== 
    var multi = $(evaluatorId).data("kendoMultiSelect");
    multi.setDataSource(data);
 
 //hien thi tat ca item trong multi
	var kendoDataId = [1,2,3]; 
    var multi = $("#EvaluatorID").data("kendoMultiSelect");            
    multi.value(kendoDataId);//hien thi tat ca item trong multi
 
============== window ==================
 var window = $("#Window").data("kendoWindow");
  window.refresh({
             url: "/Order/LaunchWindow"        
     });      
     window.center();
     window.open();
	 
=============== tabs =======================
var tabStrip = $("#ten_tabstrip").kendoTabStrip().data("kendoTabStrip");
var tabIndex = tabStrip.select().index();//lấy vi trí tab
var tabName = tabStrip.select().text();//lấy text




=========================================================================================
       var datestart = ConvertDatetime('@_hrm_Sys_Service' + 'Sys_GetData/GetFormatDate/', $("#DateStart").val());