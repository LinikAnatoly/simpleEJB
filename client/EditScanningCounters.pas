unit EditScanningCounters;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, DateUtils, AdvObj, XSBuiltIns, ExtCtrls;

const
  DURATION = 1000;
  FREQUENCY = 700;
  GRID_COLUMN_ONE_PHASITY = 3;
  GRID_COLUMN_THREE_PHASITY = 4;

type
  TfrmScanningCountersEdit = class(TDialogForm)
    HTTPRIOTKMaterials: THTTPRIO;
    lblInvNumber: TLabel;
    edtCounterInvNumber: TEdit;
    lblError: TLabel;
    HTTPRIORQPackingListItem: THTTPRIO;
    gbScannedCounters: TGroupBox;
    tbActions: TTBToolbar;
    btnView: TTBItem;
    sgInvNumbers: TAdvStringGrid;
    ActionList1: TActionList;
    actDelete: TAction;
    actAllOnePhase: TAction;
    actAllThreePhase: TAction;
    ImageList1: TImageList;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    lblOverallQty: TLabel;
    edtFindCounters: TEdit;
    lblFindCounters: TLabel;
    btnFindCounters: TButton;
    btnOk_: TButton;
    btnCancel_: TButton;
    gbSearchBySerialNumber: TGroupBox;
    sgFoundInvNumbers: TAdvStringGrid;
    btnAddCounters: TButton;
    lblSerialNumber: TLabel;
    edtSerialNumber: TEdit;
    HTTPRIOENMetrologyCounter: THTTPRIO;
    btnSearchSerialNumber: TButton;
    gbBoxes: TGroupBox;
    edtBox: TEdit;
    chkIsNewBox: TCheckBox;
    spbBoxClear: TSpeedButton;
    spbBox: TSpeedButton;
    lblBox: TLabel;
    HTTPRIORQFKOrderItem: THTTPRIO;
    timerProcessInvnumber: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure sgInvNumbersCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure actDeleteExecute(Sender: TObject);
    procedure actAllOnePhaseExecute(Sender: TObject);
    procedure actAllThreePhaseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFindCountersClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOk_Click(Sender: TObject);
    procedure btnCancel_Click(Sender: TObject);
    procedure updateFoundInvNumbers();
    procedure spbSearchSerialNumberClick(Sender: TObject);
    procedure btnSearchSerialNumberClick(Sender: TObject);
    procedure btnAddCountersClick(Sender: TObject);
    procedure chkIsNewBoxClick(Sender: TObject);
    procedure showControlsForBoxes();
    procedure spbBoxClick(Sender: TObject);
    procedure spbBoxClearClick(Sender: TObject);
    procedure timerProcessInvnumberTimer(Sender: TObject);
    procedure pushInvNumber;
    procedure edtCounterInvNumberKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCounterInvNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    invNumList : TStringList;
    lastInputInvNumber : String;

  public
    { Public declarations }
    molCode : string;
    dateGen : TXSDate;
    rqPackingListCode : Integer;
    boxCode : Integer;
    isShowBoxes : Boolean;
    rqFKOrderCode : Integer;

  end;

var
  frmScanningCountersEdit: TfrmScanningCountersEdit;

  InvNumbersHeaders : array [1..4] of String =
        ( 'Код'
          , 'Інв. №'
          , 'Найменування'
          , 'Заводський'
        );



implementation
uses ChildFormUnit, ENConsts
     , EnergyproController, DMReportsUnit
     , SCCounterController
     , RQPackingListItemController
     , ENMetrologyCounterController
     , ShowRQBox
     , RQBoxController
     , RQFKOrderItemController;
{$R *.dfm}



procedure TfrmScanningCountersEdit.pushInvNumber;
var
  invNumber, name : String;
  numInv, i : Integer;
  TempRQPackingListItem : RQPackingListItemControllerSoapPort;
