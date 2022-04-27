
unit EditRQOrderType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderTypeController ;

type
  TfrmRQOrderTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderType: THTTPRIO;

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
  frmRQOrderTypeEdit: TfrmRQOrderTypeEdit;
  RQOrderTypeObj: RQOrderType;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderTypeController  ;
}
{$R *.dfm}



procedure TfrmRQOrderTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := RQOrderTypeObj.name; 


  end;
end;



procedure TfrmRQOrderTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderType: RQOrderTypeControllerSoapPort;
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
    TempRQOrderType := HTTPRIORQOrderType as RQOrderTypeControllerSoapPort;


     RQOrderTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQOrderTypeObj.code:=low(Integer);
      TempRQOrderType.add(RQOrderTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOrderType.save(RQOrderTypeObj);
    end;
  end;
end;


end.