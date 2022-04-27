
unit EditENSO2SecObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSO2SecObjectController ;

type
  TfrmENSO2SecObjectEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblSecurityObj : TLabel;
    edtSecurityObj: TEdit;
    lblSecurityObjAddress : TLabel;
    edtSecurityObjAddress: TEdit;
    lblSecurityPeriod : TLabel;
    edtSecurityPeriod: TEdit;
    lblGuardPost : TLabel;
    edtGuardPost: TEdit;


  HTTPRIOENSO2SecObject: THTTPRIO;

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
  frmENSO2SecObjectEdit: TfrmENSO2SecObjectEdit;
  ENSO2SecObjectObj: ENSO2SecObject;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSO2SecObjectController  ;
}
{$R *.dfm}



procedure TfrmENSO2SecObjectEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     edtSecurityObj, edtSecurityObjAddress, edtSecurityPeriod, edtGuardPost
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSO2SecObjectObj.code);
    edtSecurityObj.Text := ENSO2SecObjectObj.securityObj; 
    edtSecurityObjAddress.Text := ENSO2SecObjectObj.securityObjAddress; 
    if ( ENSO2SecObjectObj.securityPeriod <> nil ) then
       edtSecurityPeriod.Text := ENSO2SecObjectObj.securityPeriod.decimalString
    else
       edtSecurityPeriod.Text := '';
    if ( ENSO2SecObjectObj.guardPost <> Low(Integer) ) then
       edtGuardPost.Text := IntToStr(ENSO2SecObjectObj.guardPost)
    else
       edtGuardPost.Text := '';

  end;
end;



procedure TfrmENSO2SecObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSO2SecObject: ENSO2SecObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     edtSecurityObj, edtSecurityObjAddress, edtSecurityPeriod, edtGuardPost
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSO2SecObject := HTTPRIOENSO2SecObject as ENSO2SecObjectControllerSoapPort;


     ENSO2SecObjectObj.securityObj := edtSecurityObj.Text; 

     ENSO2SecObjectObj.securityObjAddress := edtSecurityObjAddress.Text; 

     if (ENSO2SecObjectObj.securityPeriod = nil ) then
       ENSO2SecObjectObj.securityPeriod := TXSDecimal.Create;
     if edtSecurityPeriod.Text <> '' then
       ENSO2SecObjectObj.securityPeriod.decimalString := edtSecurityPeriod.Text 
     else
       ENSO2SecObjectObj.securityPeriod := nil;

     if ( edtGuardPost.Text <> '' ) then
       ENSO2SecObjectObj.guardPost := StrToInt(edtGuardPost.Text)
     else
       ENSO2SecObjectObj.guardPost := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      ENSO2SecObjectObj.code:=low(Integer);
      TempENSO2SecObject.add(ENSO2SecObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSO2SecObject.save(ENSO2SecObjectObj);
    end;
  end;
end;


end.