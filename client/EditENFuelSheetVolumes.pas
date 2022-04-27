
unit EditENFuelSheetVolumes;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons, ENConsts, DMReportsUnit,
  EnergyproController, EnergyproController2, ENFuelSheetVolumesController,
  ENFuelSheetVolItemDataController,
  ExtCtrls, AdvObj ;

type
    TfrmENFuelSheetVolumesEdit = class(TDialogForm)


    HTTPRIOENFuelSheetVolumes: THTTPRIO;
    pcMain: TPageControl;
    tsGeneral: TTabSheet;
    tsPlanWork: TTabSheet;
    edtName: TEdit;
    edtDateGen: TDateTimePicker;
    lblDateGen: TLabel;
    lblName: TLabel;
    edtStartDate: TDateTimePicker;
    lblStartDate: TLabel;
    edtEndDate: TDateTimePicker;
    lblEndDate: TLabel;
    cbFuelType: TComboBox;
    lblFuelType: TLabel;
    btnPrint: TButton;
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    lblYear: TLabel;
    lblMonth: TLabel;
    rgDecade: TRadioGroup;
    cbYear: TComboBox;
    cbMonth: TComboBox;
    ActionList1: TActionList;
    actView: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    ImageList2: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton11: TToolButton;
    sgENPlanWork: TAdvStringGrid;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENFuelSheetVolItemData: THTTPRIO;
    GroupBox2: TGroupBox;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    btnEdit: TToolButton;
    actEditPlan: TAction;
    btnClearDep: TSpeedButton;
    btnCancel: TButton;
    btnOk: TButton;
    edtCode: TEdit;
    lblCode: TLabel;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrintClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure sgENPlanWorkTopLeftChanged(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure btnClearDepClick(Sender: TObject);
  private
    { Private declarations }
    currentYear: Word;
    procedure UpdatePlansList;

  public
    { Public declarations }

end;

var
  frmENFuelSheetVolumesEdit: TfrmENFuelSheetVolumesEdit;
  ENFuelSheetVolumesObj: ENFuelSheetVolumes;
  itemDataFilter: ENFuelSheetVolItemDataFilter;

implementation

uses ENPlanWorkController, EditENPlanWork,
  DateUtils, ShowENDepartment, ENDepartmentController;


{uses  
    EnergyproController, EnergyproController2, ENFuelSheetVolumesController  ;
}
{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;

  ENPlanWorkHeaders: array [1..13] of String =
        ( 'Код плану'
          ,'Тип ПММ'
          ,'Кількість, л'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          //,'Рік плану'
          //,'Місяць плану'
          ,'Дата початку робіт'
          //,'Початк. місяць та рік плану (до перенесення)'
          //,'Початк. місяць плану'
          ,'ПідВид робіт'
          ,'Тип акту'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'Бюджетотримач'
          //,'Центр відповідальності'
          //,'Початк. місяць та рік плану (до перенесення)'
          //,'Дата складання плану'
          //,'Номер наряда'
          //,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
          //,'Дата створення'
        );

procedure TfrmENFuelSheetVolumesEdit.FormShow(Sender: TObject);
var decadeNumber: Integer;
begin
  tsPlanWork.TabVisible := (DialogState <> dsInsert);
  //btnPrint.Visible := (DialogState <> dsInsert);
  //edtCode.Visible := (DialogState <> dsInsert);
  //lblCode.Visible := (DialogState <> dsInsert);
  HideControls([btnPrint, edtCode, lblCode, lblDateGen, edtDateGen], (DialogState = dsInsert));
  DisableControls([edtCode, edtDateGen]);

  // Спрячем поля "Дата початку" и "Дата закінчення" - вместо них задаются год, месяц и декада
  HideControls([lblStartDate, edtStartDate, lblEndDate, edtEndDate]);

  pcMain.ActivePage := tsGeneral;

  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);

  if DialogState = dsView then
  begin
    DisableControls([rgDecade]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtDateGen
      ,edtStartDate
      ,edtEndDate
     ]);
   end;

  if DialogState = dsInsert then
  begin
    // Всем полям с датами засетим текущую дату
    SetCurrentDate;
    SetComboBoxCurrentYear(cbYear, 1, 1);
    SetComboBoxCurrentMonth(cbMonth);

    ///// Пытаемся автоматически установить декаду формирования ведомости на следующую, после текущей
    decadeNumber := getDecadeNumber(Date);
    if decadeNumber = 3 then
    begin
      // Если сейчас 3-я декада декабря, переходим на январь следующего года
      if cbMonth.ItemIndex = 11 then
      begin
        // Такого быть не должно, но на всякий случай проверим
        if (cbYear.ItemIndex + 1 >= cbYear.Items.Count) then
        begin
          //Application.MessageBox(PChar('Не задан следующий год в списке !'), PChar('Внимание !'), MB_ICONWARNING);
          Exit;
        end;

        cbYear.ItemIndex := cbYear.ItemIndex + 1;
        cbMonth.ItemIndex := 0;
      end
      else
        // Если сейчас 3-я декада любого месяца, кроме декабря, переходим на следующий месяц
        cbMonth.ItemIndex := cbMonth.ItemIndex + 1;

      rgDecade.ItemIndex := 0;
    end
    else begin
      rgDecade.ItemIndex := decadeNumber;
    end;
    /////
  end;

  if DialogState = dsEdit then
  begin
    DisableControls([edtStartDate, edtEndDate, cbFuelType, cbYear, cbMonth, rgDecade]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENFuelSheetVolumesObj.code);
      edtName.Text := ENFuelSheetVolumesObj.name;
      if ENFuelSheetVolumesObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENFuelSheetVolumesObj.dateGen.Year,ENFuelSheetVolumesObj.dateGen.Month,ENFuelSheetVolumesObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
      if ENFuelSheetVolumesObj.startDate <> nil then
      begin
        edtStartDate.DateTime:=EncodeDate(ENFuelSheetVolumesObj.startDate.Year,ENFuelSheetVolumesObj.startDate.Month,ENFuelSheetVolumesObj.startDate.Day);
        edtStartDate.checked := true;

        //cbYear.ItemIndex := ENFuelSheetVolumesObj.startDate.Year - 2014;
        cbYear.ItemIndex := ENFuelSheetVolumesObj.startDate.Year - (currentYear-1);

        cbMonth.ItemIndex := ENFuelSheetVolumesObj.startDate.Month - 1;
        rgDecade.ItemIndex := getDecadeNumber(ENFuelSheetVolumesObj.startDate) - 1;
      end
      else
      begin
        edtStartDate.DateTime:=SysUtils.Date;
        edtStartDate.checked := false;
      end;
      if ENFuelSheetVolumesObj.endDate <> nil then
      begin
        edtEndDate.DateTime:=EncodeDate(ENFuelSheetVolumesObj.endDate.Year,ENFuelSheetVolumesObj.endDate.Month,ENFuelSheetVolumesObj.endDate.Day);
        edtEndDate.checked := true;
      end
      else
      begin
        edtEndDate.DateTime:=SysUtils.Date;
        edtEndDate.checked := false;
      end;

      cbFuelType.ItemIndex := ENFuelSheetVolumesObj.fuelType - 1;
  end;
