
unit ShowENSheets4SO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSheets4SOController, AdvObj ;


type
    TfrmENSheets4SOShow = class(TChildForm)  
    HTTPRIOENSheets4SO: THTTPRIO;
    ImageList1: TImageList;
    sgENSheets4SO: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    actViewENServicesObject: TAction;
    HTTPRIOENServicesObject: THTTPRIO;
    N5: TMenuItem;
    N9: TMenuItem;
    actCreateNewSheet: TAction;
    ToolButton5: TToolButton;
    N10: TMenuItem;
    actPrint: TAction;
    ToolButton9: TToolButton;
    N11: TMenuItem;
    actViewDFDocBySheet4SO: TAction;
    ToolButton10: TToolButton;
    N12: TMenuItem;
    HTTPRIODFDoc: THTTPRIO;
    actBatchPrint: TAction;
    ToolButton12: TToolButton;
    N13: TMenuItem;
    actExcel: TAction;
    N14: TMenuItem;
    Excel1: TMenuItem;
    ToolButton13: TToolButton;
    actGenerateForToday: TAction;
    ToolButton14: TToolButton;
    N15: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENSheets4SOTopLeftChanged(Sender: TObject);
    procedure sgENSheets4SODblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actViewENServicesObjectExecute(Sender: TObject);
    procedure actCreateNewSheetExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actViewDFDocBySheet4SOExecute(Sender: TObject);
    procedure actBatchPrintExecute(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure actGenerateForTodayExecute(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
   procedure initFilter(sheets4SOFilter: ENSheets4SOFilter);
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;


var
  frmENSheets4SOShow: TfrmENSheets4SOShow;
  
  
implementation

uses Main, EditENSheets4SO, EditENSheets4SOFilter, ENServicesObjectController,
  EditENServicesConnection, DMReportsUnit, DFDocController, DFConsts,
  EditDFDocOutbox, ENSheets4SOTypeController, ENConsts;


{$R *.dfm}

const
  DFDOC_CODE_INDEX = 0;
  DFDOCTYPE_CODE_INDEX = 1;
  ENSERVICESOBJECT_CODE_INDEX = 2;
  ENATTACHMENT_CODE_INDEX = 3;

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSheets4SOHeaders: array [1..12] of String =
        ( 'Код'
          ,'Номер договору'
          ,'Дата договору'
          ,'Замовник'
          ,'Номер останнього листа'
          ,'Назва'
          ,'Дата останнього листа'
          ,'Кількість днів (подовження строку)'
          ,'Дата наступного листа'
          ,'Коментар'
          ,'Користувач, який змінив запис'
          ,'Дата ост. зміни'
        );


procedure TfrmENSheets4SOShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSheets4SOShow:=nil;
  inherited;
end;


procedure TfrmENSheets4SOShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSheets4SOShow.FormShow(Sender: TObject);
var
  TempENSheets4SO: ENSheets4SOControllerSoapPort;
  i: Integer;
  ENSheets4SOList: ENSheets4SOShortList;
begin
  SetGridHeaders(ENSheets4SOHeaders, sgENSheets4SO.ColumnHeaders);
  ColCount:=100;
  TempENSheets4SO :=  HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSheets4SOFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSheets4SOList := TempENSheets4SO.getScrollableFilteredList(ENSheets4SOFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSheets4SOList.list);

  if LastCount > -1 then
     sgENSheets4SO.RowCount:=LastCount+2
  else
     sgENSheets4SO.RowCount:=2;

   with sgENSheets4SO do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENSheets4SOList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENSheets4SOList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENSheets4SOList.list[i].servicesobjectContractNumberServices;
        if ENSheets4SOList.list[i].servicesobjectContractDateServices = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENSheets4SOList.list[i].servicesobjectContractDateServices);
        Cells[3,i+1] := ENSheets4SOList.list[i].servicesobjectContragentName;

        Cells[4,i+1] := ENSheets4SOList.list[i].numbergen;
        Cells[5,i+1] := ENSheets4SOList.list[i].name;
        if ENSheets4SOList.list[i].dateGen = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENSheets4SOList.list[i].dateGen);
        if ENSheets4SOList.list[i].dayscnt = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(ENSheets4SOList.list[i].dayscnt);
        if ENSheets4SOList.list[i].nextSheetDate = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENSheets4SOList.list[i].nextSheetDate);
        Cells[9,i+1] := ENSheets4SOList.list[i].commentgen;
        Cells[10,i+1] := ENSheets4SOList.list[i].userGen;
        if ENSheets4SOList.list[i].dateEdit = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := XSDate2String(ENSheets4SOList.list[i].dateEdit);

        Objects[DFDOC_CODE_INDEX,            i + 1] := TObject(ENSheets4SOList.list[i].dfDocCode);
        Objects[DFDOCTYPE_CODE_INDEX,        i + 1] := TObject(ENSheets4SOList.list[i].dfDocTypeCode);
        Objects[ENSERVICESOBJECT_CODE_INDEX, i + 1] := TObject(ENSheets4SOList.list[i].servicesobjectCode);
        Objects[ENATTACHMENT_CODE_INDEX,     i + 1] := TObject(ENSheets4SOList.list[i].attachmentCode);

        LastRow := i + 1;
        sgENSheets4SO.RowCount := LastRow + 1;
      end;
    
    ColCount:=ColCount+1;
    sgENSheets4SO.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSheets4SO.RowCount > selectedRow then
      sgENSheets4SO.Row := selectedRow
    else
      sgENSheets4SO.Row := sgENSheets4SO.RowCount - 1;
    end
    else
      sgENSheets4SO.Row:=1;

  sgENSheets4SO.FixedFont.Style := [fsBold];
