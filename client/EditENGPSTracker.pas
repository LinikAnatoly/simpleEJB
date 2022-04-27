unit EditENGPSTracker;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENGPSTrackerController, ExtCtrls, AdvObj ;

type
  TfrmENGPSTrackerEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;


    HTTPRIOENGPSTracker: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    Panel1: TPanel;
    gbOveral: TGroupBox;
    edtCardNumber: TEdit;
    edtPhoneNumber: TEdit;
    edtReg_id: TEdit;
    lblReg_id: TLabel;
    lblPhoneNumber: TLabel;
    lblCardNumber: TLabel;
    grpHistory: TGroupBox;
    sgENGPSTrackerHistory: TAdvStringGrid;
    btnInstallToTransport: TButton;
    btnUnInstallGPS: TButton;
    edtTransportRealName: TEdit;
    lblTransportRealName: TLabel;
    HTTPRIOENGPSTrackerHistory: THTTPRIO;
    HTTPRIOTKTransportReal: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure updateHistory;
    procedure btnInstallToTransportClick(Sender: TObject);
    procedure btnUnInstallGPSClick(Sender: TObject);
    procedure sgENGPSTrackerHistoryColumnSizing(Sender: TObject; ACol,
      ColumnSize: Integer);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENGPSTrackerEdit: TfrmENGPSTrackerEdit;
  ENGPSTrackerObj: ENGPSTracker;

implementation

uses ENGPSTrackerHistoryController, TKTransportRealController, ENConsts,
  EditGPSTrackerInstall;



{$R *.dfm}


var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENGPSTrackerHistoryHeaders: array [1..11] of String =
        ( 'Код'
          ,'Дата початку періоду'
          ,'Дата закінчення періоду'
          ,'Найменування транспортного засобу'
          ,'Держ.номер транспортного засобу'
          ,'Інвентарний номер транспортного засобу'
          ,'Рестраційний номер трекеру'
          ,'Номер телефону SIM-карти'
          ,'код  SIM-карти'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );


procedure TfrmENGPSTrackerEdit.updateHistory;
var
  TempENGPSTrackerHistory: ENGPSTrackerHistoryControllerSoapPort;
  i: Integer;
  ENGPSTrackerHistoryList: ENGPSTrackerHistoryShortList;
  gpsHistoryFilter : ENGPSTrackerHistoryFilter;
begin
  SetGridHeaders(ENGPSTrackerHistoryHeaders, sgENGPSTrackerHistory.ColumnHeaders);
  ColCount:=100;
  TempENGPSTrackerHistory :=  HTTPRIOENGPSTrackerHistory as ENGPSTrackerHistoryControllerSoapPort;

     gpsHistoryFilter := ENGPSTrackerHistoryFilter.Create;
     SetNullIntProps(gpsHistoryFilter);
     SetNullXSProps(gpsHistoryFilter);
     gpsHistoryFilter.gpsTracker := ENGPSTrackerRef.Create();
     gpsHistoryFilter.gpsTracker.code := ENGPSTrackerObj.code;

  ENGPSTrackerHistoryList := TempENGPSTrackerHistory.getScrollableFilteredList(gpsHistoryFilter,0,ColCount);
  LastCount:=High(ENGPSTrackerHistoryList.list);

  if LastCount > -1 then
     sgENGPSTrackerHistory.RowCount:=LastCount+2
  else
     sgENGPSTrackerHistory.RowCount:=2;

   with sgENGPSTrackerHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENGPSTrackerHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENGPSTrackerHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENGPSTrackerHistoryList.list[i].dateStart = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENGPSTrackerHistoryList.list[i].dateStart);

        if ENGPSTrackerHistoryList.list[i].dateFinal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENGPSTrackerHistoryList.list[i].dateFinal);

          Cells[3,i+1] := ENGPSTrackerHistoryList.list[i].realTransportName;
          Cells[4,i+1] := ENGPSTrackerHistoryList.list[i].realTransportGosNumber;
          Cells[5,i+1] := ENGPSTrackerHistoryList.list[i].realTransportInvNumber;

        Cells[6,i+1] := ENGPSTrackerHistoryList.list[i].reg_id;

        Cells[7,i+1] := ENGPSTrackerHistoryList.list[i].phoneNumber;

        Cells[8,i+1] := ENGPSTrackerHistoryList.list[i].cardNumber;

        Cells[9,i+1] := ENGPSTrackerHistoryList.list[i].userGen;

        if ENGPSTrackerHistoryList.list[i].dateEdit = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDateTimeWithDate2String(ENGPSTrackerHistoryList.list[i].dateEdit);
        Objects[0, i+1] := ENGPSTrackerHistoryList.list[i];

        LastRow:=i+1;
        sgENGPSTrackerHistory.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENGPSTrackerHistory.Row:=1;
    sgENGPSTrackerHistory.AutoSizeRows(True);

