unit Gauge150;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, InvokeRegistry, Rio, SOAPHTTPClient, Grids, BaseGrid,
  AdvGrid, ToolWin, ExtCtrls, ActnList, ImgList, ChildFormUnit, DialogFormUnit,
  StdCtrls, XSBuiltIns, tmsAdvGridExcel, AdvObj, ShellAPI, ComObj, ZDataset,
  jpeg;

type
  TfrmGauge150 = class(TDialogForm)
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    pcFiderGauge: TPageControl;
    tsMeasurementSheet: TTabSheet;
    tsMeasurementData: TTabSheet;
    pnlGauge: TPanel;
    pnlDateTimeGauge: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    advStrGrMeasurementData: TAdvStringGrid;
    btnElectricLoadRegimDayChange: TButton;
    btnCancel: TButton;
    actSave: TAction;
    ToolButton4: TToolButton;
    actReportFiderGauge: TAction;
    ToolButton5: TToolButton;
    xlsExportMeasurement: TAdvGridExcelIO;
    actWorkerChange: TAction;
    HTTPRIOENGauge150: THTTPRIO;
    HTTPRIOENSubst150PowerTrans: THTTPRIO;
    HTTPRIOENSubst2PowTrans: THTTPRIO;
    HTTPRIOENSubst150Cell: THTTPRIO;
    actOrderCell: TAction;
    tlBtnOrderCell: TToolButton;
    tsSTO_56947007_25_040_70_101_2011: TTabSheet;
    imgSTO_FSK_SES: TImage;
    chkOnlyGauge: TCheckBox;
    tsInstruction_KSRE_OS_16_20140330: TTabSheet;
    imgInstructionOS_16_20140330: TImage;
    rgSTO: TRadioGroup;
    tsElectricLoadRegimDay: TTabSheet;
    sgElectricLoadRegimDay: TAdvStringGrid;
    actAdditionalColumnsVisible: TAction;
    tlBtnAdditionalColumnsVisible: TToolButton;
    btnElectricLoadRegimDayExport: TButton;
    btnElectricLoadRegimDayCalculate: TButton;
    actElectricLoadRegimDayCalculate: TAction;
    actElectricLoadRegimDayChange: TAction;
    actElectricLoadRegimDayExport: TAction;
    HTTPRIOUser: THTTPRIO;
    chkShowOtherVoltageClassLinkedTransformer: TCheckBox;
    dtpTimeGuage: TDateTimePicker;
    dtpDateGuage: TDateTimePicker;
    procedure pcFiderGaugeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure advStrGrMeasurementDataDblClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure actInsertExecute(Sender: TObject);
    procedure advStrGrMeasurementDataKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actWorkerChangeExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actOrderCellExecute(Sender: TObject);
    procedure advStrGrMeasurementDataRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure advStrGrMeasurementDataKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkOnlyGaugeClick(Sender: TObject);
    procedure rgSTOClick(Sender: TObject);
    procedure advStrGrMeasurementDataEditCellDone(Sender: TObject; ACol,
      ARow: Integer);
    procedure actAdditionalColumnsVisibleExecute(Sender: TObject);
    procedure actReportFiderGaugeExecute(Sender: TObject);
    procedure actElectricLoadRegimDayChangeExecute(Sender: TObject);
    procedure actElectricLoadRegimDayExportExecute(Sender: TObject);
    procedure actElectricLoadRegimDayCalculateExecute(Sender: TObject);
    procedure chkShowOtherVoltageClassLinkedTransformerClick(Sender: TObject);

  private
    { Private declarations }
    procedure OrderOneCell(rowNum: Integer);
    procedure TransformerGaugePowerScriptAndGridEdit; //Формирование скрипта
  public
    { Public declarations }
    codeS150, elementCodeS150: Integer;
    nameS150: String;

  end;

var
  frmGauge150: TfrmGauge150;
  vQRYSubst150TransformerGaugePowerGenUpd: TZQuery;


implementation

uses ENEquipmentStateController, ENGauge150Controller, ENConsts,
  ENSituationRPNController, ENSubst150PowerTransController,
  ENSubstation150Controller, ENSubst150CellController, ShowEPWorker, DateUtils,
  ENVoltageClassController, Globals, reportPowerReserve, DataModuleReportsEWF,
  DataModuleReportsENetObject, ZSqlProcessor, GroupController,
  UserController, RegistryTools, VersionInfo;

type tpPowTrans = record
  powTransCode: Integer; //системный код трансформатора высоковольтной станции
  powTransDispName: string; //диспетчетское наименование трансформатора
end;

{$R *.dfm}

const workerCaption: String = 'ПІБ, підпис особи';
const strEditMarker: String = 'edit';

var lastDateTime: TDateTime; //Дата и время последнего замера
  vFirstCellRow, lengthArrPowTrans, vOldRow, vNewRow: Integer;
  vArrPowTrans: array of tpPowTrans;

procedure TfrmGauge150.actUpdateExecute(Sender: TObject);
var TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
  ENSubst150PowerTransFilterObj: ENSubst150PowerTransFilter;
  ENSubst150PowerTransList: ENSubst150PowerTransShortList;
  i, j, s150trLastCount, sgRowCnt, gauge150LastCount,
  subst150powerTransCode, cellCode, gauge150Code, vGenSwitchDev: Integer;
  condition, vStrPowTransCondition: String;

  vVoltage: Real; vColor, vTextColor: TColor;

  TempENSubst150Cell: ENSubst150CellControllerSoapPort;
  cellLastCount150, cellLastCount35, cellLastCount10, cellLastCount6,
  cellLastCount: Integer;
  ENSubst150CellList: ENSubst150CellShortList;
  cellFilter: ENSubst150CellFilter;

  TempENGauge150: ENGauge150ControllerSoapPort;
  filterENGauge150: ENGauge150Filter;
  ENGauge150List: ENGauge150ShortList;

  function SetVoltageColor(
    pVoltage: Real; isInternalSTO: Boolean = True): TColor;
  begin
    Result := RGB(255, 255, 255);
    vTextColor := RGB(0, 0, 0);
    case isInternalSTO of
      True: //Інструкція ОС-16 від 30.03.2014 р. до введення та обслуговування
        begin //мнемосхем на дисперчерських пунктах і станціях ПАО "ЕК "ХОЕ"
          if pVoltage >= 330 then
            begin
              vTextColor := RGB(255, 255, 255);
              Result := RGB(0, 0, 0); //чёрный
            end
          else if pVoltage >= 150 then
            begin
              vTextColor := RGB(255, 255, 255);
              Result := RGB(50, 130, 50); //зелёный
            end
          else if pVoltage >= 35 then
            begin
              vTextColor := RGB(255, 255, 255);
              Result := RGB(50, 50, 255); //синий
            end
          else if pVoltage >= 10 then
            Result := RGB(255, 50, 50) //красный
          else if pVoltage >= 6 then
            begin
              vTextColor := RGB(0, 0, 0);
              Result := RGB(255, 255, 130); //жёлтый
            end
          else if pVoltage <= 1 then
            Result := RGB(190, 190, 190); //серый
        end;
      False: //СТАНДАРТ ОРГАНИЗАЦИИ ОАО «ФЕДЕРАЛЬНАЯ СЕТЕВАЯ КОМПАНИЯ
        begin //ЕДИНОЙ ЭНЕРГЕТИЧЕСКОЙ СИСТЕМЫ» 56947007-25.040.70.101-2011
          if pVoltage >= 1150 then Result := RGB(205, 138, 255) //сиреневый
          else if pVoltage >= 750 then
            begin
              vTextColor := RGB(255, 255, 255);
              Result := RGB(0, 0, 200); //тёмно-синий
            end
          else if pVoltage >= 500 then Result := RGB(165, 15, 10) //красный
          else if pVoltage >= 400 then Result := RGB(240, 150, 30) //оранжевый
          else if pVoltage >= 330 then Result := RGB(0, 140, 0) //зелёный
          else if pVoltage >= 220 then Result := RGB(200, 200, 0) //жёлто-зелёный
          else if pVoltage >= 150 then Result := RGB(170, 150, 0) //хаки
          else if pVoltage >= 110 then Result := RGB(0, 180, 200) //голубой
          else if pVoltage >= 20 then
            begin
              vTextColor := RGB(255, 255, 255);
              Result := RGB(130, 100, 50); //коричневый
            end
          else if pVoltage >= 10 then
            begin
              vTextColor := RGB(255, 255, 255);
              Result := RGB(100, 0, 100); //фиолетовый
            end
          else if pVoltage >= 6 then Result := RGB(200, 150, 100) //светло-коричневый
          else if pVoltage <= 1 then
            Result := RGB(190, 190, 190); //серый
        end;
    end;



  end;

  procedure LoadCellListInGauge150(aVoltageClass: Integer);
  var c: Integer;
  begin
    vVoltage := 0;

    cellFilter.conditionSQL :=
      'ensubst150cell.voltageclassrefcode = ' + IntToStr(aVoltageClass);

    ENSubst150CellList :=
      TempENSubst150Cell.getScrollableFilteredList(cellFilter, 0, -1);
    cellLastCount := High(ENSubst150CellList.list);

    case aVoltageClass of
      ENVOLTAGECLASS_150: cellLastCount150 := cellLastCount; //Ячейки 150 кВ
      ENVOLTAGECLASS_35: cellLastCount35 := cellLastCount; //Ячейки 35 кВ
      ENVOLTAGECLASS_10: cellLastCount10 := cellLastCount; //Ячейки 10 кВ
      ENVOLTAGECLASS_6: cellLastCount6 := cellLastCount; //Ячейки 6 кВ
    end;

    if cellLastCount > -1 then
      begin
        advStrGrMeasurementData.RowCount := sgRowCnt;
        advStrGrMeasurementData.Cells[0, sgRowCnt - 1] := 'ЗАМЕРЫ';
        advStrGrMeasurementData.Cells[1, sgRowCnt - 1] := 'РЕЖИМНЫЕ';
        advStrGrMeasurementData.Cells[2, sgRowCnt - 1] := 'СИЛЫ ТОКА';
        advStrGrMeasurementData.Cells[3, sgRowCnt - 1] := 'ЯЧЕЕК СТАНЦИИ';
        advStrGrMeasurementData.Cells[4, sgRowCnt - 1] :=
          ENSubst150CellList.list[0].voltageClassRefDescription;
        advStrGrMeasurementData.Cells[5, sgRowCnt - 1] := 'ЯЧЕЙКИ ' +
          ENSubst150CellList.list[0].voltageClassRefDescription + ', I (А)';
        if ENSubst150CellList.list[0].voltageClassRefValue <> nil then
          vVoltage := StrToFloat(
            ENSubst150CellList.list[0].voltageClassRefValue.DecimalString);
        vColor := SetVoltageColor(vVoltage, (rgSTO.ItemIndex < 1));

        advStrGrMeasurementData.RowCount := sgRowCnt + cellLastCount + 1;
        for c := 0 to cellLastCount do
          begin
            advStrGrMeasurementData.RowColor[sgRowCnt + c] := vColor;
            advStrGrMeasurementData.RowFontColor[sgRowCnt + c] := vTextColor;

            advStrGrMeasurementData.Cells[0, sgRowCnt + c] :=
              ENSubst150CellList.list[c].voltageClassRefDescription;
            advStrGrMeasurementData.Cells[1, sgRowCnt + c] := 'Ячейка N';
            advStrGrMeasurementData.Cells[2, sgRowCnt + c] :=
              ENSubst150CellList.list[c].factoryNumber;
            advStrGrMeasurementData.Cells[5, sgRowCnt + c] :=
              ENSubst150CellList.list[c].name;
            advStrGrMeasurementData.Objects[5, sgRowCnt + c] :=
                TObject(ENSubst150CellList.list[c].code);
            advStrGrMeasurementData.Cells[4, sgRowCnt + c] :=
              ENSubst150CellList.list[c].materialRefName;
            advStrGrMeasurementData.Cells[3, sgRowCnt + c] :=
              ENSubst150CellList.list[c].commentGen;
            if (Pos('РЗ', advStrGrMeasurementData.Cells[3, sgRowCnt + c]) = 0)
            or (Pos('Не РЗ', advStrGrMeasurementData.Cells[3, sgRowCnt + c])
              <> 0)
            then
              begin
                //advStrGrMeasurementData.Colors[6, sgRowCnt + c] := clLtGray;
                advStrGrMeasurementData.RowColor[sgRowCnt + c] :=
                  clInactiveCaption;
                advStrGrMeasurementData.RowFontColor[sgRowCnt + c] :=
                  RGB(255, 255, 255);
                advStrGrMeasurementData.Cells[3, sgRowCnt + c] := 'Не РЗ';
              end;
          end; //for iterIntVar := 0 to cellLastCount do
        advStrGrMeasurementData.RowCount :=
          advStrGrMeasurementData.RowCount + 1;
        sgRowCnt := advStrGrMeasurementData.RowCount;
        cellLastCount := -1;
      end;
  end;