end;


procedure TfrmENSheets4SOShow.initFilter(sheets4SOFilter: ENSheets4SOFilter);
begin
  if sheets4SOFilter = nil then Exit;
  
  SetNullIntProps(sheets4SOFilter);
  SetNullXSProps(sheets4SOFilter);
  sheets4SOFilter.sheet4sotype := ENSheets4SOTypeRef.Create;
  sheets4SOFilter.sheet4sotype.code := ENSHEETS4SOTYPE_LAND_SHEET;
  sheets4SOFilter.isLast := YES;
  sheets4SOFilter.conditionSQL := 'ENSHEETS4SO.NEXTSHEETDATE IS NOT NULL';
  sheets4SOFilter.orderBySQL := 'ENSHEETS4SO.NEXTSHEETDATE DESC';
end;

procedure TfrmENSheets4SOShow.sgENSheets4SOTopLeftChanged(Sender: TObject);
var
  TempENSheets4SO: ENSheets4SOControllerSoapPort;
  i,CurrentRow: Integer;
  ENSheets4SOList: ENSheets4SOShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSheets4SO.TopRow + sgENSheets4SO.VisibleRowCount) = ColCount
  then
    begin
      TempENSheets4SO :=  HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;
      CurrentRow:=sgENSheets4SO.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSheets4SOFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSheets4SOList := TempENSheets4SO.getScrollableFilteredList(ENSheets4SOFilter(FilterObject),ColCount-1, 100);


  sgENSheets4SO.RowCount:=sgENSheets4SO.RowCount+100;
  LastCount:=High(ENSheets4SOList.list);
  with sgENSheets4SO do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENSheets4SOList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENSheets4SOList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSheets4SOList.list[i].servicesobjectContractNumberServices;
        if ENSheets4SOList.list[i].servicesobjectContractDateServices = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENSheets4SOList.list[i].servicesobjectContractDateServices);
        Cells[3,i+CurrentRow] := ENSheets4SOList.list[i].servicesobjectContragentName;

        Cells[4,i+CurrentRow] := ENSheets4SOList.list[i].numbergen;
        Cells[5,i+CurrentRow] := ENSheets4SOList.list[i].name;
        if ENSheets4SOList.list[i].dateGen = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDate2String(ENSheets4SOList.list[i].dateGen);
        if ENSheets4SOList.list[i].dayscnt = Low(Integer) then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := IntToStr(ENSheets4SOList.list[i].dayscnt);
        if ENSheets4SOList.list[i].nextSheetDate = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDate2String(ENSheets4SOList.list[i].nextSheetDate);
        Cells[9,i+CurrentRow] := ENSheets4SOList.list[i].commentgen;
        Cells[10,i+CurrentRow] := ENSheets4SOList.list[i].userGen;
        if ENSheets4SOList.list[i].dateEdit = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := XSDate2String(ENSheets4SOList.list[i].dateEdit);

        Objects[DFDOC_CODE_INDEX,            i + CurrentRow] := TObject(ENSheets4SOList.list[i].dfDocCode);
        Objects[DFDOCTYPE_CODE_INDEX,        i + CurrentRow] := TObject(ENSheets4SOList.list[i].dfDocTypeCode);
        Objects[ENSERVICESOBJECT_CODE_INDEX, i + CurrentRow] := TObject(ENSheets4SOList.list[i].servicesobjectCode);
        Objects[ENATTACHMENT_CODE_INDEX,     i + CurrentRow] := TObject(ENSheets4SOList.list[i].attachmentCode);

        LastRow := i + CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSheets4SO.Row:=CurrentRow-5;
   sgENSheets4SO.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSheets4SOShow.sgENSheets4SODblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSheets4SO,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSheets4SOShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSheets4SO.RowCount-1 do
   for j:=0 to sgENSheets4SO.ColCount-1 do
     sgENSheets4SO.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSheets4SOShow.actViewDFDocBySheet4SOExecute(Sender: TObject);
