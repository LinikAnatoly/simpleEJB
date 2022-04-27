
unit EditENSOBill;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOBillController, ExtCtrls
  , ENServicesObjectController;

type
  TfrmENSOBillEdit = class(TDialogForm)


  HTTPRIOENSOBill: THTTPRIO;
    pnlNumberGen: TPanel;
    lblNumberGen: TLabel;
    edtNumberGen: TEdit;
    pnlDateGen: TPanel;
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    btnGetSumFromActs: TButton;
    pnlSumTotal: TPanel;
    pnlSumGen: TPanel;
    lblSumTotal: TLabel;
    edtSumTotal: TEdit;
    pnlSumVat: TPanel;
    pnlCode: TPanel;
    pnlButtons: TPanel;
    lblSumGen: TLabel;
    edtSumGen: TEdit;
    lblSumVat: TLabel;
    edtSumVat: TEdit;
    lblCode: TLabel;
    edtCode: TEdit;
    btnCancel: TButton;
    btnOk: TButton;
    HTTPRIOENServicesObject: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure edtSumTotalChange(Sender: TObject);
  procedure btnGetSumFromActsClick(Sender: TObject);
  
  
  private
    // объект договора с которым связан этот счет
    servicesObject : ENServicesObject;
    { Private declarations }
  public
    { Public declarations }
  constructor Create(AOwner: TComponent; DialogState: TDialogState;
    sumTotal : Double); reintroduce; overload;


end;

var
  frmENSOBillEdit: TfrmENSOBillEdit;
  ENSOBillObj: ENSOBill;

implementation

uses Math, ENConsts, Generics.Collections;


{uses  
    EnergyproController, EnergyproController2, ENSOBillController  ;
}
{$R *.dfm}


constructor TfrmENSOBillEdit.Create(AOwner: TComponent; DialogState: TDialogState;
  sumTotal : Double);
begin
  inherited Create(AOwner, DialogState);
  if DialogState = dsInsert then begin
    edtSumTotal.Text := FloatToStr(sumTotal);
  end;
end;

procedure TfrmENSOBillEdit.FormShow(Sender: TObject);
var
  TempENServicesObject : ENServicesObjectControllerSoapPort;
begin

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if Assigned(ENSOBillObj) and Assigned(ENSOBillObj.servicesObjectRef)
    and (ENSOBillObj.servicesObjectRef.code <> Low(Integer)) then begin
      servicesObject := TempENServicesObject.getObject(ENSOBillObj.servicesObjectRef.code);
  end;

  if Assigned(servicesObject)
    and (servicesObject.contractTypeRef.code <> ENSERVICESOBJECTTYPE_CONNECTION) then begin
    // SUPP-88724 Поле для заполнения номера счета отображается
    // только для договоров на присоединение
    HideControls([pnlNumberGen]);
  end;

  DisableControls([ edtCode]);
  SetFloatStyle([edtSumTotal , edtSumGen , edtSumVat ]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtSumTotal , edtSumGen , edtSumVat]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSOBillObj.code);
      SetDateFieldForDateTimePicker(edtDateGen, ENSOBillObj.dateGen);
    if ( ENSOBillObj.sumTotal <> nil ) then
       edtSumTotal.Text := ENSOBillObj.sumTotal.decimalString
    else
       edtSumTotal.Text := ''; 
    if ( ENSOBillObj.sumGen <> nil ) then
       edtSumGen.Text := ENSOBillObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 
    if ( ENSOBillObj.sumVat <> nil ) then
       edtSumVat.Text := ENSOBillObj.sumVat.decimalString
    else
       edtSumVat.Text := '';

    edtNumberGen.Text := ENSOBillObj.numberGen;

  end;
end;



procedure TfrmENSOBillEdit.btnGetSumFromActsClick(Sender: TObject);
var TempENSOBill: ENSOBillControllerSoapPort;

begin
 TempENSOBill := HTTPRIOENSOBill as ENSOBillControllerSoapPort;

  if edtDateGen.Checked = False then
  begin
      Application.MessageBox(PChar('Установите дату!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      edtDateGen.SetFocus;
  end
  else
  begin
      ENSOBillObj.dateGen := GetTXSDateFromTDateTimePicker(edtdateGen);
      edtSumTotal.Text :=  FloatToStr(TempENSOBill.getSumByActs(ENSOBillObj));
  end;

end;

procedure TfrmENSOBillEdit.edtSumTotalChange(Sender: TObject);
begin
  if edtSumTotal.Text <> '' then
   begin
    edtSumGen.Text:= FloatToStr(RoundTo(StrToFloat(edtSumTotal.text) / 6 * 5 , -2));
    edtSumVat.Text:= FloatToStr(RoundTo(StrToFloat(edtSumTotal.text) / 6  , -2 ));
   end
   else
   begin
     edtSumGen.Text:= '';
     edtSumVat.Text:= '';
   end;


end;

procedure TfrmENSOBillEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOBill: ENSOBillControllerSoapPort;
ctrls : TList<TWinControl>;
begin
    ctrls := TList<TWinControl>.Create;
    ctrls.AddRange([edtSumTotal , edtSumGen , edtSumVat, edtDateGen]);
  if servicesObject.contractTypeRef.code = ENSERVICESOBJECTTYPE_CONNECTION then begin
    ctrls.Add(edtNumberGen);
  end;


  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues(ctrls.ToArray())  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSOBill := HTTPRIOENSOBill as ENSOBillControllerSoapPort;


     ENSOBillObj.dateGen := GetTXSDateFromTDateTimePicker(edtdateGen);

     if (ENSOBillObj.sumTotal = nil ) then
       ENSOBillObj.sumTotal := TXSDecimal.Create;
     if edtSumTotal.Text <> '' then
       ENSOBillObj.sumTotal.decimalString := edtSumTotal.Text 
     else
       ENSOBillObj.sumTotal := nil;

     if (ENSOBillObj.sumGen = nil ) then
       ENSOBillObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       ENSOBillObj.sumGen.decimalString := edtSumGen.Text 
     else
       ENSOBillObj.sumGen := nil;

     if (ENSOBillObj.sumVat = nil ) then
       ENSOBillObj.sumVat := TXSDecimal.Create;
     if edtSumVat.Text <> '' then
       ENSOBillObj.sumVat.decimalString := edtSumVat.Text 
     else
       ENSOBillObj.sumVat := nil;

     ENSOBillObj.numberGen := edtNumberGen.Text;

    if DialogState = dsInsert then
    begin
      ENSOBillObj.code:=low(Integer);
      TempENSOBill.add(ENSOBillObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSOBill.save(ENSOBillObj);
    end;
  end;
end;


end.