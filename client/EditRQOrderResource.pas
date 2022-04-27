
unit EditRQOrderResource;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderResourceController ;

type
  TfrmRQOrderResourceEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderResource: THTTPRIO;

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
  frmRQOrderResourceEdit: TfrmRQOrderResourceEdit;
  RQOrderResourceObj: RQOrderResource;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderResourceController  ;
}
{$R *.dfm}



procedure TfrmRQOrderResourceEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := RQOrderResourceObj.name; 


  end;
end;



procedure TfrmRQOrderResourceEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderResource: RQOrderResourceControllerSoapPort;
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
    TempRQOrderResource := HTTPRIORQOrderResource as RQOrderResourceControllerSoapPort;


     RQOrderResourceObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQOrderResourceObj.code:=low(Integer);
      TempRQOrderResource.add(RQOrderResourceObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOrderResource.save(RQOrderResourceObj);
    end;
  end;
end;


end.