begin
      invNumber := edtCounterInvNumber.Text;

      try
        numInv := StrToInt(invNumber);
      except
        on EConvertError do begin
           raise Exception.Create('Інвентарний номер повинен складатися тільки з цифр: ' + invNumber);
           edtCounterInvNumber.SetFocus;
           //Windows.Beep(FREQUENCY, DURATION);
           MessageBeep(MB_ICONERROR);
      end;
      end;

      edtCounterInvNumber.Text := '';
      if sgInvNumbers.RowCount > 2 then
        i := sgInvNumbers.RowCount - 1
      else
        i := 1;

        TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;

      try
        name := TempRQPackingListItem.checkCounterInScanCounter(invNumber, molCode, dateGen);
      except
      on E : Exception do begin
         lblError.Caption := 'ПОМИЛКА: ' + E.Message;
         edtCounterInvNumber.SetFocus;
         Windows.Beep(FREQUENCY, DURATION);
         Exit;
      end;

      end;


      lblError.Caption := '';
      lblError.Width := 310;

      if(invNumList = nil) then invNumList := TStringList.Create;

      if( invNumList.IndexOf(invNumber) = -1) then
        invNumList.Add(invNumber)
      else begin
        lblError.Caption := 'ПОМИЛКА: Лічильник № ' + invNumber + ' вже введенно';
        edtCounterInvNumber.SetFocus;
        Windows.Beep(FREQUENCY, DURATION);
        Exit;
      end;

      sgInvNumbers.Cells[1, i] := invNumber;
      sgInvNumbers.AddCheckBox(1, i, false, false);
      sgInvNumbers.Cells[2, i] := name;
      sgInvNumbers.AddCheckBox(GRID_COLUMN_ONE_PHASITY, i, false, false);
      sgInvNumbers.AddCheckBox(GRID_COLUMN_THREE_PHASITY, i, false, false);
      sgInvNumbers.CellProperties[1, i].ReadOnly := False;
      sgInvNumbers.CellProperties[1, sgInvNumbers.RowCount].ReadOnly := True;

      sgInvNumbers.RowCount := sgInvNumbers.RowCount + 1;

      lblOverallQty.Caption := 'Всього: ' + IntToStr(invNumList.Count);

      sgInvNumbers.SetFocus;
      sgInvNumbers.Row := i;

      edtCounterInvNumber.SetFocus;

end;

procedure TfrmScanningCountersEdit.actAllOnePhaseExecute(Sender: TObject);
begin
  inherited;
    checkGrid(sgInvNumbers, GRID_COLUMN_ONE_PHASITY, true);
    checkGrid(sgInvNumbers, GRID_COLUMN_THREE_PHASITY, false);
end;

procedure TfrmScanningCountersEdit.actAllThreePhaseExecute(Sender: TObject);
begin
  inherited;
  checkGrid(sgInvNumbers, GRID_COLUMN_ONE_PHASITY, false);
  checkGrid(sgInvNumbers, GRID_COLUMN_THREE_PHASITY, true);
end;

procedure TfrmScanningCountersEdit.actDeleteExecute(Sender: TObject);
var
  state_, isSel : Boolean;
  i, z, index, itemCode : Integer;
  idStringList : TList;
begin
  inherited;

  state_ := false;
  isSel := false;

  for i := 1 to sgInvNumbers.RowCount - 1 do
  begin
     sgInvNumbers.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
       isSel := true;
     end;

  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Оберить хоча б один інвентарний номер!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  idStringList := TList.Create;

  for i:= 1 to sgInvNumbers.RowCount - 1 do
  begin
     sgInvNumbers.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
          if(invNumList.IndexOf(sgInvNumbers.Cells[1,i]) <> -1) then
          begin
              index := invNumList.IndexOf(sgInvNumbers.Cells[1,i]);
              idStringList.Add(Ptr(i));
              invNumList.Delete(index);
          end;
     end;

  end;
  z := idStringList.Count - 1;
  while(z >= 0) do
  begin
       itemCode := Integer(idStringList[z]);
       if (sgInvNumbers.RowCount > 2) then
       begin
        sgInvNumbers.RemoveRows(itemCode, 1);
       end
       else
       begin
        sgInvNumbers.Cells[0, itemCode] := '';
        sgInvNumbers.Cells[1, itemCode] := '';
        sgInvNumbers.Cells[2, itemCode] := '';
        sgInvNumbers.Cells[3, itemCode] := '';
        sgInvNumbers.Cells[4, itemCode] := '';
        sgInvNumbers.RemoveCheckBox(1, itemCode);
       end;
       z := z - 1;
  end;

  lblOverallQty.Caption := 'Всього: ' + IntToStr(invNumList.Count);
  sgInvNumbers.CellProperties[1, sgInvNumbers.RowCount].ReadOnly := True;

