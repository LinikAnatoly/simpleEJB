
unit EditENGPSTrackerFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENGPSTrackerController ;

type
  TfrmENGPSTrackerFilterEdit = class(TDialogForm)

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


  HTTPRIOENGPSTracker: THTTPRIO;

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
  frmENGPSTrackerFilterEdit: TfrmENGPSTrackerFilterEdit;
  ENGPSTrackerFilterObj: ENGPSTrackerFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENGPSTrackerController  ;
}
{$R *.dfm}



procedure TfrmENGPSTrackerFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtReg_id
      ,edtPhoneNumber
      ,edtCardNumber
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtReg_id.Text := ENGPSTrackerObj.reg_id; 



    edtPhoneNumber.Text := ENGPSTrackerObj.phoneNumber; 



    edtCardNumber.Text := ENGPSTrackerObj.cardNumber; 



    edtUserGen.Text := ENGPSTrackerObj.userGen; 



      if ENGPSTrackerObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENGPSTrackerObj.dateEdit.Year,ENGPSTrackerObj.dateEdit.Month,ENGPSTrackerObj.dateEdit.Day);
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



procedure TfrmENGPSTrackerFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENGPSTracker: ENGPSTrackerControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENGPSTrackerFilterObj.reg_id := edtReg_id.Text; 



     ENGPSTrackerFilterObj.phoneNumber := edtPhoneNumber.Text; 



     ENGPSTrackerFilterObj.cardNumber := edtCardNumber.Text; 



     ENGPSTrackerFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENGPSTrackerFilterObj.dateEdit = nil then
          ENGPSTrackerFilterObj.dateEdit := TXSDateTime.Create;
       ENGPSTrackerFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENGPSTrackerFilterObj.dateEdit := nil;




  end;
end;




end.