
unit EditENElementType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENElementTypeController ;

type
  TfrmENElementTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


    HTTPRIOENElementType: THTTPRIO;

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
  frmENElementTypeEdit: TfrmENElementTypeEdit;
  ENElementTypeObj: ENElementType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENElementTypeController  ;
}
{$R *.dfm}



procedure TfrmENElementTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENElementTypeObj.name; 



  end;


end;



procedure TfrmENElementTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENElementType: ENElementTypeControllerSoapPort;
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
    TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;


     ENElementTypeObj.name := edtName.Text; 




    if DialogState = dsInsert then
    begin
      ENElementTypeObj.code:=low(Integer);
      TempENElementType.add(ENElementTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENElementType.save(ENElementTypeObj);
    end;

  end;
end;


end.