
unit EditENServicesObject2PaymentSchedule;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesObject2PaymentScheduleController ;

type
  TfrmENServicesObject2PaymentScheduleEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblStartDate : TLabel;
    edtStartDate: TDateTimePicker;
    lblEndDate : TLabel;
    edtEndDate: TDateTimePicker;
    lblPaySum : TLabel;
    edtPaySum: TEdit;


  HTTPRIOENServicesObject2PaymentSchedule: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

  servicesObject : Integer;
  
end;

var
  frmENServicesObject2PaymentScheduleEdit: TfrmENServicesObject2PaymentScheduleEdit;
  ENServicesObject2PaymentScheduleObj: ENServicesObject2PaymentSchedule;

implementation


{uses  
    EnergyproController, EnergyproController2, ENServicesObject2PaymentScheduleController  ;
}
{$R *.dfm}



procedure TfrmENServicesObject2PaymentScheduleEdit.FormShow(Sender: TObject);

begin

  SetFloatStyle([edtPaySum]); 

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtStartDate
      ,edtEndDate
      ,edtPaySum
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENServicesObject2PaymentScheduleObj.code);
      if ENServicesObject2PaymentScheduleObj.startDate <> nil then
      begin
        edtStartDate.DateTime:=EncodeDate(ENServicesObject2PaymentScheduleObj.startDate.Year,ENServicesObject2PaymentScheduleObj.startDate.Month,ENServicesObject2PaymentScheduleObj.startDate.Day);
        edtStartDate.checked := true;
      end
      else
      begin
        edtStartDate.DateTime:=SysUtils.Date;
        edtStartDate.checked := false;
      end;
      if ENServicesObject2PaymentScheduleObj.endDate <> nil then
      begin
        edtEndDate.DateTime:=EncodeDate(ENServicesObject2PaymentScheduleObj.endDate.Year,ENServicesObject2PaymentScheduleObj.endDate.Month,ENServicesObject2PaymentScheduleObj.endDate.Day);
        edtEndDate.checked := true;
      end
      else
      begin
        edtEndDate.DateTime:=SysUtils.Date;
        edtEndDate.checked := false;
      end;
    if ( ENServicesObject2PaymentScheduleObj.paySum <> nil ) then
       edtPaySum.Text := ENServicesObject2PaymentScheduleObj.paySum.decimalString
    else
       edtPaySum.Text := ''; 


  end;
end;



procedure TfrmENServicesObject2PaymentScheduleEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesObject2PaymentSchedule: ENServicesObject2PaymentScheduleControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([ edtPaySum
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENServicesObject2PaymentSchedule := HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;


     if edtstartDate.checked then
     begin 
       if ENServicesObject2PaymentScheduleObj.startDate = nil then
          ENServicesObject2PaymentScheduleObj.startDate := TXSDate.Create;
       ENServicesObject2PaymentScheduleObj.startDate.XSToNative(GetXSDate(edtstartDate.DateTime));
     end
     else
       ENServicesObject2PaymentScheduleObj.startDate := nil;

     if edtendDate.checked then
     begin 
       if ENServicesObject2PaymentScheduleObj.endDate = nil then
          ENServicesObject2PaymentScheduleObj.endDate := TXSDate.Create;
       ENServicesObject2PaymentScheduleObj.endDate.XSToNative(GetXSDate(edtendDate.DateTime));
     end
     else
       ENServicesObject2PaymentScheduleObj.endDate := nil;

     if (ENServicesObject2PaymentScheduleObj.paySum = nil ) then
       ENServicesObject2PaymentScheduleObj.paySum := TXSDecimal.Create;
     if edtPaySum.Text <> '' then
       ENServicesObject2PaymentScheduleObj.paySum.decimalString := edtPaySum.Text 
     else
       ENServicesObject2PaymentScheduleObj.paySum := nil;

    if DialogState = dsInsert then
    begin
      ENServicesObject2PaymentScheduleObj.code:=low(Integer);
      TempENServicesObject2PaymentSchedule.add(ENServicesObject2PaymentScheduleObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENServicesObject2PaymentSchedule.save(ENServicesObject2PaymentScheduleObj);
    end;
  end;
end;


end.