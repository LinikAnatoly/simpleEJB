
unit EditFINAccountType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINAccountTypeController ;

type
  TfrmFINAccountTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOFINAccountType: THTTPRIO;

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
  frmFINAccountTypeEdit: TfrmFINAccountTypeEdit;
  FINAccountTypeObj: FINAccountType;

implementation


{uses  
    EnergyproController, EnergyproController2, FINAccountTypeController  ;
}
{$R *.dfm}



procedure TfrmFINAccountTypeEdit.FormShow(Sender: TObject);

begin


   DisableControls([edtCode]);

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
      edtCode.Text := IntToStr(FINAccountTypeObj.code);
    edtName.Text := FINAccountTypeObj.name; 


  end;
end;



procedure TfrmFINAccountTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINAccountType: FINAccountTypeControllerSoapPort;
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
    TempFINAccountType := HTTPRIOFINAccountType as FINAccountTypeControllerSoapPort;


     FINAccountTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      FINAccountTypeObj.code:=low(Integer);
      TempFINAccountType.add(FINAccountTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINAccountType.save(FINAccountTypeObj);
    end;
  end;
end;


end.