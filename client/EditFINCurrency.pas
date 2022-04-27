
unit EditFINCurrency;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINCurrencyController ;

type
  TfrmFINCurrencyEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblShortName : TLabel;
    edtShortName: TEdit;
    lblIsoAlphabeticCode : TLabel;
    edtIsoAlphabeticCode: TEdit;
    lblIsoNumericCode : TLabel;
    edtIsoNumericCode: TEdit;
    lblSign : TLabel;
    edtSign: TEdit;


  HTTPRIOFINCurrency: THTTPRIO;

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
  frmFINCurrencyEdit: TfrmFINCurrencyEdit;
  FINCurrencyObj: FINCurrency;

implementation


{uses  
    EnergyproController, EnergyproController2, FINCurrencyController  ;
}
{$R *.dfm}



procedure TfrmFINCurrencyEdit.FormShow(Sender: TObject);

begin

 DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtShortName
      ,edtIsoAlphabeticCode
      ,edtIsoNumericCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(FINCurrencyObj.code);
    edtName.Text := FINCurrencyObj.name; 
    edtShortName.Text := FINCurrencyObj.shortName; 
    edtIsoAlphabeticCode.Text := FINCurrencyObj.isoAlphabeticCode; 
    edtIsoNumericCode.Text := FINCurrencyObj.isoNumericCode; 
    edtSign.Text := FINCurrencyObj.sign; 


  end;
end;



procedure TfrmFINCurrencyEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINCurrency: FINCurrencyControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtShortName
      ,edtIsoAlphabeticCode
      ,edtIsoNumericCode
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempFINCurrency := HTTPRIOFINCurrency as FINCurrencyControllerSoapPort;


     FINCurrencyObj.name := edtName.Text; 

     FINCurrencyObj.shortName := edtShortName.Text; 

     FINCurrencyObj.isoAlphabeticCode := edtIsoAlphabeticCode.Text; 

     FINCurrencyObj.isoNumericCode := edtIsoNumericCode.Text; 

     FINCurrencyObj.sign := edtSign.Text; 

    if DialogState = dsInsert then
    begin
      FINCurrencyObj.code:=low(Integer);
      TempFINCurrency.add(FINCurrencyObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINCurrency.save(FINCurrencyObj);
    end;
  end;
end;


end.