end;


procedure TfrmENFuelSheetVolumesEdit.pcMainChange(Sender: TObject);
begin
  if (pcMain.ActivePage = tsPlanWork) then
  begin
    UpdatePlansList;
  end;
end;


procedure TfrmENFuelSheetVolumesEdit.sgENPlanWorkTopLeftChanged(
  Sender: TObject);
var
  TempENFuelSheetVolItemData: ENFuelSheetVolItemDataControllerSoapPort;
  i, n, CurrentRow: Integer;
  itemDataList: ENFuelSheetVolItemDataShortList;
begin
  if LastCount < 99 then Exit;

  if (sgENPlanWork.TopRow + sgENPlanWork.VisibleRowCount) = ColCount
  then begin
    TempENFuelSheetVolItemData := HTTPRIOENFuelSheetVolItemData as ENFuelSheetVolItemDataControllerSoapPort;

    CurrentRow := sgENPlanWork.RowCount;

    if itemDataFilter = nil then
    begin
      itemDataFilter := ENFuelSheetVolItemDataFilter.Create;
      SetNullIntProps(itemDataFilter);
      SetNullXSProps(itemDataFilter);
    end;

    itemDataFilter.sheetVolumesRef := ENFuelSheetVolumesRef.Create;
    itemDataFilter.sheetVolumesRef.code := ENFuelSheetVolumesObj.code;

    itemDataFilter.orderBySQL := 'plan_code';

    itemDataList := TempENFuelSheetVolItemData.getScrollableFilteredList(itemDataFilter, ColCount-1, 100);

    sgENPlanWork.RowCount := sgENPlanWork.RowCount + 100;

    LastCount := High(itemDataList.list);

    with sgENPlanWork do
      for i := 0 to LastCount do
      begin
        Application.ProcessMessages;

        n := 0;

        if itemDataList.list[i].plan_code <> Low(Integer) then
          Cells[n,i+CurrentRow] := IntToStr(itemDataList.list[i].plan_code)
        else
          Cells[n,i+CurrentRow] := '';
        inc(n);

        Cells[n,i+CurrentRow] := itemDataList.list[i].materialName;
        inc(n);

        if itemDataList.list[i].countFact = nil then
          Cells[n,i+CurrentRow] := ''
        else
          Cells[n,i+CurrentRow] := itemDataList.list[i].countFact.DecimalString;
        inc(n);

        Cells[n,i+CurrentRow] := itemDataList.list[i].objectName;
        inc(n);

        Cells[n,i+CurrentRow] := itemDataList.list[i].invNumber;
        inc(n);

        Cells[n,i+CurrentRow] := itemDataList.list[i].renRefName;
        inc(n);

        {
        if itemDataList.list[i].yearGen <> Low(Integer) then
          Cells[n,i+CurrentRow] := IntToStr(itemDataList.list[i].yearGen)
        else
          Cells[n,i+CurrentRow] := '';
        inc(n);

        if itemDataList.list[i].monthGen <> Low(Integer) then
          //Cells[4,i+CurrentRow] := IntToStr(itemDataList.list[i].monthGen)
          Cells[n,i+CurrentRow] := MonthesNames[itemDataList.list[i].monthGen]
        else
          Cells[n,i+CurrentRow] := '';
        inc(n);
        }

        if itemDataList.list[i].dateStart = nil then
          Cells[n,i+CurrentRow] := ''
        else
          Cells[n,i+CurrentRow] := XSDate2String(itemDataList.list[i].dateStart);
        inc(n);

        Cells[n,i+CurrentRow] := itemDataList.list[i].typeRefName;
        inc(n);

        Cells[n,i+CurrentRow] := itemDataList.list[i].stateRefShortName;
        inc(n);

        Cells[n,i+CurrentRow] := itemDataList.list[i].kindName;
        inc(n);

        Cells[n,i+CurrentRow] := itemDataList.list[i].statusName;
        inc(n);

        Cells[n,i+CurrentRow] := itemDataList.list[i].departmentRefShortName;
        inc(n);

        Cells[n,i+CurrentRow] := itemDataList.list[i].budgetRefShortName;
        inc(n);

        //Objects[0,i+CurrentRow] := ENPlanWorkList.list[i]; //TObject(ENPlanWorkList.list[i].statusCode);

        LastRow := i + CurrentRow;
      end;

    ColCount := ColCount + 100;

    sgENPlanWork.RowCount := LastRow + 1;

    if (sgENPlanWork.RowCount > 5) then
      sgENPlanWork.Row := CurrentRow - 5;
  end;

