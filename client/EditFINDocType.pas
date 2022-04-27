
unit EditFINDocType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINDocTypeController ;

type
  TfrmFINDocTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOFINDocType: THTTPRIO;

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
  frmFINDocTypeEdit: TfrmFINDocTypeEdit;
  FINDocTypeObj: FINDocType;

implementation


{uses  
    EnergyproController, EnergyproController2, FINDocTypeController  ;
}
{$R *.dfm}



procedure TfrmFINDocTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := FINDocTypeObj.name; 


  end;
end;



procedure TfrmFINDocTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINDocType: FINDocTypeControllerSoapPort;
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
    TempFINDocType := HTTPRIOFINDocType as FINDocTypeControllerSoapPort;


     FINDocTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      FINDocTypeObj.code:=low(Integer);
      TempFINDocType.add(FINDocTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINDocType.save(FINDocTypeObj);
    end;
  end;
end;


end.