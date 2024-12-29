nếu user adminstrator thì => Vnr\Administrator
-------------------- Cach kiem tra va undo code tu TFS bang console cmd ----------------------

1. Mở CMD (Administrator)
2. thực hiện lệnh
   Cd\
   Cd "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE>"
3. Xem trạng thai
   tf status /workspace:"TUNGLY-PC;thanh.luu" /collection:"http://192.168.1.7:8080/tfs/DefaultCollection"
4. undo
- tf undo /workspace:"TUNGLY-PC;thanh.luu" /collection:"http://192.168.1.7:8080/tfs/DefaultCollection" "$/HRM6.0/WorkingCode20101025/VnResourceWeb/WebSites/VnResourceWeb/Attendance/Views/LeaveDay_List.aspx.cs"   
   
5. undo toan bo hrm   
tf undo /workspace:"THANHLUU-PC;thanh.luu" /collection:"http://192.168.1.7:8080/tfs/DefaultCollection" "$/hrm/*" /recursive




--------------- test --------------
 Cd\
   Cd "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE>"


tf status /workspace:"TUNGLY-PC;tung.ly" /collection:"http://192.168.1.7:8080/tfs/DefaultCollection"


tf status /workspace:"HIENLE;hien.le" /collection:"http://192.168.1.7:8080/tfs/DefaultCollection"

tf undo /workspace:"HIENLE;hien.le" /collection:"http://192.168.1.7:8080/tfs/DefaultCollection" "$/HRM9/Main/Source/Presentation/HRM.Presentation.Main/Settings/FIELD_COLOR.XML"   




tf undo /workspace:"DESKTOP-GVLQDRG;cuong.hoang" /collection:"http://192.168.1.7:8080/tfs/DefaultCollection" "$/HRM9/Main/Source/Presentation/HRM.Presentation.Main/Views/Cat_Document/Index.cshtml"   
tf undo /workspace:"DESKTOP-GVLQDRG;cuong.hoang" /collection:"http://192.168.1.7:8080/tfs/DefaultCollection" "$/HRM9/Main/Source/Presentation/HRM.Presentation.Main/Views/Cat_Position/PositionQuitWorkListInfo.cshtml"   

 
 
  tf status /workspace:"NHAN-PC;nhan.tran" /collection:"$/HRM9/Main/Source/Presentation/HRM.Presentation.Main/Settings/LANG_VN.XML"
  
tf undo /workspace:"NHAN-PC;nhan.tran" /collection:"http://192.168.1.7:8080/tfs/DefaultCollection" "$/HRM9/Main/Source/Presentation/HRM.Presentation.Main/Settings/LANG_VN.XML"   



----------------- test -----------
 tf status /workspace:"CPU23-TRUNGPHAM;tu.nguyedinh" /collection:"http://172.21.100.7:8080/tfs/DefaultCollection"


tf undo /workspace:"CPU23-TRUNGPHAM;tu.nguyedinh" /collection:"http://172.21.100.7:8080/tfs/DefaultCollection" "$/HRM9/Branch-Source/Main-branch_pass_v8.7.13.01_TLG/Source/Presentation/HRM.Presentation.Hr.Service/Controllers/Att_GetDataController.cs"   