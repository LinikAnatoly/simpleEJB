
unit ShowENInvestProgram;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENInvestProgramController, AdvObj ;


type
  TfrmENInvestProgramShow = class(TChildForm)  
  HTTPRIOENInvestProgram: THTTPRIO;
    ImageList1: TImageList;
    sgENInvestProgram: TAdvStringGrid;
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
    actSetFinancingCompleted: TAction;
    N5: TMenuItem;
    N9: TMenuItem;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENInvestProgramTopLeftChanged(Sender: TObject);
procedure sgENInvestProgramDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actSetFinancingCompletedExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENInvestProgramObj: ENInvestProgram;
 // ENInvestProgramFilterObj: ENInvestProgramFilter;
  
  
implementation

uses Main, EditENInvestProgram, EditENInvestProgramFilter, ENConsts;


{$R *.dfm}

var
  //frmENInvestProgramShow : TfrmENInvestProgramShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENInvestProgramHeaders: array [1..19] of String =
        ( 'Код'
          ,'Об''єкт'
          ,'Найменування'
          ,'Рік ІП'
          //,'Примітка'
          ,'Бюджетотримач'
          ,'Вид робіт'
          ,'Од. вим.'
          ,'Кільк. (рік)'
          ,'Ціна, тис. грн. з ПДВ (рік)'
          ,'Сума, тис. грн. з ПДВ (рік)'
          ,'Кільк. (I кв.)'
          ,'Сума, тис. грн. з ПДВ (I кв.)'
          ,'Кільк. (II кв.)'
          ,'Сума, тис. грн. з ПДВ (II кв.)'
          ,'Кільк. (III кв.)'
          ,'Сума, тис. грн. з ПДВ (III кв.)'
          ,'Кільк. (IV кв.)'
          ,'Сума, тис. грн. з ПДВ (IV кв.)'
          ,'Статус'
          //,'Користувач, який створив запис'
          //,'Дата створення'
          //,'Користувач, який вніс зміни'
          //,'Дата зміни'
        );
   

procedure TfrmENInvestProgramShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENInvestProgramShow:=nil;
    inherited;
  end;


procedure TfrmENInvestProgramShow.FormShow(Sender: TObject);
var
  TempENInvestProgram: ENInvestProgramControllerSoapPort;
  i: Integer;
  ENInvestProgramList: ENInvestProgramShortList;
begin
  SetGridHeaders(ENInvestProgramHeaders, sgENInvestProgram.ColumnHeaders);
  ColCount:=100;
  TempENInvestProgram :=  HTTPRIOENInvestProgram as ENInvestProgramControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENInvestProgramFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENInvestProgramList := TempENInvestProgram.getScrollableFilteredList(ENInvestProgramFilter(FilterObject),0,ColCount);

  LastCount:=High(ENInvestProgramList.list);

  if LastCount > -1 then
     sgENInvestProgram.RowCount:=LastCount+2
  else
     sgENInvestProgram.RowCount:=2;

