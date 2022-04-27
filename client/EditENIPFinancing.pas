
unit EditENIPFinancing;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIPFinancingController ;

type
  TfrmENIPFinancingEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENIPFinancing: THTTPRIO;

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
  frmENIPFinancingEdit: TfrmENIPFinancingEdit;
  ENIPFinancingObj: ENIPFinancing;

implementation


{uses  
    EnergyproController, EnergyproController2, ENIPFinancingController  ;
}
{$R *.dfm}



procedure TfrmENIPFinancingEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENIPFinancingObj.code);
    edtName.Text := ENIPFinancingObj.name; 


  end;
end;



procedure TfrmENIPFinancingEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIPFinancing: ENIPFinancingControllerSoapPort;
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
    TempENIPFinancing := HTTPRIOENIPFinancing as ENIPFinancingControllerSoapPort;


     ENIPFinancingObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENIPFinancingObj.code:=low(Integer);
      TempENIPFinancing.add(ENIPFinancingObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENIPFinancing.save(ENIPFinancingObj);
    end;
  end;
end;


end.