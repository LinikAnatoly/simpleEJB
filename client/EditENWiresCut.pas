unit EditENWiresCut;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENWiresCutController ;

type
  TfrmENWiresCutEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblWiresCut : TLabel;
    edtWiresCut: TEdit;
    HTTPRIOENWiresCut: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
end;

var frmENWiresCutEdit: TfrmENWiresCutEdit; ENWiresCutObj: ENWiresCut;

implementation

{$R *.dfm}

procedure TfrmENWiresCutEdit.FormShow(Sender: TObject);
begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtWiresCut
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENWiresCutObj.code);
    if ( ENWiresCutObj.wiresCut <> nil ) then
       edtWiresCut.Text := ENWiresCutObj.wiresCut.decimalString
    else
       edtWiresCut.Text := ''; 


  end;
end;



procedure TfrmENWiresCutEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWiresCut: ENWiresCutControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtWiresCut
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENWiresCut := HTTPRIOENWiresCut as ENWiresCutControllerSoapPort;


     if (ENWiresCutObj.wiresCut = nil ) then
       ENWiresCutObj.wiresCut := TXSDecimal.Create;
     if edtWiresCut.Text <> '' then
       ENWiresCutObj.wiresCut.decimalString := edtWiresCut.Text 
     else
       ENWiresCutObj.wiresCut := nil;

    if DialogState = dsInsert then
    begin
      ENWiresCutObj.code:=low(Integer);
      TempENWiresCut.add(ENWiresCutObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWiresCut.save(ENWiresCutObj);
    end;
  end;
end;


end.