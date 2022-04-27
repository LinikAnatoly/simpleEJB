
unit EditENFencing;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFencingController ;

type
  TfrmENFencingEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENFencing: THTTPRIO;

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
  frmENFencingEdit: TfrmENFencingEdit;
  ENFencingObj: ENFencing;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFencingController  ;
}
{$R *.dfm}



procedure TfrmENFencingEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENFencingObj.code);
    edtName.Text := ENFencingObj.name; 


  end;
end;



procedure TfrmENFencingEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFencing: ENFencingControllerSoapPort;
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
    TempENFencing := HTTPRIOENFencing as ENFencingControllerSoapPort;


     ENFencingObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENFencingObj.code:=low(Integer);
      TempENFencing.add(ENFencingObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFencing.save(ENFencingObj);
    end;
  end;
end;


end.