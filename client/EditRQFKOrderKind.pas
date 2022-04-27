
unit EditRQFKOrderKind;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderKindController ;

type
  TfrmRQFKOrderKindEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblTxtGen : TLabel;
    edtTxtGen: TEdit;


  HTTPRIORQFKOrderKind: THTTPRIO;

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
  frmRQFKOrderKindEdit: TfrmRQFKOrderKindEdit;
  RQFKOrderKindObj: RQFKOrderKind;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKOrderKindController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderKindEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtTxtGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQFKOrderKindObj.code);
    edtName.Text := RQFKOrderKindObj.name; 
    edtTxtGen.Text := RQFKOrderKindObj.txtGen; 


  end;
end;



procedure TfrmRQFKOrderKindEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderKind: RQFKOrderKindControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtTxtGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQFKOrderKind := HTTPRIORQFKOrderKind as RQFKOrderKindControllerSoapPort;


     RQFKOrderKindObj.name := edtName.Text; 

     RQFKOrderKindObj.txtGen := edtTxtGen.Text; 

    if DialogState = dsInsert then
    begin
      RQFKOrderKindObj.code:=low(Integer);
      TempRQFKOrderKind.add(RQFKOrderKindObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQFKOrderKind.save(RQFKOrderKindObj);
    end;
  end;
end;


end.