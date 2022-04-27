
unit EditENCheckpointPassList;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCheckpointPassListController,
  ExtCtrls, TB2Item, TB2Dock, TB2Toolbar, AdvObj ;

type
  TfrmENCheckpointPassListEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;


  HTTPRIOENCheckpointPassList: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbENCheckpoint: TSpeedButton;
    edtENCheckpoint: TEdit;
    lblENCheckpoint: TLabel;
    Panel1: TPanel;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem5: TTBItem;
    TBItem2: TTBItem;
    TBItem6: TTBItem;
    ActionList1: TActionList;
    ImageList1: TImageList;
    actInsert: TAction;
    actEdit: TAction;
    actRemove: TAction;
    actView: TAction;
    sgENCheckpointPassListItem: TAdvStringGrid;
    HTTPRIOENCheckpointPassListItem: THTTPRIO;
    HTTPRIOENCheckpoint: THTTPRIO;
    edtTimeStart: TDateTimePicker;
    edtTimeFinal: TDateTimePicker;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbENCheckpointClick(Sender: TObject);
  procedure UpdateGrid(Sender: TObject);
  procedure actInsertExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRemoveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    countItems : Integer;
  public
    { Public declarations }

end;

var
  frmENCheckpointPassListEdit: TfrmENCheckpointPassListEdit;
  ENCheckpointPassListObj: ENCheckpointPassList;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCheckpointPassListItemHeaders: array [1..5] of String =
        ( 'Код'
          , 'Назва (інв. №)'
          , 'Гос. номер'
          , 'Тип події'
          ,'Дата и время события'
        );

implementation


uses
  ENCheckpointController
  , ShowENCheckpoint
  , ENCheckpointPassListItemController
  , ENConsts
  , EditENCheckpointPassListItem, InsertENCheckpointPassListItem;
{$R *.dfm}



procedure TfrmENCheckpointPassListEdit.FormShow(Sender: TObject);
var
TempENCheckpoint : ENCheckpointControllerSoapPort;
checkPoint : ENCheckpoint;
begin

  DisableControls([edtCode, edtENCheckpoint]);

  UpdateGrid(Sender);

  if DialogState = dsView then
  begin
        DisableActions([actInsert, actEdit, actRemove, actView]);
  end;

  if DialogState = dsInsert then
  begin
        DisableActions([actInsert, actEdit, actRemove, actView]);
        edtDateStart.Checked := True;
        edtDateFinal.Checked := True;
        edtTimeStart.Checked := True;
        edtTimeStart.Time := StrToTime('07:30');
        edtTimeFinal.Checked := True;
        edtTimeFinal.Time := StrToTime('16:30');

  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateStart
      ,edtDateFinal
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENCheckpointPassListObj.code);
      if ENCheckpointPassListObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENCheckpointPassListObj.dateStart.Year,ENCheckpointPassListObj.dateStart.Month,ENCheckpointPassListObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;
      if ENCheckpointPassListObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENCheckpointPassListObj.dateFinal.Year,ENCheckpointPassListObj.dateFinal.Month,ENCheckpointPassListObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;

      TempENCheckpoint := HTTPRIOENCheckpoint as ENCheckpointControllerSoapPort;
      checkPoint := TempENCheckpoint.getObject(ENCheckpointPassListObj.checkpointRef.code);
      edtENCheckpoint.Text := checkPoint.name;

      edtTimeStart.DateTime:= EncodeTime(ENCheckpointPassListObj.dateStart.Hour,ENCheckpointPassListObj.dateStart.Minute, 0, 0);
      edtTimeFinal.DateTime:= EncodeTime(ENCheckpointPassListObj.dateFinal.Hour,ENCheckpointPassListObj.dateFinal.Minute, 0, 0);

  end;
end;



procedure TfrmENCheckpointPassListEdit.spbENCheckpointClick(Sender: TObject);
var
  frmCheckpointShow : TfrmENCheckpointShow;
