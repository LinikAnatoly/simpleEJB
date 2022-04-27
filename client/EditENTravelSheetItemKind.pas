
unit EditENTravelSheetItemKind;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetItemKindController ;

type
  TfrmENTravelSheetItemKindEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENTravelSheetItemKind: THTTPRIO;

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
  frmENTravelSheetItemKindEdit: TfrmENTravelSheetItemKindEdit;
  ENTravelSheetItemKindObj: ENTravelSheetItemKind;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTravelSheetItemKindController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetItemKindEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENTravelSheetItemKindObj.code);
    edtName.Text := ENTravelSheetItemKindObj.name; 


  end;
end;



procedure TfrmENTravelSheetItemKindEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetItemKind: ENTravelSheetItemKindControllerSoapPort;
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
    TempENTravelSheetItemKind := HTTPRIOENTravelSheetItemKind as ENTravelSheetItemKindControllerSoapPort;


     ENTravelSheetItemKindObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENTravelSheetItemKindObj.code:=low(Integer);
      TempENTravelSheetItemKind.add(ENTravelSheetItemKindObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTravelSheetItemKind.save(ENTravelSheetItemKindObj);
    end;
  end;
end;


end.