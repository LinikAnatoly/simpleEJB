
unit EditENSO2NodeType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSO2NodeTypeController ;

type
  TfrmENSO2NodeTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENSO2NodeType: THTTPRIO;

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
  frmENSO2NodeTypeEdit: TfrmENSO2NodeTypeEdit;
  ENSO2NodeTypeObj: ENSO2NodeType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSO2NodeTypeController  ;
}
{$R *.dfm}



procedure TfrmENSO2NodeTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENSO2NodeTypeObj.code);
    edtName.Text := ENSO2NodeTypeObj.name; 


  end;
end;



procedure TfrmENSO2NodeTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSO2NodeType: ENSO2NodeTypeControllerSoapPort;
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
    TempENSO2NodeType := HTTPRIOENSO2NodeType as ENSO2NodeTypeControllerSoapPort;


     ENSO2NodeTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENSO2NodeTypeObj.code:=low(Integer);
      TempENSO2NodeType.add(ENSO2NodeTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSO2NodeType.save(ENSO2NodeTypeObj);
    end;
  end;
end;


end.