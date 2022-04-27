
unit ShowENBuilding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENBuildingController, AdvObj ;


type
    TfrmENBuildingShow = class(TChildForm)
    HTTPRIOENBuilding: THTTPRIO;
    ImageList1: TImageList;
    sgENBuilding: TAdvStringGrid;
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
    actUnCreateOZ: TAction;
    actmoveToOS: TAction;
    actunMoveToOS: TAction;
    HTTPRIOENBuilding2OSData: THTTPRIO;
    HTTPRIOENReconstrModernOZ: THTTPRIO;
    miCreateOZ: TMenuItem;
    miUnCreateOZ: TMenuItem;
    miMoveOZ: TMenuItem;
    miUnMoveOZ: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENBuildingTopLeftChanged(Sender: TObject);
    procedure sgENBuildingDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actCreateOZExecute(Sender: TObject);
    procedure actUnCreateOZExecute(Sender: TObject);
    procedure actmoveToOSExecute(Sender: TObject);
    procedure actunMoveToOSExecute(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;


var
  frmENBuildingShow: TfrmENBuildingShow;
  
  
implementation

uses Main, EditENBuilding, EditENBuildingFilter, ENBuilding2OSDataController,
  ENReconstrModernOZController , DateUtils , ENConsts;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBuildingHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер документу'
          ,'Дата документу'
          ,'Найменування основного засобу'
          ,'Інвентарний номер'
          ,'Фактична вартість без НДС'
          ,'НДС '
          ,'Статус'
          ,'Характеристика об`єкту'
          ,'Дата введення в експлуатацію'
          ,'Дата випуску'
        );


        ENBuildingHeadersdef: array [1..31] of String =
        ( 'Код'
          ,'Номер документу'
          ,'Дата документу'
          ,'Дата останньої зміни'
          ,'Фактична вартість без НДС'
          ,'НДС '
          ,'Статус'
          ,'Характеристика об`єкту'
          ,'Виконавець (посада)'
          ,'Виконавець (ПІБ)'
          ,'Прийняв ( посада )'
          ,'Прийняв ( ПІБ )'
          ,'Договірна вартість'
          ,'Код особи яка відповідає за збереження ОЗ'
          ,'Код цеху'
          ,'Інвентарний номер'
          ,'Найменування основного засобу'
          ,'Номер договору ФИН'
          ,'Дата додговору фин'
          ,'Найменування організації'
          ,'код організації'
          ,'Признак инвест программа(0/1)'
          ,'Рік інвест програми'
          ,'Пункт інвест програми'
          ,'Адреса будівництва'
          ,'номер наказа/Розпорядження'
          ,'Дата наказа/Розпорядження'
          ,'Термін експлуатації(місяці)'
          ,'Дата введення в експлуатацію'
          ,'Дата випуску'
          ,'користувач'
        );
   

procedure TfrmENBuildingShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENBuildingShow:=nil;
  inherited;
end;


procedure TfrmENBuildingShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENBuildingShow.FormShow(Sender: TObject);
var
  TempENBuilding: ENBuildingControllerSoapPort;
  i: Integer;
  ENBuildingList: ENBuildingShortList;
begin
  SetGridHeaders(ENBuildingHeaders, sgENBuilding.ColumnHeaders);
  ColCount:=100;
  TempENBuilding :=  HTTPRIOENBuilding as ENBuildingControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBuildingFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuildingList := TempENBuilding.getScrollableFilteredList(ENBuildingFilter(FilterObject),0,ColCount);
  LastCount:=High(ENBuildingList.list);

  if LastCount > -1 then
     sgENBuilding.RowCount:=LastCount+2
  else
     sgENBuilding.RowCount:=2;

   with sgENBuilding do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuildingList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuildingList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENBuildingList.list[i].numbergen;

        if ENBuildingList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENBuildingList.list[i].dateGen);

        Cells[3,i+1] := ENBuildingList.list[i].nameOZ;
        Cells[4,i+1] := ENBuildingList.list[i].invNumberOZ;


        if ENBuildingList.list[i].summaGen = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENBuildingList.list[i].summaGen.DecimalString;

        if ENBuildingList.list[i].summaNDS = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENBuildingList.list[i].summaNDS.DecimalString;

        Cells[7,i+1] := ENBuildingList.list[i].statusRefName;
        Cells[8,i+1] := ENBuildingList.list[i].characteristic;



        if ENBuildingList.list[i].dateLoadExpl = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(ENBuildingList.list[i].dateLoadExpl);
        if ENBuildingList.list[i].dateBuild = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDate2String(ENBuildingList.list[i].dateBuild);

        LastRow:=i+1;
        sgENBuilding.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENBuilding.Row:=1;

    if selectedRow <> 0 then
    begin
    if sgENBuilding.RowCount > selectedRow then
      sgENBuilding.Row := selectedRow
    else
      sgENBuilding.Row := sgENBuilding.RowCount - 1;
    end
    else
      sgENBuilding.Row:=1;
