
unit EditENBuildingCommissionType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENBuildingCommissionTypeController ;

type
  TfrmENBuildingCommissionTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENBuildingCommissionType: THTTPRIO;

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
  frmENBuildingCommissionTypeEdit: TfrmENBuildingCommissionTypeEdit;
  ENBuildingCommissionTypeObj: ENBuildingCommissionType;

implementation



{$R *.dfm}



procedure TfrmENBuildingCommissionTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENBuildingCommissionTypeObj.code);
    edtName.Text := ENBuildingCommissionTypeObj.name; 


  end;
end;



procedure TfrmENBuildingCommissionTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuildingCommissionType: ENBuildingCommissionTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBuildingCommissionType := HTTPRIOENBuildingCommissionType as ENBuildingCommissionTypeControllerSoapPort;

     ENBuildingCommissionTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENBuildingCommissionTypeObj.code:=low(Integer);
      TempENBuildingCommissionType.add(ENBuildingCommissionTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBuildingCommissionType.save(ENBuildingCommissionTypeObj);
    end;
  end;
end;


end.