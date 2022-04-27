
unit EditRQPackingListItemType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPackingListItemTypeController ;

type
  TfrmRQPackingListItemTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQPackingListItemType: THTTPRIO;

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
  frmRQPackingListItemTypeEdit: TfrmRQPackingListItemTypeEdit;
  RQPackingListItemTypeObj: RQPackingListItemType;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPackingListItemTypeController  ;
}
{$R *.dfm}



procedure TfrmRQPackingListItemTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQPackingListItemTypeObj.code);
    edtName.Text := RQPackingListItemTypeObj.name; 


  end;
end;



procedure TfrmRQPackingListItemTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPackingListItemType: RQPackingListItemTypeControllerSoapPort;
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
    TempRQPackingListItemType := HTTPRIORQPackingListItemType as RQPackingListItemTypeControllerSoapPort;


     RQPackingListItemTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQPackingListItemTypeObj.code:=low(Integer);
      TempRQPackingListItemType.add(RQPackingListItemTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPackingListItemType.save(RQPackingListItemTypeObj);
    end;
  end;
end;


end.