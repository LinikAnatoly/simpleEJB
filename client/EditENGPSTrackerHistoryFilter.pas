
unit EditENGPSTrackerHistoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENGPSTrackerHistoryController ;

type
  TfrmENGPSTrackerHistoryFilterEdit = class(TDialogForm)

    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblReg_id : TLabel;
    edtReg_id: TEdit;

    lblPhoneNumber : TLabel;
    edtPhoneNumber: TEdit;

    lblCardNumber : TLabel;
    edtCardNumber: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENGPSTrackerHistory: THTTPRIO;

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
  frmENGPSTrackerHistoryFilterEdit: TfrmENGPSTrackerHistoryFilterEdit;
  ENGPSTrackerHistoryFilterObj: ENGPSTrackerHistoryFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENGPSTrackerHistoryController  ;
}
{$R *.dfm}



procedure TfrmENGPSTrackerHistoryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateStart
      ,edtReg_id
      ,edtPhoneNumber
      ,edtCardNumber
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENGPSTrackerHistoryObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENGPSTrackerHistoryObj.dateStart.Year,ENGPSTrackerHistoryObj.dateStart.Month,ENGPSTrackerHistoryObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;



      if ENGPSTrackerHistoryObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENGPSTrackerHistoryObj.dateFinal.Year,ENGPSTrackerHistoryObj.dateFinal.Month,ENGPSTrackerHistoryObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;



    edtReg_id.Text := ENGPSTrackerHistoryObj.reg_id; 



    edtPhoneNumber.Text := ENGPSTrackerHistoryObj.phoneNumber; 



    edtCardNumber.Text := ENGPSTrackerHistoryObj.cardNumber; 



    edtUserGen.Text := ENGPSTrackerHistoryObj.userGen; 



      if ENGPSTrackerHistoryObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENGPSTrackerHistoryObj.dateEdit.Year,ENGPSTrackerHistoryObj.dateEdit.Month,ENGPSTrackerHistoryObj.dateEdit.Day);
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



procedure TfrmENGPSTrackerHistoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENGPSTrackerHistory: ENGPSTrackerHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateStart.checked then
     begin 
       if ENGPSTrackerHistoryFilterObj.dateStart = nil then
          ENGPSTrackerHistoryFilterObj.dateStart := TXSDate.Create;
       ENGPSTrackerHistoryFilterObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENGPSTrackerHistoryFilterObj.dateStart := nil;



     if edtdateFinal.checked then
     begin 
       if ENGPSTrackerHistoryFilterObj.dateFinal = nil then
          ENGPSTrackerHistoryFilterObj.dateFinal := TXSDate.Create;
       ENGPSTrackerHistoryFilterObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENGPSTrackerHistoryFilterObj.dateFinal := nil;



     ENGPSTrackerHistoryFilterObj.reg_id := edtReg_id.Text; 



     ENGPSTrackerHistoryFilterObj.phoneNumber := edtPhoneNumber.Text; 



     ENGPSTrackerHistoryFilterObj.cardNumber := edtCardNumber.Text; 



     ENGPSTrackerHistoryFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENGPSTrackerHistoryFilterObj.dateEdit = nil then
          ENGPSTrackerHistoryFilterObj.dateEdit := TXSDateTime.Create;
       ENGPSTrackerHistoryFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENGPSTrackerHistoryFilterObj.dateEdit := nil;




  end;
end;




end.