end;

procedure TfrmScanningCountersEdit.btnAddCountersClick(Sender: TObject);
begin
  inherited;
  if sgFoundInvNumbers.Cells[1,sgFoundInvNumbers.Row] <> '' then
     begin
       edtCounterInvNumber.Text :=  sgFoundInvNumbers.Cells[1,sgFoundInvNumbers.Row];
       pushInvNumber;
     end;

end;

procedure TfrmScanningCountersEdit.btnCancel_Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmScanningCountersEdit.btnFindCountersClick(Sender: TObject);
var
  invNumber : String;
  numInv, i : Integer;
begin

    if Length(edtFindCounters.Text) < ENConsts.COUNTERS_INV_NUMBER_LENGTH_MIN then
    raise Exception.Create('Інвентарний номер повинен складатися з ' + IntToStr(ENConsts.COUNTERS_INV_NUMBER_LENGTH_MIN) + ' цифр');

     try
        numInv := StrToInt(edtFindCounters.Text);
      except
        on EConvertError do raise Exception.Create('Інвентарний номер повинен складатися тільки з цифр: ' + edtFindCounters.Text);
      end;
        invNumber := IntToStr(numInv);

      sgInvNumbers.SetFocus;

      for i := 1 to sgInvNumbers.RowCount - 1 do begin
      if sgInvNumbers.Cells[1, i] <> '' then begin
         if sgInvNumbers.Cells[1, i] = invNumber then
             begin
             sgInvNumbers.Row := i;
             Exit;
             end;
      end;
    end;

end;

procedure TfrmScanningCountersEdit.btnOkClick(Sender: TObject);
var
  length, i, phasity, k : Integer;
  counters : SCCounterController.ArrayOfSCCounterShort;
  state_ : Boolean;
  TempRQPackingListItem : RQPackingListItemControllerSoapPort;
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
begin
  inherited;
    length := 0;
    for i := 1 to sgInvNumbers.RowCount - 1 do begin
      if sgInvNumbers.Cells[1, i] <> '' then begin
        length := length + 1;
      end;
    end;

    if length = 0 then raise Exception.Create('Не введено жодного лічильника!');


    SetLength(counters, length);
    k := 0;
    for i := 1 to sgInvNumbers.RowCount - 1 do begin
      if sgInvNumbers.Cells[1, i] <> '' then begin
        counters[k] := SCCounterShort.Create;
        counters[k].invNumber := sgInvNumbers.Cells[1, i];
        phasity := 0;
        sgInvNumbers.GetCheckBoxState(GRID_COLUMN_ONE_PHASITY, i, state_);
        if state_ then phasity := 1
        else begin
          sgInvNumbers.GetCheckBoxState(GRID_COLUMN_THREE_PHASITY, i, state_);
          if state_ then phasity := 3
          else if phasity = 0 then raise Exception.Create('Оберіть фазність для лічильника інв. № ' + counters[k].invNumber);

        end;

        counters[k].phasity := TXSDecimal.Create;
        counters[k].phasity.DecimalString := IntToStr(phasity);
        k := k + 1;
      end;
    end;

    if(rqPackingListCode <> LOW_INT) then begin
      TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
      TempRQPackingListItem.addBUCounters(rqPackingListCode, counters, boxCode);
    end;
    if(rqFKOrderCode <> LOW_INT) then begin
        TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
        TempRQFKOrderItem.addCSCountersZoneChanging(rqFKOrderCode, counters);
    end;

    Application.MessageBox(PChar('Лічильники додані!'),
                    PChar('Внимание !'),MB_OK);
end;


procedure TfrmScanningCountersEdit.btnOkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Ord(Key) = VK_RETURN then
    Exit;
end;