{
  ENInvestProgramHeaders: array [1..18] of String =
        ( 'Код'
          ,'Об''єкт'
          ,'Найменування'
          ,'Рік ІП'
          ,'Бюджетотримач'
          ,'Вид робіт'
          ,'Од. вим.'
          ,'Кільк., затв. НКРЕ (рік)'
          ,'Ціна, затв. НКРЕ, тис. грн. з ПДВ (рік)'
          ,'Сума, затв. НКРЕ, тис. грн. з ПДВ (рік)'
          ,'Кільк., затв. НКРЕ (I кв.)'
          ,'Сума, затв. НКРЕ, тис. грн. з ПДВ (I кв.)'
          ,'Кільк., затв. НКРЕ (II кв.)'
          ,'Сума, затв. НКРЕ, тис. грн. з ПДВ (II кв.)'
          ,'Кільк., затв. НКРЕ (III кв.)'
          ,'Сума, затв. НКРЕ, тис. грн. з ПДВ (III кв.)'
          ,'Кільк., затв. НКРЕ (IV кв.)'
          ,'Сума, затв. НКРЕ, тис. грн. з ПДВ (IV кв.)'
        );
}

   with sgENInvestProgram do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENInvestProgramList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENInvestProgramList.list[i].code)
        else
          Cells[0,i+1] := '';

        // 09.01.14 Для услуг будем выводить наименование из поля "name", для остальных - из названия объекта
        if ENInvestProgramList.list[i].planTypeRefCode = ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST then
          Cells[1,i+1] := ENInvestProgramList.list[i].name
        else
          Cells[1,i+1] := ENInvestProgramList.list[i].elementRefName + ' (інв. № ' + ENInvestProgramList.list[i].invNumber + ')'; // 'Об''єкт'

        Cells[2,i+1] := ENInvestProgramList.list[i].name;

        if ENInvestProgramList.list[i].yearGen = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENInvestProgramList.list[i].yearGen);

        Cells[4,i+1] := ENInvestProgramList.list[i].budgetRefShortName; // 'Бюджетотримач'

        Cells[5,i+1] := ENInvestProgramList.list[i].planTypeRefName; // 'Вид робіт'

        Cells[6,i+1] := ENInvestProgramList.list[i].measurementName; // 'Од. вим.'

        if ENInvestProgramList.list[i].countGen = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENInvestProgramList.list[i].countGen.DecimalString;
        if ENInvestProgramList.list[i].price = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENInvestProgramList.list[i].price.DecimalString;
        if ENInvestProgramList.list[i].sumGen = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENInvestProgramList.list[i].sumGen.DecimalString;
        if ENInvestProgramList.list[i].quarter1count = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENInvestProgramList.list[i].quarter1count.DecimalString;
        if ENInvestProgramList.list[i].quarter1sum = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := ENInvestProgramList.list[i].quarter1sum.DecimalString;
        if ENInvestProgramList.list[i].quarter2count = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := ENInvestProgramList.list[i].quarter2count.DecimalString;
        if ENInvestProgramList.list[i].quarter2sum = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := ENInvestProgramList.list[i].quarter2sum.DecimalString;
        if ENInvestProgramList.list[i].quarter3count = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := ENInvestProgramList.list[i].quarter3count.DecimalString;
        if ENInvestProgramList.list[i].quarter3sum = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := ENInvestProgramList.list[i].quarter3sum.DecimalString;
        if ENInvestProgramList.list[i].quarter4count = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := ENInvestProgramList.list[i].quarter4count.DecimalString;
        if ENInvestProgramList.list[i].quarter4sum = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := ENInvestProgramList.list[i].quarter4sum.DecimalString;

        Cells[18,i+1] := ENInvestProgramList.list[i].statusRefName;

        LastRow:=i+1;
        sgENInvestProgram.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENInvestProgram.Row:=1;
end;

