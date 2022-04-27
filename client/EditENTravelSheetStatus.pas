
unit EditENTravelSheetStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetStatusController ;

type
  TfrmENTravelSheetStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENTravelSheetStatus: THTTPRIO;

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
  frmENTravelSheetStatusEdit: TfrmENTravelSheetStatusEdit;
  ENTravelSheetStatusObj: ENTravelSheetStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTravelSheetStatusController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENTravelSheetStatusObj.code);
    edtName.Text := ENTravelSheetStatusObj.name; 


  end;
end;



procedure TfrmENTravelSheetStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetStatus: ENTravelSheetStatusControllerSoapPort;
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
    TempENTravelSheetStatus := HTTPRIOENTravelSheetStatus as ENTravelSheetStatusControllerSoapPort;


     ENTravelSheetStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENTravelSheetStatusObj.code:=low(Integer);
      TempENTravelSheetStatus.add(ENTravelSheetStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTravelSheetStatus.save(ENTravelSheetStatusObj);
    end;
  end;
end;


end.