end;

procedure TfrmENFuelSheetVolumesEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
begin

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               if itemDataFilter = nil then
               itemDataFilter := ENFuelSheetVolItemDataFilter.Create;
               itemDataFilter.departmentrefcode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
            UpdatePlansList;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;


end;

procedure TfrmENFuelSheetVolumesEdit.UpdatePlansList;
var
  //TempENPlanWork: ENPlanWorkControllerSoapPort;
  TempENFuelSheetVolItemData: ENFuelSheetVolItemDataControllerSoapPort;
  i, n : Integer;
  //planFilter: ENPlanWorkFilter;
  //ENPlanWorkList: ENPlanWorkShortList;
  itemDataList: ENFuelSheetVolItemDataShortList;
begin
  ClearGrid(sgENPlanWork);

  if (ENFuelSheetVolumesObj = nil) then Exit;
  if (ENFuelSheetVolumesObj.code = LOW_INT) then Exit;

  if itemDataFilter = nil then
  begin
    itemDataFilter := ENFuelSheetVolItemDataFilter.Create;
    SetNullIntProps(itemDataFilter);
    SetNullXSProps(itemDataFilter);
  end;

  itemDataFilter.sheetVolumesRef := ENFuelSheetVolumesRef.Create;
  itemDataFilter.sheetVolumesRef.code := ENFuelSheetVolumesObj.code;

  itemDataFilter.orderBySQL := 'plan_code';

  ColCount := 100;

  //TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  TempENFuelSheetVolItemData := HTTPRIOENFuelSheetVolItemData as ENFuelSheetVolItemDataControllerSoapPort;

  //ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, ColCount);
  itemDataList := TempENFuelSheetVolItemData.getScrollableFilteredList(itemDataFilter, 0, ColCount);

  LastCount := High(itemDataList.list);

  if LastCount > -1 then
    sgENPlanWork.RowCount := LastCount + 2
  else
    sgENPlanWork.RowCount := 2;

  with sgENPlanWork do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;

      n := 0;

      if itemDataList.list[i].plan_code <> Low(Integer) then
        Cells[n,i+1] := IntToStr(itemDataList.list[i].plan_code)
      else
        Cells[n,i+1] := '';
      inc(n);

      Cells[n,i+1] := itemDataList.list[i].materialName;
      inc(n);

      if itemDataList.list[i].countFact = nil then
        Cells[n,i+1] := ''
      else
        Cells[n,i+1] := itemDataList.list[i].countFact.DecimalString;
      inc(n);

      Cells[n,i+1] := itemDataList.list[i].objectName;
      inc(n);

      Cells[n,i+1] := itemDataList.list[i].invNumber;
      inc(n);

      Cells[n,i+1] := itemDataList.list[i].renRefName;
      inc(n);

      {
      if itemDataList.list[i].yearGen <> Low(Integer) then
        Cells[n,i+1] := IntToStr(itemDataList.list[i].yearGen)
      else
        Cells[n,i+1] := '';
      inc(n);

      if itemDataList.list[i].monthGen <> Low(Integer) then
        //Cells[4,i+1] := IntToStr(itemDataList.list[i].monthGen)
        Cells[n,i+1] := MonthesNames[itemDataList.list[i].monthGen]
      else
        Cells[n,i+1] := '';
      inc(n);
      }

      if itemDataList.list[i].dateStart = nil then
        Cells[n,i+1] := ''
      else
        Cells[n,i+1] := XSDate2String(itemDataList.list[i].dateStart);
      inc(n);

      Cells[n,i+1] := itemDataList.list[i].typeRefName;
      inc(n);

      Cells[n,i+1] := itemDataList.list[i].stateRefShortName;
      inc(n);

      Cells[n,i+1] := itemDataList.list[i].kindName;
      inc(n);

      Cells[n,i+1] := itemDataList.list[i].statusName;
      inc(n);

      Cells[n,i+1] := itemDataList.list[i].departmentRefShortName;
      inc(n);

      Cells[n,i+1] := itemDataList.list[i].budgetRefShortName;
      inc(n);

      {
      Cells[n,i+1] := itemDataList.list[i].responsibilityRefShortName;
      inc(n);

      //Cells[n,i+1] := '';

      //if itemDataList.list[i].yearOriginal <> Low(Integer) then
      if itemDataList.list[i].yearOriginal > 0 then
      begin
        //if itemDataList.list[i].monthOriginal <> Low(Integer) then
        if itemDataList.list[i].monthOriginal > 0 then
          Cells[n,i+1] := MonthesNames[itemDataList.list[i].monthOriginal] + ' ' +
                          IntToStr(itemDataList.list[i].yearOriginal);
      end
      else
        Cells[n,i+1] := '';
      inc(n);
      /////

      Cells[n,i+1] := itemDataList.list[i].workOrderNumber;
      inc(n);

      Cells[n,i+1] := itemDataList.list[i].userGen;
      inc(n);

      if itemDataList.list[i].dateEdit = nil then
        Cells[n,i+1] := ''
      else
        Cells[n,i+1] := XSDate2String(itemDataList.list[i].dateEdit);
      inc(n);

      if itemDataList.list[i].dateGen = nil then
        Cells[n,i+1] := ''
      else
        Cells[n,i+1] := XSDateTimeWithDate2String(itemDataList.list[i].dateGen);
      inc(n);

      //Objects[0,i+1] := ENPlanWorkShort.Create;
      //Objects[0,i+1] := TObject(itemDataList.list[i]); //TObject(itemDataList.list[i].statusCode);
      }

      LastRow := i + 1;
      sgENPlanWork.RowCount := LastRow + 1;
    end;

   ColCount := ColCount + 1;
   sgENPlanWork.Row := 1;
