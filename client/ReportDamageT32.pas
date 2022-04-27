unit ReportDamageT32;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, DateUtils;

type
  TfrmReportDamageT32 = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblDate: TLabel;
    edtDateFrom: TDateTimePicker;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateTo: TDateTimePicker;
    chkFinishedEventsIncluded: TCheckBox;
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    edtEPRenName: TEdit;
    lblExecutor: TLabel;
    edtExecutor: TEdit;
    spbExecutor: TSpeedButton;
    lblDamageKind: TLabel;
    lblDamageType: TLabel;
    spbEPRenClear: TSpeedButton;
    spbExecutorClear: TSpeedButton;
    ListDamageType: TCheckListBox;
    HTTPRIOCCDamageType: THTTPRIO;
    ListDamageKind: TCheckListBox;
    HTTPRIOCCDamageKind: THTTPRIO;
    lblCCDepartment: TLabel;
    cbCCDepartment: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbExecutorClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbExecutorClearClick(Sender: TObject);
  private
    { Private declarations }
    CCRenCode : String;
    executorCode : String;
    strKindCodes, strTypeCodes : String;
  public
    { Public declarations }
  end;

var
  frmReportDamageT32: TfrmReportDamageT32;



implementation
uses ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit,
     CCRenController, ShowCCRen, ShowCCExecutor, CCExecutorController,
     ShowCCDamageKind, ShowCCCallSubType, CCDamageKindController,
     CCCallSubTypeController;

{$R *.dfm}

procedure TfrmReportDamageT32.FormCreate(Sender: TObject);
begin
  CCRenCode := '';
  executorCode := '0';
  strKindCodes := '-1';
  strTypeCodes := '-1';
  HTTPRIOCCDamageType.URL := CALL_CENTER_URL;
  HTTPRIOCCDamageType.HTTPWebNode.UserName := CALL_CENTER_DEFAULT_USER;
  HTTPRIOCCDamageType.HTTPWebNode.Password := CALL_CENTER_DEFAULT_PASSWRD;
  HTTPRIOCCDamageKind.URL := CALL_CENTER_URL;
  HTTPRIOCCDamageType.HTTPWebNode.UserName := CALL_CENTER_DEFAULT_USER;
  HTTPRIOCCDamageType.HTTPWebNode.Password := CALL_CENTER_DEFAULT_PASSWRD;
end;

procedure TfrmReportDamageT32.FormShow(Sender: TObject);
var
  TempCCCallSubType: CCCallSubTypeControllerSoapPort;
  TempCCDamageKind : CCDamageKindControllerSoapPort;
  kindFilter : CCDamageKindFilter;
  kindList : CCDamageKindShortList;
  typeList: CCCallSubTypeShortList;
  typeFilter : CCCallSubTypeFilter;
  typeIndex, kindIndex : Integer;
begin
  inherited;
  typeFilter := CCCallSubTypeFilter.Create;
  SetNullXSProps(typeFilter);
  SetNullIntProps(typeFilter);
  typeFilter.conditionSql := 'CCCALLSUBTYPE.TYPEREFCODE = ' + IntToStr(CCCALL_TYPE_T3);

  kindFilter := CCDamageKindFilter.Create;
  SetNullXSProps(kindFilter);
  SetNullIntProps(kindFilter);

  TempCCCallSubType := HTTPRIOCCDamageType as CCCallSubTypeControllerSoapPort;
  TempCCDamageKind := HTTPRIOCCDamageKind as CCDamageKindControllerSoapPort;

  typeList := TempCCCallSubType.getScrollableFilteredList(typeFilter, 0, -1);
  kindList := TempCCDamageKind.getScrollableFilteredList(kindFilter, 0, -1);

  for typeIndex := 0 to typeList.totalCount - 1 do begin
        ListDamageType.Items.AddObject(typeList.list[typeIndex].mark + ' ' + typeList.list[typeIndex].name  , TObject( typeList.list[typeIndex].code )  );
  end;

  for kindIndex := 0 to kindList.totalCount - 1 do begin
        ListDamageKind.Items.AddObject(kindList.list[kindIndex].name, TObject(kindList.list[kindIndex].code));
  end;

  edtDateTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DayOf(Now));
  edtDateFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), DayOf(Now));

  edtDateTo.Checked := true;
  edtDateFrom.Checked := true;

  DisableControls([edtEPRenName, edtExecutor]);

  end;

