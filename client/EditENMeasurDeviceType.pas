
unit EditENMeasurDeviceType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMeasurDeviceTypeController ;

type
  TfrmENMeasurDeviceTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENMeasurDeviceType: THTTPRIO;

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
  frmENMeasurDeviceTypeEdit: TfrmENMeasurDeviceTypeEdit;
  ENMeasurDeviceTypeObj: ENMeasurDeviceType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMeasurDeviceTypeController  ;
}
{$R *.dfm}



procedure TfrmENMeasurDeviceTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENMeasurDeviceTypeObj.code);
    edtName.Text := ENMeasurDeviceTypeObj.name; 


  end;
end;



procedure TfrmENMeasurDeviceTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMeasurDeviceType: ENMeasurDeviceTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('������ ���� ����������� !'),PChar('�������� !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENMeasurDeviceType := HTTPRIOENMeasurDeviceType as ENMeasurDeviceTypeControllerSoapPort;


     ENMeasurDeviceTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENMeasurDeviceTypeObj.code:=low(Integer);
      TempENMeasurDeviceType.add(ENMeasurDeviceTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMeasurDeviceType.save(ENMeasurDeviceTypeObj);
    end;
  end;
end;


end.