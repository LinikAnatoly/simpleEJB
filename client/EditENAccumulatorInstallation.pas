unit EditENAccumulatorInstallation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ImgList, TB2Item, TB2Dock, TB2Toolbar, StdCtrls,
  ComCtrls, Buttons, InvokeRegistry, Rio, SOAPHTTPClient,
  ENAccumulatorsController, ENAccumulatorsHistoryController;

type
  TfrmENAccumulatorInstallationEdit = class(TDialogForm)
    Label1: TLabel;
    ImageList1: TImageList;
    lblInstallDate: TLabel;
    gbENAccumulator: TGroupBox;
    Label38: TLabel;
    btnGo: TButton;
    btnClose: TButton;
    lblZonesInfo: TLabel;
    lblName: TLabel;
    edtBuhName: TEdit;
    edtInvNumber: TEdit;
    spbTKTransportReal: TSpeedButton;
    edtAccumulatorSerialNumber: TEdit;
    edtAccumulatorTypeName: TEdit;
    lblGosNumber: TLabel;
    edtGosNumber: TEdit;
    spbENAccumulator: TSpeedButton;
    edtInstallDate: TDateTimePicker;
    edtUninstallReason: TEdit;
    lblUninstallReason: TLabel;
    HTTPRIOENAccumulatorsHistory: THTTPRIO;
    lblUninstallDate: TLabel;
    edtUninstallDate: TDateTimePicker;
    HTTPRIOENAccumulators: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGoClick(Sender: TObject);
    procedure spbENAccumulatorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    transportRealCode : Integer;
    accumulatorCode, acmHistoryCode : Integer;

  end;

var
  frmENAccumulatorInstallationEdit : TfrmENAccumulatorInstallationEdit;
  stateCode : Integer = -1;
  ENAccumulatorsHistoryObj : ENAccumulatorsHistory;
  ENAccumulatorsObj : ENAccumulators;

implementation

uses ChildFormUnit, XSBuiltIns, ShowENAccumulators, TKTransportRealController,
     Math, ENConsts;

{$R *.dfm}


procedure TfrmENAccumulatorInstallationEdit.FormShow(Sender: TObject);
var TempENAccumulatorsHistory : ENAccumulatorsHistoryControllerSoapPort;
    TempENAccumulators : ENAccumulatorsControllerSoapPort;
begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    //edtInstallDate.DateTime := SysUtils.Date;
    //edtInstallDate.checked := false;

    if acmHistoryCode <> 0 then
    begin

      DisableControls([edtAccumulatorSerialNumber, edtAccumulatorTypeName, spbENAccumulator]);

      TempENAccumulatorsHistory := HTTPRIOENAccumulatorsHistory as ENAccumulatorsHistoryControllerSoapPort;
      ENAccumulatorsHistoryObj := ENAccumulatorsHistory.Create;
      ENAccumulatorsHistoryObj := TempENAccumulatorsHistory.getObject(acmHistoryCode);

      TempENAccumulators := HTTPRIOENAccumulators as ENAccumulatorsControllerSoapPort;
      ENAccumulatorsObj := ENAccumulators.Create;
      accumulatorCode := ENAccumulatorsHistoryObj.accumulatorsRef.code;
      ENAccumulatorsObj := TempENAccumulators.getObject(accumulatorCode);

      edtAccumulatorSerialNumber.Text := ENAccumulatorsObj.serialNumber;
      edtAccumulatorTypeName.Text := ENAccumulatorsObj.typeName;

      if ENAccumulatorsHistoryObj.installDate <> nil then
      begin
        edtInstallDate.DateTime := EncodeDate(ENAccumulatorsHistoryObj.installDate.Year,ENAccumulatorsHistoryObj.installDate.Month,ENAccumulatorsHistoryObj.installDate.Day);
        edtInstallDate.checked := true;

        edtUninstallDate.DateTime := SysUtils.Date;
        edtUninstallDate.checked := true;

      end;
    end;

  end;

end;

procedure TfrmENAccumulatorInstallationEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i: Integer;
begin


end;


procedure TfrmENAccumulatorInstallationEdit.btnGoClick(Sender: TObject);
var i : Integer;
    TempENAccumulatorsHistory : ENAccumulatorsHistoryControllerSoapPort;
    TempENAccumulators : ENAccumulatorsControllerSoapPort;
