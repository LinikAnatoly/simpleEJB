
unit EditRQFKOrderItem2EstimateItemStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderItem2EstimateItemStatusController ;

type
  TfrmRQFKOrderItem2EstimateItemStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQFKOrderItem2EstimateItemStatus: THTTPRIO;

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
  frmRQFKOrderItem2EstimateItemStatusEdit: TfrmRQFKOrderItem2EstimateItemStatusEdit;
  RQFKOrderItem2EstimateItemStatusObj: RQFKOrderItem2EstimateItemStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKOrderItem2EstimateItemStatusController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderItem2EstimateItemStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQFKOrderItem2EstimateItemStatusObj.code);
    edtName.Text := RQFKOrderItem2EstimateItemStatusObj.name; 


  end;
end;



procedure TfrmRQFKOrderItem2EstimateItemStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderItem2EstimateItemStatus: RQFKOrderItem2EstimateItemStatusControllerSoapPort;
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
    TempRQFKOrderItem2EstimateItemStatus := HTTPRIORQFKOrderItem2EstimateItemStatus as RQFKOrderItem2EstimateItemStatusControllerSoapPort;


     RQFKOrderItem2EstimateItemStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQFKOrderItem2EstimateItemStatusObj.code:=low(Integer);
      TempRQFKOrderItem2EstimateItemStatus.add(RQFKOrderItem2EstimateItemStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQFKOrderItem2EstimateItemStatus.save(RQFKOrderItem2EstimateItemStatusObj);
    end;
  end;
end;


end.