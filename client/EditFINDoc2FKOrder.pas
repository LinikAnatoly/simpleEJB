
unit EditFINDoc2FKOrder;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINDoc2FKOrderController ;

type
  TfrmFINDoc2FKOrderEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;
    lblFinDocCodeContract : TLabel;
    edtFinDocCodeContract: TEdit;


  HTTPRIOFINDoc2FKOrder: THTTPRIO;

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
  frmFINDoc2FKOrderEdit: TfrmFINDoc2FKOrderEdit;
  FINDoc2FKOrderObj: FINDoc2FKOrder;

implementation


{uses  
    EnergyproController, EnergyproController2, FINDoc2FKOrderController  ;
}
{$R *.dfm}



procedure TfrmFINDoc2FKOrderEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtFinDocCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(FINDoc2FKOrderObj.code);
    if ( FINDoc2FKOrderObj.finDocCode <> Low(Integer) ) then
       edtFinDocCode.Text := IntToStr(FINDoc2FKOrderObj.finDocCode)
    else
       edtFinDocCode.Text := '';
    if ( FINDoc2FKOrderObj.finDocCodeContract <> Low(Integer) ) then
       edtFinDocCodeContract.Text := IntToStr(FINDoc2FKOrderObj.finDocCodeContract)
    else
       edtFinDocCodeContract.Text := '';


  end;
end;



procedure TfrmFINDoc2FKOrderEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINDoc2FKOrder: FINDoc2FKOrderControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtFinDocCode
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempFINDoc2FKOrder := HTTPRIOFINDoc2FKOrder as FINDoc2FKOrderControllerSoapPort;


     if ( edtFinDocCode.Text <> '' ) then
       FINDoc2FKOrderObj.finDocCode := StrToInt(edtFinDocCode.Text)
     else
       FINDoc2FKOrderObj.finDocCode := Low(Integer) ;

     if ( edtFinDocCodeContract.Text <> '' ) then
       FINDoc2FKOrderObj.finDocCodeContract := StrToInt(edtFinDocCodeContract.Text)
     else
       FINDoc2FKOrderObj.finDocCodeContract := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      FINDoc2FKOrderObj.code:=low(Integer);
      TempFINDoc2FKOrder.add(FINDoc2FKOrderObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINDoc2FKOrder.save(FINDoc2FKOrderObj);
    end;
  end;
end;


end.