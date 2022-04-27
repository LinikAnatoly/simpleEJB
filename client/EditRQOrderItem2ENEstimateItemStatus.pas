
unit EditRQOrderItem2ENEstimateItemStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderItem2ENEstimateItemStatusController ;

type
  TfrmRQOrderItem2ENEstimateItemStatusEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderItem2ENEstimateItemStatus: THTTPRIO;

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
  frmRQOrderItem2ENEstimateItemStatusEdit: TfrmRQOrderItem2ENEstimateItemStatusEdit;
  RQOrderItem2ENEstimateItemStatusObj: RQOrderItem2ENEstimateItemStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderItem2ENEstimateItemStatusController  ;
}
{$R *.dfm}



procedure TfrmRQOrderItem2ENEstimateItemStatusEdit.FormShow(Sender: TObject);

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
    edtName.Text := RQOrderItem2ENEstimateItemStatusObj.name; 


  end;
end;



procedure TfrmRQOrderItem2ENEstimateItemStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderItem2ENEstimateItemStatus: RQOrderItem2ENEstimateItemStatusControllerSoapPort;
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
    TempRQOrderItem2ENEstimateItemStatus := HTTPRIORQOrderItem2ENEstimateItemStatus as RQOrderItem2ENEstimateItemStatusControllerSoapPort;


     RQOrderItem2ENEstimateItemStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQOrderItem2ENEstimateItemStatusObj.code:=low(Integer);
      TempRQOrderItem2ENEstimateItemStatus.add(RQOrderItem2ENEstimateItemStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOrderItem2ENEstimateItemStatus.save(RQOrderItem2ENEstimateItemStatusObj);
    end;
  end;
end;


end.