procedure TfrmReportDamageT32.spbEPRenClearClick(Sender: TObject);
begin
  inherited;
  CCRenCode := '';
  edtEPRenName.Text := '';
end;

procedure TfrmReportDamageT32.spbEPRenClick(Sender: TObject);
Var frmCCRenShow: TfrmCCRenShow;
   TempCCRen: CCRenControllerSoapPort;
   CCRenObj: CCRen;
   begin
   frmCCRenShow:=TfrmCCRenShow.Create(Application,fmNormal);
   try
      with frmCCRenShow do
           if ShowModal = mrOk then
           begin
             try
               CCRenCode:=GetReturnValue(sgCCRen,1);
               edtEPRenName.Text:=GetReturnValue(sgCCRen,2);
             except
               on EConvertError do Exit;
             end;
     end;
    finally
      frmCCRenShow.Free;
   end;
end;

procedure TfrmReportDamageT32.spbExecutorClick(Sender: TObject);
Var frmCCExecutorShow: TfrmCCExecutorShow;
   TempCCExecutor: CCExecutorControllerSoapPort;
   CCExecutorObj: CCRen;
   begin
   frmCCExecutorShow:=TfrmCCExecutorShow.Create(Application,fmNormal);
   try
      with frmCCExecutorShow do begin
      DisableActions([actEdit, actInsert, actDelete, actFilter, actNoFilter]);
           if ShowModal = mrOk then
           begin
             try
               executorCode :=GetReturnValue(sgCCExecutor,0);
               edtExecutor.Text:=GetReturnValue(sgCCExecutor,1);
 { Если нужно - добавте сюда другие значения, которые неоходимо возвращать}
             except
               on EConvertError do Exit;
             end;
     end;
      end;
    finally
      frmCCExecutorShow.Free;
   end;
end;

procedure TfrmReportDamageT32.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName : String;
  i : Integer;
begin

  inherited;

  if edtDateFrom.Date > edtDateTo.Date then
  begin
    Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
    Exit;
  end;

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

  // Считывание выбранных типов и видов событий
  for i := 0 to ListDamageKind.Count - 1 do
  begin
       if  ListDamageKind.Checked[i] then
        if strKindCodes <>  '' then
           strKindCodes := strKindCodes + ', ' + IntToStr(  Integer( ListDamageKind.Items.Objects[i] ) )
         else
           strKindCodes := strKindCodes + IntToStr(Integer(ListDamageKind.Items.Objects[i]));
  end;

  for i := 0 to ListDamageType.Count - 1 do
  begin
       if  ListDamageType.Checked[i] then
        if strTypeCodes <>  '' then
           strTypeCodes := strTypeCodes + ', ' + IntToStr(Integer(ListDamageType.Items.Objects[i]))
         else
           strTypeCodes := strTypeCodes + IntToStr(Integer(ListDamageType.Items.Objects[i]));
  end;

  // Установка параметров
  SetLength(argNames, 8);
  SetLength(args, 8);

  argNames[0] := 'renCode';
  args[0] := CCRenCode;
  argNames[1] := 'startDate';
  args[1] := DateToStr(edtDateFrom.Date);
  argNames[2] := 'endDate';
  args[2] := DateToStr(edtDateTo.Date);
  argNames[3] := 'showFinished';
  if chkFinishedEventsIncluded.Checked then
    args[3] := '1'
  else
    args[3] := '0';

  argNames[4] := 'executorCode';
  args[4] := executorCode;

  argNames[5] := 'kindCode';
  args[5] := strKindCodes;

  argNames[6] := 'typeCode';
  args[6] := strTypeCodes;

  argNames[7] := 'ccDepartmentCode';
  if cbCCDepartment.ItemIndex > 0 then
    args[7] := IntToStr(cbCCDepartment.ItemIndex - 1)
  else
    args[7] := '-1';

  reportName := 'CallCenter/Damages_T32_list';

  makeReport(reportName, argNames, args, 'xls');

  self.Close;

end;



procedure TfrmReportDamageT32.spbExecutorClearClick(Sender: TObject);
begin
  inherited;
  executorCode := '0';
  edtExecutor.Text := '';
end;

end.
