
unit EditENMolFuelMotionType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolFuelMotionTypeController ;

type
  TfrmENMolFuelMotionTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENMolFuelMotionType: THTTPRIO;

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
  frmENMolFuelMotionTypeEdit: TfrmENMolFuelMotionTypeEdit;
  ENMolFuelMotionTypeObj: ENMolFuelMotionType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMolFuelMotionTypeController  ;
}
{$R *.dfm}



procedure TfrmENMolFuelMotionTypeEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENMolFuelMotionTypeObj.code);
    edtName.Text := ENMolFuelMotionTypeObj.name; 


  end;
end;



procedure TfrmENMolFuelMotionTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMolFuelMotionType: ENMolFuelMotionTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENMolFuelMotionType := HTTPRIOENMolFuelMotionType as ENMolFuelMotionTypeControllerSoapPort;


     ENMolFuelMotionTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENMolFuelMotionTypeObj.code:=low(Integer);
      TempENMolFuelMotionType.add(ENMolFuelMotionTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMolFuelMotionType.save(ENMolFuelMotionTypeObj);
    end;
  end;
end;


end.