unit FiderGauge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, InvokeRegistry, Rio, SOAPHTTPClient, Grids, BaseGrid,
  AdvGrid, ToolWin, ExtCtrls, ActnList, ImgList, ChildFormUnit, DialogFormUnit,
  StdCtrls, XSBuiltIns, tmsAdvGridExcel, AdvObj, ShellAPI, ComObj;

type
  TfrmFiderGauge = class(TDialogForm)
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
    dtpDateGuage: TDateTimePicker;
    dtpTimeGuage: TDateTimePicker;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    advStrGrMeasurementData: TAdvStringGrid;
    HTTPRIOENTransformer: THTTPRIO;
    HTTPRIOENPanel: THTTPRIO;
    HTTPRIOENBranch: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENFiderGuage: THTTPRIO;
    actSave: TAction;
    ToolButton4: TToolButton;
    actReportFiderGauge: TAction;
    ToolButton5: TToolButton;
    xlsExportMeasurement: TAdvGridExcelIO;
    tbWorkerChange: TToolButton;
    actWorkerChange: TAction;
    HTTPRIOENTransformerChange: THTTPRIO;
    chkIncludeDismantledTransformer: TCheckBox;
    chkDisconnectedLowVoltageFeeder: TCheckBox;

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
    procedure actSaveExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actReportFiderGaugeExecute(Sender: TObject);
    procedure actWorkerChangeExecute(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure chkIncludeDismantledTransformerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codeS04, //��������� ��� ���������������� ���������� 10 - 6 / 0,4 ��
    elementCodeS04, //��������� ��� �������� ���������� 10 - 6 / 0,4 ��
    codeTransformer: Integer; //PRIC-628. ��������� ��� ��������������
    nameS04: String; //������������� �������� ���������� 10 - 6 / 0,4 ��
  end;

var
  frmFiderGauge: TfrmFiderGauge;

  vFiderGaugeDate: TDateTime; //PRIC-628. ���� ��������� � ������� ������
  vCurrentPhaseYellow, //��� ����� ���� A ��������� � ������� ������, ������
  vCurrentPhaseGreen, //��� ������ ���� B ��������� � ������� ������, ������
  vCurrentPhaseRed, //��� ������� ���� C ��������� � ������� ������, ������
  vTensionPhaseYellow, //���������� ���������� ����� ���� A, ������
  vTensionPhaseGreen, //���������� ���������� ������ ���� B, ������
  vTensionPhaseRed: Real; //���������� ���������� ������� ���� C, ������

implementation

uses
  ENTransformerController, ENBranchController, ENPanelController,
  ENFiderGuageController, ENSubstation04Controller, DMReportsUnit,
  EnergyproController, Globals, ENConsts, ShowEPWorker,
  ENAntsapfPositionController, ENTransformerChangeController;

{$R *.dfm}

const
  workerCaption: String = 'ϲ�, ����� �����, ��� ������ �����';

var trFilterObject: ENTransformerFilter; //��������������
  trLastCount: Integer;
  brFilterObject: ENBranchFilter; //������������� � ��������� �� ������
  brLastCount: Integer;
  fgFilterObject: ENFiderGuageFilter; //������ ���������� ��������
  fgLastCount: Integer;
  w: Integer; //������ �����������
  lastDateTime: TDateTime; //���� � ����� ���������� ������

procedure TfrmFiderGauge.actUpdateExecute(Sender: TObject);
var TempENTransformer: ENTransformerControllerSoapPort;
  ENTransformerList: ENTransformerShortList;
  TempENBranch: ENBranchControllerSoapPort;
  ENBranchList: ENBranchShortList;
  i, m, k, j, n: Integer;
  TempENFiderGuage: ENFiderGuageControllerSoapPort;
  ENFiderGuageList: ENFiderGuageShortList;
  //SUPP-27789. ����� �������� � ��������� ��������������
  TempENTransformerChange: ENTransformerChangeControllerSoapPort;
  ENTransformerChangeList: ENTransformerChangeShortList;
  ENTransformerChangeFilterObj: ENTransformerChangeFilter;
begin
  if pcFiderGauge.ActivePage = tsMeasurementData then
    begin
      advStrGrMeasurementData.Clear;
      lastDateTime := 0; //��������� ���� � ������� ���������� ������
      n := 0; //SUPP-27789. ������������� ������ �������������� � ������
      dtpDateGuage.Enabled := True;
      dtpDateGuage.Date := SysUtils.Date;
      dtpTimeGuage.Enabled := True;
      dtpTimeGuage.Time := SysUtils.Time;
      //��������������
      TempENTransformer :=
        HTTPRIOENTransformer as ENTransformerControllerSoapPort;
      TempENBranch :=  HTTPRIOENBranch as ENBranchControllerSoapPort;
      if trFilterObject = nil then
        begin
          trFilterObject := ENTransformerFilter.Create;
          SetNullIntProps(trFilterObject);
          SetNullXSProps(trFilterObject);
        end;
      trFilterObject.conditionSQL :=
        ' (entransformer.substation04refcode = ' + IntToStr(codes04) + ')';

      if chkIncludeDismantledTransformer.Checked then //SUPP-58106
        trFilterObject.conditionSQL := trFilterObject.conditionSQL +
          ' or (entransformer.code in (select trch.transformerrefcode ' +
          '   from net.entransformerchange trch ' + //���������������
          '   where trch.uninstalldate is not null' + //��������������
          '   and trch.substation04refcode = ' + IntToStr(codes04) + '))';

      trFilterObject.orderBySQL := ' ENTRANSFORMER.NAME';
      ENTransformerList := TempENTransformer.getScrollableFilteredList(
        ENTransformerFilter(trFilterObject), 0, -1);
      trLastCount := High(ENTransformerList.list);
      if trLastCount > - 1 then
        advStrGrMeasurementData.RowCount := (trLastCount + 1) * 7 + 3
      else
        Exit;
      advStrGrMeasurementData.ColWidths[0] := 0;
      k := 1;
      for i := 0 to trLastCount do
        begin
          k := k + 1;
          if ENTransformerList.list[i].code <> low(Integer) then
            begin
              advStrGrMeasurementData.Objects[0, k] :=
                TObject(ENTransformerList.list[i].code);
              advStrGrMeasurementData.Objects[0, k + 1] :=
                TObject(ENTransformerList.list[i].code);
              advStrGrMeasurementData.Objects[0, k + 2] :=
                TObject(ENTransformerList.list[i].code);
            end;

          if ENTransformerList.list[i].substation04RefCode = codes04 then
            begin
              n := n + 1; //SUPP-27789. ���������� ����������� � ��������������
              advStrGrMeasurementData.Cells[1, k] :=
                '������� �� ' + IntToStr(n) + ' �.�., 0,4��, �';
            end
          else //if ENTransformerList.list[i].substation04RefCode
               //<> codes04 then
            begin //SUPP-27789. ����� ���������������� ��������������
              advStrGrMeasurementData.Cells[1, k] :=
                '������� �� ����������� �.�., 0,4��, �';
              //SUPP-27789. �������� � ��������� ��������������
              TempENTransformerChange := HTTPRIOENTransformerChange
                as ENTransformerChangeControllerSoapPort;

              ENTransformerChangeFilterObj := ENTransformerChangeFilter.Create;
              SetNullIntProps(ENTransformerChangeFilterObj);
              SetNullXSProps(ENTransformerChangeFilterObj);

              //ENTransformerChangeFilterObj.conditionSQL :=
              //  ' entransformerchange.transformerrefcode = ' +
              //  IntToStr(ENTransformerList.list[i].code) +
              //  ' and entransformerchange.uninstalldate is not Null';

              ENTransformerChangeFilterObj.transformerRef :=
                ENTransformerRef.Create;
              ENTransformerChangeFilterObj.transformerRef.code :=
                ENTransformerList.list[i].code;

              ENTransformerChangeFilterObj.orderBySQL :=
                ' entransformerchange.code desc';

              ENTransformerChangeList :=
                TempENTransformerChange.getScrollableFilteredList(
                  ENTransformerChangeFilterObj, 0, -1);

              if ENTransformerChangeList.totalCount > 0 then
                begin
                  advStrGrMeasurementData.Cells[1, k + 1] :=
                    '����������� ' + XSDate2String(
                      ENTransformerChangeList.list[0].uninstallDate);
                  advStrGrMeasurementData.Cells[1, k + 2] :=
                    ENTransformerChangeList.list[0].workerEquipChange;
                end; //if ENTransformerChangeList.totalCount > 0 then

            end; //else //if ENTransformerList.list[i].substation04RefCode
                        //<> codes04 then

          advStrGrMeasurementData.Cells[2, k] := 'A';
          advStrGrMeasurementData.RowColor[k] := clAqua;
          k := k + 1;
          advStrGrMeasurementData.Cells[2, k] := 'B';
          advStrGrMeasurementData.RowColor[k] := clAqua;
          k := k + 1;
          advStrGrMeasurementData.Cells[2, k] := 'C';
          advStrGrMeasurementData.RowColor[k] := clAqua;

          k := k + 1;

          if ENTransformerList.list[i].substation04RefCode = codes04 then
            advStrGrMeasurementData.Cells[1, k] :=
              '��������� ��� ' + IntToStr(n) + ' �: '
              //+ ENTransformerList.list[i].antsapfRefName
          else
            begin
              advStrGrMeasurementData.Cells[1, k] :=
                '��� ������������� ��������������: ';
              if ENTransformerChangeList <> nil then
                if ENTransformerChangeList.totalCount > 0 then
                  begin
                    advStrGrMeasurementData.Cells[1, k + 1] := '����� � ' +
                      ENTransformerChangeList.list[0].workOrderNumber +
                        ' �� ' + XSDate2String(
                          ENTransformerChangeList.list[0].dateworkorder);
                    advStrGrMeasurementData.Cells[1, k + 2] := '��� � ' +
                      ENTransformerChangeList.list[0].actNumberGen  +
                        ' �� ' + XSDate2String(
                          ENTransformerChangeList.list[0].actDateGen);
                  end; //if ENTransformerChangeList.totalCount > 0 then
            end;

          advStrGrMeasurementData.RowColor[k] := clFuchsia;

          //������ ��������������
          if brFilterObject = nil then
            begin
              brFilterObject := ENBranchFilter.Create;
              SetNullIntProps(brFilterObject);
              SetNullXSProps(brFilterObject);
            end;
          brFilterObject.conditionSQL := 'ENBRANCH.PANELCODE IN (' +
            '  SELECT CODE FROM ENPANEL WHERE TRANSFORMERCODE = ' +
                   IntToStr(ENTransformerList.list[i].code) +
            '  OR LOWVOLTBOARDCODE IN (SELECT CODE FROM ENLOWVOLTBOARD ' +
            '    WHERE TRANSFORMERREFCODE = ' +
                   IntToStr(ENTransformerList.list[i].code) + '))';

          if chkDisconnectedLowVoltageFeeder.Checked then //SUPP-58106
            brFilterObject.conditionSQL := brFilterObject.conditionSQL +
              'or (enbranch.code in (select branchrefcode from enfiderguage ' +
              '  where transformercode = ' + //������������ �������������
                     IntToStr(ENTransformerList.list[i].code) + ') ' + //������
              '  and ENBRANCH.PANELCODE not IN ( ' +
              '    SELECT CODE FROM ENPANEL WHERE TRANSFORMERCODE = ' +
                     IntToStr(ENTransformerList.list[i].code) +
              '    OR LOWVOLTBOARDCODE IN (SELECT CODE FROM ENLOWVOLTBOARD ' +
              '    WHERE TRANSFORMERREFCODE = ' +
                     IntToStr(ENTransformerList.list[i].code) + ')))';

          brFilterObject.orderBySQL := ' ENPANEL.NAME, ENBRANCH.NUMBERGEN';
          ENBranchList := TempENBranch.getScrollableFilteredList(
            ENBranchFilter(brFilterObject), 0, -1);
          brLastCount := High(ENBranchList.list);
          if brLastCount > -1 then
            begin
              advStrGrMeasurementData.RowCount :=
                advStrGrMeasurementData.RowCount + (brLastCount + 1) * 3;
              for m := 0 to brLastCount do
                begin
                  k := k + 1;
                  if ENBranchList.list[m].code <> Low(Integer) then
                    advStrGrMeasurementData.Cells[0, k] :=
                      IntToStr(ENBranchList.list[m].code)
                  else
                    advStrGrMeasurementData.Cells[0, k] := '';
                  advStrGrMeasurementData.Cells[0, k + 1] :=
                    advStrGrMeasurementData.Cells[0, k];
                  advStrGrMeasurementData.Cells[0, k + 2] :=
                    advStrGrMeasurementData.Cells[0, k];
                  advStrGrMeasurementData.Cells[1, k] :=
                    ENBranchList.list[m].numberGen;
                  (*advStrGrMeasurementData.Cells[1, k + 1] :=
                    ENBranchList.list[m].panelName;*)
                  advStrGrMeasurementData.Cells[2, k] := 'A';
                  advStrGrMeasurementData.RowColor[k] := clYellow;
                  k := k + 1;
                  advStrGrMeasurementData.Cells[2, k] := 'B';
                  advStrGrMeasurementData.RowColor[k] := clGreen;
                  k := k + 1;
                  advStrGrMeasurementData.Cells[2, k] := 'C';
                  advStrGrMeasurementData.RowColor[k] := clRed;
                  if m = brLastCount then
                    Break;
                end;
            end;
          k := k + 1;
          if ENTransformerList.list[i].substation04RefCode = codes04 then
            advStrGrMeasurementData.Cells[1, k] :=
              IntToStr(n) + ' �, �������� ������������, �'
          else
            advStrGrMeasurementData.Cells[1, k] :=
              '������������ ������� ��������������, �';
          advStrGrMeasurementData.Cells[2, k] := 'A';
          advStrGrMeasurementData.RowColor[k] := clYellow;
          if ENTransformerList.list[i].code <> low(Integer) then
            begin
              advStrGrMeasurementData.Objects[0, k] :=
                TObject(ENTransformerList.list[i].code);
              advStrGrMeasurementData.Objects[0, k + 1] :=
                TObject(ENTransformerList.list[i].code);
              advStrGrMeasurementData.Objects[0, k + 2] :=
                TObject(ENTransformerList.list[i].code);
            end;
          k := k + 1;
          advStrGrMeasurementData.Cells[2, k] := 'B';
          advStrGrMeasurementData.RowColor[k] := clGreen;
          k := k + 1;
          advStrGrMeasurementData.Cells[2, k] := 'C';
          advStrGrMeasurementData.RowColor[k] := clRed;
          if i = trLastCount then
            begin
              if chkDisconnectedLowVoltageFeeder.Checked then //SUPP-58106
                begin //�� ��������� � ��������������� ������������� ������
                  if brFilterObject = nil then
                    begin
                      brFilterObject := ENBranchFilter.Create;
                      SetNullIntProps(brFilterObject);
                      SetNullXSProps(brFilterObject);
                    end;
                  brFilterObject.conditionSQL := 'ENBRANCH.PANELCODE IN (' +
                    '  SELECT CODE FROM ENPANEL ' +
                    '  WHERE TRANSFORMERCODE IS NULL ' +
                    '  AND (LOWVOLTBOARDCODE IS NULL ' +
                    '    OR (LOWVOLTBOARDCODE IN (' +
                    '      SELECT CODE FROM ENLOWVOLTBOARD ' +
                    '      WHERE TRANSFORMERREFCODE IS NULL))))' +
                    'AND ENBRANCH.CODE IN (SELECT BRANCHREFCODE ' +
                    '  FROM ENFIDERGUAGE WHERE SUBSTATION04CODE = ' +
                       IntToStr(codeS04) + ')';
                  brFilterObject.orderBySQL :=
                    ' ENPANEL.NAME, ENBRANCH.NUMBERGEN';
                  ENBranchList := TempENBranch.getScrollableFilteredList(
                    ENBranchFilter(brFilterObject), 0, -1);
                  brLastCount := High(ENBranchList.list);
                  if brLastCount > -1 then
                    begin
                      advStrGrMeasurementData.RowCount :=
                        advStrGrMeasurementData.RowCount +
                          (brLastCount + 1) * 3 + 1;
                      for m := 0 to brLastCount do
                        begin
                          k := k + 1;
                          if ENBranchList.list[m].code <> Low(Integer) then
                            advStrGrMeasurementData.Cells[0, k] :=
                              IntToStr(ENBranchList.list[m].code)
                          else
                            advStrGrMeasurementData.Cells[0, k] := '';
                          advStrGrMeasurementData.Cells[0, k + 1] :=
                            advStrGrMeasurementData.Cells[0, k];
                          advStrGrMeasurementData.Cells[0, k + 2] :=
                            advStrGrMeasurementData.Cells[0, k];
                          advStrGrMeasurementData.Cells[1, k] :=
                            ENBranchList.list[m].numberGen;
                          advStrGrMeasurementData.Cells[2, k] := 'A';
                          advStrGrMeasurementData.RowColor[k] := clYellow;
                          k := k + 1;
                          advStrGrMeasurementData.Cells[2, k] := 'B';
                          advStrGrMeasurementData.RowColor[k] := clGreen;
                          k := k + 1;
                          advStrGrMeasurementData.Cells[2, k] := 'C';
                          advStrGrMeasurementData.RowColor[k] := clRed;
                          if m = brLastCount then
                            Break;
                        end;
                        k := k + 1;
                        advStrGrMeasurementData.Cells[1, k] :=
                           ' ³�''������� ������ ' +
                           IntToStr(brLastCount + 1);
                    end; //if brLastCount > -1 then
                end; //if chkDisconnectedLowVoltageFeeder.Checked then

              w := k + 1;
              advStrGrMeasurementData.Cells[1, w] := workerCaption;
            end; //if i = trLastCount then
        end; //for i := 0 to trLastCount do

      //������ ���������� ��������
      //fgColCount := 100;
      TempENFiderGuage := HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;
      if fgFilterObject = nil then
        begin
          fgFilterObject := ENFiderGuageFilter.Create;
          SetNullIntProps(fgFilterObject);
          SetNullXSProps(fgFilterObject);
        end;
      fgFilterObject.conditionSQL :=
        ' (enfiderguage.substation04code = ' + IntToStr(codeS04) + ')';

      if not chkIncludeDismantledTransformer.Checked then //SUPP-58106
        fgFilterObject.conditionSQL := fgFilterObject.conditionSQL +
          ' and (enfiderguage.transformercode not in (' + //���������� ���
          '     select trch.transformerrefcode ' + //������� ���������������
          '     from net.entransformerchange trch ' + //���������������
          '     where trch.uninstalldate is not null' +
          '     and trch.substation04refcode = ' + IntToStr(codes04) + '))';

      if not chkDisconnectedLowVoltageFeeder.Checked then //SUPP-58106
        begin //���������� ��� ������� ������������ ������������� �������
          fgFilterObject.conditionSQL := fgFilterObject.conditionSQL +
            'and (enfiderguage.branchrefcode is null ' +
            '  or enfiderguage.branchrefcode in (select enbranch.code ' +
            '     from enbranch where enbranch.panelcode is Null ' +
            '     or enbranch.panelcode in (select enpanel.code ' +
            '       from enpanel where enpanel.transformercode is null' +
            '       and (enpanel.lowvoltboardcode is Null ' +
            '         or enpanel.lowvoltboardcode in (select lw.code ' +
            '           from enlowvoltboard lw ' +
            '           where lw.transformerrefcode is Null)))) ' +
            '  or enfiderguage.branchrefcode in (select br.code ' +
            '    from enbranch br where br.panelcode in (select pnl.code ' +
            '      from enpanel pnl where pnl.transformercode in (' +
            '        select entransformer.code from entransformer ' +
            '        where entransformer.substation04refcode = ' +
                       IntToStr(codes04) + ')' +
            '      or pnl.lowvoltboardcode in (select lwb.code ' +
            '        from enlowvoltboard lwb  where lwb.substation04refcode = '
                     + IntToStr(codes04) + ')';
          if chkIncludeDismantledTransformer.Checked then //� �����������
             fgFilterObject.conditionSQL := fgFilterObject.conditionSQL +
               '   or pnl.transformercode in (select tch.transformerrefcode ' +
               '     from net.entransformerchange tch ' + //�����������
               '     where tch.uninstalldate is not null ' + //����������
               '     and tch.substation04refcode = ' + //���������������
                     IntToStr(codes04) + ')';
           fgFilterObject.conditionSQL := fgFilterObject.conditionSQL + ')))';
        end; //if not chkDisconnectedLowVoltageFeeder.Checked then

      fgFilterObject.orderBySQL := ' ENFIDERGUAGE.DATEGUAGE, ' +
        'ENFIDERGUAGE.TRANSFORMERCODE, ENFIDERGUAGE.BRANCHREFCODE';
      ENFiderGuageList := TempENFiderGuage.getScrollableFilteredList(
        ENFiderGuageFilter(fgFilterObject), 0, -1);
      fgLastCount := High(ENFiderGuageList.list);

      if fgLastCount <= -1 then Exit
      else advStrGrMeasurementData.ColCount := fgLastCount + 4;

      for k := 3 to advStrGrMeasurementData.ColCount - 1 do
        advStrGrMeasurementData.ColWidths[k] := 80;
      advStrGrMeasurementData.RowCount := advStrGrMeasurementData.RowCount + 1;

      for k := 0 to fgLastCount do
        begin
          if k = fgLastCount then
            try
              lastDateTime := ENFiderGuageList.list[k].dateGuage.AsDateTime;
            except
              Application.MessageBox(
                PChar('������ ������ ���� � ������� ������ (��� ' +
                  IntToStr(ENFiderGuageList.list[k].code) + ')' + #13#10 +
                  '����������, ����������, � �������������'),
                PChar('������ �������������� ������:'));
              Exit;
            end;

          if ENFiderGuageList.list[k].dateGuage <> nil then
          begin
            advStrGrMeasurementData.Cells[k + 3, 0] := DateToStr(EncodeDate(
              ENFiderGuageList.list[k].dateGuage.Year,
              ENFiderGuageList.list[k].dateGuage.Month,
              ENFiderGuageList.list[k].dateGuage.Day));
            advStrGrMeasurementData.Cells[k + 3, 1] := TimeToStr(EncodeTime(
              ENFiderGuageList.list[k].dateGuage.Hour,
              ENFiderGuageList.list[k].dateGuage.Minute,
              ENFiderGuageList.list[k].dateGuage.Second,
              ENFiderGuageList.list[k].dateGuage.Millisecond));
          end;

          for i := 2 to advStrGrMeasurementData.RowCount - 1 do
            if (advStrGrMeasurementData.Cells[0, i] <> '')
            or (advStrGrMeasurementData.Objects[0, i] <> nil) then
              if (ENFiderGuageList.list[k].branchRefCode = Low(Integer))
              and (advStrGrMeasurementData.Objects[0, i] <> nil) then
                begin
                  if Integer(ENFiderGuageList.list[k].transformerCode) =
                    Integer(advStrGrMeasurementData.Objects[0, i])
                  then
                    if Pos('������� �� ',
                      advStrGrMeasurementData.Cells[1, i]) > 0
                    then
                      begin
                        if ENFiderGuageList.list[k].tensionPhaseYellow <> nil
                        then //���������� ����� ���� A
                          advStrGrMeasurementData.Cells[k + 3, i] :=
                            ENFiderGuageList.list[k
                              ].tensionPhaseYellow.DecimalString;
                        advStrGrMeasurementData.Objects[
                          k + 3, i] :=
                          TObject(ENFiderGuageList.list[k].code);
                        if ENFiderGuageList.list[k].tensionPhaseGreen <> nil
                        then //���������� ������ ���� B
                          advStrGrMeasurementData.Cells[k + 3, i + 1] :=
                            ENFiderGuageList.list[k
                              ].tensionPhaseGreen.DecimalString;
                        advStrGrMeasurementData.Objects[
                          k + 3, i + 1] :=
                          TObject(ENFiderGuageList.list[k].code);
                        if ENFiderGuageList.list[k].tensionPhaseRed <> nil
                        then //���������� ������� ���� C
                          advStrGrMeasurementData.Cells[k + 3, i + 2] :=
                            ENFiderGuageList.list[k
                              ].tensionPhaseRed.DecimalString;
                        advStrGrMeasurementData.Objects[
                          k + 3, i + 2] :=
                          TObject(ENFiderGuageList.list[k].code);

                        advStrGrMeasurementData.Cells[k + 3, i + 3] :=
                          ENFiderGuageList.list[k].ancapfPosRefName;
                        advStrGrMeasurementData.Objects[
                          k + 3, i + 3] :=
                          TObject(ENFiderGuageList.list[k].code);
                      end
                    else if (Pos(' �, �������� ������������, �',
                      advStrGrMeasurementData.Cells[1, i]) > 0)
                    or (Pos('������������ ������� ��������������, �',
                      advStrGrMeasurementData.Cells[1, i]) > 0)
                    then
                      begin
                        if ENFiderGuageList.list[k].currentPhaseYellow <> nil
                        then //��� ����� ���� A �� ������� ����
                          advStrGrMeasurementData.Cells[k + 3, i] :=
                            ENFiderGuageList.list[k
                              ].currentPhaseYellow.DecimalString;
                        advStrGrMeasurementData.Objects[
                          k + 3, i] :=
                          TObject(ENFiderGuageList.list[k].code);
                        if ENFiderGuageList.list[k].currentPhaseGreen <> nil
                        then //��� ������ ���� B �� ������� ����
                          advStrGrMeasurementData.Cells[k + 3, i + 1] :=
                            ENFiderGuageList.list[
                              k].currentPhaseGreen.DecimalString;
                        advStrGrMeasurementData.Objects[
                          k + 3, i + 1] :=
                          TObject(ENFiderGuageList.list[k].code);
                        if ENFiderGuageList.list[k].currentPhaseRed <> nil
                        then //��� ������� ���� C �� ������� ����
                          advStrGrMeasurementData.Cells[k + 3, i + 2] :=
                            ENFiderGuageList.list[k
                              ].currentPhaseRed.DecimalString;
                        advStrGrMeasurementData.Objects[
                          k + 3, i + 2] :=
                          TObject(ENFiderGuageList.list[k].code);
                      end;
                end
              else if (advStrGrMeasurementData.Cells[0, i] <> '') then
                if ENFiderGuageList.list[k].branchRefCode =
                  StrToInt(advStrGrMeasurementData.Cells[0, i])
                then
                  begin
                    if (advStrGrMeasurementData.Cells[2, i] = 'A')
                    and (ENFiderGuageList.list[k].currentPhaseYellow <> nil)
                    then //��� ����� ���� A �������������
                      advStrGrMeasurementData.Cells[k + 3, i] :=
                        ENFiderGuageList.list[k].currentPhaseYellow.DecimalString
                    else if (advStrGrMeasurementData.Cells[2, i] = 'B')
                    and (ENFiderGuageList.list[k].currentPhaseGreen <> nil)
                    then //��� ������ ���� B �������������
                      advStrGrMeasurementData.Cells[k + 3, i] :=
                        ENFiderGuageList.list[k].currentPhaseGreen.DecimalString
                    else if (advStrGrMeasurementData.Cells[2, i] = 'C')
                    and (ENFiderGuageList.list[k].currentPhaseRed <> nil)
                    then //��� ������� ���� C �������������
                      advStrGrMeasurementData.Cells[k + 3, i] :=
                        ENFiderGuageList.list[k].currentPhaseRed.DecimalString;
                    advStrGrMeasurementData.Objects[k + 3, i] :=
                      TObject(ENFiderGuageList.list[k].code);
                  end;
        end; //for k := 0 to fgLastCount do

      //��������� ����� ����� � ���� 3-�� �������.
      //���������� �������� advStrGrMeasurementData.RowColor[i] �����������,
      //�.�. ������ ��������� �����-�� ������� ������� �������� ��������,
      //��������������� ������� ������������� ������ (���������� Delphi-����
      //TAdvStringGrid-�)
      for i := 2 to advStrGrMeasurementData.RowCount - 1 do
        for j := 3 to advStrGrMeasurementData.ColCount - 1 do
        advStrGrMeasurementData.Colors[j, i] :=
          advStrGrMeasurementData.Colors[3, i];

      for k := 0 to fgLastCount do
        begin //���������, ����������� ������
          if ENFiderGuageList.list[k].workerCode <> low(Integer) then
            begin
              advStrGrMeasurementData.Cells[k + 3, w] :=
                ENFiderGuageList.list[k].workerSurname;
              if (ENFiderGuageList.list[k].workerName <> '')
              and (ENFiderGuageList.list[k].workerName <>
                '������� ����')
              then
                advStrGrMeasurementData.Cells[k + 3, w] :=
                  advStrGrMeasurementData.Cells[k + 3, w] +
                  ' ' + ENFiderGuageList.list[k].workerName;
              if (ENFiderGuageList.list[k].workerPatronimic <> '')
              and (ENFiderGuageList.list[k].workerPatronimic <>
                '������� ����')
              then
                advStrGrMeasurementData.Cells[k + 3, w] :=
                  advStrGrMeasurementData.Cells[k + 3, w] +
                  ' ' + ENFiderGuageList.list[k].workerPatronimic;
              advStrGrMeasurementData.Objects[k + 3, w] :=
                TObject(ENFiderGuageList.list[k].workerCode);
            end;
        end;

      //���������� ���������� �������� ����� ����������� ��������� ���������
      //� ���� � �� �� ����� ������� � ���� �������
      if advStrGrMeasurementData.ColCount >= 5 then
        begin
          k := 4;
          while k <= advStrGrMeasurementData.ColCount - 1 do
            begin
              if (advStrGrMeasurementData.Cells[k, 0] =
                advStrGrMeasurementData.Cells[k - 1, 0])
              and (Copy(advStrGrMeasurementData.Cells[k, 1], 1, 5) =
                Copy(advStrGrMeasurementData.Cells[k - 1, 1], 1, 5))
              then
                begin
                  for i := 2 to advStrGrMeasurementData.RowCount - 1 do
                    begin
                      if (advStrGrMeasurementData.Cells[k, i] <> '')
                      and (advStrGrMeasurementData.Cells[k - 1, i] = '') then
                        begin
                          advStrGrMeasurementData.Cells[k - 1, i] :=
                            advStrGrMeasurementData.Cells[k, i];
                          if advStrGrMeasurementData.Objects[k, i] <> nil then
                            advStrGrMeasurementData.Objects[k - 1, i] :=
                              advStrGrMeasurementData.Objects[k, i];
                        end;
                    end;
                  advStrGrMeasurementData.RemoveCols(k, 1);
                  k := k - 1;
                end;
              k := k + 1;
            end;
        end;
    end; //if pcFiderGauge.ActivePage = tsMeasurementData then

end;

procedure TfrmFiderGauge.FormShow(Sender: TObject);
begin
  SetCurrentDate;
  SetCurrentTime;
  DisableActions([actDelete], //������ �������� ����� �������� �������
    (((HTTPRIOENFiderGuage.HTTPWebNode.UserName <> 'energynet')
      and (HTTPRIOENFiderGuage.HTTPWebNode.UserName <> 'promadmin'))
    or (DialogState = dsView)));
  DisableActions([actInsert, actEdit, actSave, actWorkerChange],
    DialogState = dsView);
  pcFiderGauge.ActivePage := tsMeasurementData;
  actUpdateExecute(Sender);
end;

procedure TfrmFiderGauge.advStrGrMeasurementDataDblClickCell(
  Sender: TObject; ARow, ACol: Integer);
begin
  if (ACol > -1) and (ARow > -1) then
    if advStrGrMeasurementData.Objects[ACol, ARow] <> nil then
      ShowMessage(IntToStr(Integer(
        advStrGrMeasurementData.Objects[ACol, ARow])));
end;

procedure TfrmFiderGauge.actInsertExecute(Sender: TObject);
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

      for j := 3 to advStrGrMeasurementData.ColCount - 1 do
        if (Copy(advStrGrMeasurementData.Cells[j, 1], 1, 5) = Copy(
          strTime, 1, 5)) and (advStrGrMeasurementData.Cells[j, 0] = strDate)
        then
          begin
            Application.MessageBox(PChar('��������� ��������� ��� ����.' +
              #13#10 + '������, ����-�����, ������� ������� �� ������ ' +
              '�����.'), PChar('ϳ������:'), MB_ICONINFORMATION);
            Exit;
          end
        //��������� ������ �� ���������� ������� � ����� ������
        //������� - ����������� ���. ���. ��������� �� �������������
        //� 1-� ���. ���. ���������  
        {else if dtpDateGuage.DateTime < lastDateTime then
          begin
            Application.MessageBox(PChar('��������� ��������� �� ���� ' +
              #13#10 + '�� ����� ���� ���������� �����.'),
              PChar('ϳ������:'), MB_ICONINFORMATION);
            Exit;
          end}
          ;
      if (advStrGrMeasurementData.ColCount > 4)
      or ((advStrGrMeasurementData.ColCount = 4)
        and (advStrGrMeasurementData.Cells[
          advStrGrMeasurementData.ColCount - 1, 0] <> ''))
      then
        advStrGrMeasurementData.AddColumn;
      advStrGrMeasurementData.Cells[advStrGrMeasurementData.ColCount - 1, 0] :=
        strDate;
      advStrGrMeasurementData.Cells[advStrGrMeasurementData.ColCount - 1, 1] :=
        strTime;
      advStrGrMeasurementData.ColWidths[
        advStrGrMeasurementData.ColCount - 1] := 80;
      //��������� ����� ����� � ���� 3-�� �������
      for i := 2 to advStrGrMeasurementData.RowCount - 1 do
        for j := 3 to advStrGrMeasurementData.ColCount - 1 do
        advStrGrMeasurementData.Colors[j, i] :=
          advStrGrMeasurementData.Colors[3, i];
    end; //if pcFiderGauge.ActivePage = tsMeasurementData then
end;

//������ ����� ���������� �������� 
procedure TfrmFiderGauge.advStrGrMeasurementDataKeyPress(Sender: TObject;
  var Key: Char);
var vrLength, vrPos: Integer; str: String;
begin
  //������ ������� �� �����
  if Key = ',' then Key := '.';
  str := advStrGrMeasurementData.Cells[
    advStrGrMeasurementData.Col, advStrGrMeasurementData.Row];
  vrLength := Length(str); //���������� ����� ������
  vrPos := Pos('.', str);  //��������� ������� "."
  case Key of
    '0'..'9', #8: ; //��������� ������ �����, "BackSpace"
    '.':            //� "."
      begin
        //���� ����� ��� ���� ��� ����� �������� ��������� �����
        //������ ��� ������� ���� � ���� ����� ��� ���
        if (vrPos > 0) or (vrLength = 0) then
          Key := #0; //"��������" �������
      end;
    else
      Key := #0;     //��������� ������ ���������
  end;
end;

procedure TfrmFiderGauge.btnOkClick(Sender: TObject);
var i, transformerCode: Integer;
begin //PRIC-628. ���������� ���������� �� ���� ������ ��������� EnergyNet
  if Application.Tag = ENConsts.CONFIG_ENERGYWORKFLOW_CLIENT_VERSION then //��� ������� ������� ��������
    begin //���������������� ���������� 10 - 6 / 0,4 �� �� EnergyWorkFlow
      vFiderGaugeDate := StrToDate( //���� ��������� � ������� ������
        advStrGrMeasurementData.Cells[advStrGrMeasurementData.Col, 0]);
      for i := 0 to advStrGrMeasurementData.RowCount - 1 do
        begin
          transformerCode := //��� ��������������
            Integer(advStrGrMeasurementData.Objects[0, i]);
          if transformerCode = frmFiderGauge.codeTransformer then
            begin
              if Pos('������� �� ', advStrGrMeasurementData.Cells[1, i]) > 0
              then
                begin
                  //���������� ���������� ����� ���� � �� �����
                  if advStrGrMeasurementData.Cells[ //�������������� ��������,
                    advStrGrMeasurementData.Col, i] <> '' //������
                  then
                    FiderGauge.vTensionPhaseYellow := StrToFloat(
                      advStrGrMeasurementData.Cells[
                        advStrGrMeasurementData.Col, i])
                  else
                    FiderGauge.vTensionPhaseYellow := 0;

                  //���������� ���������� ������ ���� B �� �����
                  if advStrGrMeasurementData.Cells[ //�������������� ��������,
                    advStrGrMeasurementData.Col, i + 1] <> '' //������
                  then
                    FiderGauge.vTensionPhaseGreen :=
                      StrToFloat(advStrGrMeasurementData.Cells[
                        advStrGrMeasurementData.Col, i + 1])
                  else
                    FiderGauge.vTensionPhaseGreen := 0;

                  //���������� ���������� ������� ���� C �� �����
                  if advStrGrMeasurementData.Cells[ //�������������� ��������,
                    advStrGrMeasurementData.Col, i + 2] <> '' //������
                  then
                    FiderGauge.vTensionPhaseRed :=
                      StrToFloat(advStrGrMeasurementData.Cells[
                        advStrGrMeasurementData.Col, i + 2])
                  else
                    FiderGauge.vTensionPhaseRed := 0;
                end; //if Pos('������� �� ', advStrGrMeasurementData.Cells[ ...

              if Pos(' �, �������� ������������, �',
                advStrGrMeasurementData.Cells[1, i]) > 0
              then
                begin
                  //��� ����� ���� A ��������� � ������� ������, ������
                  if advStrGrMeasurementData.Cells[
                    advStrGrMeasurementData.Col, i] <> ''
                  then
                    FiderGauge.vCurrentPhaseYellow :=
                      StrToFloat(advStrGrMeasurementData.Cells[
                        advStrGrMeasurementData.Col, i])
                  else
                    FiderGauge.vCurrentPhaseYellow := 0;

                  //��� ������ ���� B ��������� � ������� ������, ������
                  if advStrGrMeasurementData.Cells[
                    advStrGrMeasurementData.Col, i + 1] <> ''
                  then
                    FiderGauge.vCurrentPhaseGreen :=
                      StrToFloat(advStrGrMeasurementData.Cells[
                        advStrGrMeasurementData.Col, i + 1])
                  else
                    FiderGauge.vCurrentPhaseGreen := 0;

                  //��� ������� ���� C ��������� � ������� ������, ������
                  if advStrGrMeasurementData.Cells[
                    advStrGrMeasurementData.Col, i + 2] <> ''
                  then
                    FiderGauge.vCurrentPhaseRed :=
                      StrToFloat(advStrGrMeasurementData.Cells[
                        advStrGrMeasurementData.Col, i + 2])
                  else
                    FiderGauge.vCurrentPhaseRed := 0;
                end; //if Pos(' �, �������� ������������, �', ...
            end; //if transformerCode = frmFiderGauge.codeTransformer then
        end; //for i := 0 to advStrGrMeasurementData.RowColor - 1 do
    end; //if Application.Tag = ENConsts.CONFIG_ENERGYWORKFLOW_CLIENT_VERSION then
end;

procedure TfrmFiderGauge.chkIncludeDismantledTransformerClick(Sender: TObject);
begin
  actUpdate.Execute;
end;

procedure TfrmFiderGauge.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    actSaveExecute(Sender);
end;

procedure TfrmFiderGauge.actSaveExecute(Sender: TObject);
var i, j, transformerCode: Integer;
  strGenSwitchDevTensionPhaseYellow, strGenSwitchDevTensionPhaseGreen,
  strGenSwitchDevTensionPhaseRed: String;
  isNewObj: Boolean;
  TempENFiderGuage: ENFiderGuageControllerSoapPort;
  ENFiderGuageObj: ENFiderGuage;
  //isWasMessage: Boolean; //������� ��������� � ���������� ������ ����� �������
  isUserCanSaveGauge: Boolean; //�������, ����� �� ������������ �������������
    //����� �������� ������ (�� ��������� - ��, ����� - ����������� ��������)
  ancapfPosCode: Integer;
begin
  isUserCanSaveGauge := true;
  TempENFiderGuage := HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;
  for j := 3 to advStrGrMeasurementData.ColCount - 1 do
    for i := 2 to advStrGrMeasurementData.RowCount - 1 do
      begin
        if (Pos('��������� ��� ', advStrGrMeasurementData.Cells[1, i]) > 0)
        or (Pos('��� ������������� ��������������: ',
          advStrGrMeasurementData.Cells[1, i]) > 0)
        then
          begin
            if (advStrGrMeasurementData.Cells[j, i] = '1')
            or (advStrGrMeasurementData.Cells[j, i] = 'I') then
              ancapfPosCode := 1
            else if (advStrGrMeasurementData.Cells[j, i] = '2')
            or (advStrGrMeasurementData.Cells[j, i] = 'II') then
              ancapfPosCode := 2
            else if (advStrGrMeasurementData.Cells[j, i] = '3')
            or (advStrGrMeasurementData.Cells[j, i] = 'III') then
              ancapfPosCode := 3
            else if (advStrGrMeasurementData.Cells[j, i] = '4')
            or (advStrGrMeasurementData.Cells[j, i] = 'IV') then
              ancapfPosCode := 4
            else if (advStrGrMeasurementData.Cells[j, i] = '5')
            or (advStrGrMeasurementData.Cells[j, i] = 'V') then
              ancapfPosCode := 5
            else if (advStrGrMeasurementData.Cells[j, i] = '')
            or (advStrGrMeasurementData.Cells[j, i] = '�� �������') then
              ancapfPosCode := 6
            else if (advStrGrMeasurementData.Cells[j, i] = '0')
            or (advStrGrMeasurementData.Cells[j, i] = '���� ���') then
              ancapfPosCode := 0;
          end
        else if Pos('������� �� ', advStrGrMeasurementData.Cells[1, i]) > 0
        then
          begin
            transformerCode := //��� ��������������
              Integer(advStrGrMeasurementData.Objects[0, i]);
            //���������� ����� ���� � �� ����� �������������� ��������
            if advStrGrMeasurementData.Cells[j, i] <> '' then
              strGenSwitchDevTensionPhaseYellow :=
                advStrGrMeasurementData.Cells[j, i]
            else
              strGenSwitchDevTensionPhaseYellow := '';
            //���������� ������ ���� B �� ����� �������������� ��������
            if advStrGrMeasurementData.Cells[j, i + 1] <> '' then
              strGenSwitchDevTensionPhaseGreen :=
                advStrGrMeasurementData.Cells[j, i + 1]
            else
              strGenSwitchDevTensionPhaseGreen := '';
            //���������� ������� ���� C �� ����� �������������� ��������
            if advStrGrMeasurementData.Cells[j, i + 2] <> '' then
              strGenSwitchDevTensionPhaseRed :=
                advStrGrMeasurementData.Cells[j, i + 2]
            else
              strGenSwitchDevTensionPhaseRed := '';
          end
        else if (advStrGrMeasurementData.Cells[2, i] = 'A')
        and (Pos(' �, �������� ������������, �',
          advStrGrMeasurementData.Cells[1, i]) = 0)
        and (Pos('������������ ������� ��������������, �',
          advStrGrMeasurementData.Cells[1, i]) = 0)
        then
          begin
            if (advStrGrMeasurementData.Cells[j, i] = '')
            and (advStrGrMeasurementData.Cells[j, i + 1] = '')
            and (advStrGrMeasurementData.Cells[j, i + 2] = '') then
              begin //�������� ������� ������
                if advStrGrMeasurementData.Objects[j, i] <> nil then
                  TempENFiderGuage.remove(
                    Integer(advStrGrMeasurementData.Objects[j, i]));
              end
            else
              begin
                if advStrGrMeasurementData.Objects[j, i] <> nil
                then
                  begin
                    ENFiderGuageObj := TempENFiderGuage.getObject(Integer(
                      advStrGrMeasurementData.Objects[j, i]));
                    isNewObj := False;
                  end
                else if advStrGrMeasurementData.Objects[j, i + 1] <> nil
                then
                  begin
                    ENFiderGuageObj := TempENFiderGuage.getObject(Integer(
                      advStrGrMeasurementData.Objects[j, i + 1]));
                    isNewObj := False;
                  end
                else if advStrGrMeasurementData.Objects[j, i + 2] <> nil
                then
                  begin
                    ENFiderGuageObj := TempENFiderGuage.getObject(Integer(
                      advStrGrMeasurementData.Objects[j, i + 2]));
                    isNewObj := False;
                  end
                else
                  begin
                    ENFiderGuageObj := ENFiderGuage.Create;
                    isNewObj := True;
                  end;
                try
                  //���������������� ���������� 10 - 6 / 0,4 ��
                  if ENFiderGuageObj.substation04 = nil then
                    ENFiderGuageObj.substation04 :=
                      ENSubstation04Ref.Create;
                  ENFiderGuageObj.substation04.code := codeS04;
                  //���� � ����� ������
                  if ENFiderGuageObj.dateGuage = nil then
                    ENFiderGuageObj.dateGuage := TXSDateTime.Create;
                  ENFiderGuageObj.dateGuage.XSToNative(GetXSDateTime(
                    StrToDateTime(advStrGrMeasurementData.Cells[j, 0]) +
                    StrToDateTime(advStrGrMeasurementData.Cells[j, 1])));
                  //�������� �� ����� ������ - �������������
                  ENFiderGuageObj.isGenSwitchDev := 0;
                  //������ �� �������������
                  if ENFiderGuageObj.transformer = nil then
                    ENFiderGuageObj.transformer := ENTransformerRef.Create;
                  ENFiderGuageObj.transformer.code := transformerCode;
                  //������ �� �������������
                  if ENFiderGuageObj.branchRef = nil then
                    ENFiderGuageObj.branchRef := ENBranchRef.Create;
                  ENFiderGuageObj.branchRef.code :=
                    StrToInt(advStrGrMeasurementData.Cells[0, i]);
                  //��� ���� �
                  if ENFiderGuageObj.currentPhaseYellow = nil then
                    ENFiderGuageObj.currentPhaseYellow :=
                      TXSDecimal.Create;
                  if advStrGrMeasurementData.Cells[j, i] <> '' then
                    ENFiderGuageObj.currentPhaseYellow.decimalString :=
                      advStrGrMeasurementData.Cells[j, i]
                  else
                    ENFiderGuageObj.currentPhaseYellow := nil;
                  //��� ���� B
                  if ENFiderGuageObj.currentPhaseGreen = nil then
                    ENFiderGuageObj.currentPhaseGreen :=
                      TXSDecimal.Create;
                  if advStrGrMeasurementData.Cells[j, i + 1] <> '' then
                    ENFiderGuageObj.currentPhaseGreen.decimalString :=
                      advStrGrMeasurementData.Cells[j, i + 1]
                  else
                    ENFiderGuageObj.currentPhaseGreen := nil;
                  //��� ���� C
                  if ENFiderGuageObj.currentPhaseRed = nil then
                    ENFiderGuageObj.currentPhaseRed :=
                      TXSDecimal.Create;
                  if advStrGrMeasurementData.Cells[j, i + 2] <> '' then
                    ENFiderGuageObj.currentPhaseRed.decimalString :=
                      advStrGrMeasurementData.Cells[j, i + 2]
                  else
                    ENFiderGuageObj.currentPhaseRed := nil;

                  //��� ������������ ������ ����������
                  if advStrGrMeasurementData.Objects[j, w] <> nil then
                    if Integer(advStrGrMeasurementData.Objects[j, w]) <>
                      low(Integer)
                    then
                      begin
                        if ENFiderGuageObj.worker = nil then
                          ENFiderGuageObj.worker := EPWorker.Create();
                        ENFiderGuageObj.worker.code :=
                          Integer(advStrGrMeasurementData.Objects[j, w]);
                      end;

                  if isNewObj then
                    begin //���������� ������ �������
                      ENFiderGuageObj.code := low(Integer);
                      TempENFiderGuage.add(ENFiderGuageObj);
                    end
                  else if isUserCanSaveGauge then //������� ���������� �������
                    isUserCanSaveGauge :=
                      TempENFiderGuage.saveWithPermission(ENFiderGuageObj);

                  {else //��������� ������������� ����� �������� ������
                  if (HTTPRIOENFiderGuage.HTTPWebNode.UserName = 'promadmin')
                  or (HTTPRIOENFiderGuage.HTTPWebNode.UserName = 'energynet')
                  or (HTTPRIOENFiderGuage.HTTPWebNode.UserName = 'SavickiyEA')
                  then //���������� �������
                    TempENFiderGuage.save(ENFiderGuageObj)
                  else if not isWasMessage then
                    begin
                      isWasMessage := True;
                      Application.MessageBox(
                        PChar('��������� ����� ������ ����� ������.' + #13#10 +
                          '��������� ����� ���������� ������� ���������.'),
                        PChar('���������:'), MB_ICONINFORMATION);
                    end;}

                finally
                  ENFiderGuageObj.Free;
                  ENFiderGuageObj := nil;
                end;
              end;
          end; //if advStrGrMeasurementData.Cells[2, i] = 'A' then
        if (Pos(' �, �������� ������������, �',
          advStrGrMeasurementData.Cells[1, i]) > 0)
        or (Pos('������������ ������� ��������������, �', //SUPP-27789
          advStrGrMeasurementData.Cells[1, i]) > 0)
        then
          begin
            if (advStrGrMeasurementData.Cells[j, i] = '')
            and (advStrGrMeasurementData.Cells[j, i + 1] = '')
            and (advStrGrMeasurementData.Cells[j, i + 2] = '') then
              begin //�������� ������� ������
                if advStrGrMeasurementData.Objects[j, i]
                  <> nil
                then
                  TempENFiderGuage.remove(
                    Integer(advStrGrMeasurementData.Objects[
                      j, i]));
              end
            else
              begin
                if advStrGrMeasurementData.Objects[j, i] <> nil then
                  begin
                    ENFiderGuageObj := TempENFiderGuage.getObject(Integer(
                      advStrGrMeasurementData.Objects[j, i]));
                    isNewObj := False;
                  end
                else if advStrGrMeasurementData.Objects[j, i + 1] <> nil then
                  begin
                    ENFiderGuageObj := TempENFiderGuage.getObject(Integer(
                      advStrGrMeasurementData.Objects[j, i + 1]));
                    isNewObj := False;
                  end
                else if advStrGrMeasurementData.Objects[j, i + 2] <> nil then
                  begin
                    ENFiderGuageObj := TempENFiderGuage.getObject(Integer(
                      advStrGrMeasurementData.Objects[j, i + 2]));
                    isNewObj := False;
                  end
                else
                  begin
                    ENFiderGuageObj := ENFiderGuage.Create;
                    isNewObj := True;
                  end;
                try
                  //���������������� ���������� 10 - 6 / 0,4 ��
                  if ENFiderGuageObj.substation04 = nil then
                    ENFiderGuageObj.substation04 :=
                      ENSubstation04Ref.Create;
                  ENFiderGuageObj.substation04.code := codeS04;
                  //���� � ����� ������
                  if ENFiderGuageObj.dateGuage = nil then
                    ENFiderGuageObj.dateGuage := TXSDateTime.Create;
                  ENFiderGuageObj.dateGuage.XSToNative(GetXSDateTime(
                    StrToDateTime(advStrGrMeasurementData.Cells[j, 0]) +
                    StrToDateTime(advStrGrMeasurementData.Cells[j, 1])));
                  //�������� �� ����� ������ - ����� �������������� �������
                  ENFiderGuageObj.isGenSwitchDev := 1;
                  //������ �� �������������
                  if ENFiderGuageObj.transformer = nil then
                    ENFiderGuageObj.transformer := ENTransformerRef.Create;
                  ENFiderGuageObj.transformer.code := transformerCode;
                  //��������� ����� � ��������������
                  ENFiderGuageObj.branchRef := nil;
                  //��������� ���
                  if ENFiderGuageObj.ancapfPosRef = nil then
                    ENFiderGuageObj.ancapfPosRef := ENAntsapfPositionRef.Create;
                  ENFiderGuageObj.ancapfPosRef.code := ancapfPosCode;
                  //��� ���� � �� ����� �������������� ��������
                  if ENFiderGuageObj.currentPhaseYellow = nil then
                    ENFiderGuageObj.currentPhaseYellow :=
                      TXSDecimal.Create;
                  if advStrGrMeasurementData.Cells[j, i] <> '' then
                    ENFiderGuageObj.currentPhaseYellow.decimalString :=
                      advStrGrMeasurementData.Cells[j, i]
                  else
                    ENFiderGuageObj.currentPhaseYellow := nil;
                  //��� ���� B �� ����� �������������� ��������
                  if ENFiderGuageObj.currentPhaseGreen = nil then
                    ENFiderGuageObj.currentPhaseGreen :=
                      TXSDecimal.Create;
                  if advStrGrMeasurementData.Cells[j, i + 1] <> '' then
                    ENFiderGuageObj.currentPhaseGreen.decimalString :=
                      advStrGrMeasurementData.Cells[j, i + 1]
                  else
                    ENFiderGuageObj.currentPhaseGreen := nil;
                  //��� ���� C �� ����� �������������� ��������
                  if ENFiderGuageObj.currentPhaseRed = nil then
                    ENFiderGuageObj.currentPhaseRed :=
                      TXSDecimal.Create;
                  if advStrGrMeasurementData.Cells[j, i + 2] <> '' then
                    ENFiderGuageObj.currentPhaseRed.decimalString :=
                      advStrGrMeasurementData.Cells[j, i + 2]
                  else
                    ENFiderGuageObj.currentPhaseRed := nil;
                  //���������� ����� ���� A �� ����� �������������� ��������
                  if ENFiderGuageObj.tensionPhaseYellow = nil then
                    ENFiderGuageObj.tensionPhaseYellow :=
                      TXSDecimal.Create;
                  if strGenSwitchDevTensionPhaseYellow <> '' then
                    ENFiderGuageObj.tensionPhaseYellow.decimalString :=
                      strGenSwitchDevTensionPhaseYellow
                  else
                    ENFiderGuageObj.tensionPhaseYellow := nil;
                  //���������� ������ ���� B �� ����� �������������� ��������
                  if ENFiderGuageObj.tensionPhaseGreen = nil then
                    ENFiderGuageObj.tensionPhaseGreen :=
                      TXSDecimal.Create;
                  if strGenSwitchDevTensionPhaseGreen <> '' then
                    ENFiderGuageObj.tensionPhaseGreen.decimalString :=
                      strGenSwitchDevTensionPhaseGreen
                  else
                    ENFiderGuageObj.tensionPhaseGreen := nil;
                  //���������� ������� ���� C �� ����� �������������� ��������
                  if ENFiderGuageObj.tensionPhaseRed = nil then
                    ENFiderGuageObj.tensionPhaseRed :=
                      TXSDecimal.Create;
                  if strGenSwitchDevTensionPhaseRed <> '' then
                    ENFiderGuageObj.tensionPhaseRed.decimalString :=
                      strGenSwitchDevTensionPhaseRed
                  else
                    ENFiderGuageObj.tensionPhaseRed := nil;

                  //��� ������������ ������ ����������
                  if advStrGrMeasurementData.Objects[j, w] <> nil then
                    if Integer(advStrGrMeasurementData.Objects[j, w]) <>
                      low(Integer)
                    then
                      begin
                        if ENFiderGuageObj.worker = nil then
                          ENFiderGuageObj.worker := EPWorker.Create();
                        ENFiderGuageObj.worker.code :=
                          Integer(advStrGrMeasurementData.Objects[j, w]);
                      end;

                  if isNewObj then
                    begin //���������� ������ �������
                      ENFiderGuageObj.code := low(Integer);
                      TempENFiderGuage.add(ENFiderGuageObj);
                    end
                  else if isUserCanSaveGauge then //������� ���������� �������
                    isUserCanSaveGauge :=
                      TempENFiderGuage.saveWithPermission(ENFiderGuageObj);

                  {else //��������� ������������� ����� �������� ������
                  if (HTTPRIOENFiderGuage.HTTPWebNode.UserName = 'promadmin')
                  or (HTTPRIOENFiderGuage.HTTPWebNode.UserName = 'energynet')
                  or (HTTPRIOENFiderGuage.HTTPWebNode.UserName = 'SavickiyEA')
                  then //���������� �������
                    TempENFiderGuage.save(ENFiderGuageObj)
                  else if not isWasMessage then
                    begin
                      isWasMessage := True;
                      Application.MessageBox(
                        PChar('��������� ����� ������ ����� ������.' + #13#10 +
                          '��������� ����� ���������� ������� ���������.'),
                        PChar('���������:'), MB_ICONINFORMATION);
                    end;}

                finally
                  ENFiderGuageObj.Free;
                  ENFiderGuageObj := nil;
                end;
            end;
          end;
      end;

  if isUserCanSaveGauge then
    Application.MessageBox(
      PChar('��������� ����� � ������������� ����� �������� ������.'),
      PChar('���������:'), MB_ICONINFORMATION)
  else
    Application.MessageBox(
      PChar('��������� ������ ����� ������.' + #13#10 +
        '��������� ����� ���������� ������� ���������.'),
      PChar('��������������:'), MB_ICONWARNING);

  actUpdateExecute(Sender);
end;

procedure TfrmFiderGauge.actEditExecute(Sender: TObject);
var j: Integer; strDate, strTime: String;
begin
  if pcFiderGauge.ActivePage = tsMeasurementData then
    begin
      strDate := DateToStr(dtpDateGuage.Date);
      strTime := TimeToStr(dtpTimeGuage.Time);
      for j := 3 to advStrGrMeasurementData.ColCount - 1 do
        if (Copy(advStrGrMeasurementData.Cells[j, 1], 1, 5) = Copy(
          strTime, 1, 5)) and (advStrGrMeasurementData.Cells[j, 0] = strDate)
        then
          begin
            Application.MessageBox(PChar('��������� ��������� ��� ����.'),
              PChar('ϳ������:'), MB_ICONINFORMATION);
            Exit;
          end;
      advStrGrMeasurementData.Cells[advStrGrMeasurementData.Col, 0] :=
        strDate;
      advStrGrMeasurementData.Cells[advStrGrMeasurementData.Col, 1] :=
        strTime;
    end;
end;

procedure TfrmFiderGauge.actDeleteExecute(Sender: TObject);
var i: Integer; TempENFiderGuage: ENFiderGuageControllerSoapPort;
begin
  if Application.MessageBox(PChar('�� ����� ������ �������� �����?'),
    PChar('�����!'), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES
  then
    Exit;
  TempENFiderGuage := HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;
  for i := 0 to advStrGrMeasurementData.RowCount - 1 do
    if advStrGrMeasurementData.Objects[
      advStrGrMeasurementData.Col, i] <> nil
    then
      begin
        if (Pos(' �, �������� ������������, �',
          advStrGrMeasurementData.Cells[1, i]) = 0)
        and (advStrGrMeasurementData.Cells[2, i] = 'A')
        then
          TempENFiderGuage.remove(Integer(advStrGrMeasurementData.Objects[
            advStrGrMeasurementData.Col, i]));
        advStrGrMeasurementData.Objects[
          advStrGrMeasurementData.Col, i] := nil;
        advStrGrMeasurementData.Cells[
          advStrGrMeasurementData.Col, i] := '';
        if advStrGrMeasurementData.Cells[2, i] = 'A' then
          begin
            advStrGrMeasurementData.Objects[
              advStrGrMeasurementData.Col, i + 1] := nil;
            advStrGrMeasurementData.Cells[
              advStrGrMeasurementData.Col, i + 1] := '';
            advStrGrMeasurementData.Objects[
              advStrGrMeasurementData.Col, i + 2] := nil;
            advStrGrMeasurementData.Cells[
              advStrGrMeasurementData.Col, i + 2] := '';
          end;
      end;
  if advStrGrMeasurementData.ColCount >= 5 then
    advStrGrMeasurementData.RemoveCols(advStrGrMeasurementData.Col, 1);
end;

procedure TfrmFiderGauge.pcFiderGaugeChange(Sender: TObject);
begin
  actUpdateExecute(Sender);
end;

procedure TfrmFiderGauge.actReportFiderGaugeExecute(Sender: TObject);
var //�������������� �� ��
  argNames, args: ArrayOfString;
  reportName : String;
  //��� �����
  AppPath, FileName: String;
  OldCursor: TCursor;
  //ExcelApp: OleVariant;
begin //�������������� �� ��
  SetLength(argNames, 1);
  SetLength(args, 1);
  argNames[0] := 's04Code';
  args[0] := IntToStr(codeS04);
  reportName := 'Passport/S04_TransformerFiderGauge/S04_SheetFiderGauge';
  makeReport(reportName, argNames, args, 'xls');

  //��� �����
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    //FileName := AppPath + TempReportsPath + GetFileName('measurements') + '.xls';
    FileName := AppPath + TempReportsPath + GetFileName('��Ͳ_��̲в�_��Բ�������_������������_' +
      StringReplace(nameS04, ' ', '_', [rfReplaceAll, rfIgnoreCase]) + '__') + '.xls';

    xlsExportMeasurement.XLSExport(FileName);

    ShellExecute(0, PChar('open'), PChar('"' + FileName + '"'), nil, nil,
      SW_SHOWMAXIMIZED);
/////
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmFiderGauge.actWorkerChangeExecute(Sender: TObject);
var frmEPWorkerShow: TfrmEPWorkerShow; i: Integer;
begin
  for i := 2 to advStrGrMeasurementData.RowCount - 1 do
    if advStrGrMeasurementData.Cells[1, i] = workerCaption then
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

end.