end;

procedure TfrmENGPSTrackerEdit.FormShow(Sender: TObject);
var TempTKTransportReal : TKTransportRealControllerSoapPort;
transportReal : TKTransportReal;
begin
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode, btnInstallToTransport, btnUnInstallGPS, grpHistory]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtReg_id
      ,edtPhoneNumber
      ,edtCardNumber
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENGPSTrackerObj.code);
    edtReg_id.Text := ENGPSTrackerObj.reg_id; 
    edtPhoneNumber.Text := ENGPSTrackerObj.phoneNumber;
    edtCardNumber.Text := ENGPSTrackerObj.cardNumber;

    if ENGPSTrackerObj.realTransport <> nil then
      if ENGPSTrackerObj.realTransport.code <> LOW_INT then
    begin
      TempTKTransportReal := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;
      transportReal :=  TempTKTransportReal.getObject(ENGPSTrackerObj.realTransport.code);
      edtTransportRealName.Text := transportReal.buhName + ' гос.№' + transportReal.gosNumber +
                                   ' інв.№' + transportReal.invNumber;
    end;

      updateHistory;
  end;


end;



procedure TfrmENGPSTrackerEdit.sgENGPSTrackerHistoryColumnSizing(
  Sender: TObject; ACol, ColumnSize: Integer);
begin
  inherited;
  sgENGPSTrackerHistory.AutoSizeRows(True);
end;

procedure TfrmENGPSTrackerEdit.btnInstallToTransportClick(Sender: TObject);
var
  TempENGPSTracker: ENGPSTrackerControllerSoapPort;
begin
frmGPSTrackerInstallEdit:=TfrmGPSTrackerInstallEdit.Create(Application, dsEdit);
  frmGPSTrackerInstallEdit.isInstall := True;
  frmGPSTrackerInstallEdit.gpsTrackerCode := ENGPSTrackerObj.code;
  try
    if frmGPSTrackerInstallEdit.ShowModal= mrOk then
      begin
        TempENGPSTracker := HTTPRIOENGPSTracker as ENGPSTrackerControllerSoapPort;
        ENGPSTrackerObj := TempENGPSTracker.getObject(ENGPSTrackerObj.code);
        FormShow(sender);
        updateHistory;
      end;
  finally
    frmGPSTrackerInstallEdit.Free;
    frmGPSTrackerInstallEdit:=nil;
  end;

end;

procedure TfrmENGPSTrackerEdit.btnUnInstallGPSClick(Sender: TObject);
var
  TempENGPSTracker: ENGPSTrackerControllerSoapPort;
begin
frmGPSTrackerInstallEdit:=TfrmGPSTrackerInstallEdit.Create(Application, dsEdit);
    frmGPSTrackerInstallEdit.isUnInstall := True;
    frmGPSTrackerInstallEdit.gpsTrackerCode := ENGPSTrackerObj.code;
  try
    if frmGPSTrackerInstallEdit.ShowModal= mrOk then
      begin
        TempENGPSTracker := HTTPRIOENGPSTracker as ENGPSTrackerControllerSoapPort;
        ENGPSTrackerObj := TempENGPSTracker.getObject(ENGPSTrackerObj.code);
        FormShow(sender);
        updateHistory;
      end;
  finally
    frmGPSTrackerInstallEdit.Free;
    frmGPSTrackerInstallEdit:=nil;
  end;
end;

procedure TfrmENGPSTrackerEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENGPSTracker: ENGPSTrackerControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtReg_id
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENGPSTracker := HTTPRIOENGPSTracker as ENGPSTrackerControllerSoapPort;

    ENGPSTrackerObj.reg_id := edtReg_id.Text;
    ENGPSTrackerObj.phoneNumber := edtPhoneNumber.Text; 
    ENGPSTrackerObj.cardNumber := edtCardNumber.Text;


    if DialogState = dsInsert then
    begin
      ENGPSTrackerObj.code := Low(Integer);
      TempENGPSTracker.add(ENGPSTrackerObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENGPSTracker.save(ENGPSTrackerObj);
    end;
  end;
end;


end.