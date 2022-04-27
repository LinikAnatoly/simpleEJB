
unit EditEquipChangeWorker;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, EquipChangeWorkerController ;

type
  TfrmEquipChangeWorkerEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOEquipChangeWorker: THTTPRIO;

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
  frmEquipChangeWorkerEdit: TfrmEquipChangeWorkerEdit;
  EquipChangeWorkerObj: EquipChangeWorker;

implementation


{uses  
    EnergyproController, EnergyproController2, EquipChangeWorkerController  ;
}
{$R *.dfm}



procedure TfrmEquipChangeWorkerEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(EquipChangeWorkerObj.code);
    edtName.Text := EquipChangeWorkerObj.name; 


  end;
end;



procedure TfrmEquipChangeWorkerEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempEquipChangeWorker: EquipChangeWorkerControllerSoapPort;
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
    TempEquipChangeWorker := HTTPRIOEquipChangeWorker as EquipChangeWorkerControllerSoapPort;


     EquipChangeWorkerObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      EquipChangeWorkerObj.code:=low(Integer);
      TempEquipChangeWorker.add(EquipChangeWorkerObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempEquipChangeWorker.save(EquipChangeWorkerObj);
    end;
  end;
end;


end.