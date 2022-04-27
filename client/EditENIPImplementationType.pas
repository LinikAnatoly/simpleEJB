
unit EditENIPImplementationType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIPImplementationTypeController ;

type
  TfrmENIPImplementationTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENIPImplementationType: THTTPRIO;

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
  frmENIPImplementationTypeEdit: TfrmENIPImplementationTypeEdit;
  ENIPImplementationTypeObj: ENIPImplementationType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENIPImplementationTypeController  ;
}
{$R *.dfm}



procedure TfrmENIPImplementationTypeEdit.FormShow(Sender: TObject);
begin
  DisableControls(edtCode);

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
      edtCode.Text := IntToStr(ENIPImplementationTypeObj.code);
    edtName.Text := ENIPImplementationTypeObj.name; 


  end;
end;



procedure TfrmENIPImplementationTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIPImplementationType: ENIPImplementationTypeControllerSoapPort;
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
    TempENIPImplementationType := HTTPRIOENIPImplementationType as ENIPImplementationTypeControllerSoapPort;


     ENIPImplementationTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENIPImplementationTypeObj.code:=low(Integer);
      TempENIPImplementationType.add(ENIPImplementationTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENIPImplementationType.save(ENIPImplementationTypeObj);
    end;
  end;
end;


end.