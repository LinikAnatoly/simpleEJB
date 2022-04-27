
unit EditENWorkOrder;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkOrderController
  , ENWorkOrder2ENPlanWorkController
   ;

type
  TfrmENWorkOrderEdit = class(TDialogForm)

    lblWorkOrderNumber : TLabel;
    edtWorkOrderNumber: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblFinMolCode : TLabel;
    edtFinMolCode: TEdit;
    lblFinMolName : TLabel;
    edtFinMolName: TEdit;
    lblFinMechanicCode : TLabel;
    edtFinMechanicCode: TEdit;
    lblFinMechanicName : TLabel;
    edtFinMechanicName: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  
  lblENWorkOrderStatusStatusWorkOrderName : TLabel;
  edtENWorkOrderStatusStatusWorkOrderName : TEdit;
  spbENWorkOrderStatusStatusWorkOrder : TSpeedButton;
  

  HTTPRIOENWorkOrder: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbFINMol: TSpeedButton;
    spbFINMechanic: TSpeedButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    HTTPRIOENWorkOrder2ENPlanWork: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbENWorkOrderStatusStatusWorkOrderClick(Sender : TObject);
    procedure spbFINMolClick(Sender: TObject);
    procedure spbFINMechanicClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENWorkOrderEdit: TfrmENWorkOrderEdit;
  ENWorkOrderObj: ENWorkOrder;
  ENWorkOrder2ENPlanWorkObj: ENWorkOrder2ENPlanWork;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowENWorkOrderStatus
  ,ENWorkOrderStatusController
, FINMolController, ShowFINMol, ENDepartment2EPRenController, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENWorkOrderController  ;
}
{$R *.dfm}



procedure TfrmENWorkOrderEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtFinMolCode, edtFinMolName, edtFinMechanicCode, edtFinMechanicName]);
    DenyBlankValues([
      //edtFinMolCode,
      edtWorkOrderNumber,
      edtDateGen,
      edtFinMolName,
      edtFinMechanicName
     ]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtWorkOrderNumber.Text := ENWorkOrder2ENPlanWorkObj.workOrder.workOrderNumber;
      if ENWorkOrder2ENPlanWorkObj.workOrder.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENWorkOrder2ENPlanWorkObj.workOrder.dateGen.Year,ENWorkOrder2ENPlanWorkObj.workOrder.dateGen.Month,ENWorkOrder2ENPlanWorkObj.workOrder.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    MakeMultiline(edtCommentGen.Lines, ENWorkOrder2ENPlanWorkObj.workOrder.commentGen);
    edtFinMolCode.Text := ENWorkOrder2ENPlanWorkObj.workOrder.finMolCode;
    edtFinMolName.Text := ENWorkOrder2ENPlanWorkObj.workOrder.finMolName;
    edtFinMechanicCode.Text := ENWorkOrder2ENPlanWorkObj.workOrder.finMechanicCode;
    edtFinMechanicName.Text := ENWorkOrder2ENPlanWorkObj.workOrder.finMechanicName;
{
    edtUserGen.Text := ENWorkOrder2ENPlanWorkObj.workOrder.userGen;
      if ENWorkOrderObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENWorkOrderObj.dateEdit.Year,ENWorkOrderObj.dateEdit.Month,ENWorkOrderObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

    edtENDepartmentDepartmentName.Text := ENWorkOrderObj.department.name;
    edtENWorkOrderStatusStatusWorkOrderName.Text := ENWorkOrderObj.statusWorkOrder.name;
}
  end;
end;



procedure TfrmENWorkOrderEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
   TempENWorkOrder: ENWorkOrderControllerSoapPort;
   TempENWorkOrder2ENPlanWork : ENWorkOrder2ENPlanWorkControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      //edtFinMolCode,
      edtWorkOrderNumber,
      edtDateGen,
      edtFinMolName,
      edtFinMechanicName
     ])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    //TempENWorkOrder := HTTPRIOENWorkOrder as ENWorkOrderControllerSoapPort;


     ENWorkOrder2ENPlanWorkObj.workOrder.workOrderNumber := edtWorkOrderNumber.Text;

     if edtdateGen.checked then
     begin 
       if ENWorkOrder2ENPlanWorkObj.workOrder.dateGen = nil then
          ENWorkOrder2ENPlanWorkObj.workOrder.dateGen := TXSDate.Create;
       ENWorkOrder2ENPlanWorkObj.workOrder.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENWorkOrder2ENPlanWorkObj.workOrder.dateGen := nil;

     ENWorkOrder2ENPlanWorkObj.workOrder.commentGen := edtCommentGen.Text;

     ENWorkOrder2ENPlanWorkObj.workOrder.finMolCode := edtFinMolCode.Text;

     ENWorkOrder2ENPlanWorkObj.workOrder.finMolName := edtFinMolName.Text;

     ENWorkOrder2ENPlanWorkObj.workOrder.finMechanicCode := edtFinMechanicCode.Text;

     ENWorkOrder2ENPlanWorkObj.workOrder.finMechanicName := edtFinMechanicName.Text;

     //.userGen := edtUserGen.Text;
     {
     if edtdateEdit.checked then
     begin
       if ENWorkOrderObj.dateEdit = nil then
          ENWorkOrderObj.dateEdit := TXSDate.Create;
       ENWorkOrderObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENWorkOrderObj.dateEdit := nil;
     }

    TempENWorkOrder2ENPlanWork := HTTPRIOENWorkOrder2ENPlanWork as ENWorkOrder2ENPlanWorkControllerSoapPort;
         
    if DialogState = dsInsert then
    begin
      //ENWorkOrderObj.code:=low(Integer);
      //TempENWorkOrder.add(ENWorkOrderObj);
      //TempENWorkOrder2ENPlanWork.add(ENWorkOrder2ENPlanWorkObj);
      TempENWorkOrder2ENPlanWork.addWithCheck(ENWorkOrder2ENPlanWorkObj,true);{SUPP-104240}
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWorkOrder2ENPlanWork.save(ENWorkOrder2ENPlanWorkObj);
    end;
  end;
