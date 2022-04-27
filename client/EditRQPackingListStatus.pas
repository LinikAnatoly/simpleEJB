
unit EditRQPackingListStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPackingListStatusController ;

type
  TfrmRQPackingListStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQPackingListStatus: THTTPRIO;

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
  frmRQPackingListStatusEdit: TfrmRQPackingListStatusEdit;
  RQPackingListStatusObj: RQPackingListStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPackingListStatusController  ;
}
{$R *.dfm}



procedure TfrmRQPackingListStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQPackingListStatusObj.code);
    edtName.Text := RQPackingListStatusObj.name; 


  end;
end;



procedure TfrmRQPackingListStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPackingListStatus: RQPackingListStatusControllerSoapPort;
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
    TempRQPackingListStatus := HTTPRIORQPackingListStatus as RQPackingListStatusControllerSoapPort;


     RQPackingListStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQPackingListStatusObj.code:=low(Integer);
      TempRQPackingListStatus.add(RQPackingListStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPackingListStatus.save(RQPackingListStatusObj);
    end;
  end;
end;


end.