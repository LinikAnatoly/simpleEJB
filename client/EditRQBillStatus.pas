
unit EditRQBillStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQBillStatusController ;

type
  TfrmRQBillStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQBillStatus: THTTPRIO;

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
  frmRQBillStatusEdit: TfrmRQBillStatusEdit;
  RQBillStatusObj: RQBillStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, RQBillStatusController  ;
}
{$R *.dfm}



procedure TfrmRQBillStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQBillStatusObj.code);
    edtName.Text := RQBillStatusObj.name; 


  end;
end;



procedure TfrmRQBillStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQBillStatus: RQBillStatusControllerSoapPort;
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
    TempRQBillStatus := HTTPRIORQBillStatus as RQBillStatusControllerSoapPort;


     RQBillStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQBillStatusObj.code:=low(Integer);
      TempRQBillStatus.add(RQBillStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQBillStatus.save(RQBillStatusObj);
    end;
  end;
end;


end.