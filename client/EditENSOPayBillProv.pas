
unit EditENSOPayBillProv;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOPayBillProvController ;

type
  TfrmENSOPayBillProvEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
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
  frmENSOPayBillProvEdit: TfrmENSOPayBillProvEdit;
  ENSOPayBillProvObj: ENSOPayBillProv;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSOPayBillProvController  ;
}
{$R *.dfm}



procedure TfrmENSOPayBillProvEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSOPayBillProvObj.code);
    edtUserGen.Text := ENSOPayBillProvObj.userGen; 
      SetDateFieldForDateTimePicker(edtDateEdit, ENSOPayBillProvObj.dateEdit);


  end;
end;



procedure TfrmENSOPayBillProvEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOPayBillProv: ENSOPayBillProvControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSOPayBillProv := HTTPRIOENSOPayBillProv as ENSOPayBillProvControllerSoapPort;


     ENSOPayBillProvObj.userGen := edtUserGen.Text; 

     ENSOPayBillProvObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtdateEdit);	   

    if DialogState = dsInsert then
    begin
      ENSOPayBillProvObj.code:=low(Integer);
      TempENSOPayBillProv.add(ENSOPayBillProvObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSOPayBillProv.save(ENSOPayBillProvObj);
    end;
  end;
end;


end.