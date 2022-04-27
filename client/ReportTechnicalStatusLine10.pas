unit ReportTechnicalStatusLine10;

interface


uses
    Buttons, Controls, Classes, StdCtrls,
    Windows, Messages, SysUtils, Variants, Graphics, Forms,
    Dialogs, DialogFormUnit, ComCtrls, ChildFormUnit, InvokeRegistry, Rio,
    SOAPHTTPClient;

type
    TfrmReportTechnicalStatusLine10 = class(TDialogForm)
    lblLine10: TLabel;
    spbLine10: TSpeedButton;
    spbLine10Clear: TSpeedButton;
    edtENLine: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    HTTPRIOENLine10: THTTPRIO;
    cbLineType: TComboBox;
    HTTPRIOENLine04: THTTPRIO;
    HTTPRIOENElementType: THTTPRIO;
    lblLineType: TLabel;
    HTTPRIOENLine150: THTTPRIO;

    procedure btnOkClick(Sender: TObject);
    procedure spbLine10Click(Sender: TObject);
    procedure spbLine10ClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbLineTypeChange(Sender: TObject);
    procedure loadLineType(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    line04Code, line10Code, line150Code: Integer;
  end;


var
  frmReportTechnicalStatusLine10: TfrmReportTechnicalStatusLine10;


implementation


uses
  ShowENLine10
  , ENLine10Controller
  , EnergyproController
  , DMReportsUnit
  , ENLine04Controller
  , ShowENLine04
  , ENElementTypeController
  , ENConsts
, ShowENLine150, ENLine150Controller;


{$R *.dfm}



procedure TfrmReportTechnicalStatusLine10.btnOkClick(Sender: TObject);
var
  elementCode: Integer;
  argNames, args: ArrayOfString;
  reportName: string;

  elementTypeCode: Integer;
  elementTypeShort: ENElementTypeShort;

  line10: ENLine10;
  TempENLine10: ENLine10ControllerSoapPort;

  line04: ENLine04;
  TempENLine04: ENLine04ControllerSoapPort;

  line150: ENLine150;
  TempENLine150: ENLine150ControllerSoapPort;
begin

  if cbLineType.ItemIndex = -1 then
    raise Exception.Create('ќбер≥ть тип л≥н≥й.');

  try
    elementTypeShort := ENElementTypeShort(cbLineType.Items.Objects[cbLineType.ItemIndex]);
  except
    on EConvertError do Exit;
  end;

  elementTypeCode := elementTypeShort.code;

  SetLength(argNames, 2);
  SetLength(args, 2);

  argNames[0] := 'elementCode';
  argNames[1] := 'elementTypeCode';

  if elementTypeCode = EN_LINE04 then
  begin
    TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;

    if ( line04Code <> -1 ) then
    begin
      try
         line04 := TempENLine04.getObject(line04Code);
      except
        on EConvertError do Exit;
      end;

      args[0] := IntToStr(line04.element.code);
    end else args[0] := '0';

  end else

  if elementTypeCode = EN_LINE10 then
  begin
    TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;

    if ( line10Code <> -1 ) then
    begin
      try
         line10 := TempENLine10.getObject(line10Code);
      except
        on EConvertError do Exit;
      end;

      args[0] := IntToStr(line10.element.code);
    end else args[0] := '0';

  end else

  if elementTypeCode = EN_LINE150 then
  begin
    TempENLine150 := HTTPRIOENLine150 as ENLine150ControllerSoapPort;

    if ( line150Code <> -1 ) then
    begin
      try
         line150 := TempENLine150.getObject(line150Code);
      except
        on EConvertError do Exit;
      end;

      args[0] := IntToStr(line150.element.code);
    end else args[0] := '0';

  end else

    raise Exception.Create('ƒл€ типу елемента з кодом ' + IntToStr(elementTypeCode) + ' цей зв≥т не застосовуЇтьс€!');

  args[1] := IntToStr(elementTypeCode);

  reportName := 'TechnicalStatus/technicalStatusLine';
  makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmReportTechnicalStatusLine10.cbLineTypeChange(Sender: TObject);
begin
  inherited;
  line04Code := -1;
  line10Code := -1;
  line150Code := -1;
  edtENLine.Text := '';
end;


procedure TfrmReportTechnicalStatusLine10.FormCreate(Sender: TObject);
begin
  inherited;
  line04Code := -1;
  line10Code := -1;
  line150Code := -1;
end;


procedure TfrmReportTechnicalStatusLine10.FormShow(Sender: TObject);
begin
  inherited;
  DenyBlankValues([cbLineType]);
  DisableControls([edtENLine]);
  loadLineType(Sender);
end;


procedure TfrmReportTechnicalStatusLine10.spbLine10Click(Sender: TObject);
var
  elementTypeCode: Integer;
  elementTypeShort: ENElementTypeShort;

  frmENLine10Show: TfrmENLine10Show;
  line10Filter: ENLine10Filter;

  frmENLine04Show: TfrmENLine04Show;
  line04Filter: ENLine04Filter;

  frmENLine150Show: TfrmENLine150Show;
  line150Filter: ENLine150Filter;
begin
  inherited;

  if cbLineType.ItemIndex = -1 then
    raise Exception.Create('ќбер≥ть тип л≥н≥й.');

  try
    elementTypeShort := ENElementTypeShort(cbLineType.Items.Objects[cbLineType.ItemIndex]);
  except
    on EConvertError do Exit;
  end;

  elementTypeCode := elementTypeShort.code;

  if elementTypeCode = EN_LINE04 then
  begin
    line04Filter := ENLine04Filter.Create;
    SetNullIntProps(line04Filter);
    SetNullXSProps(line04Filter);

    frmENLine04Show := TfrmENLine04Show.Create(Application, fmNormal, line04Filter);
    try
      frmENLine04Show.DisableActions([frmENLine04Show.actENLine04Insert,
                                      frmENLine04Show.actENLine04Edit,
                                      frmENLine04Show.actENLine04Delete]);

      with frmENLine04Show do
        if ShowModal = mrOk then
        begin
          try
            line04Code := StrToInt(GetReturnValue(sgENLine04, 0));
            edtENLine.Text := GetReturnValue(sgENLine04, 1);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmENLine04Show.Free;
    end;

  end else

  if elementTypeCode = EN_LINE10 then
  begin
    line10Filter := ENLine10Filter.Create;
    SetNullIntProps(line10Filter);
    SetNullXSProps(line10Filter);

    frmENLine10Show := TfrmENLine10Show.Create(Application, fmNormal, line10Filter);
    try
      frmENLine10Show.DisableActions([frmENLine10Show.actInsert,
                                      frmENLine10Show.actEdit,
                                      frmENLine10Show.actDelete]);

      with frmENLine10Show do
        if ShowModal = mrOk then
        begin
          try
            line10Code := StrToInt(GetReturnValue(sgENLine10, 0));
            edtENLine.Text := GetReturnValue(sgENLine10, 1);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmENLine10Show.Free;
    end;

  end else

  if elementTypeCode = EN_LINE150 then
  begin
    line150Filter := ENLine150Filter.Create;
    SetNullIntProps(line150Filter);
    SetNullXSProps(line150Filter);

    frmENLine150Show := TfrmENLine150Show.Create(Application, fmNormal, line150Filter);
    try
      frmENLine150Show.DisableActions([frmENLine150Show.actInsert,
                                       frmENLine150Show.actEdit,
                                       frmENLine150Show.actDelete]);

      with frmENLine150Show do
        if ShowModal = mrOk then
        begin
          try
            line150Code := StrToInt(GetReturnValue(sgENLine150, 0));
            edtENLine.Text := GetReturnValue(sgENLine150, 1);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmENLine150Show.Free;
    end;
  end;
end;


procedure TfrmReportTechnicalStatusLine10.spbLine10ClearClick(Sender: TObject);
begin
  inherited;
  line04Code := -1;
  line10Code := -1;
  line150Code := -1;
  edtENLine.Text := '';
end;


procedure TfrmReportTechnicalStatusLine10.loadLineType(Sender: TObject);
var
  i: Integer;
  typeFilter: ENElementTypeFilter;
  TempENElementType: ENElementTypeControllerSoapPort;
  ENElementTypeList: ENElementTypeShortList;
begin
  TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  cbLineType.Items.Clear;

  typeFilter := ENElementTypeFilter.Create;
  SetNullIntProps(typeFilter);
  SetNullXSProps(typeFilter);
  typeFilter.conditionSQL := ' code in (' + IntToStr(EN_LINE04) + ', ' +
                                            IntToStr(EN_LINE10) + ', ' +
                                            IntToStr(EN_LINE150) + ') ';
  typeFilter.orderBySQL := ' code desc ';

  ENElementTypeList := TempENElementType.getScrollableFilteredList(typeFilter, 0, -1);

  for i:=0 to High(ENElementTypeList.list) do
  begin
    cbLineType.Items.AddObject(ENElementTypeList.list[i].name, ENElementTypeList.list[i]);
  end;

end;



end.