end;

procedure TfrmENFuelSheetVolumesEdit.actEditPlanExecute(Sender: TObject);
Var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  tPlan: ENPlanWork;
  objCode: Integer;
begin
  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(objCode);

  if tPlan = nil then
  begin
    Exit;
  end;

    if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD,
    ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])
  then
    begin
      Application.MessageBox(PChar('План затверджений !'),
        PChar('Увага'), MB_ICONWARNING);
      Exit;
    end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  //selectedRow := sgENPlanWork.Row;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsEdit);

  //frmENPlanWorkEdit.viewPlanWork := viewPlanWork;

  try
    if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
      frmENPlanWorkEdit.isTransport := true;

    if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
      frmENPlanWorkEdit.isSiz := true;

    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(objCode);
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmENFuelSheetVolumesEdit.actUpdateExecute(Sender: TObject);
begin
  UpdatePlansList;
end;

procedure TfrmENFuelSheetVolumesEdit.actViewExecute(Sender: TObject);
Var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  tPlan: ENPlanWork;
  objCode: Integer;
begin
  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(objCode);

  if tPlan = nil then
  begin
    Exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  //selectedRow := sgENPlanWork.Row;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);

  //frmENPlanWorkEdit.viewPlanWork := viewPlanWork;

  try
    if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
      frmENPlanWorkEdit.isTransport := true;

    if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
      frmENPlanWorkEdit.isSiz := true;

    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(objCode);
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmENFuelSheetVolumesEdit.btnClearDepClick(Sender: TObject);
begin
  inherited;
  itemDataFilter.departmentrefcode := Low(Integer);
  UpdatePlansList;