begin

   if (edtAccumulatorSerialNumber.Text = '') then
    begin
      Application.MessageBox(PChar('Выберите аккумулятор!'),PChar('Ошибка!'),MB_ICONERROR);
      edtAccumulatorSerialNumber.SetFocus;
      Exit;
    end;

    if (btnGo.Caption = 'Установить')  then
    begin
      TempENAccumulators := HTTPRIOENAccumulators as ENAccumulatorsControllerSoapPort;
      ENAccumulatorsObj := ENAccumulators.Create;
      ENAccumulatorsObj := TempENAccumulators.getObject(accumulatorCode);

       if (ENAccumulatorsObj.installStatusRef.code = ENACCUMULATORSSTATUS_YES) then
         begin
           Application.MessageBox(PChar('Аккумулятор уже установлен на другом автомобиле!'),PChar('Ошибка!'),MB_ICONERROR);
           Exit;
         end;
    end;

    if (btnGo.Caption = 'Снять') and (not NoBlankValues([edtUninstallDate])) then
     begin
       Application.MessageBox(PChar('Укажите дату снятия!'),PChar('Ошибка!'),MB_ICONERROR);
       edtUninstallDate.SetFocus;
       Exit;
     end;

     if not NoBlankValues([edtInstallDate])  then
     begin
         Application.MessageBox(PChar('Укажите дату установки!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
         edtInstallDate.SetFocus;
         Exit;
     end else
     begin
      TempENAccumulatorsHistory := HTTPRIOENAccumulatorsHistory as ENAccumulatorsHistoryControllerSoapPort;

      if acmHistoryCode <> 0 then
      begin
        ENAccumulatorsHistoryObj.uninstallDate := TXSDate.Create;
        ENAccumulatorsHistoryObj.uninstallDate.XSToNative(GetXSDate(edtUninstallDate.DateTime));

        if edtUninstallReason.Text <> '' then
           ENAccumulatorsHistoryObj.replacementReason := edtUninstallReason.Text;

        TempENAccumulatorsHistory.save(ENAccumulatorsHistoryObj);

      end else
      begin
        ENAccumulatorsHistoryObj := ENAccumulatorsHistory.Create;

        if edtinstallDate.checked then
        begin
          if ENAccumulatorsHistoryObj.installDate = nil then
             ENAccumulatorsHistoryObj.installDate := TXSDate.Create;
             ENAccumulatorsHistoryObj.installDate.XSToNative(GetXSDate(edtInstallDate.DateTime));
        end
        else
          ENAccumulatorsHistoryObj.installDate := nil;

        if edtUninstallDate.checked then
        begin
          if ENAccumulatorsHistoryObj.uninstallDate = nil then
             ENAccumulatorsHistoryObj.uninstallDate := TXSDate.Create;
             ENAccumulatorsHistoryObj.uninstallDate.XSToNative(GetXSDate(edtUninstallDate.DateTime));
        end
        else
          ENAccumulatorsHistoryObj.uninstallDate := nil;

        if (btnGo.Caption = 'Установить') then
        begin
          ENAccumulatorsHistoryObj.distance := TXSDecimal.Create;
          ENAccumulatorsHistoryObj.distance.decimalString := '0';
        end;

        ENAccumulatorsHistoryObj.transportRealRef := TKTransportRealRef.Create;
        ENAccumulatorsHistoryObj.transportRealRef.code := transportRealCode;

        ENAccumulatorsHistoryObj.accumulatorsRef := ENAccumulatorsRef.Create;
        ENAccumulatorsHistoryObj.accumulatorsRef.code := accumulatorCode;

        TempENAccumulatorsHistory.add(ENAccumulatorsHistoryObj);
      end;

     end;

     ModalResult := mrOk;
end;


procedure TfrmENAccumulatorInstallationEdit.spbENAccumulatorClick(
  Sender: TObject);
var
   frmENAccumulatorsShow : TfrmENAccumulatorsShow;
   f : ENAccumulatorsFilter;
begin
   f := ENAccumulatorsFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.conditionSQL := 'enaccumulators.installstatusrefcode = 0';

   frmENAccumulatorsShow := TfrmENAccumulatorsShow.Create(Application, fmNormal, f);

   try
      with frmENAccumulatorsShow do
        if ShowModal = mrOk then
        begin
            try
               accumulatorCode := StrToInt(GetReturnValue(sgENAccumulators,0));
               edtAccumulatorSerialNumber.Text:=GetReturnValue(sgENAccumulators,3);
               edtAccumulatorTypeName.Text:= GetReturnValue(sgENAccumulators,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENAccumulatorsShow.Free;
   end;
end;

end.

