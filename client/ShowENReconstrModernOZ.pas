
unit ShowENReconstrModernOZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENReconstrModernOZController , StrUtils, AdvObj, tmsAdvGridExcel  ;


type
  TfrmENReconstrModernOZShow = class(TChildForm)  
  HTTPRIOENReconstrModernOZ: THTTPRIO;
    ImageList1: TImageList;
    sgENReconstrModernOZ: TAdvStringGrid;
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
    actCreateOZ: TAction;
    miN5: TMenuItem;
    miCreateOZ: TMenuItem;
    actUnCreateOZ: TAction;
    miUnCreateOZ: TMenuItem;
    actmoveToOS: TAction;
    actunMoveToOS: TAction;
    mimoveToOS: TMenuItem;
    miunMoveToOS: TMenuItem;
    HTTPRIOENReconstrModern2OSData: THTTPRIO;
    actExportExcel: TAction;
    aeExcel: TAdvGridExcelIO;
    mniN5Line: TMenuItem;
    actExportExcel1: TMenuItem;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENReconstrModernOZTopLeftChanged(Sender: TObject);
procedure sgENReconstrModernOZDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actCreateOZExecute(Sender: TObject);
    procedure actUnCreateOZExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actmoveToOSExecute(Sender: TObject);
    procedure actunMoveToOSExecute(Sender: TObject);
    procedure sgENReconstrModernOZClick(Sender: TObject);
    procedure actExportExcelExecute(Sender: TObject);


  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENReconstrModernOZObj: ENReconstrModernOZ;
 // ENReconstrModernOZFilterObj: ENReconstrModernOZFilter;
  
  
implementation

uses Main, EditENReconstrModernOZ, EditENReconstrModernOZFilter, ENConsts,
  DateUtils, ENReconstrModern2OSDataController, Globals , ShellAPI,
  DMReportsUnit;


{$R *.dfm}

var
  //frmENReconstrModernOZShow : TfrmENReconstrModernOZShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENReconstrModernOZHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер документу'
          ,'Дата ОЗ-2'
          ,'Підрозділ'
          ,'Найменування об`єкта'
          ,'Фактична вартість'
       //   ,'Договірна вартість'
       //   ,'Виконав (ПІБ)'
          ,'Статус'
          ,'Користувач'
          ,'Дата останньої зміни'




        //  ,'Характеристика об`єкту'
        // ,'Виконавець (посада)'
        //  ,'Прийняв ( посада )'
        //  ,'Прийняв ( ПІБ )'
        // ,'Код особи яка відповідає за збереження ОЗ'

        //  ,'Код цеху'
        );
   

procedure TfrmENReconstrModernOZShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENReconstrModernOZShow:=nil;
    inherited;
  end;


procedure TfrmENReconstrModernOZShow.FormShow(Sender: TObject);
var
  TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
  i: Integer;
  ENReconstrModernOZList: ENReconstrModernOZShortList;
begin
  SetGridHeaders(ENReconstrModernOZHeaders, sgENReconstrModernOZ.ColumnHeaders);
  ColCount:=100;
  TempENReconstrModernOZ :=  HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENReconstrModernOZFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENReconstrModernOZFilter(FilterObject).orderBySQL := 'ENRECONSTRMODERNOZ.dategen desc, ENRECONSTRMODERNOZ.code desc';

  ENReconstrModernOZList := TempENReconstrModernOZ.getScrollableFilteredList(ENReconstrModernOZFilter(FilterObject),0,ColCount);


  LastCount:=High(ENReconstrModernOZList.list);

  if LastCount > -1 then
     sgENReconstrModernOZ.RowCount:=LastCount+2
  else
     sgENReconstrModernOZ.RowCount:=2;

   with sgENReconstrModernOZ do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENReconstrModernOZList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENReconstrModernOZList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENReconstrModernOZList.list[i].numbergen;
        if ENReconstrModernOZList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENReconstrModernOZList.list[i].dateGen);
        Cells[3,i+1] := ENReconstrModernOZList.list[i].departmentRefShortName;
        Cells[4,i+1] := ENReconstrModernOZList.list[i].nameOZ + ' ('+ ENReconstrModernOZList.list[i].invNumberOZ+ ')';

        if ENReconstrModernOZList.list[i].summaGen = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENReconstrModernOZList.list[i].summaGen.DecimalString;

        //if ENReconstrModernOZList.list[i].contractPrice = nil then
       //   Cells[6,i+1] := ''
        //else
        //  Cells[6,i+1] := ENReconstrModernOZList.list[i].contractPrice.DecimalString;
        //Cells[7,i+1] := ENReconstrModernOZList.list[i].executedName;

        Cells[6,i+1] := ENReconstrModernOZList.list[i].statusRefName;
        Cells[7,i+1] := ENReconstrModernOZList.list[i].userGen;

        if ENReconstrModernOZList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENReconstrModernOZList.list[i].dateEdit);


        LastRow:=i+1;
        sgENReconstrModernOZ.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENReconstrModernOZ.Row:=1;

   sgENReconstrModernOZClick(Sender);
