
unit EditENWarrantStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWarrantStatusController ;

type
  TfrmENWarrantStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENWarrantStatus: THTTPRIO;

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
  frmENWarrantStatusEdit: TfrmENWarrantStatusEdit;
  ENWarrantStatusObj: ENWarrantStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWarrantStatusController  ;
}
{$R *.dfm}



procedure TfrmENWarrantStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENWarrantStatusObj.code);
    edtName.Text := ENWarrantStatusObj.name; 


  end;
end;



procedure TfrmENWarrantStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWarrantStatus: ENWarrantStatusControllerSoapPort;
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
    TempENWarrantStatus := HTTPRIOENWarrantStatus as ENWarrantStatusControllerSoapPort;


     ENWarrantStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENWarrantStatusObj.code:=low(Integer);
      TempENWarrantStatus.add(ENWarrantStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWarrantStatus.save(ENWarrantStatusObj);
    end;
  end;
end;


end.