var
  //frmDFDocManagement: TfrmDocumentManagementShow;
  ObjCode, dfDocCode: Integer;
  //docFilter: DFDocFilter;
  TempDFDoc: DFDocControllerSoapPort;
  doc: DFDoc;
begin
  try
    ObjCode := StrToInt(sgENSheets4SO.Cells[0, sgENSheets4SO.Row]);
  except
    on EConvertError do Exit;
  end;

  dfDocCode := Integer(sgENSheets4SO.Objects[DFDOC_CODE_INDEX, sgENSheets4SO.Row]);
  if dfDocCode <= 0 then Exit;

{
  docFilter := DFDocFilter.Create;
  SetNullIntProps(docFilter);
  SetNullXSProps(docFilter);
  docFilter.code := dfDocCode;

  frmDFDocManagement := TfrmDocumentManagementShow.Create(Application, fmNormal);
  try
    frmDFDocManagement.generalSearchFilter := docFilter;
    Application.Tag := ENConsts.CONFIG_CALLCENTER_CLIENT_VERSION;
    frmDFDocManagement.ShowModal;
  finally
    frmDFDocManagement.Free;
    frmDFDocManagement := nil;
  end;
}

  TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;
  doc := TempDFDoc.getObject(dfDocCode);

  if (doc.docTypeRef.code = DFDOCTYPE_OUTBOX) then
  begin
    DFDocOutBoxObj := DMReports.getOutBoxByDocCode(dfDocCode);
    if (DFDocOutBoxObj = nil) then Exit;

    frmDFDocOutBoxEdit := TfrmDFDocOutBoxEdit.Create(Application, dsView);
    try
      frmDFDocOutBoxEdit.ShowModal;
    finally
      frmDFDocOutBoxEdit.Free;
      frmDFDocOutBoxEdit := nil;
    end;
  end;
end;

procedure TfrmENSheets4SOShow.actViewENServicesObjectExecute(Sender: TObject);
var
  ObjCode, servicesObjectCode: Integer;
  TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  try
    ObjCode := StrToInt(sgENSheets4SO.Cells[0, sgENSheets4SO.Row]);
  except
    on EConvertError do Exit;
  end;

  servicesObjectCode := Integer(sgENSheets4SO.Objects[ENSERVICESOBJECT_CODE_INDEX, sgENSheets4SO.Row]);
  if servicesObjectCode <= 0 then Exit;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  ENServicesConnectionObj := TempENServicesObject.getObject(servicesObjectCode);

  frmENServicesConnectionEdit := TfrmENServicesConnectionEdit.Create(Application, dsView);
  try
    frmENServicesConnectionEdit.priconnections := True;
    frmENServicesConnectionEdit.ShowModal;
  finally
    frmENServicesConnectionEdit.Free;
    frmENServicesConnectionEdit := nil;
  end;
end;

procedure TfrmENSheets4SOShow.actViewExecute(Sender: TObject);
var 
  TempENSheets4SO: ENSheets4SOControllerSoapPort;
