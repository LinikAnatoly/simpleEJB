
unit EditFINMolType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINMolTypeController ;

type
  TfrmFINMolTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOFINMolType: THTTPRIO;

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
  frmFINMolTypeEdit: TfrmFINMolTypeEdit;
  FINMolTypeObj: FINMolType;

implementation


{uses  
    EnergyproController, EnergyproController2, FINMolTypeController  ;
}
{$R *.dfm}



procedure TfrmFINMolTypeEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(FINMolTypeObj.code);
    edtName.Text := FINMolTypeObj.name; 


  end;
end;



procedure TfrmFINMolTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINMolType: FINMolTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempFINMolType := HTTPRIOFINMolType as FINMolTypeControllerSoapPort;


     FINMolTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      FINMolTypeObj.code:=low(Integer);
      TempFINMolType.add(FINMolTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINMolType.save(FINMolTypeObj);
    end;
  end;
end;


end.