
unit EditENTravelSheetType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetTypeController ;

type
  TfrmENTravelSheetTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENTravelSheetType: THTTPRIO;

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
  frmENTravelSheetTypeEdit: TfrmENTravelSheetTypeEdit;
  ENTravelSheetTypeObj: ENTravelSheetType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTravelSheetTypeController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENTravelSheetTypeObj.code);
    edtName.Text := ENTravelSheetTypeObj.name; 


  end;
end;



procedure TfrmENTravelSheetTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetType: ENTravelSheetTypeControllerSoapPort;
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
    TempENTravelSheetType := HTTPRIOENTravelSheetType as ENTravelSheetTypeControllerSoapPort;


     ENTravelSheetTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENTravelSheetTypeObj.code:=low(Integer);
      TempENTravelSheetType.add(ENTravelSheetTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTravelSheetType.save(ENTravelSheetTypeObj);
    end;
  end;
end;


end.