procedure TfrmENInvestProgramShow.sgENInvestProgramTopLeftChanged(Sender: TObject);
var
  TempENInvestProgram: ENInvestProgramControllerSoapPort;
  i,CurrentRow: Integer;
  ENInvestProgramList: ENInvestProgramShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENInvestProgram.TopRow + sgENInvestProgram.VisibleRowCount) = ColCount
  then
    begin
      TempENInvestProgram :=  HTTPRIOENInvestProgram as ENInvestProgramControllerSoapPort;
      CurrentRow:=sgENInvestProgram.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENInvestProgramFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENInvestProgramList := TempENInvestProgram.getScrollableFilteredList(ENInvestProgramFilter(FilterObject),ColCount-1, 100);

  sgENInvestProgram.RowCount:=sgENInvestProgram.RowCount+100;
  LastCount:=High(ENInvestProgramList.list);
  with sgENInvestProgram do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENInvestProgramList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENInvestProgramList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';

        // 09.01.14 Для услуг будем выводить наименование из поля "name", для остальных - из названия объекта
        if ENInvestProgramList.list[i].planTypeRefCode = ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST then
          Cells[1,i+CurrentRow] := ENInvestProgramList.list[i].name
        else
          Cells[1,i+CurrentRow] := ENInvestProgramList.list[i].elementRefName + ' (інв. № ' + ENInvestProgramList.list[i].invNumber + ')'; // 'Об''єкт'

        Cells[2,i+CurrentRow] := ENInvestProgramList.list[i].name;

        if ENInvestProgramList.list[i].yearGen = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENInvestProgramList.list[i].yearGen);

        Cells[4,i+CurrentRow] := ENInvestProgramList.list[i].budgetRefShortName; // 'Бюджетотримач'

        Cells[5,i+CurrentRow] := ENInvestProgramList.list[i].planTypeRefName; // 'Вид робіт'

        Cells[6,i+CurrentRow] := ENInvestProgramList.list[i].measurementName; // 'Од. вим.'

        if ENInvestProgramList.list[i].countGen = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENInvestProgramList.list[i].countGen.DecimalString;
        if ENInvestProgramList.list[i].price = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENInvestProgramList.list[i].price.DecimalString;
        if ENInvestProgramList.list[i].sumGen = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENInvestProgramList.list[i].sumGen.DecimalString;
        if ENInvestProgramList.list[i].quarter1count = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := ENInvestProgramList.list[i].quarter1count.DecimalString;
        if ENInvestProgramList.list[i].quarter1sum = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := ENInvestProgramList.list[i].quarter1sum.DecimalString;
        if ENInvestProgramList.list[i].quarter2count = nil then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := ENInvestProgramList.list[i].quarter2count.DecimalString;
        if ENInvestProgramList.list[i].quarter2sum = nil then
          Cells[13,i+CurrentRow] := ''
        else
          Cells[13,i+CurrentRow] := ENInvestProgramList.list[i].quarter2sum.DecimalString;
        if ENInvestProgramList.list[i].quarter3count = nil then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := ENInvestProgramList.list[i].quarter3count.DecimalString;
        if ENInvestProgramList.list[i].quarter3sum = nil then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := ENInvestProgramList.list[i].quarter3sum.DecimalString;
        if ENInvestProgramList.list[i].quarter4count = nil then
          Cells[16,i+CurrentRow] := ''
        else
          Cells[16,i+CurrentRow] := ENInvestProgramList.list[i].quarter4count.DecimalString;
        if ENInvestProgramList.list[i].quarter4sum = nil then
          Cells[17,i+CurrentRow] := ''
        else
          Cells[17,i+CurrentRow] := ENInvestProgramList.list[i].quarter4sum.DecimalString;

        Cells[18,i+CurrentRow] := ENInvestProgramList.list[i].statusRefName;

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENInvestProgram.Row:=CurrentRow-5;
   sgENInvestProgram.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENInvestProgramShow.sgENInvestProgramDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENInvestProgram,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENInvestProgramShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENInvestProgram.RowCount-1 do
   for j:=0 to sgENInvestProgram.ColCount-1 do
     sgENInvestProgram.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENInvestProgramShow.actViewExecute(Sender: TObject);
