
unit EditENTravelWorkMode;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelWorkModeController ;

type
  TfrmENTravelWorkModeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENTravelWorkMode: THTTPRIO;

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
  frmENTravelWorkModeEdit: TfrmENTravelWorkModeEdit;
  ENTravelWorkModeObj: ENTravelWorkMode;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTravelWorkModeController  ;
}
{$R *.dfm}



procedure TfrmENTravelWorkModeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENTravelWorkModeObj.code);
    edtName.Text := ENTravelWorkModeObj.name; 


  end;
end;



procedure TfrmENTravelWorkModeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelWorkMode: ENTravelWorkModeControllerSoapPort;
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
    TempENTravelWorkMode := HTTPRIOENTravelWorkMode as ENTravelWorkModeControllerSoapPort;


     ENTravelWorkModeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENTravelWorkModeObj.code:=low(Integer);
      TempENTravelWorkMode.add(ENTravelWorkModeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTravelWorkMode.save(ENTravelWorkModeObj);
    end;
  end;
end;


end.