begin
  if pcFiderGauge.ActivePage = tsMeasurementData then
    begin
      tsMeasurementData.Caption := 'Данні вимірів ' + nameS150;
      advStrGrMeasurementData.Clear;
      lastDateTime := 0; //Обнуление даты и времени последнего замера
      dtpDateGuage.Enabled := (frmGauge150.DialogState = dsEdit)
        or (frmGauge150.DialogState = dsInsert);
      dtpDateGuage.Checked := True;
      dtpDateGuage.DateTime := SysUtils.Date;
      dtpTimeGuage.Enabled := dtpDateGuage.Enabled;
      dtpTimeGuage.Checked := True;
      dtpTimeGuage.DateTime := SysUtils.Time;

      if actAdditionalColumnsVisible.Checked then
        begin
          advStrGrMeasurementData.ColWidths[0] := 50;
          advStrGrMeasurementData.ColWidths[1] := 80;
          advStrGrMeasurementData.ColWidths[2] := 80;
          advStrGrMeasurementData.ColWidths[3] := 110;
          advStrGrMeasurementData.ColWidths[4] := 80;
          advStrGrMeasurementData.ColWidths[5] := 120;
        end;

      //Силовые трансформаторы
      TempENSubst150PowerTrans :=
        HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;
      ENSubst150PowerTransFilterObj := ENSubst150PowerTransFilter.Create;
      SetNullIntProps(ENSubst150PowerTransFilterObj);
      SetNullXSProps(ENSubst150PowerTransFilterObj);

      condition := ENSubst150PowerTransFilterObj.conditionSQL;

      vStrPowTransCondition := 'ensubst150powertrans.substationrefcode = ' +
        IntToStr(codeS150);

      //Отображение связанных трансформаторов иного класса напряжения
      if chkShowOtherVoltageClassLinkedTransformer.Checked then //SUPP-61031
        vStrPowTransCondition := vStrPowTransCondition + ' ' +
          'or (ensubst150powertrans.code in (' +
          '  select ensubst2powtrans.powertransrefcode' +
          '  from ensubst2powtrans ' +
          '  where ensubst2powtrans.substationrefcode = ' +
             IntToStr(codeS150) + ') ' +
          'or ensubst150powertrans.substationrefcode in (' +
          '  select ensubst2powtrans.substationrefcode' +
          '  from ensubst2powtrans ' +
          '  where ensubst2powtrans.powertransrefcode in (' +
          '    select st150pt.code from ensubst150powertrans st150pt' +
          '    where st150pt.substationrefcode = ' +
               IntToStr(codeS150) + ')))';

      AddCondition(condition, vStrPowTransCondition);

      ENSubst150PowerTransFilterObj.conditionSQL := condition;

      //ENSubst150PowerTransFilterObj.substationRef := ENSubstation150Ref.Create;
      //ENSubst150PowerTransFilterObj.substationRef.code := codeS150;

      ENSubst150PowerTransList :=
        TempENSubst150PowerTrans.getScrollableFilteredList(
          ENSubst150PowerTransFilterObj, 0, -1);

      s150trLastCount := High(ENSubst150PowerTransList.list);
      SetLength(vArrPowTrans, s150trLastCount + 1);

      if s150trLastCount > -1 then
        begin
          sgRowCnt := 3 + (s150trLastCount + 1) * 7;
          advStrGrMeasurementData.RowCount := sgRowCnt;
        end
      else Exit;

      advStrGrMeasurementData.Cells[0, 0] := 'Класс U, кВ';
      advStrGrMeasurementData.Cells[1, 0] := 'Тип объекта станции';
      advStrGrMeasurementData.Cells[2, 0] := 'Номинальный ток, А';
      advStrGrMeasurementData.Cells[3, 0] := 'Установленная мощность, кВА';
      advStrGrMeasurementData.Cells[4, 0] := 'Напряжение, кВ';
      advStrGrMeasurementData.Cells[5, 0] :=
        'Дата замера силы тока и напряжения';

      advStrGrMeasurementData.Cells[0, 1] := 'ЗАМЕРЫ';
      advStrGrMeasurementData.Cells[1, 1] := 'РЕЖИМНЫЕ';
      advStrGrMeasurementData.Cells[2, 1] := 'ШИН';
      advStrGrMeasurementData.Cells[3, 1] := 'ТРАНСФОРМАТОРОВ';
      advStrGrMeasurementData.Cells[4, 1] := 'СИЛОВЫХ';
      advStrGrMeasurementData.Cells[5, 1] := 'Время замера';

      advStrGrMeasurementData.FixedCols := 6;

      for i := 0 to s150trLastCount do
        begin
          vArrPowTrans[i].powTransCode :=
            ENSubst150PowerTransList.list[i].code;
          vArrPowTrans[i].powTransDispName :=
            ENSubst150PowerTransList.list[i].name;

          advStrGrMeasurementData.Objects[2, 7 * i + 2] :=
            TObject(ENSubst150PowerTransList.list[i].code);
          advStrGrMeasurementData.Cells[0, 7 * i + 2] :=
            ENSubst150PowerTransList.list[i].voltageClassRefDescription;
          advStrGrMeasurementData.Cells[1, 7 * i + 2] :=
            ENSubst150PowerTransList.list[i].typeRefName;
          advStrGrMeasurementData.Cells[2, 7 * i + 2] :=
            ENSubst150PowerTransList.list[i].name;
          advStrGrMeasurementData.Cells[3, 7 * i + 2] := 'Заводской номер';
          advStrGrMeasurementData.Cells[4, 7 * i + 2] :=
            ENSubst150PowerTransList.list[i].factoryNumber;
          advStrGrMeasurementData.Cells[5, 7 * i + 2] :=
            ENSubst150PowerTransList.list[i].name + ' Положение РПН';

          if ENSubst150PowerTransList.list[i].voltageVN <> nil then
            condition := IntToStr(Round(StrToFloat(
              ENSubst150PowerTransList.list[i].voltageVN.DecimalString)));
          advStrGrMeasurementData.Cells[5, 7 * i + 3] :=
            ENSubst150PowerTransList.list[i].name + ' с.ш. ' +
             condition + ' кВ, U (кВ)';
          advStrGrMeasurementData.Cells[5, 7 * i + 4] :=
            ENSubst150PowerTransList.list[i].name + ' с.ш. ' +
             condition + ' кВ, I (А)';

          if ENSubst150PowerTransList.list[i].voltageSN <> nil then
            condition := IntToStr(Round(StrToFloat(
              ENSubst150PowerTransList.list[i].voltageSN.DecimalString)));
          advStrGrMeasurementData.Cells[5, 7 * i + 5] :=
            ENSubst150PowerTransList.list[i].name + ' с.ш. ' +
             condition + ' кВ, U (кВ)';
          advStrGrMeasurementData.Cells[5, 7 * i + 6] :=
            ENSubst150PowerTransList.list[i].name + ' с.ш. ' +
             condition + ' кВ, I (А)';

          if ENSubst150PowerTransList.list[i].voltageNN <> nil then
            condition := IntToStr(Round(StrToFloat(
              ENSubst150PowerTransList.list[i].voltageNN.DecimalString)));
          advStrGrMeasurementData.Cells[5, 7 * i + 7] :=
            ENSubst150PowerTransList.list[i].name + ' с.ш. ' +
             condition + ' кВ, U (кВ)';
          advStrGrMeasurementData.Cells[5, 7 * i + 8] :=
            ENSubst150PowerTransList.list[i].name + ' с.ш. ' +
             condition + ' кВ, I (А)';

          advStrGrMeasurementData.Cells[0, 7 * i + 3] := 'ВН';
          advStrGrMeasurementData.Cells[0, 7 * i + 4] := 'сторона';
          advStrGrMeasurementData.Cells[0, 7 * i + 5] := 'СН';
          advStrGrMeasurementData.Cells[0, 7 * i + 6] := 'сторона';
          advStrGrMeasurementData.Cells[0, 7 * i + 7] := 'НН';
          advStrGrMeasurementData.Cells[0, 7 * i + 8] := 'сторона';

          if ENSubst150PowerTransList.list[i].materialRefCode > 0 then
            begin
              advStrGrMeasurementData.Cells[1, 7 * i + 3] := 'Материал';
              advStrGrMeasurementData.Cells[1, 7 * i + 4] :=
                ENSubst150PowerTransList.list[i].materialRefName;
              advStrGrMeasurementData.Cells[2, 7 * i + 4] := 'Классификация';
              advStrGrMeasurementData.Cells[3, 7 * i + 4] :=
                ENSubst150PowerTransList.list[i].materialRefIdentid;
              if ENSubst150PowerTransList.list[i].materialRefNumkatalog <> ''
              then
                begin
                  advStrGrMeasurementData.Cells[1, 7 * i + 6] := 'Каталог';
                  advStrGrMeasurementData.Cells[1, 7 * i + 7] :=
                    ENSubst150PowerTransList.list[i].materialRefNumkatalog;
                end;
            end;

          if (ENSubst150PowerTransList.list[i].powerVN = nil) then
            advStrGrMeasurementData.Cells[3, 7 * i + 3] := ''
          else advStrGrMeasurementData.Cells[3, 7 * i + 3] :=
            ENSubst150PowerTransList.list[i].powerVN.DecimalString;
          if (ENSubst150PowerTransList.list[i].powerSN = nil) then
            advStrGrMeasurementData.Cells[3, 7 * i + 5] := ''
          else advStrGrMeasurementData.Cells[3, 7 * i + 5] :=
            ENSubst150PowerTransList.list[i].powerSN.DecimalString;
          if (ENSubst150PowerTransList.list[i].powerNN = nil) then
            advStrGrMeasurementData.Cells[3, 7 * i + 7] := ''
          else advStrGrMeasurementData.Cells[3, 7 * i + 7] :=
            ENSubst150PowerTransList.list[i].powerNN.DecimalString;

          if (ENSubst150PowerTransList.list[i].currentVN = nil) then
            advStrGrMeasurementData.Cells[2, 7 * i + 3] := ''
          else advStrGrMeasurementData.Cells[2, 7 * i + 3] :=
            ENSubst150PowerTransList.list[i].currentVN.DecimalString;
          if (ENSubst150PowerTransList.list[i].currentSN = nil) then
            advStrGrMeasurementData.Cells[2, 7 * i + 5] := ''
          else advStrGrMeasurementData.Cells[2, 7 * i + 5] :=
            ENSubst150PowerTransList.list[i].currentSN.DecimalString;
          if (ENSubst150PowerTransList.list[i].currentNN = nil) then
            advStrGrMeasurementData.Cells[2, 7 * i + 7] := ''
          else advStrGrMeasurementData.Cells[2, 7 * i + 7] :=
            ENSubst150PowerTransList.list[i].currentNN.DecimalString;

          if (ENSubst150PowerTransList.list[i].voltageVN = nil) then
            advStrGrMeasurementData.Cells[4, 7 * i + 3] := ''
          else advStrGrMeasurementData.Cells[4, 7 * i + 3] :=
            ENSubst150PowerTransList.list[i].voltageVN.DecimalString;
          if (ENSubst150PowerTransList.list[i].voltageSN = nil) then
            advStrGrMeasurementData.Cells[4, 7 * i + 5] := ''
          else advStrGrMeasurementData.Cells[4, 7 * i + 5] :=
            ENSubst150PowerTransList.list[i].voltageSN.DecimalString;
          if (ENSubst150PowerTransList.list[i].voltageNN = nil) then
            advStrGrMeasurementData.Cells[4, 7 * i + 7] := ''
          else advStrGrMeasurementData.Cells[4, 7 * i + 7] :=
            ENSubst150PowerTransList.list[i].voltageNN.DecimalString;

          advStrGrMeasurementData.RowColor[7 * i + 2] := clFuchsia;

          vVoltage := 0; vColor := RGB(255, 255, 255);
          vTextColor := RGB(0, 0, 0);
          if ENSubst150PowerTransList.list[i].voltageVN <> nil then
            begin
              vVoltage := StrToFloat(
                ENSubst150PowerTransList.list[i].voltageVN.DecimalString);
              vColor := SetVoltageColor(vVoltage, (rgSTO.ItemIndex < 1));
              advStrGrMeasurementData.RowColor[7 * i + 3] := vColor;
              advStrGrMeasurementData.RowFontColor[7 * i + 3] := vTextColor;
              advStrGrMeasurementData.RowColor[7 * i + 4] := vColor;
              advStrGrMeasurementData.RowFontColor[7 * i + 4] := vTextColor;
            end;

          vVoltage := 0; vColor := RGB(255, 255, 255);
          vTextColor := RGB(0, 0, 0);
          if ENSubst150PowerTransList.list[i].voltageSN <> nil then
            begin
              vVoltage := StrToFloat(
                ENSubst150PowerTransList.list[i].voltageSN.DecimalString);
              vColor := SetVoltageColor(vVoltage, (rgSTO.ItemIndex < 1));
              advStrGrMeasurementData.RowColor[7 * i + 5] := vColor;
              advStrGrMeasurementData.RowFontColor[7 * i + 5] := vTextColor;
              advStrGrMeasurementData.RowColor[7 * i + 6] := vColor;
              advStrGrMeasurementData.RowFontColor[7 * i + 6] := vTextColor;
            end;

          vVoltage := 0; vColor := RGB(255, 255, 255);
          vTextColor := RGB(0, 0, 0);
          if ENSubst150PowerTransList.list[i].voltageNN <> nil then
            begin
              vVoltage := StrToFloat(
                ENSubst150PowerTransList.list[i].voltageNN.DecimalString);
              vColor := SetVoltageColor(vVoltage, (rgSTO.ItemIndex < 1));
              advStrGrMeasurementData.RowColor[7 * i + 7] := vColor;
              advStrGrMeasurementData.RowFontColor[7 * i + 7] := vTextColor;
              advStrGrMeasurementData.RowColor[7 * i + 8] := vColor;
              advStrGrMeasurementData.RowFontColor[7 * i + 8] := vTextColor;
            end;
        end;

      //Ячейки
      TempENSubst150Cell :=
        HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;
      cellFilter := ENSubst150CellFilter.Create;
      SetNullIntProps(cellFilter);
      SetNullXSProps(cellFilter);

      cellFilter.substationRef := ENSubstation150Ref.Create;
      cellFilter.substationRef.code := codeS150;

      vFirstCellRow := sgRowCnt;

      cellLastCount150 := 0; //Ячейки 150 кВ
      cellLastCount35 := 0; //Ячейки 35 кВ
      cellLastCount10 := 0; //Ячейки 10 кВ
      cellLastCount6 := 0; //Ячейки 6 кВ

      //Ячейки 150 кВ
      LoadCellListInGauge150(ENVOLTAGECLASS_150);

      //Ячейки 35 кВ
      LoadCellListInGauge150(ENVOLTAGECLASS_35);

      //Ячейки 10 кВ
      LoadCellListInGauge150(ENVOLTAGECLASS_10);

      //Ячейки 6 кВ
      LoadCellListInGauge150(ENVOLTAGECLASS_6);

      advStrGrMeasurementData.RowCount := sgRowCnt + 2;
      sgRowCnt := advStrGrMeasurementData.RowCount;
      advStrGrMeasurementData.Cells[5, sgRowCnt - 2] := workerCaption;
      advStrGrMeasurementData.RowHeights [sgRowCnt - 3] := 10;
      advStrGrMeasurementData.RowHeights [sgRowCnt - 1] := 0;

      //Режимные замеры высоковольтных станций
      TempENGauge150 := HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;
      filterENGauge150 := ENGauge150Filter.Create;
      SetNullIntProps(filterENGauge150); SetNullXSProps(filterENGauge150);
      filterENGauge150.substation150Ref := ENSubstation150Ref.Create;
      filterENGauge150.substation150Ref.code := codeS150;
      //filterENGauge150.powerTransRef := ENSubst150PowerTransRef.Create;
      //filterENGauge150.powerTransRef.code := subst150powerTransCode;

      filterENGauge150.orderBySQL :=
        ' engauge150.dategauge, engauge150.substation150refcode, ' +
        'coalesce(engauge150.powertransrefcode, 0), ' +
        'coalesce(engauge150.isgenswitchdev, 0), ' +
        'engauge150.cellrefcode, engauge150.voltageclassrefcode, ' +
        'engauge150.line150refcode, engauge150.line10refcode, ' +
        'engauge150.cablerefcode';

      ENGauge150List := TempENGauge150.getScrollableFilteredList(
        ENGauge150Filter(filterENGauge150), 0, -1);
      gauge150LastCount := High(ENGauge150List.list);

      if gauge150LastCount <= -1 then Exit
      else advStrGrMeasurementData.ColCount := gauge150LastCount + 7;

      subst150powerTransCode := 0; cellCode := 0; gauge150Code := 0;
      condition := '';

      if cellLastCount150 >= 0 then
        cellLastCount := cellLastCount150;
      if cellLastCount35 >= 0 then
        cellLastCount := cellLastCount + cellLastCount35 + 1;
      if cellLastCount10 >= 0 then
        cellLastCount := cellLastCount + cellLastCount10 + 2;
      if cellLastCount6 >= 0 then
        cellLastCount := cellLastCount + cellLastCount6 + 3;

      for j := 0 to gauge150LastCount do
        begin
          advStrGrMeasurementData.ColWidths[j + 6] := 70;
          advStrGrMeasurementData.Cells[j + 6, 0] := DateToStr(EncodeDate(
            ENGauge150List.list[j].dateGauge.Year,
            ENGauge150List.list[j].dateGauge.Month,
            ENGauge150List.list[j].dateGauge.Day));
          advStrGrMeasurementData.Cells[j + 6, 1] := TimeToStr(EncodeTime(
            ENGauge150List.list[j].dateGauge.Hour,
            ENGauge150List.list[j].dateGauge.Minute, 0, 0));
            //ENGauge150List.list[j].dateGauge.Second,
            //ENGauge150List.list[j].dateGauge.Millisecond

          subst150powerTransCode := ENGauge150List.list[j].powerTransRefCode;
          cellCode := ENGauge150List.list[j].cellRefCode;
          gauge150Code := ENGauge150List.list[j].code;

          if (subst150powerTransCode > 0) and (cellCode <= 0) then
            for i := 0 to s150trLastCount do
              begin
                if advStrGrMeasurementData.Objects[2, 7 * i + 2] <> nil then
                  if Integer(advStrGrMeasurementData.Objects[2, 7 * i + 2]) =
                    subst150powerTransCode
                  then
                    begin
                      advStrGrMeasurementData.Cells[j + 6, 7 * i + 2] :=
                        ENGauge150List.list[j].situationRPNRefDescription;
                      advStrGrMeasurementData.Objects[j + 6, 7 * i + 2] :=
                        TObject(gauge150Code);

                      condition := ENGauge150List.list[j].name;
                      vGenSwitchDev := 0;

                      if Pos('ВысокоВольтной', condition) > 0 then
                        vGenSwitchDev := 1
                      else if Pos('СреднеВольтной', condition) > 0 then
                        vGenSwitchDev := 2
                      else if Pos('НизкоВольтной', condition) > 0 then
                        vGenSwitchDev := 3;
                      if vGenSwitchDev = 0 then vGenSwitchDev := 1;

                      if ENGauge150List.list[j].tension <> nil then
                        advStrGrMeasurementData.Cells[
                            j + 6, 7 * i + 2 * vGenSwitchDev + 1] :=
                          ENGauge150List.list[j].tension.DecimalString;
                      advStrGrMeasurementData.Objects[
                          j + 6, 7 * i + 2 * vGenSwitchDev + 1] :=
                        TObject(gauge150Code);

                      if ENGauge150List.list[j].current <> nil then
                        advStrGrMeasurementData.Cells[
                            j + 6, 7 * i + 2 * vGenSwitchDev + 2] :=
                          ENGauge150List.list[j].current.DecimalString;
                      advStrGrMeasurementData.Objects[
                          j + 6, 7 * i + 2 * vGenSwitchDev + 2] :=
                        TObject(gauge150Code);
                    end;
              end
          else if (cellCode > 0) then
            for i := vFirstCellRow to vFirstCellRow + cellLastCount + 1 do
              begin
                if advStrGrMeasurementData.Objects[5, i] <> nil then
                  if Integer(advStrGrMeasurementData.Objects[5, i]) = cellCode
                  then
                    begin
                      if ENGauge150List.list[j].current <> nil then
                        advStrGrMeasurementData.Cells[j + 6, i] :=
                          ENGauge150List.list[j].current.DecimalString;
                      advStrGrMeasurementData.Objects[j + 6, i] :=
                        TObject(gauge150Code);
                    end;
                if (subst150powerTransCode > 0)
                and (advStrGrMeasurementData.Objects[1, i] = nil)
                and (advStrGrMeasurementData.Cells[1, i] = 'Ячейка N')
                then
                  begin
                    advStrGrMeasurementData.Objects[1, i] :=
                      TObject(subst150powerTransCode);
                    advStrGrMeasurementData.Cells[3, i] :=
                      advStrGrMeasurementData.Cells[3, i] + ' ' +
                      ENGauge150List.list[j].powerTransRefName;
                  end;
              end;

          //Сотрудник, выполнивший замеры
          if (subst150powerTransCode > 0) or (cellCode > 0)
          and (ENGauge150List.list[j].userGen <> '')
          and (advStrGrMeasurementData.Cells[j + 6, sgRowCnt - 2] = '') then
            advStrGrMeasurementData.Cells[j + 6, sgRowCnt - 2] :=
              ENGauge150List.list[j].userGen;

          //Вывод ФИО сотрудника, внёсшего информацию о Трансформаторе в случае
          //отсутствия сведений о редактировавшем Замер сотруднике
          if (advStrGrMeasurementData.Cells[j + 6, sgRowCnt - 2] = '')
          and (subst150powerTransCode > 0) then
            advStrGrMeasurementData.Cells[j + 6, sgRowCnt - 2] :=
              ENGauge150List.list[j].powerTransRefUserGen;

          //Вывод ФИО сотрудника, внёсшего информацию о Ячейке в случае
          //отсутствия сведений о редактировавшем Замер сотруднике
          if (advStrGrMeasurementData.Cells[j + 6, sgRowCnt - 2] = '')
          and (cellCode > 0) then
            advStrGrMeasurementData.Cells[j + 6, sgRowCnt - 2] :=
              ENGauge150List.list[j].cellRefUserGen;
        end;

      //Раскраска строк грида в цвет 6-го столбца.
      //Применение свойства advStrGrMeasurementData.RowColor[i] недопустимо,
      //т.к. данная раскраска каким-то образом стирает свойства объектов,
      //соответствующим ячейкам предпоследней строки (внутренний Delphi-глюк
      //TAdvStringGrid-а)
      for i := 2 to advStrGrMeasurementData.RowCount - 1 do
        for j := 6 to advStrGrMeasurementData.ColCount - 1 do
          begin
            advStrGrMeasurementData.Colors[j, i] :=
              advStrGrMeasurementData.Colors[6, i];
            advStrGrMeasurementData.FontColors[j, i] :=
              advStrGrMeasurementData.FontColors[6, i];
          end;

      //Уменьшение количества столбцов грида посредством помещения сделанных
      //в одно и то же время замеров в одну колонку
      if advStrGrMeasurementData.ColCount >= 7 then
        begin
          j := 6;
          while j <= advStrGrMeasurementData.ColCount - 1 do
            begin
              if (advStrGrMeasurementData.Cells[j, 0] =
                advStrGrMeasurementData.Cells[j - 1, 0])
              and (Copy(advStrGrMeasurementData.Cells[j, 1], 1, 5) =
                Copy(advStrGrMeasurementData.Cells[j - 1, 1], 1, 5))
              then
                begin
                  for i := 2 to advStrGrMeasurementData.RowCount - 1 do
                    begin
                      if (advStrGrMeasurementData.Cells[j, i] <> '')
                      and (advStrGrMeasurementData.Cells[j - 1, i] = '') then
                        begin
                          advStrGrMeasurementData.Cells[j - 1, i] :=
                            advStrGrMeasurementData.Cells[j, i];
                          if advStrGrMeasurementData.Objects[j, i] <> nil then
                            advStrGrMeasurementData.Objects[j - 1, i] :=
                              advStrGrMeasurementData.Objects[j, i];
                        end;
                    end;
                  advStrGrMeasurementData.RemoveCols(j, 1);
                  j := j - 1;
                end;
              j := j + 1;
            end;
        end;
      if chkOnlyGauge.Checked then actFilter.Execute;
    end; //if pcFiderGauge.ActivePage = tsMeasurementData then