end;


procedure TfrmENWorkOrderEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
{
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENWorkOrderObj.department = nil then ENWorkOrderObj.department := ENDepartment.Create();
               ENWorkOrderObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
               edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
   }
end;



procedure TfrmENWorkOrderEdit.spbENWorkOrderStatusStatusWorkOrderClick(Sender : TObject);
//var
//   frmENWorkOrderStatusShow: TfrmENWorkOrderStatusShow;
begin
{   frmENWorkOrderStatusShow:=TfrmENWorkOrderStatusShow.Create(Application,fmNormal);
   try
      with frmENWorkOrderStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENWorkOrderObj.statusWorkOrder = nil then ENWorkOrderObj.statusWorkOrder := ENWorkOrderStatus.Create();
               ENWorkOrderObj.statusWorkOrder.code := StrToInt(GetReturnValue(sgENWorkOrderStatus,0));
               edtENWorkOrderStatusStatusWorkOrderName.Text:=GetReturnValue(sgENWorkOrderStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENWorkOrderStatusShow.Free;
   end;}
end;



procedure TfrmENWorkOrderEdit.spbFINMolClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // –Ё—ы и ћќЋы
      //plan := DMReports.getPlanByCode(planCode);

   if ENWorkOrder2ENPlanWorkObj.workOrder.department <> nil then
     if ENWorkOrder2ENPlanWorkObj.workOrder.department.code <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code :=  ENWorkOrder2ENPlanWorkObj.workOrder.department.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);
   try
      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtFinMolCode.Text := GetReturnValue(sgFINMol,0);
               edtFINMolName.Text := GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               ENWorkOrder2ENPlanWorkObj.workOrder.finMolCode := GetReturnValue(sgFINMol,0);
               ENWorkOrder2ENPlanWorkObj.workOrder.finMolName := GetReturnValue(sgFINMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
 {

 if not Assigned(frmFINMolShow) then
    frmFINMolShow := TfrmFINMolShow.Create(Application,fmChild,f);
 frmFINMolShow.Show;
 }


end;

procedure TfrmENWorkOrderEdit.spbFINMechanicClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // –Ё—ы и ћќЋы
      //plan := DMReports.getPlanByCode(planCode);

   if ENWorkOrder2ENPlanWorkObj.workOrder.department <> nil then
     if ENWorkOrder2ENPlanWorkObj.workOrder.department.code <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code :=  ENWorkOrder2ENPlanWorkObj.workOrder.department.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);
   try
      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtFinMechanicCode.Text:= GetReturnValue(sgFINMol,0);
               edtFinMechanicName.Text:= GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               ENWorkOrder2ENPlanWorkObj.workOrder.finMechanicCode := GetReturnValue(sgFINMol,0);
               ENWorkOrder2ENPlanWorkObj.workOrder.finMechanicName := GetReturnValue(sgFINMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
 {

 if not Assigned(frmFINMolShow) then
    frmFINMolShow := TfrmFINMolShow.Create(Application,fmChild,f);
 frmFINMolShow.Show;
 }

end;

end.