end;

{procedure TfrmENBuildingShow.FormShow(Sender: TObject);
var
  TempENBuilding: ENBuildingControllerSoapPort;
  i: Integer;
  ENBuildingList: ENBuildingShortList;
begin
  SetGridHeaders(ENBuildingHeaders, sgENBuilding.ColumnHeaders);
  ColCount:=100;
  TempENBuilding :=  HTTPRIOENBuilding as ENBuildingControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBuildingFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuildingList := TempENBuilding.getScrollableFilteredList(ENBuildingFilter(FilterObject),0,ColCount);
  LastCount:=High(ENBuildingList.list);

  if LastCount > -1 then
     sgENBuilding.RowCount:=LastCount+2
  else
     sgENBuilding.RowCount:=2;

   with sgENBuilding do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuildingList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuildingList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBuildingList.list[i].numbergen;
        if ENBuildingList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENBuildingList.list[i].dateGen);
        if ENBuildingList.list[i].dateEdit = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENBuildingList.list[i].dateEdit);
        if ENBuildingList.list[i].summaGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENBuildingList.list[i].summaGen.DecimalString;
        if ENBuildingList.list[i].summaNDS = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENBuildingList.list[i].summaNDS.DecimalString;
        Cells[6,i+1] := ENBuildingList.list[i].statusRefName;
        Cells[7,i+1] := ENBuildingList.list[i].characteristic;
        Cells[8,i+1] := ENBuildingList.list[i].executedPosition;
        Cells[9,i+1] := ENBuildingList.list[i].executedName;
        Cells[10,i+1] := ENBuildingList.list[i].acceptedPosition;
        Cells[11,i+1] := ENBuildingList.list[i].acceptedName;
        if ENBuildingList.list[i].contractPrice = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := ENBuildingList.list[i].contractPrice.DecimalString;
        Cells[13,i+1] := ENBuildingList.list[i].codeMol;
        Cells[14,i+1] := ENBuildingList.list[i].codePodr;
        Cells[15,i+1] := ENBuildingList.list[i].invNumberOZ;
        Cells[16,i+1] := ENBuildingList.list[i].nameOZ;
        Cells[17,i+1] := ENBuildingList.list[i].finContractNumber;
        if ENBuildingList.list[i].finContractDate = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := XSDate2String(ENBuildingList.list[i].finContractDate);
        Cells[19,i+1] := ENBuildingList.list[i].partnerName;
        Cells[20,i+1] := ENBuildingList.list[i].partnerCode;
        if ENBuildingList.list[i].isInvestProgram = Low(Integer) then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := IntToStr(ENBuildingList.list[i].isInvestProgram);
        Cells[22,i+1] := ENBuildingList.list[i].yearInvestProgram;
        Cells[23,i+1] := ENBuildingList.list[i].itemInvestProgram;
        Cells[24,i+1] := ENBuildingList.list[i].buildingAddress;
        Cells[25,i+1] := ENBuildingList.list[i].decreeNumber;
        if ENBuildingList.list[i].decreeDate = nil then
          Cells[26,i+1] := ''
        else
          Cells[26,i+1] := XSDate2String(ENBuildingList.list[i].decreeDate);
        if ENBuildingList.list[i].exploitationTerm = Low(Integer) then
          Cells[27,i+1] := ''
        else
          Cells[27,i+1] := IntToStr(ENBuildingList.list[i].exploitationTerm);
        if ENBuildingList.list[i].dateLoadExpl = nil then
          Cells[28,i+1] := ''
        else
          Cells[28,i+1] := XSDate2String(ENBuildingList.list[i].dateLoadExpl);
        if ENBuildingList.list[i].dateBuild = nil then
          Cells[29,i+1] := ''
        else
          Cells[29,i+1] := XSDate2String(ENBuildingList.list[i].dateBuild);
        Cells[30,i+1] := ENBuildingList.list[i].userGen;
        LastRow:=i+1;
        sgENBuilding.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENBuilding.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENBuilding.RowCount > selectedRow then
      sgENBuilding.Row := selectedRow
    else
      sgENBuilding.Row := sgENBuilding.RowCount - 1;
    end
    else
      sgENBuilding.Row:=1;   
