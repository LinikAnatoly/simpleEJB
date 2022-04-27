
unit EditRQOrderKind;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderKindController ;

type
  TfrmRQOrderKindEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderKind: THTTPRIO;

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
  frmRQOrderKindEdit: TfrmRQOrderKindEdit;
  RQOrderKindObj: RQOrderKind;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderKindController  ;
}
{$R *.dfm}



procedure TfrmRQOrderKindEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := RQOrderKindObj.name; 


  end;
end;



procedure TfrmRQOrderKindEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderKind: RQOrderKindControllerSoapPort;
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
    TempRQOrderKind := HTTPRIORQOrderKind as RQOrderKindControllerSoapPort;


     RQOrderKindObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQOrderKindObj.code:=low(Integer);
      TempRQOrderKind.add(RQOrderKindObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOrderKind.save(RQOrderKindObj);
    end;
  end;
end;


end.