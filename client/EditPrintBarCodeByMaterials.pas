unit EditPrintBarCodeByMaterials;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts, DMReportsUnit,
    EnergyproController, EnergyproController2, ENCoordinatesController, Printers, ShellAPI,
    TKMaterialsController, AdvObj;

type
    TfrmPrintBarCodeByMaterialsEdit = class(TDialogForm)
    chbLowLevel: TCheckBox;
    lblName: TLabel;
    edtName: TEdit;
    HTTPRIOTKMaterials: THTTPRIO;
    btnOk: TButton;
    sgTKMaterials: TAdvStringGrid;
    gpPrint: TGroupBox;
    edtPrintMaterialsName: TEdit;
    edtCountGen: TEdit;
    Label1: TLabel;
    edtCode: TEdit;
    lblCode: TLabel;
    btnPrint: TButton;
    btnPrintMediumBarCode: TButton;
    btnPrintSmallBarCode: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure sgTKMaterialsTopLeftChanged(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure sgTKMaterialsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPrintSmallBarCodeClick(Sender: TObject);
    procedure btnPrintMediumBarCodeClick(Sender: TObject);
    procedure edtNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure updateTKMaterialsGrid(materialsFilter : TKMaterialsFilter);
  end;

var
  frmPrintBarCodeByMaterialsEdit: TfrmPrintBarCodeByMaterialsEdit;

implementation

{$R *.dfm}



var
  materialCode : Integer;
  FilterObject : TKMaterialsFilter;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  TKMaterialsHeaders: array [1..5] of String =
        ( 'код'
          ,'Назва'
          ,'Од. виміру'
          ,'Вартість'
          ,'Група матеріалів'
        );


procedure SetDefaultPrinter(NewDefPrinter : string); 
var 
  ResStr: array[0..255] of Char; 
begin 
  StrPCopy(ResStr, NewdefPrinter); 
  WriteProfileString('windows', 'device', ResStr); 
  StrCopy(ResStr, 'windows'); 
  SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, Longint(@ResStr)); 
end;

procedure SetDefaultPrinter2(PrinterName: string); 
var 
  I: Integer; 
  Device: PChar; 
  Driver: PChar; 
  Port: PChar; 
  HdeviceMode: THandle; 
  aPrinter: TPrinter; 
begin 
  Printer.PrinterIndex := -1; 
  GetMem(Device, 255); 
  GetMem(Driver, 255); 
  GetMem(Port, 255); 
  aPrinter := TPrinter.Create;
  try 
    for I := 0 to Printer.Printers.Count - 1 do 
    begin 
      if Printer.Printers[i]= PrinterName then
      begin 
        aprinter.PrinterIndex := i; 
        aPrinter.getprinter(device, driver, port, HdeviceMode); 
        StrCat(Device, ','); 
        StrCat(Device, Driver); 
        StrCat(Device, Port); 
        WriteProfileString('windows', 'device', Device); 
        StrCopy(Device, 'windows'); 
        SendMessage(HWND_BROADCAST, WM_WININICHANGE, 
          0, Longint(@Device)); 
      end; 
    end; 
  finally 
    aPrinter.Free; 
  end; 
  FreeMem(Device, 255); 
  FreeMem(Driver, 255); 
  FreeMem(Port, 255); 
end;


procedure TfrmPrintBarCodeByMaterialsEdit.btnOkClick(Sender: TObject);
var
  i,l,j : Integer;
  TKMaterialsList : TKMaterialsShortList;
  TempTKMaterials : TKMaterialsControllerSoapPort;
