unit ReportWorkedTimeInActs;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, AdvObj;

type
  TfrmReportWorkedTimeInActs = class(TDialogForm)
    lblBudgName: TLabel;
    spbBudgName: TSpeedButton;
    spbBudgNameClear: TSpeedButton;
    edtBudgName: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblDate: TLabel;
    edtDateFrom: TDateTimePicker;
    HTTPRIOTKMaterials: THTTPRIO;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateTo: TDateTimePicker;
    GroupBox1: TGroupBox;
    ActionList1: TActionList;
    actInsert: TAction;
    actDelete: TAction;
    ImageList1: TImageList;
    tbActions: TTBToolbar;
    btnView: TTBItem;
    btnAdd: TTBItem;
    sgTabNumbers: TAdvStringGrid;
    actSelectAll: TAction;
    actUndoSelect: TAction;
    btnSelectAll: TTBItem;
    btnUndoSelect: TTBItem;
    procedure spbBudgNameClick(Sender: TObject);
    procedure spbBudgNameClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUndoSelectExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure sgTabNumbersCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sgTabNumbersEditCellDone(Sender: TObject; ACol, ARow: Integer);


  private
    { Private declarations }
    procedure ClearBudg();
    
  public
    { Public declarations }
    budgCode: Integer;
    tabNumbersList : TStringList;
    isBindedAct : Integer;
  end;

var
  frmReportWorkedTimeInActs: TfrmReportWorkedTimeInActs;

  FINWorkerHeaders: array [1..3] of String =
        ( 'Код'
          ,'Таб. номер'
          ,'ФІО'
        );


implementation
uses ShowENDepartment , ENDepartmentTypeController , ENDepartmentController , ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit, TKVirtualBrigadeController, ShowFinWorker, FinWorkerController;

{$R *.dfm}
 //----------------------------------------------------------------------------

procedure TfrmReportWorkedTimeInActs.ClearBudg();
begin
 BudgCode := -1;
 edtBudgName.Text := '';
 tabNumbersList := TStringList.Create;
