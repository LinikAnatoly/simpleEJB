unit EditENAutoTiresInstallation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ImgList, TB2Item, TB2Dock, TB2Toolbar, StdCtrls,
  ComCtrls, Buttons, InvokeRegistry, Rio, SOAPHTTPClient,
  ENAutoTiresController, ENAutoTiresHistoryController, ENConsts;

type
  TfrmENAutoTiresInstallationEdit = class(TDialogForm)
    Label1: TLabel;
    ImageList1: TImageList;
    lblInstallDate: TLabel;
    gbENAutoTires: TGroupBox;
    Label38: TLabel;
    btnGo: TButton;
    btnClose: TButton;
    lblZonesInfo: TLabel;
    lblZoneType: TLabel;
    cbENTiresInstallPlaces: TComboBox;
    lblName: TLabel;
    edtBuhName: TEdit;
    edtInvNumber: TEdit;
    spbTKTransportReal: TSpeedButton;
    edtTiresSerialNumber: TEdit;
    edtTiresTypeName: TEdit;
    lblGosNumber: TLabel;
    edtGosNumber: TEdit;
    spbENAutoTires: TSpeedButton;
    edtInstallDate: TDateTimePicker;
    edtUninstallReason: TEdit;
    lblUninstallReason: TLabel;
    HTTPRIOENAutoTiresHistory: THTTPRIO;
    lblUninstallDate: TLabel;
    edtUninstallDate: TDateTimePicker;
    HTTPRIOENAutoTires: THTTPRIO;
    edtActNumber: TEdit;
    lblActNumber: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGoClick(Sender: TObject);
    procedure spbENAutoTiresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    transportRealCode : Integer;
    installPlacescCode : Integer;
    tiresCode, tiresHistoryCode : Integer;

  end;

var
  frmENAutoTiresInstallationEdit : TfrmENAutoTiresInstallationEdit;
  stateCode : Integer = -1;
  ENAutoTiresHistoryObj : ENAutoTiresHistory;
  ENAutoTiresObj : ENAutoTires;

implementation

uses ChildFormUnit, XSBuiltIns, ShowENAutoTires,
     ENTiresInstallPlacesController, TKTransportRealController,
  Math;

{$R *.dfm}


procedure TfrmENAutoTiresInstallationEdit.FormShow(Sender: TObject);
var TempENAutoTiresHistory : ENAutoTiresHistoryControllerSoapPort;
    TempENAutoTires : ENAutoTiresControllerSoapPort;
begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    //edtInstallDate.DateTime := SysUtils.Date;
    //edtInstallDate.checked := false;

    if tiresHistoryCode <> 0 then
    begin

      DisableControls([edtTiresSerialNumber, edtTiresTypeName,
         cbENTiresInstallPlaces, spbENAutoTires]);

      TempENAutoTiresHistory := HTTPRIOENAutoTiresHistory as ENAutoTiresHistoryControllerSoapPort;
      ENAutoTiresHistoryObj := ENAutoTiresHistory.Create;
      ENAutoTiresHistoryObj := TempENAutoTiresHistory.getObject(tiresHistoryCode);

      TempENAutoTires := HTTPRIOENAutoTires as ENAutoTiresControllerSoapPort;
      ENAutoTiresObj := ENAutoTires.Create;
      tiresCode := ENAutoTiresHistoryObj.tiresRef.code;
      ENAutoTiresObj := TempENAutoTires.getObject(tiresCode);

      edtTiresSerialNumber.Text := ENAutoTiresObj.serialNumber;
      edtTiresTypeName.Text := ENAutoTiresObj.typeName;

      cbENTiresInstallPlaces.ItemIndex := ENAutoTiresHistoryObj.installPlacesRef.code-1;

      if ENAutoTiresHistoryObj.installDate <> nil then
      begin
        edtInstallDate.DateTime := EncodeDate(ENAutoTiresHistoryObj.installDate.Year,ENAutoTiresHistoryObj.installDate.Month,ENAutoTiresHistoryObj.installDate.Day);
        edtInstallDate.checked := true;

        edtUninstallDate.DateTime := SysUtils.Date;
        edtUninstallDate.checked := true;

      end;
    end;

  end;

end;

procedure TfrmENAutoTiresInstallationEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i: Integer;
begin


end;


procedure TfrmENAutoTiresInstallationEdit.btnGoClick(Sender: TObject);
var i: Integer;
    TempENAutoTiresHistory : ENAutoTiresHistoryControllerSoapPort;
    TempENAutoTires : ENAutoTiresControllerSoapPort;
