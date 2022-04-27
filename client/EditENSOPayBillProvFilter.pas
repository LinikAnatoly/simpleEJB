
unit EditENSOPayBillProvFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOPayBillProvController ;

type
  TfrmENSOPayBillProvFilterEdit = class(TDialogForm)

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENSOPayBillProv: THTTPRIO;

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
  frmENSOPayBillProvFilterEdit: TfrmENSOPayBillProvFilterEdit;
  ENSOPayBillProvFilterObj: ENSOPayBillProvFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSOPayBillProvController  ;
}
{$R *.dfm}



procedure TfrmENSOPayBillProvFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtUserGen.Text := ENSOPayBillProvObj.userGen; 



      if ENSOPayBillProvObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSOPayBillProvObj.dateEdit.Year,ENSOPayBillProvObj.dateEdit.Month,ENSOPayBillProvObj.dateEdit.Day);
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



procedure TfrmENSOPayBillProvFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENSOPayBillProv: ENSOPayBillProvControllerSoapPort; //»сключено объ€вление не используемых переменных
begin
  if (ModalResult = mrOk)  then
  begin

     ENSOPayBillProvFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSOPayBillProvFilterObj.dateEdit = nil then
          ENSOPayBillProvFilterObj.dateEdit := TXSDateTime.Create;
       ENSOPayBillProvFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSOPayBillProvFilterObj.dateEdit := nil;




  end;
end;




end.