end; }


procedure TfrmENBuildingShow.sgENBuildingTopLeftChanged(Sender: TObject);
var
  TempENBuilding: ENBuildingControllerSoapPort;
  i,CurrentRow: Integer;
  ENBuildingList: ENBuildingShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBuilding.TopRow + sgENBuilding.VisibleRowCount) = ColCount
  then
    begin
      TempENBuilding :=  HTTPRIOENBuilding as ENBuildingControllerSoapPort;
      CurrentRow:=sgENBuilding.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBuildingFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuildingList := TempENBuilding.getScrollableFilteredList(ENBuildingFilter(FilterObject),ColCount-1, 100);


  sgENBuilding.RowCount:=sgENBuilding.RowCount+100;
  LastCount:=High(ENBuildingList.list);
  with sgENBuilding do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuildingList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBuildingList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENBuildingList.list[i].numbergen;

        if ENBuildingList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENBuildingList.list[i].dateGen);

        Cells[3,i+CurrentRow] := ENBuildingList.list[i].nameOZ;
        Cells[4,i+CurrentRow] := ENBuildingList.list[i].invNumberOZ;


        if ENBuildingList.list[i].summaGen = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENBuildingList.list[i].summaGen.DecimalString;

        if ENBuildingList.list[i].summaNDS = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENBuildingList.list[i].summaNDS.DecimalString;

        Cells[7,i+CurrentRow] := ENBuildingList.list[i].statusRefName;
        Cells[8,i+CurrentRow] := ENBuildingList.list[i].characteristic;



        if ENBuildingList.list[i].dateLoadExpl = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDate2String(ENBuildingList.list[i].dateLoadExpl);
        if ENBuildingList.list[i].dateBuild = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := XSDate2String(ENBuildingList.list[i].dateBuild);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBuilding.Row:=CurrentRow-5;
   sgENBuilding.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBuildingShow.sgENBuildingDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBuilding,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENBuildingShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENBuilding.RowCount-1 do
   for j:=0 to sgENBuilding.ColCount-1 do
     sgENBuilding.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENBuildingShow.actViewExecute(Sender: TObject);
var 
  TempENBuilding: ENBuildingControllerSoapPort;
