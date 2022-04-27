
unit EditENServicesObject2PaymentScheduleFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesObject2PaymentScheduleController ;

type
  TfrmENServicesObject2PaymentScheduleFilterEdit = class(TDialogForm)

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

end;

var
  frmENServicesObject2PaymentScheduleFilterEdit: TfrmENServicesObject2PaymentScheduleFilterEdit;
  ENServicesObject2PaymentScheduleFilterObj: ENServicesObject2PaymentScheduleFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENServicesObject2PaymentScheduleController  ;
}
{$R *.dfm}



procedure TfrmENServicesObject2PaymentScheduleFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtStartDate
      ,edtEndDate
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

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

}

end;



procedure TfrmENServicesObject2PaymentScheduleFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesObject2PaymentSchedule: ENServicesObject2PaymentScheduleControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtstartDate.checked then
     begin 
       if ENServicesObject2PaymentScheduleFilterObj.startDate = nil then
          ENServicesObject2PaymentScheduleFilterObj.startDate := TXSDate.Create;
       ENServicesObject2PaymentScheduleFilterObj.startDate.XSToNative(GetXSDate(edtstartDate.DateTime));
     end
     else
       ENServicesObject2PaymentScheduleFilterObj.startDate := nil;



     if edtendDate.checked then
     begin 
       if ENServicesObject2PaymentScheduleFilterObj.endDate = nil then
          ENServicesObject2PaymentScheduleFilterObj.endDate := TXSDate.Create;
       ENServicesObject2PaymentScheduleFilterObj.endDate.XSToNative(GetXSDate(edtendDate.DateTime));
     end
     else
       ENServicesObject2PaymentScheduleFilterObj.endDate := nil;



     if (ENServicesObject2PaymentScheduleFilterObj.paySum = nil ) then
       ENServicesObject2PaymentScheduleFilterObj.paySum := TXSDecimal.Create;
     if edtPaySum.Text <> '' then
       ENServicesObject2PaymentScheduleFilterObj.paySum.decimalString := edtPaySum.Text 
     else
       ENServicesObject2PaymentScheduleFilterObj.paySum := nil;





  end;
end;




end.