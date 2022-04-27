
unit EditENBuildingStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENBuildingStatusController ;

type
  TfrmENBuildingStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENBuildingStatus: THTTPRIO;

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
  frmENBuildingStatusEdit: TfrmENBuildingStatusEdit;
  ENBuildingStatusObj: ENBuildingStatus;

implementation



{$R *.dfm}



procedure TfrmENBuildingStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENBuildingStatusObj.code);
    edtName.Text := ENBuildingStatusObj.name; 


  end;
end;



procedure TfrmENBuildingStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuildingStatus: ENBuildingStatusControllerSoapPort;
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
    TempENBuildingStatus := HTTPRIOENBuildingStatus as ENBuildingStatusControllerSoapPort;

     ENBuildingStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENBuildingStatusObj.code:=low(Integer);
      TempENBuildingStatus.add(ENBuildingStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBuildingStatus.save(ENBuildingStatusObj);
    end;
  end;
end;


end.