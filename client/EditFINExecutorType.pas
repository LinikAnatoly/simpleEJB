
unit EditFINExecutorType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINExecutorTypeController ;

type
  TfrmFINExecutorTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOFINExecutorType: THTTPRIO;

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
  frmFINExecutorTypeEdit: TfrmFINExecutorTypeEdit;
  FINExecutorTypeObj: FINExecutorType;

implementation


{uses  
    EnergyproController, EnergyproController2, FINExecutorTypeController  ;
}
{$R *.dfm}



procedure TfrmFINExecutorTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(FINExecutorTypeObj.code);
    edtName.Text := FINExecutorTypeObj.name; 


  end;
end;



procedure TfrmFINExecutorTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINExecutorType: FINExecutorTypeControllerSoapPort;
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
    TempFINExecutorType := HTTPRIOFINExecutorType as FINExecutorTypeControllerSoapPort;


     FINExecutorTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      FINExecutorTypeObj.code:=low(Integer);
      TempFINExecutorType.add(FINExecutorTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINExecutorType.save(FINExecutorTypeObj);
    end;
  end;
end;


end.