end;

procedure TfrmENReconstrModernOZShow.sgENReconstrModernOZTopLeftChanged(Sender: TObject);
var
  TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
  i,CurrentRow: Integer;
  ENReconstrModernOZList: ENReconstrModernOZShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENReconstrModernOZ.TopRow + sgENReconstrModernOZ.VisibleRowCount) = ColCount
  then
    begin
      TempENReconstrModernOZ :=  HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
      CurrentRow:=sgENReconstrModernOZ.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENReconstrModernOZFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENReconstrModernOZFilter(FilterObject).orderBySQL := 'ENRECONSTRMODERNOZ.dategen desc, ENRECONSTRMODERNOZ.code desc';

  ENReconstrModernOZList := TempENReconstrModernOZ.getScrollableFilteredList(ENReconstrModernOZFilter(FilterObject),ColCount-1, 100);



  sgENReconstrModernOZ.RowCount:=sgENReconstrModernOZ.RowCount+100;
  LastCount:=High(ENReconstrModernOZList.list);
  with sgENReconstrModernOZ do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
         if ENReconstrModernOZList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENReconstrModernOZList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENReconstrModernOZList.list[i].numbergen;
        if ENReconstrModernOZList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENReconstrModernOZList.list[i].dateGen);
        Cells[3,i+CurrentRow] := ENReconstrModernOZList.list[i].departmentRefShortName;
        Cells[4,i+CurrentRow] := ENReconstrModernOZList.list[i].nameOZ + ' ('+ ENReconstrModernOZList.list[i].invNumberOZ+ ')';

        if ENReconstrModernOZList.list[i].summaGen = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENReconstrModernOZList.list[i].summaGen.DecimalString;
       // if ENReconstrModernOZList.list[i].contractPrice = nil then
       //   Cells[6,i+CurrentRow] := ''
       // else
        //  Cells[6,i+CurrentRow] := ENReconstrModernOZList.list[i].contractPrice.DecimalString;
        //Cells[7,i+CurrentRow] := ENReconstrModernOZList.list[i].executedName;

        Cells[6,i+CurrentRow] := ENReconstrModernOZList.list[i].statusRefName;
        Cells[7,i+CurrentRow] := ENReconstrModernOZList.list[i].userGen;

        if ENReconstrModernOZList.list[i].dateEdit = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDate2String(ENReconstrModernOZList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENReconstrModernOZ.Row:=CurrentRow-5;
   sgENReconstrModernOZ.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENReconstrModernOZShow.sgENReconstrModernOZDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENReconstrModernOZ,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENReconstrModernOZShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENReconstrModernOZ.RowCount-1 do
   for j:=0 to sgENReconstrModernOZ.ColCount-1 do
     sgENReconstrModernOZ.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENReconstrModernOZShow.actViewExecute(Sender: TObject);
Var TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
begin
  frmENReconstrModernOZEdit := TfrmENReconstrModernOZEdit.Create(Application, dsView);
  try
    TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
    try
      frmENReconstrModernOZEdit.ENReconstrModernOZObj := TempENReconstrModernOZ.getObject(StrToInt(sgENReconstrModernOZ.Cells[0, sgENReconstrModernOZ.Row]));
    except
      on EConvertError do Exit;
    end;
    frmENReconstrModernOZEdit.ShowModal;
  finally
    frmENReconstrModernOZEdit.Free;
    frmENReconstrModernOZEdit := nil;
  end;
end;

procedure TfrmENReconstrModernOZShow.actEditExecute(Sender: TObject);
Var TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
begin
  frmENReconstrModernOZEdit := TfrmENReconstrModernOZEdit.Create(Application, dsEdit);
  try
    TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
    try
      frmENReconstrModernOZEdit.ENReconstrModernOZObj := TempENReconstrModernOZ.getObject(StrToInt(sgENReconstrModernOZ.Cells[0,sgENReconstrModernOZ.Row]));
    except
      on EConvertError do Exit;
    end;

    if (frmENReconstrModernOZEdit.ENReconstrModernOZObj.statusRef.code <> ENRECONSTRMODERNOZ_STATUS_DRAFT) then
    begin
      Application.MessageBox(PChar(' Документ ОЗ-2 редагується тільки в черновому статусі!!! '),
                             PChar('Увага !'), MB_ICONWARNING );
      Exit;
    end;

    if frmENReconstrModernOZEdit.ShowModal = mrOk then
      UpdateGrid(Sender);
  finally
    frmENReconstrModernOZEdit.Free;
    frmENReconstrModernOZEdit := nil;
  end;
end;

procedure TfrmENReconstrModernOZShow.actExportExcelExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName('request') + '.xls';

    aeExcel.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;

end;

procedure TfrmENReconstrModernOZShow.actDeleteExecute(Sender: TObject);
Var TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
  ObjCode: Integer;
begin
 TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
   try
     ObjCode := StrToInt(sgENReconstrModernOZ.Cells[0,sgENReconstrModernOZ.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Реконструкція модернізація Основних засобів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENReconstrModernOZ.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENReconstrModernOZShow.actInsertExecute(Sender: TObject);
begin
  frmENReconstrModernOZEdit := TfrmENReconstrModernOZEdit.Create(Application, dsInsert);
  try
    frmENReconstrModernOZEdit.ENReconstrModernOZObj := ENReconstrModernOZ.Create;
    if frmENReconstrModernOZEdit.ShowModal = mrOk then
    begin
      if frmENReconstrModernOZEdit.ENReconstrModernOZObj <> nil then
        UpdateGrid(Sender);
    end;
  finally
    frmENReconstrModernOZEdit.Free;
    frmENReconstrModernOZEdit := nil;
  end;
end;

procedure TfrmENReconstrModernOZShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENReconstrModernOZShow.actFilterExecute(Sender: TObject);
begin
frmENReconstrModernOZFilterEdit:=TfrmENReconstrModernOZFilterEdit.Create(Application, dsInsert);
  try
    ENReconstrModernOZFilterObj := ENReconstrModernOZFilter.Create;
    SetNullIntProps(ENReconstrModernOZFilterObj);
    SetNullXSProps(ENReconstrModernOZFilterObj);

    if frmENReconstrModernOZFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENReconstrModernOZFilter.Create;
      FilterObject := ENReconstrModernOZFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENReconstrModernOZFilterEdit.Free;
    frmENReconstrModernOZFilterEdit:=nil;
  end;
end;

procedure TfrmENReconstrModernOZShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENReconstrModernOZShow.actCreateOZExecute(Sender: TObject);
var TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
    ObjCode : Integer;
    obj : ENReconstrModernOZ;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити статус на "Складений" ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
begin
    try
     ObjCode := StrToInt(sgENReconstrModernOZ.Cells[0,sgENReconstrModernOZ.Row]);
    except
     on EConvertError do Exit;
    end;

    TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
    obj := TempENReconstrModernOZ.getObject(ObjCode);

    TempENReconstrModernOZ.createOZ(ObjCode);

    UpdateGrid(Sender);
end;
end;

procedure TfrmENReconstrModernOZShow.actUnCreateOZExecute(Sender: TObject);
var TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
    ObjCode : Integer;
    obj : ENReconstrModernOZ;
    TempENReconstrModern2OSData: ENReconstrModern2OSDataControllerSoapPort;
    osDataFilter: ENReconstrModern2OSDataFilter;
    osDataList: ENReconstrModern2OSDataShortList;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити статус на "Черновий" ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
begin

  

   osDataFilter := ENReconstrModern2OSDataFilter.Create;
   SetNullIntProps(osDataFilter);
   SetNullXSProps(osDataFilter);

   osDataFilter.ENReconstrModernOZRef := ENReconstrModernOZRef.Create;
   osDataFilter.ENReconstrModernOZRef.code :=   StrToInt(sgENReconstrModernOZ.Cells[0,sgENReconstrModernOZ.Row]);
   TempENReconstrModern2OSData := HTTPRIOENReconstrModern2OSData as ENReconstrModern2OSDataControllerSoapPort;
   osDataList := TempENReconstrModern2OSData.getScrollableFilteredList(osDataFilter, 0, -1);

    if osDataList.totalCount > 0 then
     if Application.MessageBox(PChar(' При відміні складання документу ОЗ-2 видаляться бух.дані. Продовжити відміну складання?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDCANCEL then
        Exit;


    try
     ObjCode := StrToInt(sgENReconstrModernOZ.Cells[0,sgENReconstrModernOZ.Row]);
    except
     on EConvertError do Exit;
    end;

    TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
    obj := TempENReconstrModernOZ.getObject(ObjCode);

    TempENReconstrModernOZ.unCreateOZ(ObjCode);

    UpdateGrid(Sender);
end;
end;

procedure TfrmENReconstrModernOZShow.PopupMenu1Popup(Sender: TObject);
var
  ozObj : ENReconstrModernOZ;
  ObjCode : Integer;
  TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
begin

   try
     ObjCode := StrToInt(sgENReconstrModernOZ.Cells[0,sgENReconstrModernOZ.Row]);
   except
     on EConvertError do Exit;
   end;

   TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
   ozObj := TempENReconstrModernOZ.getObject(ObjCode);

   if  ozObj = nil  then Exit;


   begin
      actEdit.Enabled := (ozObj.statusRef.code = ENRECONSTRMODERNOZ_STATUS_DRAFT);
      actDelete.Enabled := (ozObj.statusRef.code = ENRECONSTRMODERNOZ_STATUS_DRAFT);
      actCreateOZ.Enabled := (ozObj.statusRef.code = ENRECONSTRMODERNOZ_STATUS_DRAFT);
      actUnCreateOZ.Enabled := (ozObj.statusRef.code = ENRECONSTRMODERNOZ_STATUS_SIGNED);
      actmoveToOS .Enabled := (ozObj.statusRef.code = ENRECONSTRMODERNOZ_STATUS_SIGNED);
      actunMoveToOS.Enabled := (ozObj.statusRef.code = ENRECONSTRMODERNOZ_STATUS_CLOSE);
   end;
end;

procedure TfrmENReconstrModernOZShow.actmoveToOSExecute(Sender: TObject);
var TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
    ObjCode : Integer;
    obj : ENReconstrModernOZ;
    buhDate : TDateTime;
    monthDocOZ , monthCurrentOS:Word;
    characteristicOS  , characteristicNet , characteristicResult: string;

begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте провести документ в ОЗ ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
begin
    try
     ObjCode := StrToInt(sgENReconstrModernOZ.Cells[0,sgENReconstrModernOZ.Row]);
    except
     on EConvertError do Exit;
    end;


    TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;

         // проверка текущей бух даты в ОС
    buhDate := TempENReconstrModernOZ.getCurrentBuhDateOS();

    // ShowMessage( DateTimeToStr(buhDate) );
    obj := TempENReconstrModernOZ.getObject(ObjCode);

    //// !!! 14.01.13 Тут не так надо... нужно не месяца между собой сравнивать,
    //   а даты (всегда первое число)!!! Потому что, если, например, у нас дата документа будет '15.12.2012',
    //   а бух. дата - '14.01.13', то в итоге мы сравним 12 с 1 и проверка не сработает
    //   (а нужно сравнивать 2 даты - '01.12.2012' и '01.01.2013'!!!)
    monthDocOZ := obj.dateGen.Month;
    monthCurrentOS := MonthOfTheYear(buhDate);

    if monthDocOZ < monthCurrentOS then
      if Application.MessageBox(PChar('Місяць дати ОЗ-2 ОС: ' + vartostr(monthDocOZ)  + ' меньше поточного бухгалтерського місяця ' + vartostr(monthCurrentOS) + '. Провести доввод поточною бухгалтерською датою ?' ),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDCANCEL then
      exit;

     characteristicOS :=  Trim(StringReplace(TempENReconstrModernOZ.getObjectCharacteristicsFromOS(obj.invNumberOZ), #10,#13#10,[rfReplaceAll]));
     characteristicNet := // Trim(obj.characteristic);
                               // PChar(AnsiReplaceStr(Trim(obj.characteristic), chr(13), chr(10)+chr(13)));
                                Trim(StringReplace(obj.characteristic, #10,#13#10,[rfReplaceAll]));

       if Length(characteristicOS)+Length(characteristicNet)+2 > 4000 then
      if Application.MessageBox(PChar('Кількість символів в полі "Зміни в характеристиці ОЗ" забагато для передачі характеристики об`єкта в програму ОС !. Продовжити проведення довводу ? При цьому характеристика буде автоматично зменшена до 4000 символів!!!  '),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDCANCEL then
      exit;

     characteristicResult := characteristicOS + ' ' + characteristicNet;
     characteristicResult := Copy(characteristicResult,0,4000);




    TempENReconstrModernOZ.moveToOS(ObjCode);

    UpdateGrid(Sender);
end;
end;

procedure TfrmENReconstrModernOZShow.actunMoveToOSExecute(Sender: TObject);
var TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
    ObjCode : Integer;
    obj : ENReconstrModernOZ;
    buhDate : TDateTime;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити проведення документа з ОЗ ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    try
      ObjCode := StrToInt(sgENReconstrModernOZ.Cells[0,sgENReconstrModernOZ.Row]);
    except
      on EConvertError do Exit;
    end;

    TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;

    // проверка текущей бух даты в ОС
    buhDate := TempENReconstrModernOZ.getCurrentBuhDateOS();

    obj := TempENReconstrModernOZ.getObject(ObjCode);

    // Для документов, подписанных с помощью ЭЦП, вызываем свой метод отмены проведения
    // (чтобы были отдельные права, потому что их могут проводить/отменять проведение
    // все подряд, а старые - только бухгалтера)
    if DMReports.getDocCodeForObject(obj) > 0 then
      TempENReconstrModernOZ.unMoveToOSByEcp(ObjCode)
    else
      TempENReconstrModernOZ.unMoveToOS(ObjCode);

    UpdateGrid(Sender);
end;
end;

procedure TfrmENReconstrModernOZShow.sgENReconstrModernOZClick(
  Sender: TObject);
var
  ozObj : ENReconstrModernOZ;
  ObjCode : Integer;
  TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
begin

   try
     ObjCode := StrToInt(sgENReconstrModernOZ.Cells[0,sgENReconstrModernOZ.Row]);
   except
     on EConvertError do Exit;
   end;

   TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
   ozObj := TempENReconstrModernOZ.getObject(ObjCode);

   if  ozObj = nil  then Exit;


   begin
      actEdit.Enabled := (ozObj.statusRef.code = ENRECONSTRMODERNOZ_STATUS_DRAFT);
      actDelete.Enabled := (ozObj.statusRef.code = ENRECONSTRMODERNOZ_STATUS_DRAFT);
      
   end;
end;

end.