end;
// -----------------------------------------------------------------------------
procedure TfrmReportWorkedTimeInActs.spbBudgNameClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   Filter : ENDepartmentFilter;
begin
  Filter := ENDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);
  Filter.typeRef := ENDepartmentTypeRef.Create;
  Filter.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
  Filter.conditionSQL := ' parentrefcode is null';
  
  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
          budgCode := ENDepartmentShort(tvDep.Selected.Data).code;
          edtBudgName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
      end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmReportWorkedTimeInActs.sgTabNumbersCanEditCell(Sender: TObject;
  ARow, ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := (ARow >= 1) {and (sgTabNumbers.Cells[ARow, 1] = '')} and (ACol = 1);

end;

procedure TfrmReportWorkedTimeInActs.sgTabNumbersEditCellDone(Sender: TObject;
  ACol, ARow: Integer);
  var
  tabNumber : String;
  i : Integer;
begin
  inherited;
  tabNumber := Trim(sgTabNumbers.Cells[ARow, ACol]);
  if Length(tabNumber) > 0 then begin
    if(tabNumbersList.IndexOf(tabNumber) = -1) then begin
      tabNumbersList.Add(tabNumber);
      sgTabNumbers.CellProperties[1, ARow].ReadOnly := False;
      sgTabNumbers.AddCheckBox(1, ARow, false, false);
    end else begin
      for i := 1 to sgTabNumbers.RowCount - 1 do
        if (sgTabNumbers.Cells[i, 1] = tabNumber) And (i <> ARow) then begin
          sgTabNumbers.Cells[ARow, ACol] := '';
        end;
    end;

  end;
end;

procedure TfrmReportWorkedTimeInActs.spbBudgNameClearClick(Sender: TObject);
begin
ClearBudg();
end;

procedure TfrmReportWorkedTimeInActs.FormShow(Sender: TObject);
begin
  inherited;
  edtDateTo.Checked := true;
  edtDateFrom.Checked := true;
  SetGridHeaders(FINWorkerHeaders, sgTabNumbers.ColumnHeaders);
  DisableControls([edtBudgName]);
  sgTabNumbers.RowCount := 2;

  end;

procedure TfrmReportWorkedTimeInActs.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName, strTabNumbers : String;
  i : Integer;
begin

  inherited;

if edtDateFrom.Checked = false then
begin
   Application.MessageBox('Оберить дату початку', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if edtDateTo.Checked = false then
begin
   Application.MessageBox('Оберить дату закінчення', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if edtDateFrom.Date > edtDateTo.Date then
begin
  Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;


if (tabNumbersList.Count = 0) and (budgCode = -1) then
begin
  Application.MessageBox('Оберить або бюджетотримача або табельні номери', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

// Установка параметров
SetLength(argNames, 4);
SetLength(args, 4);

argNames[0] := 'dateStart';
argNames[1] := 'dateFinal';
argNames[2] := 'budgetCode';
argNames[3] := 'tabNumbersCondition';
args[0] := DateToStr(edtDateFrom.date);
args[1] := DateToStr(edtDateTo.date);
args[2] := IntToStr(budgCode);
args[3] := '';


// Сборка табельных номеров если таковые были заданы
if(tabNumbersList.Count > 0) then
begin
    strTabNumbers := '';
    for i := 0 to tabNumbersList.Count - 1 do
    begin
        if Length(strTabNumbers) = 0 then strTabNumbers := chr(39)+ tabNumbersList[i] + chr(39)
        else strTabNumbers := strTabNumbers + ', ' + chr(39)+ tabNumbersList[i]+chr(39);
    end;

    args[3] := ' and working_time.tabnumber in (' + strTabNumbers + ')';
end;

reportName := 'Personal/WorkedTimeInActs';

makeReport(reportName, argNames, args, 'xls');

self.Close;

end;

procedure TfrmReportWorkedTimeInActs.FormCreate(Sender: TObject);
begin
ClearBudg;
end;
procedure TfrmReportWorkedTimeInActs.actInsertExecute(Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
begin
  inherited;

  f :=FINWorkerFilter.Create;
  f.departmentCode := '-1';
  SetNullIntProps(f);
  SetNullXSProps(f);

   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal,f);
   frmFINWorkerShow.forReport := True;
   try

     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin

            if(tabNumbersList.IndexOf(GetReturnValue(sgFINWorker,2)) = -1) then
            begin

              if(tabNumbersList.Count > 0) then
                sgTabNumbers.RowCount := sgTabNumbers.RowCount + 1;

              tabNumbersList.Add(GetReturnValue(sgFINWorker,2));

              sgTabNumbers.Rows[sgTabNumbers.RowCount - 1].Add('');
              sgTabNumbers.Cells[1, sgTabNumbers.RowCount - 1] :=  GetReturnValue(sgFINWorker,2);
              sgTabNumbers.Cells[2, sgTabNumbers.RowCount - 1] := GetReturnValue(sgFINWorker, 1);
              sgTabNumbers.AddCheckBox(1, sgTabNumbers.RowCount - 1, false, false);
              sgTabNumbers.CellProperties[0, sgTabNumbers.RowCount - 1].ReadOnly := True;
              sgTabNumbers.CellProperties[1, sgTabNumbers.RowCount - 1].ReadOnly := True;
              sgTabNumbers.CellProperties[2, sgTabNumbers.RowCount - 1].ReadOnly := True;
            end;
        end;

   finally
      frmFINWorkerShow.Free;
   end;
end;
procedure TfrmReportWorkedTimeInActs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tabNumbersList.Free;
  tabNumbersList := nil;
end;

procedure TfrmReportWorkedTimeInActs.actDeleteExecute(Sender: TObject);
var
  state_, isSel : Boolean;
  i, z, index, itemCode : Integer;
  idStringList : TList;
begin
  inherited;

  state_ := false;
  isSel := false;

  for i := 1 to sgTabNumbers.RowCount - 1 do
  begin
     sgTabNumbers.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
       isSel := true;
     end;

  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Оберить хоча б один табельний номер!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  idStringList := TList.Create;

  for i:= 1 to sgTabNumbers.RowCount - 1 do
  begin
     sgTabNumbers.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
          if(tabNumbersList.IndexOf(sgTabNumbers.Cells[1,i]) <> -1) then
          begin
              index := tabNumbersList.IndexOf(sgTabNumbers.Cells[1,i]);
              idStringList.Add(Ptr(i));
              tabNumbersList.Delete(index);
          end;
     end;

  end;
  z := idStringList.Count - 1;
  while(z >= 0) do
  begin
       itemCode := Integer(idStringList[z]);
       if (sgTabNumbers.RowCount > 2) then
       begin
        sgTabNumbers.RemoveRows(itemCode, 1);
       end
       else
       begin
        sgTabNumbers.Cells[0, itemCode] := '';
        sgTabNumbers.Cells[1, itemCode] := '';
        sgTabNumbers.Cells[2, itemCode] := '';
        sgTabNumbers.CellProperties[0, itemCode].ReadOnly := True;
        sgTabNumbers.CellProperties[1, itemCode].ReadOnly := False;
        sgTabNumbers.CellProperties[2, itemCode].ReadOnly := True;

        sgTabNumbers.RemoveCheckBox(1, itemCode);
       end;
       z := z - 1;
  end;

end;

procedure TfrmReportWorkedTimeInActs.actUndoSelectExecute(Sender: TObject);
begin
  inherited;
  checkGrid(sgTabNumbers, 1, false);
end;

procedure TfrmReportWorkedTimeInActs.actSelectAllExecute(Sender: TObject);
begin
  inherited;
  checkGrid(sgTabNumbers, 1, true);
end;

end.
