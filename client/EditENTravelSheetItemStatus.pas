
unit EditENTravelSheetItemStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetItemStatusController ;

type
  TfrmENTravelSheetItemStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENTravelSheetItemStatus: THTTPRIO;

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
  frmENTravelSheetItemStatusEdit: TfrmENTravelSheetItemStatusEdit;
  ENTravelSheetItemStatusObj: ENTravelSheetItemStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTravelSheetItemStatusController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetItemStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENTravelSheetItemStatusObj.code);
    edtName.Text := ENTravelSheetItemStatusObj.name; 


  end;
end;



procedure TfrmENTravelSheetItemStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetItemStatus: ENTravelSheetItemStatusControllerSoapPort;
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
    TempENTravelSheetItemStatus := HTTPRIOENTravelSheetItemStatus as ENTravelSheetItemStatusControllerSoapPort;


     ENTravelSheetItemStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENTravelSheetItemStatusObj.code:=low(Integer);
      TempENTravelSheetItemStatus.add(ENTravelSheetItemStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTravelSheetItemStatus.save(ENTravelSheetItemStatusObj);
    end;
  end;
end;


end.