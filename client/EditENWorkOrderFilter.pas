
unit EditENWorkOrderFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkOrderController ;

type
  TfrmENWorkOrderFilterEdit = class(TDialogForm)

    lblWorkOrderNumber : TLabel;
    edtWorkOrderNumber: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
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

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbENWorkOrderStatusStatusWorkOrderClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENWorkOrderFilterEdit: TfrmENWorkOrderFilterEdit;
  ENWorkOrderFilterObj: ENWorkOrderFilter;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowENWorkOrderStatus
  ,ENWorkOrderStatusController
;

{uses  
    EnergyproController, EnergyproController2, ENWorkOrderController  ;
}
{$R *.dfm}



procedure TfrmENWorkOrderFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtFinMolCode
      ,edtFinMolName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtWorkOrderNumber.Text := ENWorkOrderObj.workOrderNumber; 



      if ENWorkOrderObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENWorkOrderObj.dateGen.Year,ENWorkOrderObj.dateGen.Month,ENWorkOrderObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    edtCommentGen.Text := ENWorkOrderObj.commentGen; 



    edtFinMolCode.Text := ENWorkOrderObj.finMolCode; 



    edtFinMolName.Text := ENWorkOrderObj.finMolName; 



    edtFinMechanicCode.Text := ENWorkOrderObj.finMechanicCode; 



    edtFinMechanicName.Text := ENWorkOrderObj.finMechanicName; 



    edtUserGen.Text := ENWorkOrderObj.userGen; 



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


  end;

}

end;



procedure TfrmENWorkOrderFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWorkOrder: ENWorkOrderControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENWorkOrderFilterObj.workOrderNumber := edtWorkOrderNumber.Text; 



     if ENWorkOrderFilterObj.dateGen = nil then
        ENWorkOrderFilterObj.dateGen := TXSDate.Create;
      ENWorkOrderFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));




     ENWorkOrderFilterObj.commentGen := edtCommentGen.Text; 



     ENWorkOrderFilterObj.finMolCode := edtFinMolCode.Text; 



     ENWorkOrderFilterObj.finMolName := edtFinMolName.Text; 



     ENWorkOrderFilterObj.finMechanicCode := edtFinMechanicCode.Text; 



     ENWorkOrderFilterObj.finMechanicName := edtFinMechanicName.Text; 



     ENWorkOrderFilterObj.userGen := edtUserGen.Text; 



     if ENWorkOrderFilterObj.dateEdit = nil then
        ENWorkOrderFilterObj.dateEdit := TXSDate.Create;
      ENWorkOrderFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));





  end;
end;

procedure TfrmENWorkOrderFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);
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
               if ENWorkOrderFilterObj.department = nil then ENWorkOrderFilterObj.department := ENDepartment.Create();
               ENWorkOrderFilterObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
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


procedure TfrmENWorkOrderFilterEdit.spbENWorkOrderStatusStatusWorkOrderClick(Sender : TObject);
var 
   frmENWorkOrderStatusShow: TfrmENWorkOrderStatusShow;
begin
   frmENWorkOrderStatusShow:=TfrmENWorkOrderStatusShow.Create(Application,fmNormal);
   try
      with frmENWorkOrderStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENWorkOrderFilterObj.statusWorkOrder = nil then ENWorkOrderFilterObj.statusWorkOrder := ENWorkOrderStatus.Create();
               ENWorkOrderFilterObj.statusWorkOrder.code := StrToInt(GetReturnValue(sgENWorkOrderStatus,0));
               edtENWorkOrderStatusStatusWorkOrderName.Text:=GetReturnValue(sgENWorkOrderStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENWorkOrderStatusShow.Free;
   end;
end;





end.