begin
  TempENSheets4SO := HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;
  try
    ENSheets4SOObj := TempENSheets4SO.getObject(StrToInt(sgENSheets4SO.Cells[0,sgENSheets4SO.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSheets4SO.Row;
  frmENSheets4SOEdit:=TfrmENSheets4SOEdit.Create(Application, dsView);
  
  try
    frmENSheets4SOEdit.ShowModal;
  finally
    frmENSheets4SOEdit.Free;
    frmENSheets4SOEdit:=nil;
  end;

  if sgENSheets4SO.RowCount > selectedRow then
    sgENSheets4SO.Row := selectedRow
  else
    sgENSheets4SO.Row := sgENSheets4SO.RowCount - 1;
  
end;


procedure TfrmENSheets4SOShow.actEditExecute(Sender: TObject);
var 
  TempENSheets4SO: ENSheets4SOControllerSoapPort;
begin
  TempENSheets4SO := HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;
  try
    ENSheets4SOObj := TempENSheets4SO.getObject(StrToInt(sgENSheets4SO.Cells[0,sgENSheets4SO.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSheets4SO.Row;
  frmENSheets4SOEdit:=TfrmENSheets4SOEdit.Create(Application, dsEdit);
  
  try
    if frmENSheets4SOEdit.ShowModal= mrOk then
      begin
        //TempENSheets4SO.save(ENSheets4SOObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSheets4SOEdit.Free;
    frmENSheets4SOEdit:=nil;
  end;

  if sgENSheets4SO.RowCount > selectedRow then
    sgENSheets4SO.Row := selectedRow
  else
    sgENSheets4SO.Row := sgENSheets4SO.RowCount - 1;
  
end;


procedure TfrmENSheets4SOShow.actExcelExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox(PChar('Цей список може бути не повним (вибираються по 100 записів). Долистайте до кінця списку.' + #10#13 +
                                  'Зберегти в Excel?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) = IDOK then
  begin
    DMReports.exportGrid(sgENSheets4SO, 'Реєстр_листів');
  end;
end;

procedure TfrmENSheets4SOShow.actBatchPrintExecute(Sender: TObject);
var
  TempENSheets4SO: ENSheets4SOControllerSoapPort;
  sheetsFilter: ENSheets4SOFilter;
  sheetsList: ENSheets4SOShortList;
  i, sheetsCount, attachmentCode: Integer;
  condition: String;
begin
  sheetsFilter := ENSheets4SOFilter.Create;
  initFilter(sheetsFilter);

  condition := sheetsFilter.conditionSQL;
  AddCondition(condition, ' ensheets4so.dategen = to_date(''' + DateToStr(Date) + ''', ''dd.MM.yyyy'')');
  sheetsFilter.conditionSQL := condition;

  TempENSheets4SO := HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;

  sheetsList := TempENSheets4SO.getScrollableFilteredList(sheetsFilter, 0, -1);
  sheetsCount := High(sheetsList.list) + 1;

  if sheetsCount = 0 then
  begin
    Application.MessageBox(PChar('На поточну дату (' + DateToStr(Date) + ') не знайдено жодного листа!'),
                           PChar('Повідомлення'), MB_ICONINFORMATION);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте надрукувати всі листи (' + IntToStr(sheetsCount) +
                                  ' шт.) на поточну дату (' + DateToStr(Date) + ') ?' + #13#10 +
                                  'Це може зайняти деякий час та завантажити систему!'),
                            PChar('Увага!'),MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  for i := 0 to sheetsCount - 1 do
  begin
    Application.ProcessMessages;
    attachmentCode := sheetsList.list[i].attachmentCode;
    if attachmentCode <= 0 then Continue;
    DMReports.openENAttachment(attachmentCode, true);
    Sleep(5000);
  end;
end;

procedure TfrmENSheets4SOShow.actCreateNewSheetExecute(Sender: TObject);
var
  TempENSheets4SO: ENSheets4SOControllerSoapPort;
  servicesObjectCode: Integer;
  servicesObjectNumber: String;
  previousSheetCode: Integer;
begin
  try
    previousSheetCode := StrToInt(sgENSheets4SO.Cells[0, sgENSheets4SO.Row]);
  except
    on EConvertError do Exit;
  end;

  servicesObjectCode := Integer(sgENSheets4SO.Objects[ENSERVICESOBJECT_CODE_INDEX, sgENSheets4SO.Row]);
  if servicesObjectCode <= 0 then Exit;

  if not DMReports.checkLandSheetStageForServicesObject(servicesObjectCode) then
  begin
    Application.MessageBox(PChar('Для створення листа спочатку потрібно внести додатковий реквізит' +
                                 #13#10 + '"Номер стадії відведення земельної ділянки" (значення від 1 до 5)' +
                                 #13#10 + 'на договорі про приєднання!'),
                           PChar('Увага !'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  ENSheets4SOObj := ENSheets4SO.Create;
  SetNullIntProps(ENSheets4SOObj);
  SetNullXSProps(ENSheets4SOObj);
  ENSheets4SOObj.servicesobject := ENServicesObjectRef.Create;
  ENSheets4SOObj.servicesobject.code := servicesObjectCode;

  try
    frmENSheets4SOEdit := TfrmENSheets4SOEdit.Create(Application, dsInsert);
    try
      servicesObjectNumber := sgENSheets4SO.Cells[1, sgENSheets4SO.Row];
      frmENSheets4SOEdit.Caption := frmENSheets4SOEdit.Caption + ' (договір № ' + servicesObjectNumber + ')';
      frmENSheets4SOEdit.previousSheetCode := previousSheetCode;

      if frmENSheets4SOEdit.ShowModal = mrOk then
      begin
        if ENSheets4SOObj <> nil then
          UpdateGrid(Sender);
      end;
    finally
      frmENSheets4SOEdit.Free;
      frmENSheets4SOEdit := nil;
    end;
  finally
    ENSheets4SOObj.Free;
  end;
end;

procedure TfrmENSheets4SOShow.actDeleteExecute(Sender: TObject);
Var TempENSheets4SO: ENSheets4SOControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSheets4SO := HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSheets4SO.Cells[0,sgENSheets4SO.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Вихідні листи для договорів)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSheets4SO.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSheets4SOShow.actInsertExecute(Sender: TObject);
begin
  // Создание первого письма пока только из договора!
  EXIT;

  ENSheets4SOObj:=ENSheets4SO.Create;
  SetNullIntProps(ENSheets4SOObj);
  SetNullXSProps(ENSheets4SOObj);

  try
    frmENSheets4SOEdit:=TfrmENSheets4SOEdit.Create(Application, dsInsert);
    try
      if frmENSheets4SOEdit.ShowModal = mrOk then
      begin
        if ENSheets4SOObj<>nil then
            UpdateGrid(Sender);
      end;
    finally
      frmENSheets4SOEdit.Free;
      frmENSheets4SOEdit:=nil;
    end;
  finally
    ENSheets4SOObj.Free;
  end;
end;


procedure TfrmENSheets4SOShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSheets4SOShow.actFilterExecute(Sender: TObject);
begin
  frmENSheets4SOFilterEdit := TfrmENSheets4SOFilterEdit.Create(Application, dsInsert);
  try
    ENSheets4SOFilterObj := ENSheets4SOFilter.Create;
    SetNullIntProps(ENSheets4SOFilterObj);
    SetNullXSProps(ENSheets4SOFilterObj);

    //if FilterObject <> nil then
    //  ENSheets4SOFilterObj := ENSheets4SOFilter(FilterObject);
    initFilter(ENSheets4SOFilterObj);
    frmENSheets4SOFilterEdit.DisableControls([frmENSheets4SOFilterEdit.btnENSheet4SOType,
                                              frmENSheets4SOFilterEdit.spbSOValuesTypeClear]);

    if frmENSheets4SOFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSheets4SOFilter.Create;
      FilterObject := ENSheets4SOFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSheets4SOFilterEdit.Free;
    frmENSheets4SOFilterEdit := nil;
  end;
end;


procedure TfrmENSheets4SOShow.actGenerateForTodayExecute(Sender: TObject);
var
  TempENSheets4SO: ENSheets4SOControllerSoapPort;
  sheetsCount: Integer;
begin
  if Application.MessageBox(PChar('Буде автоматично сформовано листи, які потрібно відправити СЬОГОДНІ!' + #13#10 +
                                  'Продовжити?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  TempENSheets4SO := HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;
  sheetsCount := TempENSheets4SO.generateNextLandSheetsForToday;

  if sheetsCount > 0 then
  begin
    Application.MessageBox(PChar('Було сформовано нові листи в кількості ' + IntToStr(sheetsCount) + ' шт.'),
                           PChar('Увага!'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end
  else
    Application.MessageBox(PChar('Немає потреби у формуванні нових лістів (або їх вже було сформовано раніше)!'),
                           PChar('Увага!'), MB_ICONINFORMATION);
end;

procedure TfrmENSheets4SOShow.actNoFilterExecute(Sender: TObject);
begin
  {
  FilterObject.Free;
  FilterObject := nil;
  }
  FilterObject := ENSheets4SOFilter.Create;
  initFilter(ENSheets4SOFilter(FilterObject));

  selectedRow := 1;
  UpdateGrid(Sender);
end;

procedure TfrmENSheets4SOShow.actPrintExecute(Sender: TObject);
var
  ObjCode, attachmentCode: Integer;
begin
  try
    ObjCode := StrToInt(sgENSheets4SO.Cells[0, sgENSheets4SO.Row]);
  except
    on EConvertError do Exit;
  end;

  attachmentCode := Integer(sgENSheets4SO.Objects[ENATTACHMENT_CODE_INDEX, sgENSheets4SO.Row]);
  if attachmentCode <= 0 then Exit;
  DMReports.openENAttachment(attachmentCode, true);
end;

end.