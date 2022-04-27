
unit EditENSO2DistrAgree;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSO2DistrAgreeController ;

type
  TfrmENSO2DistrAgreeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENSO2DistrAgree: THTTPRIO;

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
  frmENSO2DistrAgreeEdit: TfrmENSO2DistrAgreeEdit;
  ENSO2DistrAgreeObj: ENSO2DistrAgree;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSO2DistrAgreeController  ;
}
{$R *.dfm}



procedure TfrmENSO2DistrAgreeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENSO2DistrAgreeObj.code);
    edtUserGen.Text := ENSO2DistrAgreeObj.userGen; 
      SetDateFieldForDateTimePicker(edtDateEdit, ENSO2DistrAgreeObj.dateEdit);


  end;
end;



procedure TfrmENSO2DistrAgreeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSO2DistrAgree: ENSO2DistrAgreeControllerSoapPort;
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
    TempENSO2DistrAgree := HTTPRIOENSO2DistrAgree as ENSO2DistrAgreeControllerSoapPort;


     ENSO2DistrAgreeObj.userGen := edtUserGen.Text; 

     ENSO2DistrAgreeObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtdateEdit);	   

    if DialogState = dsInsert then
    begin
      ENSO2DistrAgreeObj.code:=low(Integer);
      TempENSO2DistrAgree.add(ENSO2DistrAgreeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSO2DistrAgree.save(ENSO2DistrAgreeObj);
    end;
  end;
end;


end.