
unit EditENPlanWorkForm;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkFormController ;

type
  TfrmENPlanWorkFormEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanWorkForm: THTTPRIO;

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
  frmENPlanWorkFormEdit: TfrmENPlanWorkFormEdit;
  ENPlanWorkFormObj: ENPlanWorkForm;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkFormController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkFormEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENPlanWorkFormObj.code);
    edtName.Text := ENPlanWorkFormObj.name; 


  end;
end;



procedure TfrmENPlanWorkFormEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkForm: ENPlanWorkFormControllerSoapPort;
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
    TempENPlanWorkForm := HTTPRIOENPlanWorkForm as ENPlanWorkFormControllerSoapPort;


     ENPlanWorkFormObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPlanWorkFormObj.code:=low(Integer);
      TempENPlanWorkForm.add(ENPlanWorkFormObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanWorkForm.save(ENPlanWorkFormObj);
    end;
  end;
end;


end.