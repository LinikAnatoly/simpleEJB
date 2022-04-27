
unit EditENUnitedGroup2TechCondServices;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENUnitedGroup2TechCondServicesController ;

type
  TfrmENUnitedGroup2TechCondServicesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCostLines04Building : TLabel;
    edtCostLines04Building: TEdit;
    lblCostLines10Building : TLabel;
    edtCostLines10Building: TEdit;


  HTTPRIOENUnitedGroup2TechCondServices: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblCaption: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENUnitedGroup2TechCondServicesEdit: TfrmENUnitedGroup2TechCondServicesEdit;
  ENUnitedGroup2TechCondServicesObj: ENUnitedGroup2TechCondServices;

implementation


{uses  
    EnergyproController, EnergyproController2, ENUnitedGroup2TechCondServicesController  ;
}
{$R *.dfm}



procedure TfrmENUnitedGroup2TechCondServicesEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);
  SetFloatStyle([edtCostLines04Building, edtCostLines10Building]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENUnitedGroup2TechCondServicesObj.code);
    if ( ENUnitedGroup2TechCondServicesObj.costLines04Building <> nil ) then
       edtCostLines04Building.Text := ENUnitedGroup2TechCondServicesObj.costLines04Building.decimalString
    else
       edtCostLines04Building.Text := ''; 

    if ( ENUnitedGroup2TechCondServicesObj.costLines10Building <> nil ) then
       edtCostLines10Building.Text := ENUnitedGroup2TechCondServicesObj.costLines10Building.decimalString
    else
       edtCostLines10Building.Text := '';
  end;
end;



procedure TfrmENUnitedGroup2TechCondServicesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENUnitedGroup2TechCondServices: ENUnitedGroup2TechCondServicesControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    if (edtCostLines04Building.Text = '') and (edtCostLines10Building.Text = '') then
    begin
      Application.MessageBox(PChar('Заповніть хоча б одне поле з вартістю!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
      edtCostLines04Building.SetFocus;
      Action := caNone;
      Exit;
    end;

    TempENUnitedGroup2TechCondServices := HTTPRIOENUnitedGroup2TechCondServices as ENUnitedGroup2TechCondServicesControllerSoapPort;


     if (ENUnitedGroup2TechCondServicesObj.costLines04Building = nil ) then
       ENUnitedGroup2TechCondServicesObj.costLines04Building := TXSDecimal.Create;
     if edtCostLines04Building.Text <> '' then
       ENUnitedGroup2TechCondServicesObj.costLines04Building.decimalString := edtCostLines04Building.Text
     else
       ENUnitedGroup2TechCondServicesObj.costLines04Building := nil;

     if (ENUnitedGroup2TechCondServicesObj.costLines10Building = nil ) then
       ENUnitedGroup2TechCondServicesObj.costLines10Building := TXSDecimal.Create;
     if edtCostLines10Building.Text <> '' then
       ENUnitedGroup2TechCondServicesObj.costLines10Building.decimalString := edtCostLines10Building.Text
     else
       ENUnitedGroup2TechCondServicesObj.costLines10Building := nil;

    if DialogState = dsInsert then
    begin
      ENUnitedGroup2TechCondServicesObj.code:=low(Integer);
      TempENUnitedGroup2TechCondServices.add(ENUnitedGroup2TechCondServicesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENUnitedGroup2TechCondServices.save(ENUnitedGroup2TechCondServicesObj);
    end;
  end;
end;


procedure TfrmENUnitedGroup2TechCondServicesEdit.FormCreate(
  Sender: TObject);
begin
  inherited;
  lblCaption.Caption := '';
end;

end.