begin

  if ((edtName.Text = '') and (edtCode.Text = '')) then
  begin
    Application.MessageBox(PChar('Не визначено критерій пошуку ...'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  DisableControls([btnPrint]);


  edtPrintMaterialsName.Text := '';
  edtCountGen.Text := '1';

  SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);
  ColCount:=100;

  FilterObject := TKMaterialsFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);
  if edtCode.Text = '' then
  FilterObject.name := edtName.Text;
  if edtName.Text = '' then
  FilterObject.code := StrToInt(edtCode.Text);


  if chbLowLevel.Checked then
    if FilterObject.conditionSQL <> '' then
      FilterObject.conditionSQL := FilterObject.conditionSQL + ' and tk1.accountingtyperefcode <> '
        + IntToStr(TK_ACCOUNTINGTYPE_SERVICES)
        + ' AND TK1.CODE not in (select parentrefcode from tkmaterials where parentrefcode is not null)'
    else
      FilterObject.conditionSQL := ' tk1.accountingtyperefcode <> '
        + IntToStr(TK_ACCOUNTINGTYPE_SERVICES)
        + ' and TK1.CODE not in (select parentrefcode from tkmaterials where parentrefcode is not null)';

  FilterObject.orderBySQL := 'TK1.NAME';

  TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
  TKMaterialsList := TempTKMaterials.getScrollableFilteredList(FilterObject,0,ColCount);

  ClearGrid(sgTKMaterials);

  LastCount := High(TKMaterialsList.list);

  if LastCount > -1 then
     sgTKMaterials.RowCount:=LastCount+2
  else
     sgTKMaterials.RowCount:=2;

   with sgTKMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if TKMaterialsList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(TKMaterialsList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := TKMaterialsList.list[i].name;
        Cells[2,i+1] := TKMaterialsList.list[i].measurementName;

        if TKMaterialsList.list[i].cost = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := TKMaterialsList.list[i].cost.DecimalString;

        Cells[4,i+1] := TKMaterialsList.list[i].parentRefName;

        LastRow:=i+1;
        sgTKMaterials.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgTKMaterials.Row:=1;

   sgTKMaterialsClick(Sender);
end;

procedure TfrmPrintBarCodeByMaterialsEdit.sgTKMaterialsTopLeftChanged(Sender: TObject);
var
  TempTKMaterials: TKMaterialsControllerSoapPort;
  i,CurrentRow: Integer;
  TKMaterialsList: TKMaterialsShortList;
begin
  if LastCount < 99 then Exit;
  if (sgTKMaterials.TopRow + sgTKMaterials.VisibleRowCount) = ColCount
  then
  begin
      TempTKMaterials :=  HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
      CurrentRow:=sgTKMaterials.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := TKMaterialsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  TKMaterialsList := TempTKMaterials.getScrollableFilteredList(TKMaterialsFilter(FilterObject),ColCount-1, 100);

  sgTKMaterials.RowCount:=sgTKMaterials.RowCount+100;
  LastCount:=High(TKMaterialsList.list);
  with sgTKMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if TKMaterialsList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(TKMaterialsList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := TKMaterialsList.list[i].name;
        Cells[2,i+CurrentRow] := TKMaterialsList.list[i].measurementName;

        if TKMaterialsList.list[i].cost = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := TKMaterialsList.list[i].cost.DecimalString;

        Cells[4,i+CurrentRow] := TKMaterialsList.list[i].parentRefName;

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgTKMaterials.Row:=CurrentRow-5;
   sgTKMaterials.RowCount:=LastRow+1;
  end;
end;



procedure TfrmPrintBarCodeByMaterialsEdit.btnPrintClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  str : String;
begin
  SetLength(argNames, 2);
  SetLength(args, 2);
  argNames[0] := 'materialCode';
  argNames[1] := 'countGen';

  if (materialCode <> Low(Integer)) then
  begin
    args[0] := IntToStr(materialCode);
    args[1] := edtCountGen.Text;
    str := 'TechCard/barCodeByMaterials/printBarCodeByMaterialsMain';
    makeReport(str, argNames, args, 'pdf');
  end;
end;

procedure TfrmPrintBarCodeByMaterialsEdit.sgTKMaterialsClick(
  Sender: TObject);
begin
  try
    materialCode := StrToInt(GetReturnValue(sgTKMaterials,0) );  // (sgTKMaterials,0));
    if (materialCode <> Low(Integer)) then
    begin
      edtPrintMaterialsName.Text := GetReturnValue(sgTKMaterials,1);
      DisableControls([btnPrint], False);
    end;
  except
    on EConvertError do Exit;
  end;
end;

procedure TfrmPrintBarCodeByMaterialsEdit.FormShow(Sender: TObject);
begin
  SetIntStyle([edtCountGen, edtCode]);
  DenyBlankValues([edtPrintMaterialsName, edtCountGen]);
  DisableControls([btnPrint]);
  materialCode := Low(Integer);
end;

procedure TfrmPrintBarCodeByMaterialsEdit.btnPrintSmallBarCodeClick(Sender: TObject);
var
  i : Integer;
  argNames, args : ArrayOfString;
  str : String;
begin

  //SetDefaultPrinter2('Argox CP-2140 smallBarCode');

  SetLength(argNames, 2);
  SetLength(args, 2);
  argNames[0] := 'materialCode';
  argNames[1] := 'countGen';

  if (materialCode <> Low(Integer)) then
  begin
    args[0] := IntToStr(materialCode);
    args[1] := edtCountGen.Text;
    str := 'TechCard/barCodeByMaterials/small/printBarCodeByMaterials';
    makeReportWithOutExecute(str, argNames, args, 'pdf', 'smallBarCode');
  end;

  for i:=1 to StrToInt(edtCountGen.Text) do
  begin
    ShellExecute(
    WindowHandle,
    PChar('open'),
    PChar('acrord32'),
    PChar(' /s /o /h /t "'+ExtractFilePath(Application.ExeName) + 'tempReports\' + 'smallBarCode.pdf" "Argox CP-2140 smallBarCode"'),
    nil,
    SW_HIDE
    );
  end;

  //ShellExecute(Handle, 'print', PChar(ExtractFilePath(Application.ExeName) + 'tempReports\' + 'smallBarCode.pdf'), nil, nil, SW_SHOW);

  {AcroPDF.src := ExtractFilePath(Application.ExeName) + 'tempReports\' + 'smallBarCode.pdf';
  AcroPDF.LoadFile(ExtractFilePath(Application.ExeName) + 'tempReports\' + 'smallBarCode.pdf');

  for i:=1 to StrToInt(edtCountGen.Text) do
  begin
    AcroPDF.printAll;
  end;}

end;

procedure TfrmPrintBarCodeByMaterialsEdit.btnPrintMediumBarCodeClick(Sender: TObject);
var
  i : Integer;
  argNames, args : ArrayOfString;
  str : String;
begin

  //SetDefaultPrinter2('Argox CP-2140 mediumBarCode');
  
  SetLength(argNames, 2);
  SetLength(args, 2);
  argNames[0] := 'materialCode';
  argNames[1] := 'countGen';

  if (materialCode <> Low(Integer)) then
  begin
    args[0] := IntToStr(materialCode);
    args[1] := edtCountGen.Text;
    str := 'TechCard/barCodeByMaterials/printBarCodeByMaterials';
    makeReportWithOutExecute(str, argNames, args, 'pdf', 'mediumBarCode');
  end;

  for i:=1 to StrToInt(edtCountGen.Text) do
  begin
    ShellExecute(
    WindowHandle,
    PChar('open'),
    PChar('acrord32'),
    PChar(' /s /o /h /t "'+ExtractFilePath(Application.ExeName) + 'tempReports\' + 'mediumBarCode.pdf" "Argox CP-2140 mediumBarCode"'),
    nil,
    SW_HIDE
    );
  end;

  //ShellExecute(Handle, 'print', PChar(ExtractFilePath(Application.ExeName) + 'tempReports\' + 'mediumBarCode.pdf'), nil, nil, SW_SHOW);

  {AcroPDF.src := ExtractFilePath(Application.ExeName) + 'tempReports\' + 'mediumBarCode.pdf';
  AcroPDF.LoadFile(ExtractFilePath(Application.ExeName) + 'tempReports\' + 'mediumBarCode.pdf');

  for i:=1 to StrToInt(edtCountGen.Text) do
  begin
    AcroPDF.printAll;
  end;}

end;

procedure TfrmPrintBarCodeByMaterialsEdit.edtNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   edtCode.Text := '';
end;

procedure TfrmPrintBarCodeByMaterialsEdit.edtCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  edtName.Text := '';
end;

procedure TfrmPrintBarCodeByMaterialsEdit.updateTKMaterialsGrid(materialsFilter : TKMaterialsFilter);
var
  i,l,j : Integer;
  TKMaterialsList : TKMaterialsShortList;
  TempTKMaterials : TKMaterialsControllerSoapPort;
begin

  DisableControls([btnPrint]);


  edtPrintMaterialsName.Text := '';
  edtCountGen.Text := '1';

  SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);


  if chbLowLevel.Checked then
    if materialsFilter.conditionSQL <> '' then
      materialsFilter.conditionSQL := materialsFilter.conditionSQL + ' and tk1.accountingtyperefcode <> '
        + IntToStr(TK_ACCOUNTINGTYPE_SERVICES)
        + ' AND TK1.CODE not in (select parentrefcode from tkmaterials where parentrefcode is not null)'
    else
      materialsFilter.conditionSQL := ' tk1.accountingtyperefcode <> '
        + IntToStr(TK_ACCOUNTINGTYPE_SERVICES)
        + ' and TK1.CODE not in (select parentrefcode from tkmaterials where parentrefcode is not null)';

  materialsFilter.orderBySQL := 'TK1.NAME';

  TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
  TKMaterialsList := TempTKMaterials.getScrollableFilteredList(materialsFilter,0, -1);

  ClearGrid(sgTKMaterials);

  LastCount := High(TKMaterialsList.list);

  if LastCount > -1 then
     sgTKMaterials.RowCount:=LastCount+2
  else
     sgTKMaterials.RowCount:=2;

   with sgTKMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if TKMaterialsList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(TKMaterialsList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := TKMaterialsList.list[i].name;
        Cells[2,i+1] := TKMaterialsList.list[i].measurementName;

        if TKMaterialsList.list[i].cost = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := TKMaterialsList.list[i].cost.DecimalString;

        Cells[4,i+1] := TKMaterialsList.list[i].parentRefName;

        LastRow:=i+1;
        sgTKMaterials.RowCount:=LastRow+1;
      end;
   sgTKMaterials.Row:=1;
end;

end.
