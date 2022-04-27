
unit EditENSO2SecObjectResp;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSO2SecObjectRespController ;

type
  TfrmENSO2SecObjectRespEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblResponsibleName : TLabel;
    edtResponsibleName: TEdit;
    lblResponsiblePosition : TLabel;
    edtResponsiblePosition: TEdit;
    lblResponsibleContactInfo : TLabel;
    edtResponsibleContactInfo: TMemo;


  HTTPRIOENSO2SecObjectResp: THTTPRIO;

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
  frmENSO2SecObjectRespEdit: TfrmENSO2SecObjectRespEdit;
  ENSO2SecObjectRespObj: ENSO2SecObjectResp;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSO2SecObjectRespController  ;
}
{$R *.dfm}



procedure TfrmENSO2SecObjectRespEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtResponsibleName, edtResponsiblePosition, edtResponsibleContactInfo
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSO2SecObjectRespObj.code);
    edtResponsibleName.Text := ENSO2SecObjectRespObj.responsibleName; 
    edtResponsiblePosition.Text := ENSO2SecObjectRespObj.responsiblePosition; 
    MakeMultiline(edtResponsibleContactInfo.Lines, ENSO2SecObjectRespObj.responsibleContactInfo);

  end;
end;



procedure TfrmENSO2SecObjectRespEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSO2SecObjectResp: ENSO2SecObjectRespControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtResponsibleName, edtResponsiblePosition, edtResponsibleContactInfo
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSO2SecObjectResp := HTTPRIOENSO2SecObjectResp as ENSO2SecObjectRespControllerSoapPort;

     ENSO2SecObjectRespObj.responsibleName := edtResponsibleName.Text; 

     ENSO2SecObjectRespObj.responsiblePosition := edtResponsiblePosition.Text; 

     ENSO2SecObjectRespObj.responsibleContactInfo := edtResponsibleContactInfo.Text;

    if DialogState = dsInsert then
    begin
      ENSO2SecObjectRespObj.code:=low(Integer);
      TempENSO2SecObjectResp.add(ENSO2SecObjectRespObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSO2SecObjectResp.save(ENSO2SecObjectRespObj);
    end;
  end;
end;


end.