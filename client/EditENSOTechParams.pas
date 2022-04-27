
unit EditENSOTechParams;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOTechParamsController ;

type
  TfrmENSOTechParamsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblClosestDistance : TLabel;
    edtClosestDistance: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;


  HTTPRIOENSOTechParams: THTTPRIO;

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
  frmENSOTechParamsEdit: TfrmENSOTechParamsEdit;
  ENSOTechParamsObj: ENSOTechParams;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSOTechParamsController  ;
}
{$R *.dfm}



procedure TfrmENSOTechParamsEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtClosestDistance
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSOTechParamsObj.code);
    if ( ENSOTechParamsObj.closestDistance <> Low(Integer) ) then
       edtClosestDistance.Text := IntToStr(ENSOTechParamsObj.closestDistance)
    else
       edtClosestDistance.Text := '';
    edtUserGen.Text := ENSOTechParamsObj.userGen; 


  end;
end;



procedure TfrmENSOTechParamsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOTechParams: ENSOTechParamsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtClosestDistance
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSOTechParams := HTTPRIOENSOTechParams as ENSOTechParamsControllerSoapPort;


     if ( edtClosestDistance.Text <> '' ) then
       ENSOTechParamsObj.closestDistance := StrToInt(edtClosestDistance.Text)
     else
       ENSOTechParamsObj.closestDistance := Low(Integer) ;

     ENSOTechParamsObj.userGen := edtUserGen.Text; 

    if DialogState = dsInsert then
    begin
      ENSOTechParamsObj.code:=low(Integer);
      TempENSOTechParams.add(ENSOTechParamsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSOTechParams.save(ENSOTechParamsObj);
    end;
  end;
end;


end.