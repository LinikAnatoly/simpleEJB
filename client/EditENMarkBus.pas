
unit EditENMarkBus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMarkBusController ;

type
  TfrmENMarkBusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblBusSection : TLabel;
    edtBusSection: TEdit;


  HTTPRIOENMarkBus: THTTPRIO;

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
  frmENMarkBusEdit: TfrmENMarkBusEdit;
  ENMarkBusObj: ENMarkBus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMarkBusController  ;
}
{$R *.dfm}



procedure TfrmENMarkBusEdit.FormShow(Sender: TObject);

begin
  SetFloatStyle([edtBusSection]);
  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtBusSection
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENMarkBusObj.code);
    edtName.Text := ENMarkBusObj.name; 
    if ( ENMarkBusObj.busSection <> nil ) then
       edtBusSection.Text := ENMarkBusObj.busSection.decimalString
    else
       edtBusSection.Text := ''; 


  end;
end;



procedure TfrmENMarkBusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMarkBus: ENMarkBusControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtBusSection
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENMarkBus := HTTPRIOENMarkBus as ENMarkBusControllerSoapPort;


     ENMarkBusObj.name := edtName.Text; 

     if (ENMarkBusObj.busSection = nil ) then
       ENMarkBusObj.busSection := TXSDecimal.Create;
     if edtBusSection.Text <> '' then
       ENMarkBusObj.busSection.decimalString := edtBusSection.Text 
     else
       ENMarkBusObj.busSection := nil;

    if DialogState = dsInsert then
    begin
      ENMarkBusObj.code:=low(Integer);
      TempENMarkBus.add(ENMarkBusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMarkBus.save(ENMarkBusObj);
    end;
  end;
end;


end.
