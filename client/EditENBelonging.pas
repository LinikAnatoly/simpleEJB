
unit EditENBelonging;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBelongingController ;

type
  TfrmENBelongingEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENBelonging: THTTPRIO;

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
  frmENBelongingEdit: TfrmENBelongingEdit;
  ENBelongingObj: ENBelonging;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBelongingController  ;
}
{$R *.dfm}



procedure TfrmENBelongingEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENBelongingObj.name; 


  end;
end;



procedure TfrmENBelongingEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBelonging: ENBelongingControllerSoapPort;
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
    TempENBelonging := HTTPRIOENBelonging as ENBelongingControllerSoapPort;


     ENBelongingObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENBelongingObj.code:=low(Integer);
      TempENBelonging.add(ENBelongingObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBelonging.save(ENBelongingObj);
    end;
  end;
end;


end.