end;

procedure TfrmGauge150.actWorkerChangeExecute(Sender: TObject);
var frmEPWorkerShow: TfrmEPWorkerShow; i: Integer;
begin
  for i := 2 to advStrGrMeasurementData.RowCount - 1 do
    if advStrGrMeasurementData.Cells[5, i] = workerCaption then
      Break;
  frmEPWorkerShow := TfrmEPWorkerShow.Create(Application, fmNormal);
  try
    with frmEPWorkerShow do
      if ShowModal = mrOk then
        begin
          try
            advStrGrMeasurementData.Objects[
              advStrGrMeasurementData.Col, i] :=
                TObject(StrToInt(GetReturnValue(sgMain, 0)));
            advStrGrMeasurementData.Cells[advStrGrMeasurementData.Col, i] :=
              GetReturnValue(sgMain, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmEPWorkerShow.Free;
  end;
end;

procedure TfrmGauge150.FormShow(Sender: TObject);
begin
  DisableActions([actDelete], //Кнопка Удаления ранее введённых замеров
    (HTTPRIOENGauge150.HTTPWebNode.UserName <> 'energynet')
    and (HTTPRIOENGauge150.HTTPWebNode.UserName <> 'promadmin'));
  DisableActions([actInsert, actEdit, actSave, actWorkerChange],
    DialogState = dsView);
  if pcFiderGauge.ActivePage <> tsElectricLoadRegimDay then
    begin
      pcFiderGauge.ActivePage := tsMeasurementData;
      actUpdateExecute(Sender);
    end;

  //actAdditionalColumnsVisibleExecute(nil);
  pcFiderGaugeChange(nil);
  //actFilter.Execute;
end;

procedure TfrmGauge150.advStrGrMeasurementDataDblClickCell(
  Sender: TObject; ARow, ACol: Integer);
begin
  if (ACol > -1) and (ARow > -1) then
    if advStrGrMeasurementData.Objects[ACol, ARow] <> nil then
      ShowMessage(IntToStr(Integer(
        advStrGrMeasurementData.Objects[ACol, ARow])));
end;

procedure TfrmGauge150.advStrGrMeasurementDataEditCellDone(Sender: TObject;
  ACol, ARow: Integer);
begin
  advStrGrMeasurementData.Cells[ACol, advStrGrMeasurementData.RowCount - 1] :=
    strEditMarker;
end;

procedure TfrmGauge150.actInsertExecute(Sender: TObject);
var i, j: Integer; strDate, strTime: String;
begin
  if pcFiderGauge.ActivePage = tsMeasurementData then
    begin
      strDate := DateToStr(dtpDateGuage.Date);
      strTime := TimeToStr(dtpTimeGuage.Time);

      if dtpDateGuage.checked then
        begin
          dtpDateGuage.Time := 0;
          if dtpTimeGuage.Checked then
            dtpDateGuage.Time := dtpTimeGuage.Time;
        end;

      for j := 6 to advStrGrMeasurementData.ColCount - 1 do
        if (j > 6) and (advStrGrMeasurementData.Cells[j, 0] = strDate)
        and (Copy(advStrGrMeasurementData.Cells[j, 1], 1, 5) =
          Copy(strTime, 1, 5))
        then
          begin
            Application.MessageBox(PChar('Пропонуєма хронологія вже існує.' +
              #13#10 + 'Оберіть, будь-ласка, потрібну колонку та введіть ' +
              'заміри.'), PChar('Підказка:'), MB_ICONINFORMATION);
            Exit;
          end

        //Отключаем запрет на добавление замеров с датой меньше
        //крайней - согласовано Зам. Тех. Директора по Присоединению
        //с 1-м Зам. Тех. Директора  
        {else if dtpDateGuage.DateTime < lastDateTime then
          begin
            Application.MessageBox(PChar('Пропонуєма хронологія має бути ' +
              #13#10 + 'не раніше дати останнього заміру.'),
              PChar('Підказка:'), MB_ICONINFORMATION);
            Exit;
          end}
          ;

      if (advStrGrMeasurementData.ColCount > 7)
      or ((advStrGrMeasurementData.ColCount = 7)
        and (advStrGrMeasurementData.Cells[
          advStrGrMeasurementData.ColCount - 1, 0] <> ''))
      then
        advStrGrMeasurementData.AddColumn;
      advStrGrMeasurementData.Cells[advStrGrMeasurementData.ColCount - 1, 0] :=
        strDate;
      advStrGrMeasurementData.Cells[advStrGrMeasurementData.ColCount - 1, 1] :=
        strTime;
      advStrGrMeasurementData.ColWidths[
        advStrGrMeasurementData.ColCount - 1] := 70;

      //Раскраска строк грида в цвет 6-го столбца
      for i := 2 to advStrGrMeasurementData.RowCount - 1 do
        for j := 6 to advStrGrMeasurementData.ColCount - 1 do
          begin
            advStrGrMeasurementData.Colors[j, i] :=
              advStrGrMeasurementData.Colors[6, i];
            advStrGrMeasurementData.FontColors[j, i] :=
              advStrGrMeasurementData.FontColors[6, i];

            if (j <> 6) and (i <> 0) and (i <> 1) then
              begin
                if (advStrGrMeasurementData.Cells[2, i] = 'ВН') then
                  advStrGrMeasurementData.Cells[j, i] := 'Положение'
                else if (advStrGrMeasurementData.Cells[2, i] = 'СН') then
                  advStrGrMeasurementData.Cells[j, i] := 'РПН ' +
                    advStrGrMeasurementData.Cells[1, i];
              end;
          end;
    end; //if pcFiderGauge.ActivePage = tsMeasurementData then
end;

procedure TfrmGauge150.actNoFilterExecute(Sender: TObject);
var i: Integer;
begin
  for i := 2 to advStrGrMeasurementData.RowCount - 1 do
    if advStrGrMeasurementData.Cells[5, i] = '' then
      advStrGrMeasurementData.RowHeights[i] := 10
    else advStrGrMeasurementData.RowHeights[i] := 21;
  advStrGrMeasurementData.RowHeights[
    advStrGrMeasurementData.RowCount - 1] := 0;
  chkOnlyGauge.Checked := False;
end;

procedure TfrmGauge150.OrderOneCell(rowNum: Integer);
var m, modRes: Integer; strMsg: string;
begin
  if (advStrGrMeasurementData.Cells[1, rowNum] = 'Ячейка N')
  //and (advStrGrMeasurementData.Objects[1, rowNum] = nil)
  then
    begin
      modRes := 0;
      while (modRes <> mrYes) and (modRes <> mrCancel) do
        for m := 0 to lengthArrPowTrans - 1 do
          begin
            if lengthArrPowTrans = 1 then
              modRes := mrYes
            else if (Pos(vArrPowTrans[m].powTransDispName,
              advStrGrMeasurementData.Cells[5, rowNum]) = 0)
            and (advStrGrMeasurementData.Objects[1, rowNum] = nil) then
              begin
                strMsg := 'Ячейка ' + advStrGrMeasurementData.Cells[5, rowNum];
                if advStrGrMeasurementData.Cells[2, rowNum] <> '' then
                  strMsg := strMsg + ' номер ' +
                    advStrGrMeasurementData.Cells[2, rowNum];
                strMsg := strMsg + ' относится к трансформатору ' +
                  vArrPowTrans[m].powTransDispName + '?';
                modRes := Application.MessageBox(PChar(strMsg),
                  PChar('Соотнесение ячейки трансформатору:' +
                    'ДА, НЕТ - подтверждение или отрицание выбора; ' +
                    'ОТМЕНА - отказ от осуществления связи.'),
                  MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON2);
              end
            else modRes := mrCancel;
            if modRes = mrCancel then Break;
            if modRes = mrYes then
              begin
                advStrGrMeasurementData.Objects[1, rowNum] :=
                  TObject(vArrPowTrans[m].powTransCode);

                if Pos('Не РЗ', advStrGrMeasurementData.Cells[3, rowNum]) > 0
                then advStrGrMeasurementData.Cells[3, rowNum] := 'Не РЗ'
                else if Pos('РЗ', advStrGrMeasurementData.Cells[3, rowNum]) > 0
                then advStrGrMeasurementData.Cells[3, rowNum] := 'РЗ';

                advStrGrMeasurementData.Cells[3, rowNum] :=
                  advStrGrMeasurementData.Cells[3, rowNum] + ' ' +
                  vArrPowTrans[m].powTransDispName;
                Break;
              end;
          end;
    end;
end;

procedure TfrmGauge150.actOrderCellExecute(Sender: TObject);
var i: Integer;
begin
  lengthArrPowTrans := Length(vArrPowTrans);
  for i := vFirstCellRow to advStrGrMeasurementData.RowCount - 3 do
    if advStrGrMeasurementData.RowHeights[i] > 0 then
      OrderOneCell(i);
end;

procedure TfrmGauge150.actReportFiderGaugeExecute(Sender: TObject);
var AppPath, FileName: String; OldCursor: TCursor;
begin
  xlsExportMeasurement.AdvStringGrid := advStrGrMeasurementData;
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    AppPath := ExtractFilePath(Application.ExeName);
      if not DirectoryExists(AppPath + TempReportsPath) then
        CreateDir(AppPath + TempReportsPath);
      if nameS150 <> '' then FileName := GetFileName(
        StringReplace(nameS150, ' ', '_', [rfReplaceAll, rfIgnoreCase])) + '_';
      FileName := AppPath + TempReportsPath + 'ElectricLoadRegimDay_' +
        AutoChange(AutoChange(AutoChange(
		  FileName, '"', '_'), '/', '_'), '\', '_') + '.xls';
    xlsExportMeasurement.XLSExport(FileName);
    ShellExecute(0, PChar('open'), PChar('"' + FileName + '"'), nil, nil,
        SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmGauge150.actSaveExecute(Sender: TObject);
var i, j, k, subst150powerTransCode, vRPN, gaugeCode, vVoltageClassCode,
  cellCode: Integer;
  TempENGauge150: ENGauge150ControllerSoapPort;
  vUserGen, vVoltageClassDescription: string;
  vENGauge150Obj: ENGauge150;

  strTension, strCurrent: string;
  vTime: TDateTime;
  isNewObj: Boolean;

  procedure GenSwitchDevGaugeEdit(n, m, pGenSwitchDev: Integer);
  var localStrTension, localStrCurrent: string; localIsNewObj: Boolean;
    vLocalTime: TDateTime; localGaugeCode: Integer; //localTension: Real;
  begin
    localStrTension := advStrGrMeasurementData.Cells[n, m + 1];
    localStrCurrent := advStrGrMeasurementData.Cells[n, m + 2];
    localGaugeCode := 0;
    localIsNewObj := (advStrGrMeasurementData.Objects[n, m + 1] = nil);
    if localIsNewObj then
      begin
        if (localStrTension = '') and (localStrCurrent = '') then
          Exit;
        vENGauge150Obj := ENGauge150.Create
      end
    else
      begin
        localGaugeCode := Integer(
          advStrGrMeasurementData.Objects[n, m + 1]);
        if (localGaugeCode > 0)
        and (localStrTension = '') and (localStrCurrent = '') then
          begin
            TempENGauge150.remove(localGaugeCode);
            Exit;
          end;
        vENGauge150Obj := TempENGauge150.getObject(localGaugeCode);
      end;

    if pGenSwitchDev = 1 then
      vENGauge150Obj.name := 'Замер ВысокоВольтной стороны ' +
        advStrGrMeasurementData.Cells[2, m]
    else if pGenSwitchDev = 2 then
      vENGauge150Obj.name := 'Замер СреднеВольтной стороны ' +
        advStrGrMeasurementData.Cells[2, m - 2]
    else if pGenSwitchDev = 3 then
      vENGauge150Obj.name := 'Замер НизкоВольтной стороны ' +
        advStrGrMeasurementData.Cells[2, m - 4];

    //if vENGauge150Obj.substation150Ref = nil then
      vENGauge150Obj.substation150Ref := ENSubstation150Ref.Create;
    vENGauge150Obj.substation150Ref.code := codeS150;

    //if vENGauge150Obj.powerTransRef = nil then
      vENGauge150Obj.powerTransRef := ENSubst150PowerTransRef.Create;
    vENGauge150Obj.powerTransRef.code := subst150powerTransCode;

    if pGenSwitchDev > 1 then
      begin
        vLocalTime :=
          IncSecond(StrToDateTime(advStrGrMeasurementData.Cells[n, 1]));
        advStrGrMeasurementData.Cells[n, 1] := TimeToStr(vLocalTime);
      end;
    if vENGauge150Obj.dateGauge = nil then
      vENGauge150Obj.dateGauge := TXSDateTime.Create;
    vENGauge150Obj.dateGauge.XSToNative(GetXSDateTime(
      StrToDateTime(advStrGrMeasurementData.Cells[n, 0]) +
      StrToDateTime(advStrGrMeasurementData.Cells[n, 1])));

    vENGauge150Obj.isGenSwitchDev := pGenSwitchDev;

    {localTension := StrToFloat(localStrTension);
    if localTension <= 7.2 then
      vENGauge150Obj.voltageClassRef.code := ENVOLTAGECLASS_6
    else if localTension <= 24 then //Ячейки 6 - 10 кВ
      vENGauge150Obj.voltageClassRef.code := ENVOLTAGECLASS_10
    else if localTension <= 40.5 then //Ячейки 35 кВ
      vENGauge150Obj.voltageClassRef.code := ENVOLTAGECLASS_35
    else //if localTension <= ? then //Ячейки 150 кВ
      vENGauge150Obj.voltageClassRef.code := ENVOLTAGECLASS_150;}

    if (vENGauge150Obj.tension = nil) then
      vENGauge150Obj.tension := TXSDecimal.Create;
    if localStrTension <> '' then
      vENGauge150Obj.tension.decimalString := localStrTension
    else vENGauge150Obj.tension.decimalString := '0';

    if (vENGauge150Obj.current = nil) then
      vENGauge150Obj.current := TXSDecimal.Create;
    if localStrCurrent <> '' then
      vENGauge150Obj.current.decimalString := localStrCurrent
    else vENGauge150Obj.current.decimalString := '0';

    vENGauge150Obj.situationRPNRef := ENSituationRPNRef.Create;
    if (vRPN = 0) or (vRPN = 22) then
      vENGauge150Obj.situationRPNRef := nil
      //vENGauge150Obj.situationRPNRef.code := Low(Integer)
    else vENGauge150Obj.situationRPNRef.code := vRPN;

    //Код выполнившего замеры сотрудника
    if (vUserGen <> '') and (vENGauge150Obj.userGen = '') then
      vENGauge150Obj.userGen := vUserGen;

    if localIsNewObj then TempENGauge150.add(vENGauge150Obj)
    else if advStrGrMeasurementData.Cells[
      n, advStrGrMeasurementData.RowCount - 1] = strEditMarker
    then TempENGauge150.save(vENGauge150Obj);
  end;

begin
  vVoltageClassCode := 0;
  TempENGauge150 := HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;
  for j := 6 to advStrGrMeasurementData.ColCount - 1 do
    begin
      if advStrGrMeasurementData.Cells[
        j, advStrGrMeasurementData.RowCount - 2] <> ''
      then vUserGen :=
        advStrGrMeasurementData.Cells[j, advStrGrMeasurementData.RowCount - 2];

      for i := 2 to advStrGrMeasurementData.RowCount - 1 do
        begin
          if (Pos('РПН', advStrGrMeasurementData.Cells[5, i]) > 0)
          or (Pos('Заводской номер', advStrGrMeasurementData.Cells[3, i]) > 0)
          then
            begin
              if (advStrGrMeasurementData.Cells[j, i] = '1')
              or (advStrGrMeasurementData.Cells[j, i] = 'I') then vRPN := 1
              else if (advStrGrMeasurementData.Cells[j, i] = '2')
              or (advStrGrMeasurementData.Cells[j, i] = 'II') then vRPN := 2
              else if (advStrGrMeasurementData.Cells[j, i] = '3')
              or (advStrGrMeasurementData.Cells[j, i] = 'III') then vRPN := 3
              else if (advStrGrMeasurementData.Cells[j, i] = '4')
              or (advStrGrMeasurementData.Cells[j, i] = 'IV') then vRPN := 4
              else if (advStrGrMeasurementData.Cells[j, i] = '5')
              or (advStrGrMeasurementData.Cells[j, i] = 'V') then vRPN := 5
              else if (advStrGrMeasurementData.Cells[j, i] = '6')
              or (advStrGrMeasurementData.Cells[j, i] = 'VI') then vRPN := 6
              else if (advStrGrMeasurementData.Cells[j, i] = '7')
              or (advStrGrMeasurementData.Cells[j, i] = 'VII') then vRPN := 7
              else if (advStrGrMeasurementData.Cells[j, i] = '8')
              or (advStrGrMeasurementData.Cells[j, i] = 'VIII') then vRPN := 8
              else if (advStrGrMeasurementData.Cells[j, i] = '9')
              or (advStrGrMeasurementData.Cells[j, i] = 'IX') then vRPN := 9
              else if (advStrGrMeasurementData.Cells[j, i] = '10')
              or (advStrGrMeasurementData.Cells[j, i] = 'X') then vRPN := 10
              else if (advStrGrMeasurementData.Cells[j, i] = '11')
              or (advStrGrMeasurementData.Cells[j, i] = 'XI') then vRPN := 11
              else if (advStrGrMeasurementData.Cells[j, i] = '12')
              or (advStrGrMeasurementData.Cells[j, i] = 'XII') then vRPN := 12
              else if (advStrGrMeasurementData.Cells[j, i] = '13')
              or (advStrGrMeasurementData.Cells[j, i] = 'XIII') then vRPN := 13
              else if (advStrGrMeasurementData.Cells[j, i] = '14')
              or (advStrGrMeasurementData.Cells[j, i] = 'XIV') then vRPN := 14
              else if (advStrGrMeasurementData.Cells[j, i] = '15')
              or (advStrGrMeasurementData.Cells[j, i] = 'XV') then vRPN := 15
              else if (advStrGrMeasurementData.Cells[j, i] = '16')
              or (advStrGrMeasurementData.Cells[j, i] = 'XVI') then vRPN := 16
              else if (advStrGrMeasurementData.Cells[j, i] = '17')
              or (advStrGrMeasurementData.Cells[j, i] = 'XVII') then vRPN := 17
              else if (advStrGrMeasurementData.Cells[j, i] = '18')
              or (advStrGrMeasurementData.Cells[j, i] = 'XVIII') then
                vRPN := 18
              else if (advStrGrMeasurementData.Cells[j, i] = '19')
              or (advStrGrMeasurementData.Cells[j, i] = 'XIX') then vRPN := 19
              else if (advStrGrMeasurementData.Cells[j, i] = '20')
              or (advStrGrMeasurementData.Cells[j, i] = 'XX') then vRPN := 20
              else if (advStrGrMeasurementData.Cells[j, i] = '0')
              or (advStrGrMeasurementData.Cells[j, i] = 'Немає РН')
              then vRPN := 21
              else if (advStrGrMeasurementData.Cells[j, i] = '')
              or (advStrGrMeasurementData.Cells[j, i] = 'Не вказано')
              then vRPN := 22;

              subst150powerTransCode := //Код трансформатора
                Integer(advStrGrMeasurementData.Objects[2, i]);

              GenSwitchDevGaugeEdit(j, i, 1);
              GenSwitchDevGaugeEdit(j, i + 2, 2);
              GenSwitchDevGaugeEdit(j, i + 4, 3);

            end
          else if (Pos('I, Амперы', advStrGrMeasurementData.Cells[5, i]) > 0)
          or (Pos('ЯЧЕЕК СТАНЦИИ', advStrGrMeasurementData.Cells[3, i]) > 0)
          or (Pos('СИЛЫ ТОКА', advStrGrMeasurementData.Cells[2, i]) > 0) then
            begin
              vVoltageClassDescription := advStrGrMeasurementData.Cells[4, i];
              if vVoltageClassDescription = '6 кВ' then
                vVoltageClassCode := 4
              else if vVoltageClassDescription = '10 кВ' then
                vVoltageClassCode := 3
              else if vVoltageClassDescription = '35 кВ' then
                vVoltageClassCode := 2
              else if vVoltageClassDescription = '150 кВ' then
                vVoltageClassCode := 1;
              Continue;
            end
          else if (vVoltageClassCode > 0)
          and (Pos('РЗ', advStrGrMeasurementData.Cells[3, i]) <> 0)
          //and (Pos('Не РЗ', advStrGrMeasurementData.Cells[3, i]) = 0)
          then
            begin
              gaugeCode := 0; cellCode := 0;
              strCurrent := advStrGrMeasurementData.Cells[j, i];
              isNewObj := (advStrGrMeasurementData.Objects[j, i] = nil);

              if isNewObj then
                begin
                  if strCurrent = '' then
                    Continue;
                  vENGauge150Obj := ENGauge150.Create;
                end
              else
                begin
                  gaugeCode := Integer(advStrGrMeasurementData.Objects[j, i]);
                  if (strCurrent = '') and (gaugeCode > 0) then
                    begin
                      TempENGauge150.remove(gaugeCode);
                      Continue;
                    end;
                  vENGauge150Obj := TempENGauge150.getObject(gaugeCode);
                end;

              if (vENGauge150Obj.current = nil) then
                vENGauge150Obj.current := TXSDecimal.Create;
              if strCurrent <> '' then
                vENGauge150Obj.current.DecimalString := strCurrent
              else vENGauge150Obj.current.DecimalString := '0';
              strTension := '0';
              if advStrGrMeasurementData.Objects[1, i] <> nil then
                begin //Если ячейка связана с трансформатором
                  k := vFirstCellRow - 8;
                  while k >= 2 do
                    begin
                      if Integer(advStrGrMeasurementData.Objects[1, i]) =
                        Integer(advStrGrMeasurementData.Objects[2, k])
                      then
                        begin
                          if Pos(advStrGrMeasurementData.Cells[0, i],
                            advStrGrMeasurementData.Cells[5, k + 1]) > 0
                          then strTension :=
                            advStrGrMeasurementData.Cells[j, k + 1]
                          else if Pos(advStrGrMeasurementData.Cells[0, i],
                            advStrGrMeasurementData.Cells[5, k + 3]) > 0
                          then strTension :=
                            advStrGrMeasurementData.Cells[j, k + 3]
                          else if Pos(advStrGrMeasurementData.Cells[0, i],
                            advStrGrMeasurementData.Cells[5, k + 5]) > 0
                          then strTension :=
                            advStrGrMeasurementData.Cells[j, k + 5];
                          Break;
                        end;
                      k := k - 7;
                    end;
                end;

              if (vENGauge150Obj.tension = nil) then
                vENGauge150Obj.tension := TXSDecimal.Create;
              if strTension <> '' then
                vENGauge150Obj.tension.DecimalString := strTension
              else vENGauge150Obj.tension.DecimalString := '0';
              if vENGauge150Obj.voltageClassRef = nil then
                vENGauge150Obj.voltageClassRef := ENVoltageClassRef.Create;
              vENGauge150Obj.voltageClassRef.code := vVoltageClassCode;

              cellCode := Integer(advStrGrMeasurementData.Objects[5, i]);
              if cellCode > 0 then
                begin
                  if vENGauge150Obj.cellRef = nil then
                    vENGauge150Obj.cellRef := ENSubst150CellRef.Create;
                  vENGauge150Obj.cellRef.code := cellCode;
                end;

              vENGauge150Obj.name := 'Замер тока ' +
                advStrGrMeasurementData.Cells[0, i] + ' ячейки ' +
                advStrGrMeasurementData.Cells[2, i] + ' ' +
                advStrGrMeasurementData.Cells[5, i];

              //if vENGauge150Obj.substation150Ref = nil then
                vENGauge150Obj.substation150Ref := ENSubstation150Ref.Create;
              vENGauge150Obj.substation150Ref.code := codeS150;

              if advStrGrMeasurementData.Objects[1, i] <> nil then
                begin
                  //if vENGauge150Obj.powerTransRef = nil then
                    vENGauge150Obj.powerTransRef :=
                      ENSubst150PowerTransRef.Create;
                  vENGauge150Obj.powerTransRef.code :=
                    Integer(advStrGrMeasurementData.Objects[1, i]);
                end;

              vTime :=
                IncSecond(StrToDateTime(advStrGrMeasurementData.Cells[j, 1]));
              advStrGrMeasurementData.Cells[j, 1] := TimeToStr(vTime);
              if vENGauge150Obj.dateGauge = nil then
                vENGauge150Obj.dateGauge := TXSDateTime.Create;
              vENGauge150Obj.dateGauge.XSToNative(GetXSDateTime(
                StrToDateTime(advStrGrMeasurementData.Cells[j, 0]) +
                StrToDateTime(advStrGrMeasurementData.Cells[j, 1])));

              if (vUserGen <> '') and (vENGauge150Obj.userGen = '') then
                vENGauge150Obj.userGen := vUserGen; //Выполнивший замеры

              if (strCurrent = '') and (strTension = '')
              and (vENGauge150Obj <> nil) and (gaugeCode > 0) and (not isNewObj)
              then TempENGauge150.remove(gaugeCode)
              else
                begin
                  if isNewObj then TempENGauge150.add(vENGauge150Obj)
                  else if advStrGrMeasurementData.Cells[j,
                    advStrGrMeasurementData.RowCount - 1] = strEditMarker
                  then TempENGauge150.save(vENGauge150Obj);
                end;
            end;
        end;
    end;
  actUpdate.Execute;
  //actFilter.Execute;
end;

//Запрет ввода нечисловых значений
procedure TfrmGauge150.advStrGrMeasurementDataKeyPress(Sender: TObject;
  var Key: Char);
var vrLength, vrPos: Integer; str: String;
begin
  //Меняем запятую на точку
  if Key = ',' then Key := '.';
  str := advStrGrMeasurementData.Cells[
    advStrGrMeasurementData.Col, advStrGrMeasurementData.Row];
  vrLength := Length(str); //определяем длину текста
  vrPos := Pos('.', str);  //проверяем наличие "."
  case Key of
    '0'..'9', #8: ; //разрешены только цифры, "BackSpace"
    '.':            //и "."
      begin
        //если точка уже есть или точку пытаются поставить перед
        //числом или никаких цифр в поле ввода еще нет
        if (vrPos > 0) or (vrLength = 0) then
          Key := #0; //"погасить" клавишу
      end;
    else
      Key := #0;     //остальные кнопки запрещены
  end;
end;

procedure TfrmGauge150.advStrGrMeasurementDataKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState); //Изменение текущей строки таблицы
begin //замеров, отфильтрованных по указанному в примечании ячейки признаку РЗ
  if (advStrGrMeasurementData.RowHeights[vNewRow] > 0) then Exit;
  while (advStrGrMeasurementData.RowHeights[vNewRow] = 0) do
    if (vOldRow < vNewRow)
    then //Цикл для двойных строк НАПРЯЖЕНИЕ - СИЛА
      vNewRow := vNewRow + 1  //ТОКА сторон главного коммутационного аппарата
    else if (vOldRow > vNewRow)
    then vNewRow := vNewRow - 1;

  while vNewRow >= advStrGrMeasurementData.RowCount - 1 do
    vNewRow := vNewRow - 1;

  try
    advStrGrMeasurementData.Row := vNewRow;
  except
  end;
end;

procedure TfrmGauge150.advStrGrMeasurementDataRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  vOldRow := 0;
  vNewRow := 0;

  if (advStrGrMeasurementData.RowHeights[NewRow] > 0) or (OldRow = NewRow)
  then Exit;

  vOldRow := OldRow;
  vNewRow := NewRow;
end;

procedure TfrmGauge150.chkOnlyGaugeClick(Sender: TObject);
begin
  if chkOnlyGauge.Checked then actFilter.Execute
  else actNoFilter.Execute;
end;

procedure TfrmGauge150.chkShowOtherVoltageClassLinkedTransformerClick(
  Sender: TObject);
begin
  actUpdate.Execute;
end;

procedure TfrmGauge150.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(DMReportsENetObject) then
    begin
      DMReportsENetObject.Free;
      DMReportsENetObject := nil;
    end;
  {if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    actSaveExecute(Sender);}
end;

procedure TfrmGauge150.actEditExecute(Sender: TObject);
var j: Integer; strDate, strTime: String;
begin
  if pcFiderGauge.ActivePage = tsMeasurementData then
    begin
      if (advStrGrMeasurementData.Row >= vFirstCellRow) and (vFirstCellRow > 0)
      then
        begin
          lengthArrPowTrans := Length(vArrPowTrans);
          OrderOneCell(advStrGrMeasurementData.Row);
        end;

      strDate := DateToStr(dtpDateGuage.Date);
      strTime := TimeToStr(dtpTimeGuage.Time);
      for j := 6 to advStrGrMeasurementData.ColCount - 1 do
        if (Copy(advStrGrMeasurementData.Cells[j, 1], 1, 5) = Copy(
          strTime, 1, 5)) and (advStrGrMeasurementData.Cells[j, 0] = strDate)
        then
          begin
            Application.MessageBox(PChar('Пропонуєма хронологія вже існує.'),
              PChar('Підказка:'), MB_ICONINFORMATION);
            Exit;
          end;
      advStrGrMeasurementData.Cells[advStrGrMeasurementData.Col, 0] :=
        strDate;
      advStrGrMeasurementData.Cells[advStrGrMeasurementData.Col, 1] :=
        strTime;
      advStrGrMeasurementData.Cells[advStrGrMeasurementData.Col,
        advStrGrMeasurementData.RowCount - 1] := strEditMarker;
    end;
end;

procedure TfrmGauge150.TransformerGaugePowerScriptAndGridEdit;
var vZSPSubst150TransformerGaugePowerUpd: TZSQLProcessor;
  i, j, vSubst150TransformerGaugePowerGenUpdRecCnt: Integer;
  strSubst150TrGaugePowerUpd, strSubst150TrGaugePowerUpdPart: String;
begin //Формирование скрипта изменения нагрузки станции в режимный день
  vQRYSubst150TransformerGaugePowerGenUpd.Close;
  vQRYSubst150TransformerGaugePowerGenUpd.Open;

  vZSPSubst150TransformerGaugePowerUpd :=
    DMReportsENetObject.zspSubst150TransformerGaugePowerUpd;

  vSubst150TransformerGaugePowerGenUpdRecCnt :=
    vQRYSubst150TransformerGaugePowerGenUpd.RecordCount;
  if vSubst150TransformerGaugePowerGenUpdRecCnt > 0 then
    begin
      strSubst150TrGaugePowerUpd := '';
      strSubst150TrGaugePowerUpdPart := '';
      vZSPSubst150TransformerGaugePowerUpd.Script.Clear;
      vQRYSubst150TransformerGaugePowerGenUpd.First;

      frmGauge150.sgElectricLoadRegimDay.RowCount :=
        vSubst150TransformerGaugePowerGenUpdRecCnt + 2;

      frmGauge150.sgElectricLoadRegimDay.ColWidths[0] := 0;

      //Очистка таблицы
      for i := 1 to frmGauge150.sgElectricLoadRegimDay.RowCount - 1 do
        for j := 0 to frmGauge150.sgElectricLoadRegimDay.ColCount - 1 do
          frmGauge150.sgElectricLoadRegimDay.Cells[j, i] := '';

      for i := 1 to vSubst150TransformerGaugePowerGenUpdRecCnt do
        begin
          if strSubst150TrGaugePowerUpd <> '' then
            strSubst150TrGaugePowerUpd :=
              strSubst150TrGaugePowerUpd + #13#10;
          strSubst150TrGaugePowerUpdPart :=
            vQRYSubst150TransformerGaugePowerGenUpd.FieldByName(
              'ad4subst150upd').AsString;
          strSubst150TrGaugePowerUpd := strSubst150TrGaugePowerUpd +
            strSubst150TrGaugePowerUpdPart;

          //Скрипт изменения нагрузки станции
          frmGauge150.sgElectricLoadRegimDay.Cells[0, i] :=
            strSubst150TrGaugePowerUpdPart;
          //Код понижающей трансформаторной станции
          frmGauge150.sgElectricLoadRegimDay.Cells[1, i] :=
            vQRYSubst150TransformerGaugePowerGenUpd.FieldByName(
              'substation150refcode').AsString;
          //Номинальное напряжение, кВ
          frmGauge150.sgElectricLoadRegimDay.Cells[2, i] :=
            vQRYSubst150TransformerGaugePowerGenUpd.FieldByName(
              'voltage').AsString;
          //Район ЭнергоСнабжения
          frmGauge150.sgElectricLoadRegimDay.Cells[3, i] :=
            vQRYSubst150TransformerGaugePowerGenUpd.FieldByName(
              'renname').AsString;
          //Понижающая станция 150 - 110 / 35 - 27 / 10 - 6 кВ
          frmGauge150.sgElectricLoadRegimDay.Cells[4, i] :=
            vQRYSubst150TransformerGaugePowerGenUpd.FieldByName(
              'substation150name').AsString;
          //Сохранённая нагрузка (кВт) в режимный день
          frmGauge150.sgElectricLoadRegimDay.Cells[5, i] :=
            vQRYSubst150TransformerGaugePowerGenUpd.FieldByName(
              'gauge_s04_power_previous').AsString;
          //Расчётная нагрузка (кВт) в режимный день
          frmGauge150.sgElectricLoadRegimDay.Cells[6, i] :=
            vQRYSubst150TransformerGaugePowerGenUpd.FieldByName(
              'gauge_s04_power').AsString;

          vQRYSubst150TransformerGaugePowerGenUpd.Next;
        end;

      vZSPSubst150TransformerGaugePowerUpd.Script.Text :=
        strSubst150TrGaugePowerUpd;

      frmGauge150.sgElectricLoadRegimDay.FixedCols := 1;
    end;
end;

procedure TfrmGauge150.actElectricLoadRegimDayCalculateExecute(Sender: TObject);
begin
  frmReportPowerReserve := TfrmReportPowerReserve.Create(Application, dsEdit);
  frmReportPowerReserve.cbPeriod1.Checked := True;
  frmReportPowerReserve.cbPeriod2.Checked := True;
  try
    with frmReportPowerReserve do
      begin
        cbPeriod1.Visible := False;
        gbDatesRange2.Visible := False;
        dtpDateFrom.ShowCheckbox := True;
        dtpDateTo.ShowCheckbox := True;
        dtpDateFrom.DateTime := StrToDate('15.06.2016');
        dtpDateTo.DateTime := StrToDate('31.12.2016');
        dtpDateFrom.Checked := False;
        dtpDateTo.Checked := False;
        lblEPRenName.Visible := False;
        edtEPRenName.Visible := False;
        spbEPRen.Visible := False;
        lblMessage.Visible := False;
        gbReportFileType.Visible := False;
        chkTechTerms.Visible := False;
        chkWithoutBillng.Visible := False;
        grpReserv.Visible := True;
        if ShowModal = mrOk then
          begin
            //Загрузка модуля невизуальных компонентов объектов энергетики EnergyNet
            if not Assigned(DMReportsENetObject) then
              Application.CreateForm(TDMReportsENetObject, DMReportsENetObject);

            //Загрузка модуля невизуальных компонентов внешней отчётности
            if not Assigned(DMReportsEWF) then
              Application.CreateForm(TDMReportsEWF, DMReportsEWF);

            try
              if not DMReportsENetObject.sesEN.Connected then
                DMReportsENetObject.sesEN.Connected := True;

              if (not DMReportsEWF.sesReportEWF.Connected)
              and (Application.Tag = ENConsts.CONFIG_ENERGYNET_CLIENT_VERSION)
              then DMReportsEWF.sesReportEWF.Connected := True;

              //Формирование скрипта обновления нагрузок Станций в режимный день
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_Subst150TransformerGaugePowerGenUpd,
                DMReportsENetObject.zqrySubst150TransformerGaugePowerGenUpd,
                nil, //Источник данных
                'zqrySubst150TransformerGaugePowerGenUpd.sql', //Запрос *.sql
                'queryNETOBJ', //Резервная директория хранения запроса
                '', //Файла FastReport-отчёта *.fr3
                0, //Код cn.ewfreports отчёта *.fr3 ноль во избежание загрузки
                False, //Запрос из cn.ewfreport_query_text
                0); //Потребности в TfrxDBDataSet НЕТ. Вид запроса - ВЫБОРКА

              frmGauge150.pcFiderGauge.ActivePage :=
                frmGauge150.tsElectricLoadRegimDay;

              vQRYSubst150TransformerGaugePowerGenUpd :=
                DMReportsENetObject.zqrySubst150TransformerGaugePowerGenUpd;
              vQRYSubst150TransformerGaugePowerGenUpd.Close;

              if frmGauge150.codeS150 > 0 then
                vQRYSubst150TransformerGaugePowerGenUpd.ParamByName(
                  'substation150refcode').AsInteger := frmGauge150.codeS150
              else vQRYSubst150TransformerGaugePowerGenUpd.ParamByName(
                'substation150refcode').Clear;
              if dtpDateFrom.Checked then
                vQRYSubst150TransformerGaugePowerGenUpd.ParamByName(
                  'gauge_date_start').AsDateTime := dtpDateFrom.DateTime
              else vQRYSubst150TransformerGaugePowerGenUpd.ParamByName(
                  'gauge_date_start').Clear;
              if dtpDateTo.Checked then
                vQRYSubst150TransformerGaugePowerGenUpd.ParamByName(
                  'gauge_date').AsDateTime := dtpDateTo.DateTime
              else vQRYSubst150TransformerGaugePowerGenUpd.ParamByName(
                  'gauge_date').Clear;
              if rbReservOnlyNew.Checked then
                vQRYSubst150TransformerGaugePowerGenUpd.ParamByName(
                  'new').AsInteger := 1
              else if rbReservAll.Checked then
                vQRYSubst150TransformerGaugePowerGenUpd.ParamByName(
                  'new').AsInteger := 2
              else //if rbReservOnlyExist.Checked then
                vQRYSubst150TransformerGaugePowerGenUpd.ParamByName(
                  'new').Clear;

              TransformerGaugePowerScriptAndGridEdit; //Формирование скрипта

            finally //Высвобождать из оперативной памяти модуль невизуальных
              //DMReportsENetObject.Free; //компонентов до завершения работы
              //DMReportsENetObject := nil; //с ними нельзя
              DMReportsEWF.Free;    //компонентов внешней отчётности
              DMReportsEWF := nil;  //проекта EnergyWorkFlow
            end;
          end;
      end;
  finally
    frmReportPowerReserve.Free;
    frmReportPowerReserve := nil;
  end;

  pcFiderGaugeChange(nil);
end;

procedure TfrmGauge150.actElectricLoadRegimDayChangeExecute(Sender: TObject);
begin
  if (frmGauge150.btnElectricLoadRegimDayChange.ModalResult = mrNone)
  and (frmGauge150.pcFiderGauge.ActivePage = frmGauge150.tsElectricLoadRegimDay)
  then
    if Application.MessageBox(PChar('Вы действительно хотите изменить ' +
    'значение электрической нагрузки в режимный день на расчётное?'),
      PChar('Увага!'), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES
    then
      begin
        DMReportsENetObject.zspSubst150TransformerGaugePowerUpd.Execute;
        TransformerGaugePowerScriptAndGridEdit; //Формирование скрипта
      end;
end;

procedure TfrmGauge150.actElectricLoadRegimDayExportExecute(Sender: TObject);
var AppPath, FileName: String; OldCursor: TCursor;
begin
  xlsExportMeasurement.AdvStringGrid := sgElectricLoadRegimDay;
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    AppPath := ExtractFilePath(Application.ExeName);
      if not DirectoryExists(AppPath + TempReportsPath) then
        CreateDir(AppPath + TempReportsPath);
      if nameS150 <> '' then FileName := GetFileName(
        StringReplace(nameS150, ' ', '_', [rfReplaceAll, rfIgnoreCase])) + '_';
      FileName := AppPath + TempReportsPath + 'ElectricLoadRegimDay_' +
        FileName + '.xls';
    xlsExportMeasurement.XLSExport(FileName);
    ShellExecute(0, PChar('open'), PChar('"' + FileName + '"'), nil, nil,
      SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmGauge150.actFilterExecute(Sender: TObject);
var i: Integer;
begin
  for i := 2 to advStrGrMeasurementData.RowCount - 1 do
    if ((advStrGrMeasurementData.Cells[0, i] = 'ВН')
      or (advStrGrMeasurementData.Cells[0, i] = 'СН')
      or (advStrGrMeasurementData.Cells[0, i] = 'НН'))
    and (advStrGrMeasurementData.Cells[2, i] = '')
    and (advStrGrMeasurementData.Cells[3, i] = '')
    and (advStrGrMeasurementData.Cells[4, i] = '')
    then
      begin
        advStrGrMeasurementData.RowHeights[i] := 0;
        advStrGrMeasurementData.RowHeights[i + 1] := 0;
      end
    else if (advStrGrMeasurementData.Cells[3, i] = 'Не РЗ')
    //or (advStrGrMeasurementData.Colors[6, i] = clLtGray)
    or (advStrGrMeasurementData.Colors[6, i] = RGB(0, 0, 0)) then
      advStrGrMeasurementData.RowHeights[i] := 0;
  chkOnlyGauge.Checked := True;
end;

procedure TfrmGauge150.actAdditionalColumnsVisibleExecute(Sender: TObject);
begin
  if pcFiderGauge.ActivePage <> tsMeasurementData then
    Exit;
  actAdditionalColumnsVisible.Checked :=
    not actAdditionalColumnsVisible.Checked;
  if actAdditionalColumnsVisible.Checked then
    begin
      advStrGrMeasurementData.ColWidths[0] := 50;
      advStrGrMeasurementData.ColWidths[1] := 80;
      advStrGrMeasurementData.ColWidths[2] := 80;
      advStrGrMeasurementData.ColWidths[3] := 110;
      advStrGrMeasurementData.ColWidths[4] := 80;
    end
  else
    begin
      advStrGrMeasurementData.ColWidths[0] := 0;
      advStrGrMeasurementData.ColWidths[1] := 0;
      advStrGrMeasurementData.ColWidths[2] := 0;
      advStrGrMeasurementData.ColWidths[3] := 0;
      advStrGrMeasurementData.ColWidths[4] := 0;
    end;
end;

procedure TfrmGauge150.actDeleteExecute(Sender: TObject);
var i, gauge150Code: Integer; TempENGauge150: ENGauge150ControllerSoapPort;
  marker: String;
  filterGauge150: ENGauge150Filter;
  gauge150CodeArr: ENGauge150Controller.ArrayOfInteger;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити заміри?'),
    PChar('Увага!'), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES
  then
    Exit;
  TempENGauge150 := HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;
  for i := 2 to advStrGrMeasurementData.RowCount - 4 do
    begin
      if advStrGrMeasurementData.Objects[advStrGrMeasurementData.Col, i] <> nil
      then gauge150Code := Integer(
        advStrGrMeasurementData.Objects[advStrGrMeasurementData.Col, i]);

      marker := advStrGrMeasurementData.Cells[0, i];
      if (marker = 'ВН') or (marker = 'СН') or (marker = 'НН')
      or (marker = 'сторона') then
        begin
          filterGauge150 := ENGauge150Filter.Create;
          SetNullIntProps(filterGauge150); SetNullXSProps(filterGauge150);
          filterGauge150.code := gauge150Code;
          gauge150CodeArr :=
            TempENGauge150.getScrollableFilteredCodeArray(filterGauge150, 0, -1);
          if Length(gauge150CodeArr) = 0 then //Обнуление кода во избежание
            gauge150Code := 0 //попытки удаления отсутствующего замера
        end;

      if gauge150Code > 0 then
        TempENGauge150.remove(gauge150Code);

      advStrGrMeasurementData.Objects[advStrGrMeasurementData.Col, i] := nil;
      advStrGrMeasurementData.Cells[
        advStrGrMeasurementData.Col, i] := '';
    end;
  if advStrGrMeasurementData.ColCount >= 8 then
    advStrGrMeasurementData.RemoveCols(advStrGrMeasurementData.Col, 1)
  else if advStrGrMeasurementData.ColCount = 7 then
    begin
      advStrGrMeasurementData.Cells[advStrGrMeasurementData.Col, 0] := '';
      advStrGrMeasurementData.Cells[advStrGrMeasurementData.Col, 1] := '';
    end;
end;

procedure TfrmGauge150.pcFiderGaugeChange(Sender: TObject);
var TempUser: UserControllerSoapPort;
  UserFilterObj: UserFilter;
  UserList: UserShortList;
  userGroupList: GroupController.GroupShortList;
  AppVersion : String;
  FVI: TFileVersionInfo;
  i, LastCount, ugLastCount: Integer;
  vGroupFilter: GroupFilter;
  vElectricLoadRegimDayChangeVisible, vActDeleteEnabled,
  isActivePgMeasurData: Boolean;
begin
  vElectricLoadRegimDayChangeVisible := False;
  vActDeleteEnabled := False;
  frmGauge150.actElectricLoadRegimDayExport.Visible := (
    pcFiderGauge.ActivePage = tsElectricLoadRegimDay);
  frmGauge150.rgSTO.Visible :=
    not frmGauge150.actElectricLoadRegimDayExport.Visible;

  isActivePgMeasurData := (pcFiderGauge.ActivePage = tsMeasurementData);
  chkShowOtherVoltageClassLinkedTransformer.Visible := isActivePgMeasurData;
  if isActivePgMeasurData then actUpdateExecute(Sender);

  if (pcFiderGauge.ActivePage = tsElectricLoadRegimDay)
  or (pcFiderGauge.ActivePage = tsMeasurementData)
  then
    begin
      xlsExportMeasurement.AdvStringGrid := sgElectricLoadRegimDay;

      AppVersion := '';
      try
        FVI := FileVersionInfo(Application.ExeName);
        AppVersion := FVI.FileVersion;
      except
      end;
      TempUser := HTTPRIOUser as UserControllerSoapPort;
      UserFilterObj := UserFilter.Create;
      SetNullIntProps(UserFilterObj);
      SetNullXSProps(UserFilterObj);
      UserFilterObj.name := HTTPRIOENGauge150.HTTPWebNode.UserName;
      UserList := TempUser.getScrollableFilteredList(UserFilterObj, 0, -1,
        False, AppVersion, CONFIG_ENERGYNET_CLIENT_VERSION);
      LastCount := High(UserList.list);
      if LastCount > -1 then
        begin
          userGroupList := TempUser.getUser2GroupList(UserList.list[0].code);
          ugLastCount := userGroupList.totalCount;
          if ugLastCount > -1 then
            begin
              for i := 0 to ugLastCount - 1 do
                if userGroupList.list[i].code =
                  ELECTRIC_LOAD_REGIM_DAY_EDITORS_GROUP
                then
                  begin
                    vElectricLoadRegimDayChangeVisible := (
                      userGroupList.list[i].userIncludes = 1);
                    if pcFiderGauge.ActivePage = tsElectricLoadRegimDay then
                      Break;
                  end
                else if userGroupList.list[i].code =
                  ELECTRIC_LOAD_REGIM_DAY_DELETERS_GROUP
                then
                  begin
                    vActDeleteEnabled := (
                      userGroupList.list[i].userIncludes = 1);
                    if isActivePgMeasurData then Break;
                  end;
            end;
        end; //if LastCount > -1 then
    end //if pcFiderGauge.ActivePage = tsElectricLoadRegimDay then
  else
    xlsExportMeasurement.AdvStringGrid := advStrGrMeasurementData;

  frmGauge150.actElectricLoadRegimDayChange.Visible :=
    vElectricLoadRegimDayChangeVisible;

  DisableActions([actDelete], //Кнопка Удаления ранее введённых замеров
    not (actDelete.Enabled or vActDeleteEnabled));
end;

procedure TfrmGauge150.rgSTOClick(Sender: TObject);
begin
  actUpdate.Execute;
end;

end.