procedure TfrmScanningCountersEdit.btnOk_Click(Sender: TObject);
var
  length, i, phasity, k : Integer;
  counters : SCCounterController.ArrayOfSCCounterShort;
  state_ : Boolean;
  TempRQPackingListItem : RQPackingListItemControllerSoapPort;
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
begin
  inherited;
    length := 0;
    for i := 1 to sgInvNumbers.RowCount - 1 do begin
      if sgInvNumbers.Cells[1, i] <> '' then begin
        length := length + 1;
      end;
    end;

    if length = 0 then raise Exception.Create('Не введено жодного лічильника!');


    SetLength(counters, length);
    k := 0;
    for i := 1 to sgInvNumbers.RowCount - 1 do begin
      if sgInvNumbers.Cells[1, i] <> '' then begin
        counters[k] := SCCounterShort.Create;
        counters[k].invNumber := sgInvNumbers.Cells[1, i];
        phasity := 0;
        sgInvNumbers.GetCheckBoxState(GRID_COLUMN_ONE_PHASITY, i, state_);
        if state_ then phasity := 1
        else begin
          sgInvNumbers.GetCheckBoxState(GRID_COLUMN_THREE_PHASITY, i, state_);
          if state_ then phasity := 3
          else if phasity = 0 then raise Exception.Create('Оберіть фазність для лічильника інв. № ' + counters[k].invNumber);

        end;

        counters[k].phasity := TXSDecimal.Create;
        counters[k].phasity.DecimalString := IntToStr(phasity);
        k := k + 1;
      end;
    end;

    if(rqPackingListCode <> LOW_INT) then begin
      TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
      TempRQPackingListItem.addBUCounters(rqPackingListCode, counters, boxCode);
    end;
    if(rqFKOrderCode <> LOW_INT) then begin
        TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
        TempRQFKOrderItem.addCSCountersZoneChanging(rqFKOrderCode, counters);
    end;

    Application.MessageBox(PChar('Лічильники додані!'),
                    PChar('Внимание !'),MB_OK);

    Self.Close;
end;

procedure TfrmScanningCountersEdit.btnSearchSerialNumberClick(Sender: TObject);
begin
  inherited;
  updateFoundInvNumbers;
end;

procedure TfrmScanningCountersEdit.chkIsNewBoxClick(Sender: TObject);
begin
  inherited;
  showControlsForBoxes;
end;

procedure TfrmScanningCountersEdit.edtCounterInvNumberKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   lastInputInvNumber := edtCounterInvNumber.Text;
end;

procedure TfrmScanningCountersEdit.edtCounterInvNumberKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
  currentValue : String;
  lengthCurrentValue, diff : Integer;
begin
  inherited;
  currentValue := edtCounterInvNumber.Text;
  lengthCurrentValue := Length(currentValue);
  if lengthCurrentValue > 0 then begin
    diff := lengthCurrentValue - Length(lastInputInvNumber);
    if diff > 0 then begin
	    if diff = 1 then begin
	       if lengthCurrentValue >= COUNTERS_INV_NUMBER_LENGTH_MIN  then begin
            if timerProcessInvnumber.Enabled then timerProcessInvnumber.Enabled := False;
            if lengthCurrentValue <> COUNTERS_INV_NUMBER_LENGTH_MAX then
              timerProcessInvnumber.Enabled := True
            else
              pushInvNumber;
          end;
	    end else begin
	    if lengthCurrentValue >= COUNTERS_INV_NUMBER_LENGTH_MIN then
        pushInvNumber;
	    end;
	  end else begin
      if timerProcessInvnumber.Enabled then timerProcessInvnumber.Enabled := False;

    end;
  end;
end;

procedure TfrmScanningCountersEdit.FormCreate(Sender: TObject);
begin
  inherited;
  sgInvNumbers.RowCount := 2;
  boxCode := LOW_INT;
  rqPackingListCode := LOW_INT;
  rqFKOrderCode := LOW_INT;
  lblError.Width := 310;
end;

procedure TfrmScanningCountersEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Ord(Key) = VK_RETURN then
    Exit;
end;

procedure TfrmScanningCountersEdit.FormShow(Sender: TObject);
begin
  inherited;
  if (rqFKOrderCode = LOW_INT) and (rqPackingListCode = LOW_INT) then begin
     raise Exception.Create('Wrong parameters: this form can be only for packing lists or fkOrders, not for both');
  end;
  if (rqFKOrderCode <> LOW_INT) then begin
    HideControls([gbBoxes]);
  end;
  edtCounterInvNumber.SetFocus;
  DisableControls([edtBox]);
  showControlsForBoxes;
end;

