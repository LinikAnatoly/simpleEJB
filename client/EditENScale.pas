
unit EditENScale;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENScaleController ;

type
  TfrmENScaleEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENScale: THTTPRIO;

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
  frmENScaleEdit: TfrmENScaleEdit;
  ENScaleObj: ENScale;

implementation


{uses  
    EnergyproController, EnergyproController2, ENScaleController  ;
}
{$R *.dfm}



procedure TfrmENScaleEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENScaleObj.code);
    edtName.Text := ENScaleObj.name; 


  end;
end;



procedure TfrmENScaleEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENScale: ENScaleControllerSoapPort;
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
    TempENScale := HTTPRIOENScale as ENScaleControllerSoapPort;


     ENScaleObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENScaleObj.code:=low(Integer);
      TempENScale.add(ENScaleObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENScale.save(ENScaleObj);
    end;
  end;
end;


end.