end;

procedure TfrmENFuelSheetVolumesEdit.btnPrintClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  inherited;
  if (ENFuelSheetVolumesObj = nil) then Exit;
  if (ENFuelSheetVolumesObj.code = LOW_INT) then Exit;

  SetLength(argNames, 1);
  SetLength(args, 1);

  {
  argNames[0] := 'pYear';
  args[0] := IntToStr(ENFuelSheetVolumesObj.startDate.Year);

  argNames[1] := 'pMonth';
  args[1] := IntToStr(ENFuelSheetVolumesObj.startDate.Month);

  argNames[2] := 'pFuelType';
  args[2] := IntToStr(cbFuelType.ItemIndex + 1);
  }

  argNames[0] := 'pFuelSheetCode';
  args[0] := IntToStr(ENFuelSheetVolumesObj.code);

  // reportName := 'fuel/gsm_limit/20150227/gsm_report_main';
  reportName := 'fuel/gsm_limit/20210125/gsm_report_main';
  makeReport(reportName, argNames, args, 'xls');

  reportName := 'fuel/gsm_limit/20210125_fuel_for_work/gsm_report_main';
  makeReport(reportName, argNames, args, 'xls');

end;


procedure TfrmENFuelSheetVolumesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelSheetVolumes: ENFuelSheetVolumesControllerSoapPort;
    year, month, decadeNumber: Integer;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end else
  { Вместо полей "Дата початку" и "Дата закінчення" задаются год, месяц и декада
  if (not edtStartDate.Checked) or (not edtEndDate.Checked) then
  begin
    Application.MessageBox(PChar('Вкажіть період формування відомості!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end else
  }
  if (cbFuelType.ItemIndex = -1) then
  begin
    Application.MessageBox(PChar('Вкажіть тип ПММ!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    cbFuelType.SetFocus;
    Action := caNone;
  end
  else
  begin
    if (cbYear.ItemIndex = -1) then
    begin
      Application.MessageBox(PChar('Вкажіть рік!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      cbYear.SetFocus;
      Action := caNone;
      Exit;
    end;

    if (cbMonth.ItemIndex = -1) then
    begin
      Application.MessageBox(PChar('Вкажіть місяць!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      cbMonth.SetFocus;
      Action := caNone;
      Exit;
    end;

    if (rgDecade.ItemIndex = -1) then
    begin
      Application.MessageBox(PChar('Вкажіть декаду!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      rgDecade.SetFocus;
      Action := caNone;
      Exit;
    end;

    //year := cbYear.ItemIndex + 2014;
    year := cbYear.ItemIndex + (currentYear-1);
    month := cbMonth.ItemIndex + 1;
    decadeNumber := rgDecade.ItemIndex + 1;

    TempENFuelSheetVolumes := HTTPRIOENFuelSheetVolumes as ENFuelSheetVolumesControllerSoapPort;
    ENFuelSheetVolumesObj.name := edtName.Text;

    if edtdateGen.checked then
    begin
     if ENFuelSheetVolumesObj.dateGen = nil then
        ENFuelSheetVolumesObj.dateGen := TXSDate.Create;
     ENFuelSheetVolumesObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
    end
    else
      ENFuelSheetVolumesObj.dateGen := nil;

    if edtstartDate.checked then
    begin
     if ENFuelSheetVolumesObj.startDate = nil then
        ENFuelSheetVolumesObj.startDate := TXSDate.Create;
     ENFuelSheetVolumesObj.startDate.XSToNative(GetXSDate(edtstartDate.DateTime));
    end
    else
      ENFuelSheetVolumesObj.startDate := nil;

     if edtendDate.checked then
     begin 
       if ENFuelSheetVolumesObj.endDate = nil then
          ENFuelSheetVolumesObj.endDate := TXSDate.Create;
       ENFuelSheetVolumesObj.endDate.XSToNative(GetXSDate(edtendDate.DateTime));
     end
     else
       ENFuelSheetVolumesObj.endDate := nil;

    ENFuelSheetVolumesObj.fuelType := cbFuelType.ItemIndex + 1;

    if DialogState = dsInsert then
    begin
      ENFuelSheetVolumesObj.code:=low(Integer);
      //TempENFuelSheetVolumes.add(ENFuelSheetVolumesObj);
      TempENFuelSheetVolumes.add(ENFuelSheetVolumesObj, year, month, decadeNumber);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFuelSheetVolumes.save(ENFuelSheetVolumesObj);
    end;
  end;
end;


procedure TfrmENFuelSheetVolumesEdit.FormCreate(Sender: TObject);
begin
  inherited;
  currentYear := YearOf(Now);
end;

end.
