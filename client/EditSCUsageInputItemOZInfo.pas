
unit EditSCUsageInputItemOZInfo;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCUsageInputItemOZInfoController ;

type
  TfrmSCUsageInputItemOZInfoEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblSourceCode : TLabel;
    edtSourceCode_: TEdit;
    lblAccount : TLabel;
    edtAccount_: TEdit;
    lblExpensesCode : TLabel;
    edtExpensesCode_: TEdit;
    lblSumWithNds : TLabel;
    edtSumWithNds: TEdit;
    lblSumNds : TLabel;
    edtSumNds: TEdit;
    lblSumGen : TLabel;
    edtSumGen: TEdit;

  btnOk: TButton;
  btnCancel: TButton;
    edtAccount: TComboBox;
    edtSourceCode: TComboBox;
    edtExpensesCode: TComboBox;
    HTTPRIOSCUsageInputItemOZInfo: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSumWithNdsChange(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmSCUsageInputItemOZInfoEdit: TfrmSCUsageInputItemOZInfoEdit;
  SCUsageInputItemOZInfoObj: SCUsageInputItemOZInfo;

implementation


uses
    SCUsageInputItemOZController, SCUsageInputItemOZ2SCCounterController
    , ENSettingsConsts, DMReportsUnit, EditSCUsageInput;

{$R *.dfm}



procedure TfrmSCUsageInputItemOZInfoEdit.FormShow(Sender: TObject);
var
  account, accountExpertise : String;
  frmEditSCUsageInput : TfrmSCUsageInputEdit;
begin
  DisableControls([edtCode]);
  SetFloatStyle([edtSumWithNds, edtSumGen]);

  edtSumNds.Text := '0.00';
  DisableControls([edtSumNds]);

  account := DMReports.getSettingValueByKey(ENSettingsConsts.ACCOUNT_FOR_COUNTER_INCOME);
  accountExpertise := DMReports.getSettingValueByKey(ENSettingsConsts.ACCOUNT_FOR_CUSTOMER_COUNTER_EXPERTISE);
  edtAccount.Items.Add(account);
  edtAccount.Items.Add(accountExpertise);
  edtAccount.ItemIndex := 0;

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) then begin
    /// SUPP-58999 Определение счета для ОЗ
    ///  если поле с номером акта приглашение не пустое, то приходуется
    ///  на забалансовый счет по акту экспертизы, если нет - то на обычный
    ///  счет безвозмездного принятия счетчиков
    frmEditSCUsageInput := TfrmSCUsageInputEdit.Create(Application, dsEdit);
    if frmEditSCUsageInput.isForExpertise(SCUsageInputItemOZInfoObj.usageInputItemOZRef.code) then begin
      edtAccount.ItemIndex := 1;
    end;
    frmEditSCUsageInput.Free;
    frmEditSCUsageInput:=nil;
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    SetFloatStyle([edtSumWithNds, edtSumNds, edtSumGen]);
    DenyBlankValues([
      edtSourceCode
      ,edtAccount
      ,edtExpensesCode
      ,edtSumWithNds
      ,edtSumNds
      ,edtSumGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(SCUsageInputItemOZInfoObj.code);
    edtSourceCode.Text := SCUsageInputItemOZInfoObj.sourceCode;
    if SCUsageInputItemOZInfoObj.account = accountExpertise then begin
       edtAccount.ItemIndex := 1;
    end;

    edtExpensesCode.Text := SCUsageInputItemOZInfoObj.expensesCode; 
    if ( SCUsageInputItemOZInfoObj.sumWithNds <> nil ) then
       edtSumWithNds.Text := SCUsageInputItemOZInfoObj.sumWithNds.decimalString
    else
       edtSumWithNds.Text := ''; 
    if ( SCUsageInputItemOZInfoObj.sumNds <> nil ) then
       edtSumNds.Text := SCUsageInputItemOZInfoObj.sumNds.decimalString
    else
       edtSumNds.Text := ''; 
    if ( SCUsageInputItemOZInfoObj.sumGen <> nil ) then
       edtSumGen.Text := SCUsageInputItemOZInfoObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 


  end;
end;



procedure TfrmSCUsageInputItemOZInfoEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCUsageInputItemOZInfo: SCUsageInputItemOZInfoControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtSourceCode
      ,edtAccount
      ,edtExpensesCode
      ,edtSumWithNds
      ,edtSumNds
      ,edtSumGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin


    TempSCUsageInputItemOZInfo := HTTPRIOSCUsageInputItemOZInfo as SCUsageInputItemOZInfoControllerSoapPort;


     SCUsageInputItemOZInfoObj.sourceCode := edtSourceCode.Text;

     SCUsageInputItemOZInfoObj.account := edtAccount.Text;

     SCUsageInputItemOZInfoObj.expensesCode := edtExpensesCode.Text;

     if (SCUsageInputItemOZInfoObj.sumWithNds = nil ) then
       SCUsageInputItemOZInfoObj.sumWithNds := TXSDecimal.Create;
     if edtSumWithNds.Text <> '' then
       SCUsageInputItemOZInfoObj.sumWithNds.decimalString := edtSumWithNds.Text
     else
       SCUsageInputItemOZInfoObj.sumWithNds := nil;

     if (SCUsageInputItemOZInfoObj.sumNds = nil ) then
       SCUsageInputItemOZInfoObj.sumNds := TXSDecimal.Create;
     if edtSumNds.Text <> '' then
       SCUsageInputItemOZInfoObj.sumNds.decimalString := edtSumNds.Text
     else
       SCUsageInputItemOZInfoObj.sumNds := nil;

     if (SCUsageInputItemOZInfoObj.sumGen = nil ) then
       SCUsageInputItemOZInfoObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
     begin
       SCUsageInputItemOZInfoObj.sumGen.decimalString := edtSumGen.Text;
       if  StrToFloat(SCUsageInputItemOZInfoObj.sumGen.decimalString) = 0 then
       begin
        Application.MessageBox(PChar('Вартість повинна бути більше 0 !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action:=caNone;
        Exit;
       end;
     end
     else
       SCUsageInputItemOZInfoObj.sumGen := nil;

    if DialogState = dsInsert then
    begin
      SCUsageInputItemOZInfoObj.code:=low(Integer);
      TempSCUsageInputItemOZInfo.add(SCUsageInputItemOZInfoObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempSCUsageInputItemOZInfo.save(SCUsageInputItemOZInfoObj);
    end;
  end;
end;


procedure TfrmSCUsageInputItemOZInfoEdit.edtSumWithNdsChange(
  Sender: TObject);
begin
  inherited;
  edtSumGen.Text := edtSumWithNds.Text;
end;

end.