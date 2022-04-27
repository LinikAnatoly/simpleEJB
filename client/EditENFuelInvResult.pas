
unit EditENFuelInvResult;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelInvResultController ;

type
  TfrmENFuelInvResultEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDeltaCount : TLabel;
    edtDeltaCount: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENFuelInvResult: THTTPRIO;

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
  frmENFuelInvResultEdit: TfrmENFuelInvResultEdit;
  ENFuelInvResultObj: ENFuelInvResult;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFuelInvResultController  ;
}
{$R *.dfm}



procedure TfrmENFuelInvResultEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDeltaCount
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENFuelInvResultObj.code);
    if ( ENFuelInvResultObj.deltaCount <> nil ) then
       edtDeltaCount.Text := ENFuelInvResultObj.deltaCount.decimalString
    else
       edtDeltaCount.Text := ''; 
    edtUserGen.Text := ENFuelInvResultObj.userGen; 
      if ENFuelInvResultObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENFuelInvResultObj.dateEdit.Year,ENFuelInvResultObj.dateEdit.Month,ENFuelInvResultObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;
end;



procedure TfrmENFuelInvResultEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelInvResult: ENFuelInvResultControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDeltaCount
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENFuelInvResult := HTTPRIOENFuelInvResult as ENFuelInvResultControllerSoapPort;


     if (ENFuelInvResultObj.deltaCount = nil ) then
       ENFuelInvResultObj.deltaCount := TXSDecimal.Create;
     if edtDeltaCount.Text <> '' then
       ENFuelInvResultObj.deltaCount.decimalString := edtDeltaCount.Text 
     else
       ENFuelInvResultObj.deltaCount := nil;

     ENFuelInvResultObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENFuelInvResultObj.dateEdit = nil then
          ENFuelInvResultObj.dateEdit := TXSDateTime.Create;
       ENFuelInvResultObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENFuelInvResultObj.dateEdit := nil;	   

    if DialogState = dsInsert then
    begin
      ENFuelInvResultObj.code:=low(Integer);
      TempENFuelInvResult.add(ENFuelInvResultObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFuelInvResult.save(ENFuelInvResultObj);
    end;
  end;
end;


end.