procedure TfrmScanningCountersEdit.sgInvNumbersCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
begin
  inherited;
  if (ACol = GRID_COLUMN_ONE_PHASITY) then begin
    if State then
         sgInvNumbers.SetCheckBoxState(GRID_COLUMN_THREE_PHASITY, ARow, False);
  end;

  if (ACol = GRID_COLUMN_THREE_PHASITY) then begin
    if State then
      sgInvNumbers.SetCheckBoxState(GRID_COLUMN_ONE_PHASITY, ARow, False);
  end;

end;

procedure TfrmScanningCountersEdit.spbBoxClearClick(Sender: TObject);
begin
  inherited;
  boxCode := LOW_INT;
  edtBox.Text := '';
end;

procedure TfrmScanningCountersEdit.spbBoxClick(Sender: TObject);
var
  showBox : TfrmRQBoxShow;
  filterBox : RQBoxFilter;
begin
  inherited;
  filterBox := RQBoxFilter.Create;
  SetNullXSProps(filterBox);
  SetNullIntProps(filterBox);
  filterBox.conditionSQL := ' EXISTS (select 1 from ' +
                            ' rqbox2rqpackinglistitm as bopl1 ' +
                            ' inner join rqpackinglistitem as pali1 on bopl1.packinglistitemrefcode = pali1.code ' +
                            ' inner join rqpackinglist as pl1 on pali1.packinglistrefcode = pl1.code ' +
                            ' where pl1.code =  ' + IntToStr(rqPackingListCode) +
                            ' and bopl1.boxrefcode = RQBOX.CODE) ';
  showBox := TfrmRQBoxShow.Create(Application, fmNormal, filterBox);
     try
      with showBox do begin
        DisableActions([actView, actFilter, actNoFilter]);
        if ShowModal = mrOk then
        begin
            try
               boxCode := StrToInt(GetReturnValue(sgRQBox,0));
               edtBox.Text:=GetReturnValue(sgRQBox,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      showBox.Free;
   end;
end;

procedure TfrmScanningCountersEdit.spbSearchSerialNumberClick(Sender: TObject);
begin
  inherited;
  updateFoundInvNumbers;
end;

procedure TfrmScanningCountersEdit.timerProcessInvnumberTimer(Sender: TObject);
begin
  inherited;
  pushInvNumber;
  timerProcessInvnumber.Enabled := False;
end;

procedure TfrmScanningCountersEdit.updateFoundInvNumbers;
var
filter : ENMetrologyCounterFilter;
list : ENMetrologyCounterShortList;
TempENMetrologyCounter : ENMetrologyCounterControllerSoapPort;
i : Integer;
begin

    if Length(edtSerialNumber.Text) = 0 then
    begin
     Application.MessageBox(PChar('Введіть заводський номер!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
    end;

    sgFoundInvNumbers.Clear;
    SetGridHeaders(InvNumbersHeaders, sgFoundInvNumbers.ColumnHeaders);

    filter := ENMetrologyCounterFilter.Create;
    SetNullXSProps(filter);
    SetNullIntProps(filter);

    filter.buildNumber := edtSerialNumber.Text;
    filter.molCode := molCode;
    filter.conditionSQL := 'nvl(a.energy_lock, -1) < 0 ';

    TempENMetrologyCounter := HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;

    list := TempENMetrologyCounter.getCountersList(filter, 0, -1);

    if High(list.list) > -1 then
     sgFoundInvNumbers.RowCount:=High(list.list)+2
    else
     sgFoundInvNumbers.RowCount:=2;

    with sgFoundInvNumbers do
    for i:=0 to High(list.list) do
      begin
        Application.ProcessMessages;
        if list.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(list.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := list.list[i].invNumber;
        Cells[2,i+1] := list.list[i].name;
        Cells[3, i+1] := list.list[i].buildNumber;
        sgFoundInvNumbers.RowCount:=High(list.list)+2;
      end;

end;

procedure TfrmScanningCountersEdit.showControlsForBoxes;
begin
  edtBox.Visible := (not chkIsNewBox.Checked);
  lblBox.Visible := (not chkIsNewBox.Checked);
  spbBox.Visible := (not chkIsNewBox.Checked);
  spbBoxClear.Visible := (not chkIsNewBox.Checked);
end;

end.