begin
  TempENBuilding := HTTPRIOENBuilding as ENBuildingControllerSoapPort;
  try
    ENBuildingObj := TempENBuilding.getObject(StrToInt(sgENBuilding.Cells[0,sgENBuilding.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBuilding.Row;
  frmENBuildingEdit:=TfrmENBuildingEdit.Create(Application, dsView);
  
  try
    frmENBuildingEdit.ShowModal;
  finally
    frmENBuildingEdit.Free;
    frmENBuildingEdit:=nil;
  end;

  if sgENBuilding.RowCount > selectedRow then
    sgENBuilding.Row := selectedRow
  else
    sgENBuilding.Row := sgENBuilding.RowCount - 1;
  
end;


procedure TfrmENBuildingShow.actEditExecute(Sender: TObject);
var 
  TempENBuilding: ENBuildingControllerSoapPort;
begin
  TempENBuilding := HTTPRIOENBuilding as ENBuildingControllerSoapPort;
  try
    ENBuildingObj := TempENBuilding.getObject(StrToInt(sgENBuilding.Cells[0,sgENBuilding.Row]));
  except
    on EConvertError do Exit;
  end;

  if (ENBuildingObj.statusRef.code <> ENBUILDING_STATUS_DRAFT) then
  begin
    Application.MessageBox(PChar('Редагувати складені або проведені документи не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  
  selectedRow := sgENBuilding.Row;
  frmENBuildingEdit:=TfrmENBuildingEdit.Create(Application, dsEdit);
  
  try
    if frmENBuildingEdit.ShowModal= mrOk then
      begin
        //TempENBuilding.save(ENBuildingObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBuildingEdit.Free;
    frmENBuildingEdit:=nil;
  end;

  if sgENBuilding.RowCount > selectedRow then
    sgENBuilding.Row := selectedRow
  else
    sgENBuilding.Row := sgENBuilding.RowCount - 1;
  
end;


procedure TfrmENBuildingShow.actCreateOZExecute(Sender: TObject);
var TempENbuilding: ENBuildingControllerSoapPort;
    ObjCode : Integer;
    obj : ENBuilding;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити статус на "Складений" ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
begin
    try
     ObjCode := StrToInt(sgENBuilding.Cells[0,sgENBuilding.Row]);
    except
     on EConvertError do Exit;
    end;

    TempENbuilding := HTTPRIOENbuilding as ENBUildingControllerSoapPort;
    obj := TempENbuilding.getObject(ObjCode);

    TempENbuilding.createOZ(ObjCode);

    UpdateGrid(Sender);
end;
end;

procedure TfrmENBuildingShow.actDeleteExecute(Sender: TObject);
Var TempENBuilding: ENBuildingControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBuilding := HTTPRIOENBuilding as ENBuildingControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBuilding.Cells[0,sgENBuilding.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Нове будівництво)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBuilding.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBuildingShow.actInsertExecute(Sender: TObject);
// Var TempENBuilding: ENBuildingControllerSoapPort; 
begin
  // TempENBuilding := HTTPRIOENBuilding as ENBuildingControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBuildingObj:=ENBuilding.Create;
  SetNullIntProps(ENBuildingObj);
  SetNullXSProps(ENBuildingObj);

   //ENBuildingObj.dateGen:= TXSDate.Create;
   //ENBuildingObj.dateEdit:= TXSDate.Create;
   //ENBuildingObj.summaGen:= TXSDecimal.Create;
   //ENBuildingObj.summaNDS:= TXSDecimal.Create;
   //ENBuildingObj.contractPrice:= TXSDecimal.Create;
   //ENBuildingObj.finContractDate:= TXSDate.Create;
   //ENBuildingObj.decreeDate:= TXSDate.Create;
   //ENBuildingObj.dateLoadExpl:= TXSDate.Create;
   //ENBuildingObj.dateBuild:= TXSDate.Create;


  try
    frmENBuildingEdit:=TfrmENBuildingEdit.Create(Application, dsInsert);
    try
      if frmENBuildingEdit.ShowModal = mrOk then
      begin
        if ENBuildingObj<>nil then
            //TempENBuilding.add(ENBuildingObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBuildingEdit.Free;
      frmENBuildingEdit:=nil;
    end;
  finally
    ENBuildingObj.Free;
  end;
end;


procedure TfrmENBuildingShow.actmoveToOSExecute(Sender: TObject);
var TempENBuilding: ENBuildingControllerSoapPort;
    ObjCode : Integer;
    obj : ENBuilding;
    buhDate : TDateTime;
    monthDocOZ , monthCurrentOS:Word;
    characteristicOS  , characteristicNet , characteristicResult: string;

    TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте провести документ в ОЗ ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
begin
    try
     ObjCode := StrToInt(sgENBuilding.Cells[0,sgENBuilding.Row]);
    except
     on EConvertError do Exit;
    end;


    TempENBuilding := HTTPRIOENBuilding as ENBuildingControllerSoapPort;

    TempENReconstrModernOZ :=  HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;

         // проверка текущей бух даты в ОС
    buhDate := TempENReconstrModernOZ.getCurrentBuhDateOS();

    // ShowMessage( DateTimeToStr(buhDate) );
    obj := TempENBuilding.getObject(ObjCode);

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

     //characteristicOS :=  Trim(StringReplace(TempENBuilding.getObjectCharacteristicsFromOS(obj.invNumberOZ), #10,#13#10,[rfReplaceAll]));
     characteristicNet := // Trim(obj.characteristic);
                               // PChar(AnsiReplaceStr(Trim(obj.characteristic), chr(13), chr(10)+chr(13)));
                                Trim(StringReplace(obj.characteristic, #10,#13#10,[rfReplaceAll]));

       if Length(characteristicOS)+Length(characteristicNet)+2 > 4000 then
      if Application.MessageBox(PChar('Кількість символів в полі "Зміни в характеристиці ОЗ" забагато для передачі характеристики об`єкта в програму ОС !. Продовжити проведення довводу ? При цьому характеристика буде автоматично зменшена до 4000 символів!!!  '),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDCANCEL then
      exit;

     characteristicResult := characteristicOS + ' ' + characteristicNet;
     characteristicResult := Copy(characteristicResult,0,4000);




    TempENBuilding.moveToOS(ObjCode);

    UpdateGrid(Sender);
end;
end;

procedure TfrmENBuildingShow.actUnCreateOZExecute(Sender: TObject);
var TempENBuilding: ENBuildingControllerSoapPort;
    ObjCode : Integer;
    obj : ENBuilding;
    TempEnBuilding2OSData: ENBuilding2OSDataControllerSoapPort;
    osDataFilter: ENBuilding2OSDataFilter;
    osDataList: ENBuilding2OSDataShortList;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити статус на "Черновий" ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
begin



   osDataFilter := ENBuilding2OSDataFilter.Create;
   SetNullIntProps(osDataFilter);
   SetNullXSProps(osDataFilter);

   osDataFilter.ENBuildingRef := ENBuildingRef.Create;
   osDataFilter.ENBuildingRef.code :=   StrToInt(sgENBuilding.Cells[0,sgENBuilding.Row]);
   TempENBuilding2OSData := HTTPRIOENBuilding2OSData as ENBuilding2OSDataControllerSoapPort;
   osDataList := TempENBuilding2OSData.getScrollableFilteredList(osDataFilter, 0, -1);

    if osDataList.totalCount > 0 then
     if Application.MessageBox(PChar(' При відміні складання документу ОЗ-2 видаляться бух.дані. Продовжити відміну складання?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDCANCEL then
        Exit;


    try
     ObjCode := StrToInt(sgENBuilding.Cells[0,sgENBuilding.Row]);
    except
     on EConvertError do Exit;
    end;

    TempENBuilding := HTTPRIOENBuilding as ENBuildingControllerSoapPort;
    obj := TempENBuilding.getObject(ObjCode);

    TempENBuilding.unCreateOZ(ObjCode);

    UpdateGrid(Sender);
end;
end;

procedure TfrmENBuildingShow.actunMoveToOSExecute(Sender: TObject);
var TempENBuilding: ENBuildingControllerSoapPort;
    ObjCode : Integer;
    obj : ENBuilding;
    buhDate : TDateTime;
    TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити проведення документа з ОЗ ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
begin
    try
     ObjCode := StrToInt(sgENBuilding.Cells[0,sgENBuilding.Row]);
    except
     on EConvertError do Exit;
    end;


    TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
    TempENBuilding := HTTPRIOENBuilding as ENBuildingControllerSoapPort;

     // проверка текущей бух даты в ОС
    buhDate := TempENReconstrModernOZ.getCurrentBuhDateOS();

    obj := TempENBuilding.getObject(ObjCode);

    TempENBuilding.unMoveToOS(ObjCode);

    UpdateGrid(Sender);
end;
end;

procedure TfrmENBuildingShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENBuildingShow.actFilterExecute(Sender: TObject);
begin
frmENBuildingFilterEdit:=TfrmENBuildingFilterEdit.Create(Application, dsInsert);
  try
    ENBuildingFilterObj := ENBuildingFilter.Create;
    SetNullIntProps(ENBuildingFilterObj);
    SetNullXSProps(ENBuildingFilterObj);

    if frmENBuildingFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENBuildingFilter.Create;
      FilterObject := ENBuildingFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBuildingFilterEdit.Free;
    frmENBuildingFilterEdit:=nil;
  end;
end;


procedure TfrmENBuildingShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.