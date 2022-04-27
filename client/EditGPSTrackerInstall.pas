
unit EditGPSTrackerInstall;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2  ;

type
  TfrmGPSTrackerInstallEdit = class(TDialogForm)
    lblInstallDate: TLabel;
    edtDate: TDateTimePicker;
    lblTransportToInstall: TLabel;

  btnOk: TButton;
  btnCancel: TButton;
    edtTransportToInstall: TEdit;
    btnTransportToInstallClear: TSpeedButton;
    btnTransportToInstall: TSpeedButton;
    HTTPRIOENGPSTracker: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTransportToInstallClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTransportToInstallClearClick(Sender: TObject);

  
  private
    { Private declarations }
  public
    { Public declarations }
  gpsTrackerCode, transportRealCode : Integer;
  isInstall, isUnInstall : Boolean;
  insDate: TXSDate;
end;

var
  frmGPSTrackerInstallEdit: TfrmGPSTrackerInstallEdit;



implementation

uses ShowTKTransportReal, ENConsts, ENGPSTrackerController;


{uses  
    EnergyproController, EnergyproController2, GPSTrackerInstallController  ;
}
{$R *.dfm}



procedure TfrmGPSTrackerInstallEdit.FormCreate(Sender: TObject);
begin
  inherited;
   gpsTrackerCode := LOW_INT;
   transportRealCode := LOW_INT;
   isInstall := false;
   isUnInstall := false;
end;

procedure TfrmGPSTrackerInstallEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtTransportToInstall]);

  if isUnInstall then
  begin
    HideControls([edtTransportToInstall, btnTransportToInstall, btnTransportToInstallClear]);
    lblInstallDate.Caption := 'Дата зняття';
  end;

  if isInstall then
  begin
  lblInstallDate.Caption := 'Дата встановлення';
  end;

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDate
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin



  end;
end;



procedure TfrmGPSTrackerInstallEdit.btnTransportToInstallClearClick(
  Sender: TObject);
begin
  inherited;
   transportRealCode := LOW_INT;
   edtTransportToInstall.Text := '';
end;

procedure TfrmGPSTrackerInstallEdit.btnTransportToInstallClick(
  Sender: TObject);
var
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin

   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin
            try
               transportRealCode := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTransportToInstall.Text:= GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;

procedure TfrmGPSTrackerInstallEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENGPSTracker: ENGPSTrackerControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDate
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENGPSTracker := HTTPRIOENGPSTracker as ENGPSTrackerControllerSoapPort;

       if edtDate.Checked then
    begin
     if insDate = nil then
        insDate := TXSDate.Create;
        insDate.XSToNative(GetXSDate(edtDate.DateTime));
    end;

    if DialogState = dsEdit then
    begin
    if isInstall then
      TempENGPSTracker.installGPS(gpsTrackerCode, transportRealCode, insDate)
      else if isUnInstall then
       TempENGPSTracker.unInstallGPS(gpsTrackerCode, insDate)
    end;
  end;
end;


end.