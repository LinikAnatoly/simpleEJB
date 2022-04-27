
unit EditENSituationRPN;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSituationRPNController ;

type
  TfrmENSituationRPNEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblValue : TLabel;
    edtValue: TEdit;
    lblDescription : TLabel;
    edtDescription: TEdit;


  HTTPRIOENSituationRPN: THTTPRIO;

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
  frmENSituationRPNEdit: TfrmENSituationRPNEdit;
  ENSituationRPNObj: ENSituationRPN;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSituationRPNController  ;
}
{$R *.dfm}



procedure TfrmENSituationRPNEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtValue
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSituationRPNObj.code);
    if ( ENSituationRPNObj.value <> Low(Integer) ) then
       edtValue.Text := IntToStr(ENSituationRPNObj.value)
    else
       edtValue.Text := '';
    edtDescription.Text := ENSituationRPNObj.description; 


  end;
end;



procedure TfrmENSituationRPNEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSituationRPN: ENSituationRPNControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtValue
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSituationRPN := HTTPRIOENSituationRPN as ENSituationRPNControllerSoapPort;


     if ( edtValue.Text <> '' ) then
       ENSituationRPNObj.value := StrToInt(edtValue.Text)
     else
       ENSituationRPNObj.value := Low(Integer) ;

     ENSituationRPNObj.description := edtDescription.Text; 

    if DialogState = dsInsert then
    begin
      ENSituationRPNObj.code:=low(Integer);
      TempENSituationRPN.add(ENSituationRPNObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSituationRPN.save(ENSituationRPNObj);
    end;
  end;
end;


end.