begin

    if (edtTiresSerialNumber.Text = '') then
    begin
      Application.MessageBox(PChar('Выберите автопокрышку!'),PChar('Ошибка!'),MB_ICONERROR);
      edtTiresSerialNumber.SetFocus;
      Exit;
    end;

    if (btnGo.Caption = 'Установить')  then
    begin
      TempENAutoTires := HTTPRIOENAutoTires as ENAutoTiresControllerSoapPort;
      ENAutoTiresObj := ENAutoTires.Create;
      ENAutoTiresObj := TempENAutoTires.getObject(tiresCode);

      if (ENAutoTiresObj.installStatusRef.code = ENTIRESINSTALLSTATUS_YES) then
         begin
           Application.MessageBox(PChar('Покрышка уже установлена на другом автомобиле!'),PChar('Ошибка!'),MB_ICONERROR);
           Exit;
         end;
    end;


    if (cbENTiresInstallPlaces.ItemIndex = -1) then
     begin
       Application.MessageBox(PChar('Укажите место установки!'),PChar('Ошибка!'),MB_ICONERROR);
       cbENTiresInstallPlaces.SetFocus;
       Exit;
     end;


    if (btnGo.Caption = 'Снять') and (not NoBlankValues([edtUninstallDate])) then
     begin
       Application.MessageBox(PChar('Укажите дату снятия!'),PChar('Ошибка!'),MB_ICONERROR);
       edtUninstallDate.SetFocus;
       Exit;
     end;

    if (not NoBlankValues([edtActNumber])) then
     begin
       Application.MessageBox(PChar('Введите № Акта!!!'),PChar('Ошибка!'),MB_ICONERROR);
       edtActNumber.SetFocus;
       Exit;
     end;

     if not NoBlankValues([edtInstallDate]) then
     begin
         Application.MessageBox(PChar('Укажите дату установки!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
         edtInstallDate.SetFocus;
         Exit;
     end else
     begin
      TempENAutoTiresHistory := HTTPRIOENAutoTiresHistory as ENAutoTiresHistoryControllerSoapPort;

      if tiresHistoryCode <> 0 then
      begin
        ENAutoTiresHistoryObj.uninstallDate := TXSDate.Create;
        ENAutoTiresHistoryObj.uninstallDate.XSToNative(GetXSDate(edtUninstallDate.DateTime));

        if edtUninstallReason.Text <> '' then
           ENAutoTiresHistoryObj.replacementReason := edtUninstallReason.Text;

           ENAutoTiresHistoryObj.actUninstallNumber := edtActNumber.Text;

           TempENAutoTiresHistory.save(ENAutoTiresHistoryObj);
      end else
      begin
        ENAutoTiresHistoryObj := ENAutoTiresHistory.Create;

        if edtinstallDate.checked then
        begin
          if ENAutoTiresHistoryObj.installDate = nil then
             ENAutoTiresHistoryObj.installDate := TXSDate.Create;
             ENAutoTiresHistoryObj.installDate.XSToNative(GetXSDate(edtInstallDate.DateTime));
        end
        else
          ENAutoTiresHistoryObj.installDate := nil;

        if edtUninstallDate.checked then
        begin
          if ENAutoTiresHistoryObj.uninstallDate = nil then
             ENAutoTiresHistoryObj.uninstallDate := TXSDate.Create;
             ENAutoTiresHistoryObj.uninstallDate.XSToNative(GetXSDate(edtUninstallDate.DateTime));
        end
        else
          ENAutoTiresHistoryObj.uninstallDate := nil;

        if (btnGo.Caption = 'Установить')  then
        begin
          ENAutoTiresHistoryObj.distance := TXSDecimal.Create;
          ENAutoTiresHistoryObj.distance.decimalString := '0';
          ENAutoTiresHistoryObj.actInstallNumber := edtActNumber.Text;
        end;

        ENAutoTiresHistoryObj.installPlacesRef := ENTiresInstallPlacesRef.Create;
        ENAutoTiresHistoryObj.installPlacesRef.code := cbENTiresInstallPlaces.ItemIndex+1;

        ENAutoTiresHistoryObj.transportRealRef := TKTransportRealRef.Create;
        ENAutoTiresHistoryObj.transportRealRef.code := transportRealCode;

        ENAutoTiresHistoryObj.tiresRef := ENAutoTiresRef.Create;
        ENAutoTiresHistoryObj.tiresRef.code := tiresCode;

        TempENAutoTiresHistory.add(ENAutoTiresHistoryObj);
      end;

     end;

     ModalResult := mrOk;
end;


procedure TfrmENAutoTiresInstallationEdit.spbENAutoTiresClick(
  Sender: TObject);
var
   frmENAutoTiresShow : TfrmENAutoTiresShow;
   f : ENAutoTiresFilter;
begin
   f := ENAutoTiresFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.conditionSQL := 'ENAUTOTIRES.INSTALLSTATUSREFCODE = 0';

   frmENAutoTiresShow := TfrmENAutoTiresShow.Create(Application, fmNormal, f);

   try
      with frmENAutoTiresShow do
        if ShowModal = mrOk then
        begin
            try
               tiresCode := StrToInt(GetReturnValue(sgENAutoTires,0));
               edtTiresSerialNumber.Text:=GetReturnValue(sgENAutoTires,3);
               edtTiresTypeName.Text:= GetReturnValue(sgENAutoTires,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENAutoTiresShow.Free;
   end;
end;

end.

