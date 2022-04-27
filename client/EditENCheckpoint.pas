
unit EditENCheckpoint;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCheckpointController ;

type
  TfrmENCheckpointEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENCheckpoint: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbENCheckpoint: TSpeedButton;
    edtENTransportDepartment: TEdit;
    lblENTransportDepartment: TLabel;
    HTTPRIOENTransportDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENCheckpointClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCheckpointEdit: TfrmENCheckpointEdit;
  ENCheckpointObj: ENCheckpoint;

implementation


uses
  ENTransportDepartmentController
  , ShowENTransportDepartment;
{$R *.dfm}



procedure TfrmENCheckpointEdit.FormShow(Sender: TObject);
var
  TempENTransportDepartment : ENTransportDepartmentControllerSoapPort;
  transportDepartment :  ENTransportDepartment;
begin

  DisableControls([edtCode, edtENTransportDepartment]);

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
    edtCode.Text := IntToStr(ENCheckpointObj.code);
    edtName.Text := ENCheckpointObj.name;

    TempENTransportDepartment := HTTPRIOENTransportDepartment as ENTransportDepartmentControllerSoapPort;
    transportDepartment := TempENTransportDepartment.getObject(ENCheckpointObj.transportDepartmentRef.code);

    edtENTransportDepartment.Text := transportDepartment.name;

  end;
end;



procedure TfrmENCheckpointEdit.spbENCheckpointClick(Sender: TObject);
var
  frmTransportDep : TfrmENTransportDepartmentShow;
begin
  inherited;
  frmTransportDep := TfrmENTransportDepartmentShow.Create(Application,fmNormal);
  try
    with frmTransportDep do
    if ShowModal = mrOk then
    begin
      try
         if ENCheckpointObj.transportDepartmentRef = nil then ENCheckpointObj.transportDepartmentRef := ENTransportDepartmentRef.Create;
         ENCheckpointObj.transportDepartmentRef.code := StrToInt(GetReturnValue(sgENTransportDepartment,0));
         edtENTransportDepartment.Text := GetReturnValue(sgENTransportDepartment,1);
      except
         on EConvertError do Exit;
      end;
    end;
  finally
    frmTransportDep.Free;
  end;
end;

procedure TfrmENCheckpointEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCheckpoint: ENCheckpointControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      , edtENTransportDepartment
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENCheckpoint := HTTPRIOENCheckpoint as ENCheckpointControllerSoapPort;


     ENCheckpointObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENCheckpointObj.code:=low(Integer);
      TempENCheckpoint.add(ENCheckpointObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCheckpoint.save(ENCheckpointObj);
    end;
  end;
end;


end.