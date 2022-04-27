unit EditCheckpointRegistration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DialogFormUnit, ChildFormUnit, InvokeRegistry,
  Rio, SOAPHTTPClient, Grids, AdvObj, BaseGrid, AdvGrid, ExtCtrls, ENTravelSheetController,
  ENCheckpointPassListItemController;

type
  TfrmCheckpointRegistration = class(TChildForm)
    gbTravelSheetInfo: TGroupBox;
    lblNumberGen: TLabel;
    lblAuto: TLabel;
    lblDriver: TLabel;
    btnGetTravelSheet: TButton;
    HTTPRIOTKTransportReal: THTTPRIO;
    HTTPRIOENTravelSheet: THTTPRIO;
    HTTPRIOTKDriverSertificate: THTTPRIO;
    edtTravelSheetCode: TEdit;
    HTTPRIOFINWorker: THTTPRIO;
    lblDate: TLabel;
    Panel1: TPanel;
    sgENCheckpointPassListItem: TAdvStringGrid;
    HTTPRIOENCheckpointPassListItem: THTTPRIO;
    btnIn: TButton;
    btnOut: TButton;
    lblENCheckpoint: TLabel;
    HTTPRIOENCheckpoint: THTTPRIO;
    cbCheckpoint: TComboBox;
    Panel2: TPanel;
    sgPassListItemsByDay: TAdvStringGrid;
    HTTPRIOENTravelSheetItem: THTTPRIO;
    procedure btnGetTravelSheetClick(Sender: TObject);
    function getDriverSertificateNumber(tabNumber : string) : string;
    procedure UpdateGrid(Sender: TObject);
    procedure btnInClick(Sender: TObject);
    procedure clearFrm(Sender: Tobject);
    procedure btnOutClick(Sender: TObject);
    procedure cbCheckpointClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtTravelSheetCodeChange(Sender: TObject);
    procedure cbCheckpointCloseUp(Sender: TObject);
    procedure sgENCheckpointPassListItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure updateGridByDay(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    travelSheet : ENTravelSheet;
    checkPointPassListItem : ENCheckpointPassListItem;
    checkPointCode : Integer;
  public
    { Public declarations }
  end;

var
  frmCheckpointRegistration: TfrmCheckpointRegistration;

    ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCheckpointPassListItemByTravelSheetHeaders: array [1..4] of String =
        ( 'Код'
          , 'Назва КПП'
          , 'Тип події'
          ,'Дата и время события'
        );

  ENCheckpointPassListItemByDayHeaders: array [1..4] of String =
        ( 'Код'
          , 'Гос. номер'
          , 'Тип події'
          ,'Дата и время события'
        );

implementation

uses  TKDriverSertificateController,
  FINWorkerController, GridHeadersUnit,
  ENCheckpointPassListController, ENConsts, ENCheckpointEventTypeController
  , ENTravelSheetItemController;


{$R *.dfm}

procedure    TfrmCheckpointRegistration.updateGridByDay(Sender: TObject);
var
  TempENCheckpointPassListItem : ENCheckpointPassListItemControllerSoapPort;
  itemFilter : ENCheckpointPassListItemFilter;
  itemList : ENCheckpointPassListItemShortList;
  i, LastCount : Integer;
begin
        if checkPointCode = LOW_INT then Exit;

        sgENCheckpointPassListItem.Clear;
        SetGridHeaders(ENCheckpointPassListItemByDayHeaders, sgPassListItemsByDay.ColumnHeaders);

        TempENCheckpointPassListItem := HTTPRIOENCheckpointPassListItem as ENCheckpointPassListItemControllerSoapPort;
        itemFilter := ENCheckpointPassListItemFilter.Create;
        SetNullXSProps(itemFilter);
        SetNullIntProps(itemFilter);
        itemFilter.conditionSQL := ' (encheckpointpasslist.checkpointrefcode = ' + IntToStr(checkPointCode) +
                                   ' and encheckpointpasslisttm.dateevent between to_timestamp(to_char(current_date,''dd.MM.yyyy'')||'' 00:00'',''dd.MM.yyyy HH24:MI'')' +
                                   ' and to_timestamp(to_char(current_date,''dd.MM.yyyy'')||'' 23:59:59'',''dd.MM.yyyy HH24:MI:ss''))';
        itemFilter.orderBySQL := 'encheckpointpasslisttm.dateevent desc';
        itemList := TempENCheckpointPassListItem.getScrollableFilteredList(itemFilter, 0, -1);

        LastCount := High(itemList.list);

        if LastCount > -1 then
          sgPassListItemsByDay.RowCount:=LastCount+2
        else
          sgPassListItemsByDay.RowCount:=2;

        with sgPassListItemsByDay do
        for i:=0 to LastCount do
        begin
          Application.ProcessMessages;

          if itemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(itemList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1, i+1] := itemList.list[i].transportRealRefGosNumber;

          Cells[2, i+1] := itemList.list[i].eventTypeRefName;
          Cells[3, i+1] := XSDateTimeWithDate2String(itemList.list[i].dateEvent);

        end;
   sgPassListItemsByDay.Row:=1;
end;

procedure TfrmCheckpointRegistration.cbCheckpointClick(Sender: TObject);
begin
  inherited;
     case cbCheckpoint.ItemIndex of
       -1 : checkPointCode := LOW_INT;
       0 : checkPointCode := ENConsts.ENCHECKPOINT_MOTORCADE;
       1 : checkPointCode := ENConsts.ENCHECKPOINT_CPP;
       2 : checkPointCode := ENConsts.ENCHECKPOINT_VYS;
       3 : checkPointCode := ENConsts.ENCHECKPOINT_GPR;
       4 : checkPointCode := ENConsts.ENCHECKPOINT_SKA;
       5 : checkPointCode := ENConsts.ENCHECKPOINT_CUR;
       6 : checkPointCode := ENConsts.ENCHECKPOINT_HGES;
       7 : checkPointCode := ENConsts.ENCHECKPOINT_LEP;
       8 : checkPointCode := ENConsts.ENCHECKPOINT_GEN;
       9 : checkPointCode := ENConsts.ENCHECKPOINT_GEN2;
       10 : checkPointCode := ENConsts.ENCHECKPOINT_IVA;
       11 : checkPointCode := ENConsts.ENCHECKPOINT_KAH;
       12 : checkPointCode := ENConsts.ENCHECKPOINT_NKAH;
       13 : checkPointCode := ENConsts.ENCHECKPOINT_NTR;
       14 : checkPointCode := ENConsts.ENCHECKPOINT_CHA;
       15 : checkPointCode := ENConsts.ENCHECKPOINT_NVOR;
       16 : checkPointCode := ENConsts.ENCHECKPOINT_VAL;
       17 : checkPointCode := ENConsts.ENCHECKPOINT_SER;
       18 : checkPointCode := ENConsts.ENCHECKPOINT_BER;
       19 : checkPointCode := ENConsts.ENCHECKPOINT_ROG;
       20 : checkPointCode := ENConsts.ENCHECKPOINT_KAL;
       21 : checkPointCode := ENConsts.ENCHECKPOINT_GOR;
     end;

     if checkPointCode <> LOW_INT  then
     begin
          btnIn.Visible := True;
          btnOut.Visible := True;
          clearFrm(Sender);
          updateGridByDay(sender);
     end;

     edtTravelSheetCode.SetFocus;
end;

procedure TfrmCheckpointRegistration.cbCheckpointCloseUp(Sender: TObject);
begin
  inherited;
     edtTravelSheetCode.SetFocus;
end;

procedure TfrmCheckpointRegistration.clearFrm(Sender: TObject);
begin
    travelSheet := nil;
    checkPointPassListItem := nil;

    lblNumberGen.Caption := 'Номер';
    lblAuto.Caption := 'Автомобіль';
    lblDriver.Caption := 'Водій';
    lblDate.Caption := 'Дата з/по';

    edtTravelSheetCode.Text := '';
    ClearGrid(sgENCheckpointPassListItem);
end;

procedure TfrmCheckpointRegistration.edtTravelSheetCodeChange(Sender: TObject);
var trCode : Integer;
begin
  inherited;

   if Length(edtTravelSheetCode.Text) > 1 then
    try
       trCode := StrToInt(edtTravelSheetCode.Text);
    except
        on EConvertError do begin
           raise Exception.Create('Код повинен складатися тільки з цифр: ' + edtTravelSheetCode.Text);
           edtTravelSheetCode.SetFocus;
           MessageBeep(MB_ICONERROR);
       end;
    end;

  if Length(edtTravelSheetCode.Text) > 8 then
  begin
  btnGetTravelSheetClick(sender);
  edtTravelSheetCode.Text := '';
  edtTravelSheetCode.SetFocus;
  end;

end;

procedure TfrmCheckpointRegistration.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    if FormMode = fmChild then
      frmCheckpointRegistration:=nil;
    inherited;
end;

procedure TfrmCheckpointRegistration.FormCreate(Sender: TObject);
begin
  inherited;
  checkPointCode := LOW_INT;

  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check1' then cbCheckpoint.ItemIndex := 1;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check2' then cbCheckpoint.ItemIndex := 0;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_vys' then cbCheckpoint.ItemIndex := 2;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_gpr' then cbCheckpoint.ItemIndex := 3;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_sk' then cbCheckpoint.ItemIndex := 4;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_cur' then cbCheckpoint.ItemIndex := 5;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_hges' then cbCheckpoint.ItemIndex := 6;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_lep' then cbCheckpoint.ItemIndex := 7;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_gen' then cbCheckpoint.ItemIndex := 8;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_gen2' then cbCheckpoint.ItemIndex := 9;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_iva' then cbCheckpoint.ItemIndex := 10;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_kah' then cbCheckpoint.ItemIndex := 11;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_nkah' then cbCheckpoint.ItemIndex := 12;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_ntr' then cbCheckpoint.ItemIndex := 13;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_cha' then cbCheckpoint.ItemIndex := 14;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_nv' then cbCheckpoint.ItemIndex := 15;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_va' then cbCheckpoint.ItemIndex := 16;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_ser' then cbCheckpoint.ItemIndex := 17;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_ber' then cbCheckpoint.ItemIndex := 18;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_rog' then cbCheckpoint.ItemIndex := 19;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_kal' then cbCheckpoint.ItemIndex := 20;
  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'check_gor' then cbCheckpoint.ItemIndex := 21;

  cbCheckpointClick(Sender);

end;

procedure TfrmCheckpointRegistration.FormShow(Sender: TObject);
begin
  inherited;
  cbCheckpoint.Enabled := False;

  if HTTPRIOTKTransportReal.HTTPWebNode.UserName = 'energynet' then
  cbCheckpoint.Enabled := True;

end;

procedure TfrmCheckpointRegistration.btnGetTravelSheetClick(Sender: TObject);
var
TempENTravelSheet: ENTravelSheetControllerSoapPort;
TempENTravelSheetItem : ENTravelSheetItemControllerSoapPort;
travelItemFilter : ENTravelSheetItemFilter;
travelItemList : ENTravelSheetItemShortList;
TempFinWorker: FinWorkerControllerSoapPort;
fWorker : FINWorker;
begin

   if Length(edtTravelSheetCode.Text) = 0 then Exit;

   TempENTravelSheet :=  HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
     travelSheet := TempENTravelSheet.getObject(StrToInt(edtTravelSheetCode.Text));
     if travelSheet = nil then
     begin
           Application.MessageBox(PChar('Такого путевого листа не найдено в системе!!!'),PChar('Ошибка!'),MB_ICONWARNING+MB_OK);
           edtTravelSheetCode.SetFocus;
           Exit;
     end;
    except
     on EConvertError do Exit;
   end;

   TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
   travelItemFilter := ENTravelSheetItemFilter.Create;
   SetNullXSProps(travelItemFilter);
   SetNullIntProps(travelItemFilter);
   travelItemFilter.travelSheetRef := ENTravelSheetRef.Create;
   travelItemFilter.travelSheetRef.code := travelSheet.code;
   travelItemFilter.conditionSQL := 'entravelsheetitem.planrefcode IS NOT NULL';
   travelItemList := TempENTravelSheetItem.getScrollableFilteredList(travelItemFilter, 0, -1);
   if travelItemList.totalCount = 0 then begin
    Application.MessageBox(PChar(Format('У подорожньому листі № %s немає діючих наряд-завдань!'
      , [travelSheet.numberGen])), PChar('Повідомлення'), MB_ICONERROR);
   end;



   TempFinWorker :=  HTTPRIOFinWorker as FinWorkerControllerSoapPort;
   fWorker := TempFinWorker.getObject(travelSheet.finWorker.code);

   lblNumberGen.Caption := travelSheet.numberGen;
   lblAuto.Caption :=  travelSheet.transportReal.name + ' гос.№ ' + travelSheet.transportReal.gosNumber;
   lblDriver.Caption := fWorker.name + ' посв.№ ' + getDriverSertificateNumber(fWorker.tabNumber);
   lblDate.Caption :=  ' з ' + DateTimeToStr(EncodeDate(travelSheet.dateStart.Year,travelSheet.dateStart.Month,travelSheet.dateStart.Day))  + ' ' +
                       TimeToStr(EncodeTime(travelSheet.timeStart.Hour,travelSheet.timeStart.Minute, 0, 0)) +
                       ' по ' +
                       DateTimeToStr(EncodeDate(travelSheet.dateFinal.Year,travelSheet.dateFinal.Month,travelSheet.dateFinal.Day)) + ' ' +
                       TimeToStr(EncodeTime(travelSheet.timeFinal.Hour,travelSheet.timeFinal.Minute, 0, 0));

   UpdateGrid(Sender);
   edtTravelSheetCode.SetFocus;
end;

procedure TfrmCheckpointRegistration.btnInClick(Sender: TObject);
var
  TempENCheckpointPassListItem: ENCheckpointPassListItemControllerSoapPort;
begin
       if travelSheet = nil then
         begin
           Application.MessageBox(PChar('Путевой лист не отсканирован!!!'),PChar('Ошибка!'),MB_ICONWARNING+MB_OK);
           edtTravelSheetCode.SetFocus;
           Exit;
         end;

       if checkPointCode = LOW_INT then
         begin
           Application.MessageBox(PChar('Не выбран КПП для которого нужно регистрировать события!!!'),PChar('Ошибка!'),MB_ICONWARNING+MB_OK);
           edtTravelSheetCode.SetFocus;
           Exit;
         end;

       TempENCheckpointPassListItem :=  HTTPRIOENCheckpointPassListItem as ENCheckpointPassListItemControllerSoapPort;

       checkPointPassListItem := ENCheckpointPassListItem.Create;
       checkPointPassListItem.travelSheetRef := ENTravelSheetRef.Create;
       checkPointPassListItem.travelSheetRef.code := travelSheet.code;
       // подменим checkpointPassList. Вместо кода реестра запишем туда ссылку на КПП
       checkPointPassListItem.checkpointPassListRef := ENCheckpointPassListRef.Create;
       checkPointPassListItem.checkpointPassListRef.code := checkPointCode;
       //
       TempENCheckpointPassListItem.addRideIn(checkPointPassListItem);

       clearFrm(Sender);
       edtTravelSheetCode.SetFocus;
       updateGridByDay(Sender);
end;

procedure TfrmCheckpointRegistration.btnOutClick(Sender: TObject);
var
  TempENCheckpointPassListItem: ENCheckpointPassListItemControllerSoapPort;
begin

       if travelSheet = nil then
         begin
           Application.MessageBox(PChar('Путевой лист не отсканирован!!!'),PChar('Ошибка!'),MB_ICONWARNING+MB_OK);
           edtTravelSheetCode.SetFocus;
           Exit;
         end;

       if checkPointCode = LOW_INT then
         begin
           Application.MessageBox(PChar('Не выбран КПП для которого нужно регистрировать события!!!'),PChar('Ошибка!'),MB_ICONWARNING+MB_OK);
           edtTravelSheetCode.SetFocus;
           Exit;
         end;

       TempENCheckpointPassListItem :=  HTTPRIOENCheckpointPassListItem as ENCheckpointPassListItemControllerSoapPort;

       checkPointPassListItem := ENCheckpointPassListItem.Create;
       checkPointPassListItem.travelSheetRef := ENTravelSheetRef.Create;
       checkPointPassListItem.travelSheetRef.code := travelSheet.code;
       // подменим checkpointPassList. Вместо кода реестра запишем туда ссылку на КПП
       checkPointPassListItem.checkpointPassListRef := ENCheckpointPassListRef.Create;
       checkPointPassListItem.checkpointPassListRef.code := checkPointCode;
       //
       TempENCheckpointPassListItem.addRideOut(checkPointPassListItem);

       clearFrm(Sender);
       edtTravelSheetCode.SetFocus;
       updateGridByDay(Sender);
end;


function TfrmCheckpointRegistration.getDriverSertificateNumber(tabNumber : string) : string;
var
   TempTKDriverSertificate: TKDriverSertificateControllerSoapPort;
   f : TKDriverSertificateFilter;
   l : TKDriverSertificateShortList;
begin

   Result := '';
   f := TKDriverSertificateFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.tabNumber := tabNumber;
   TempTKDriverSertificate :=  HTTPRIOTKDriverSertificate as TKDriverSertificateControllerSoapPort;
   l := TempTKDriverSertificate.getScrollableFilteredList(f, 0, -1);
   if (l.totalCount > 0) then Result := Trim(l.list[0].sertificateNumber);

end;


procedure TfrmCheckpointRegistration.sgENCheckpointPassListItemClick(
  Sender: TObject);
begin
  inherited;
  edtTravelSheetCode.SetFocus;
end;

procedure TfrmCheckpointRegistration.UpdateGrid(Sender: TObject);
var
  TempENCheckpointPassListItem : ENCheckpointPassListItemControllerSoapPort;
  itemFilter : ENCheckpointPassListItemFilter;
  itemList : ENCheckpointPassListItemShortList;
  i, LastCount : Integer;
begin
        if (travelSheet = nil) or (travelSheet.code = LOW_INT) then Exit;

        sgENCheckpointPassListItem.Clear;
        SetGridHeaders(ENCheckpointPassListItemByTravelSheetHeaders, sgENCheckpointPassListItem.ColumnHeaders);

        TempENCheckpointPassListItem := HTTPRIOENCheckpointPassListItem as ENCheckpointPassListItemControllerSoapPort;
        itemFilter := ENCheckpointPassListItemFilter.Create;
        SetNullXSProps(itemFilter);
        SetNullIntProps(itemFilter);
        itemFilter.travelSheetRef := ENTravelSheetRef.Create;
        itemFilter.travelSheetRef.code := travelSheet.code;

        itemList := TempENCheckpointPassListItem.getScrollableFilteredList(itemFilter, 0, -1);

        LastCount := High(itemList.list);

        if LastCount > -1 then
          sgENCheckpointPassListItem.RowCount:=LastCount+2
        else
          sgENCheckpointPassListItem.RowCount:=2;

        with sgENCheckpointPassListItem do
        for i:=0 to LastCount do
        begin
          Application.ProcessMessages;

          if itemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(itemList.list[i].code)
          else
            Cells[0,i+1] := '';

//          Cells[1, i+1] := itemList.list[i].transportRealRefName + ' ' + itemList.list[i].transportRealRefInvNumber;
//
//          Cells[2, i+1] := itemList.list[i].transportRealRefGosNumber;
//
//          Cells[3, i+1] := itemList.list[i].eventTypeRefName;
//          Cells[4, i+1] := XSDateTimeWithDate2String(itemList.list[i].dateEvent);

          Cells[1, i+1] := itemList.list[i].checkpointName;

          Cells[2, i+1] := itemList.list[i].eventTypeRefName;

          Cells[3, i+1] := XSDateTimeWithDate2String(itemList.list[i].dateEvent);

        end;
       sgENCheckpointPassListItem.Row:=1;

end;

end.