Var TempENInvestProgram: ENInvestProgramControllerSoapPort;
begin
 TempENInvestProgram := HTTPRIOENInvestProgram as ENInvestProgramControllerSoapPort;
   try
     ENInvestProgramObj := TempENInvestProgram.getObject(StrToInt(sgENInvestProgram.Cells[0,sgENInvestProgram.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENInvestProgramEdit:=TfrmENInvestProgramEdit.Create(Application, dsView);
  try
    frmENInvestProgramEdit.ShowModal;
  finally
    frmENInvestProgramEdit.Free;
    frmENInvestProgramEdit:=nil;
  end;
end;

procedure TfrmENInvestProgramShow.actEditExecute(Sender: TObject);
Var TempENInvestProgram: ENInvestProgramControllerSoapPort;
begin
  TempENInvestProgram := HTTPRIOENInvestProgram as ENInvestProgramControllerSoapPort;
  try
    ENInvestProgramObj := TempENInvestProgram.getObject(StrToInt(sgENInvestProgram.Cells[0, sgENInvestProgram.Row]));
  except
    on EConvertError do Exit;
  end;

  if ENInvestProgramObj.statusRef.code <> ENINVESTPROGRAMSTATUS_DRAFT then
  begin
    Application.MessageBox(PChar('Для редагування Інвестпрограма повинна бути в статусі "Чорнова"!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  frmENInvestProgramEdit := TfrmENInvestProgramEdit.Create(Application, dsEdit);
  try
    if frmENInvestProgramEdit.ShowModal= mrOk then
    begin
      //TempENInvestProgram.save(ENInvestProgramObj);
      UpdateGrid(Sender);
    end;
  finally
    frmENInvestProgramEdit.Free;
    frmENInvestProgramEdit:=nil;
  end;
end;

procedure TfrmENInvestProgramShow.actDeleteExecute(Sender: TObject);
Var TempENInvestProgram: ENInvestProgramControllerSoapPort;
  ObjCode: Integer;
begin
 TempENInvestProgram := HTTPRIOENInvestProgram as ENInvestProgramControllerSoapPort;
   try
     ObjCode := StrToInt(sgENInvestProgram.Cells[0,sgENInvestProgram.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Інвестпрограма по об"єкту) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENInvestProgram.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENInvestProgramShow.actInsertExecute(Sender: TObject);
// Var TempENInvestProgram: ENInvestProgramControllerSoapPort; 
begin
  // TempENInvestProgram := HTTPRIOENInvestProgram as ENInvestProgramControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENInvestProgramObj:=ENInvestProgram.Create;

   //ENInvestProgramObj.countGen:= TXSDecimal.Create;
   //ENInvestProgramObj.price:= TXSDecimal.Create;
   //ENInvestProgramObj.sumGen:= TXSDecimal.Create;
   //ENInvestProgramObj.quarter1count:= TXSDecimal.Create;
   //ENInvestProgramObj.quarter1sum:= TXSDecimal.Create;
   //ENInvestProgramObj.quarter2count:= TXSDecimal.Create;
   //ENInvestProgramObj.quarter2sum:= TXSDecimal.Create;
   //ENInvestProgramObj.quarter3count:= TXSDecimal.Create;
   //ENInvestProgramObj.quarter3sum:= TXSDecimal.Create;
   //ENInvestProgramObj.quarter4count:= TXSDecimal.Create;
   //ENInvestProgramObj.quarter4sum:= TXSDecimal.Create;
   //ENInvestProgramObj.dateAdd:= TXSDateTime.Create;
   
   //ENInvestProgramObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENInvestProgramEdit:=TfrmENInvestProgramEdit.Create(Application, dsInsert);
    try
      if frmENInvestProgramEdit.ShowModal = mrOk then
      begin
        if ENInvestProgramObj<>nil then
            //TempENInvestProgram.add(ENInvestProgramObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENInvestProgramEdit.Free;
      frmENInvestProgramEdit:=nil;
    end;
  finally
    ENInvestProgramObj.Free;
  end;
end;

procedure TfrmENInvestProgramShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENInvestProgramShow.actFilterExecute(Sender: TObject);
begin
  frmENInvestProgramFilterEdit := TfrmENInvestProgramFilterEdit.Create(Application, dsInsert);
  try
    ENInvestProgramFilterObj := ENInvestProgramFilter.Create;
    SetNullIntProps(ENInvestProgramFilterObj);
    SetNullXSProps(ENInvestProgramFilterObj);

    if frmENInvestProgramFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENInvestProgramFilter.Create;
      FilterObject := ENInvestProgramFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENInvestProgramFilterEdit.Free;
    frmENInvestProgramFilterEdit := nil;
  end;
end;

procedure TfrmENInvestProgramShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENInvestProgramShow.actSetFinancingCompletedExecute(
  Sender: TObject);
var TempENInvestProgram: ENInvestProgramControllerSoapPort;
    ObjCode: Integer;
begin
  try
    ObjCode := StrToInt(sgENInvestProgram.Cells[0, sgENInvestProgram.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести ІП в статус "Фінансування завершено"?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENInvestProgram := HTTPRIOENInvestProgram as ENInvestProgramControllerSoapPort;
    TempENInvestProgram.setFinancingCompleted(ObjCode);
    UpdateGrid(Sender);
  end;
end;

end.