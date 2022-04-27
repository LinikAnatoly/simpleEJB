
unit EditENMethodExecuteWork;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMethodExecuteWorkController ;

type
  TfrmENMethodExecuteWorkEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENMethodExecuteWork: THTTPRIO;

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
  frmENMethodExecuteWorkEdit: TfrmENMethodExecuteWorkEdit;
  ENMethodExecuteWorkObj: ENMethodExecuteWork;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMethodExecuteWorkController  ;
}
{$R *.dfm}



procedure TfrmENMethodExecuteWorkEdit.FormShow(Sender: TObject);

begin

   DisableControls([edtCode]);


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
      edtCode.Text := IntToStr(ENMethodExecuteWorkObj.code);
    edtName.Text := ENMethodExecuteWorkObj.name; 


  end;
end;



procedure TfrmENMethodExecuteWorkEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMethodExecuteWork: ENMethodExecuteWorkControllerSoapPort;
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
    TempENMethodExecuteWork := HTTPRIOENMethodExecuteWork as ENMethodExecuteWorkControllerSoapPort;


     ENMethodExecuteWorkObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENMethodExecuteWorkObj.code:=low(Integer);
      TempENMethodExecuteWork.add(ENMethodExecuteWorkObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMethodExecuteWork.save(ENMethodExecuteWorkObj);
    end;
  end;
end;


end.