begin
  inherited;
  frmCheckpointShow := TfrmENCheckpointShow.Create(Application,fmNormal);
  try
    with frmCheckpointShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      if ShowModal = mrOk then
      begin
        try
          if ENCheckpointPassListObj.checkpointRef = nil then ENCheckpointPassListObj.checkpointRef := ENCheckPointRef.Create;
          ENCheckpointPassListObj.checkpointRef.code := StrToInt(GetReturnValue(sgENCheckpoint,0));
          edtENCheckpoint.Text := GetReturnValue(sgENCheckpoint,1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmCheckpointShow.Free;
  end;
end;

procedure TfrmENCheckpointPassListEdit.actEditExecute(Sender: TObject);
var
  TempENCheckpointPassListItem : ENCheckpointPassListItemControllerSoapPort;
begin
  inherited;
      TempENCheckpointPassListItem := HTTPRIOENCheckpointPassListItem as ENCheckpointPassListItemControllerSoapPort;
      try
        ENCheckpointPassListItemObj := TempENCheckpointPassListItem.getObject(StrToInt(sgENCheckpointPassListItem.Cells[0,sgENCheckpointPassListItem.Row]));
      except
        on EConvertError do Exit;
      end;

      frmENCheckpointPassListItemEdit := TfrmENCheckpointPassListItemEdit.Create(Application, dsEdit);
      try
        frmENCheckpointPassListItemEdit.ShowModal;
      finally
        frmENCheckpointPassListItemEdit.Free;
        frmENCheckpointPassListItemEdit:=nil;
        UpdateGrid(Sender);
      end;
end;

procedure TfrmENCheckpointPassListEdit.actInsertExecute(Sender: TObject);
begin
  inherited;
      try
        ENCheckpointPassListItemObjInsert := ENCheckpointPassListItem.Create;
      except
        on EConvertError do Exit;
      end;

      if ENCheckpointPassListItemObjInsert.checkPointPassListRef  = nil then ENCheckpointPassListItemObjInsert.checkPointPassListRef := ENCheckpointPassListRef.Create;
      ENCheckpointPassListItemObjInsert.checkPointPassListRef.code := ENCheckPointPassListObj.code;

      ENCheckpointPassListItemObjInsert.dateEvent := ENCheckpointPassListObj.dateStart;

      frmENCheckpointPassListItemInsert := TfrmENCheckpointPassListItemInsert.Create(Application, dsInsert);
      try
        frmENCheckpointPassListItemInsert.ShowModal;
      finally
        frmENCheckpointPassListItemInsert.Free;
        frmENCheckpointPassListItemInsert:=nil;
        UpdateGrid(Sender);
      end;
end;

procedure TfrmENCheckpointPassListEdit.actRemoveExecute(Sender: TObject);
var
  itemCode : Integer;
  TempENCheckpointPassListItem : ENCheckpointPassListItemControllerSoapPort;
begin
  inherited;
  TempENCheckpointPassListItem := HTTPRIOENCheckpointPassListItem as ENCheckpointPassListItemControllerSoapPort;
  try
    itemCode := StrToInt(sgENCheckpointPassListItem.Cells[0,sgENCheckpointPassListItem.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строку реестра на КПП)?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENCheckpointPassListItem.remove(itemCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENCheckpointPassListEdit.actViewExecute(Sender: TObject);
var
  TempENCheckpointPassListItem : ENCheckpointPassListItemControllerSoapPort;
begin
  inherited;
      TempENCheckpointPassListItem := HTTPRIOENCheckpointPassListItem as ENCheckpointPassListItemControllerSoapPort;
      try
        ENCheckpointPassListItemObj := TempENCheckpointPassListItem.getObject(StrToInt(sgENCheckpointPassListItem.Cells[0,sgENCheckpointPassListItem.Row]));
      except
        on EConvertError do Exit;
      end;

      frmENCheckpointPassListItemEdit := TfrmENCheckpointPassListItemEdit.Create(Application, dsView);
      try
        frmENCheckpointPassListItemEdit.ShowModal;
      finally
        frmENCheckpointPassListItemEdit.Free;
        frmENCheckpointPassListItemEdit:=nil;
      end;
end;

procedure TfrmENCheckpointPassListEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCheckpointPassList: ENCheckpointPassListControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDateStart
      ,edtDateFinal
      ,edtENCheckpoint
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENCheckpointPassList := HTTPRIOENCheckpointPassList as ENCheckpointPassListControllerSoapPort;


     if edtdateStart.checked then
     begin 
       if ENCheckpointPassListObj.dateStart = nil then
          ENCheckpointPassListObj.dateStart := TXSDateTime.Create;
       ENCheckpointPassListObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENCheckpointPassListObj.dateStart := nil;	   

     if edtdateFinal.checked then
     begin 
       if ENCheckpointPassListObj.dateFinal = nil then
          ENCheckpointPassListObj.dateFinal := TXSDateTime.Create;
       ENCheckpointPassListObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENCheckpointPassListObj.dateFinal := nil;

    if edtDateStart.Date > edtDateFinal.Date then
    begin
      Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    ENCheckpointPassListObj.dateStart.Hour := DateTimeToXSDateTime(edtTimeStart.DateTime).Hour;
    ENCheckpointPassListObj.dateStart.Minute := DateTimeToXSDateTime(edtTimeStart.DateTime).Minute;

    ENCheckpointPassListObj.dateFinal.Hour := DateTimeToXSDateTime(edtTimeFinal.DateTime).Hour;
    ENCheckpointPassListObj.dateFinal.Minute := DateTimeToXSDateTime(edtTimeFinal.DateTime).Minute;

    if DialogState = dsInsert then
    begin
      ENCheckpointPassListObj.code:=low(Integer);
      TempENCheckpointPassList.add(ENCheckpointPassListObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCheckpointPassList.save(ENCheckpointPassListObj);
    end;
  end;
end;

procedure TfrmENCheckpointPassListEdit.FormCreate(Sender: TObject);
begin
  inherited;
  countItems := 0;
end;

procedure TfrmENCheckpointPassListEdit.UpdateGrid(Sender: TObject);
var
  TempENCheckpointPassListItem : ENCheckpointPassListItemControllerSoapPort;
  itemFilter : ENCheckpointPassListItemFilter;
  itemList : ENCheckpointPassListItemShortList;
  i, LastCount : Integer;
begin
        countItems := 0;
        if (ENCheckpointPassListObj = nil) or (ENCheckpointPassListObj.code = LOW_INT) then Exit;

        sgENCheckpointPassListItem.Clear;
        SetGridHeaders(ENCheckpointPassListItemHeaders, sgENCheckpointPassListItem.ColumnHeaders);


        TempENCheckpointPassListItem := HTTPRIOENCheckpointPassListItem as ENCheckpointPassListItemControllerSoapPort;
        itemFilter := ENCheckpointPassListItemFilter.Create;
        SetNullXSProps(itemFilter);
        SetNullIntProps(itemFilter);
        itemFilter.checkpointPassListRef := ENCheckpointPassListRef.Create;
        itemFilter.checkpointPassListRef.code := ENCheckpointPassListObj.code;

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

          countItems := countItems + 1;

          if itemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(itemList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1, i+1] := itemList.list[i].transportRealRefName + ' ' + itemList.list[i].transportRealRefInvNumber;

          Cells[2, i+1] := itemList.list[i].transportRealRefGosNumber;

          Cells[3, i+1] := itemList.list[i].eventTypeRefName;
          Cells[4, i+1] := XSDateTimeWithDate2String(itemList.list[i].dateEvent);

        end;


       sgENCheckpointPassListItem.Row:=1;

       DisableControls([edtDateStart, edtDateFinal, spbENCheckpoint, edtTimeStart, edtTimeFinal], countItems > 0);
end;
end.
