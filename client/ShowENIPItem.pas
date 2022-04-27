
unit ShowENIPItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENIPItemController, AdvObj ;


type
    TfrmENIPItemShow = class(TChildForm)  
    HTTPRIOENIPItem: THTTPRIO;
    ImageList1: TImageList;
    sgENIPItem: TAdvStringGrid;
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

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENIPItemTopLeftChanged(Sender: TObject);
    procedure sgENIPItemDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENIPItemShort; stdcall; static;
 end;


var
  frmENIPItemShow: TfrmENIPItemShow;
  
  
implementation

uses Main, EditENIPItem, EditENIPItemFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENIPItemHeaders: array [1..25] of String =
        ( 'Код'  // 0
          ,'Розділ ІП'    // 1
          ,'Пункт ІП' // 2
          ,'Цільова програма' // 3
          ,'Назва об`єкта, продукції ...' //4
          ,'Бух. назва об`єкта, продукції ...' //5

          ,'Інв. номер/номера'     // 6
          ,'Проектна документація'     // 7
          ,'Джерело фінансування'   // 8
          ,'Кільк. (рік)'  // 9
          ,'Ціна, тис. грн. без ПДВ (рік)' //10
          ,'Сума, тис. грн. без ПДВ (рік)'     //11
          ,'Кількість, (1-й кв.)'             //12
          ,'Сума, тис. грн. без ПДВ (1-й кв.)'   //13
          ,'Кільк., (2-й кв.)'               // 14
          ,'Сума, тис. грн. без ПДВ (2-й кв.)'   // 15
          ,'Кільк.,(3-й кв.)'                //16
          ,'Сума, тис. грн. без ПДВ (3-й кв.)'    //17
          ,'Кільк.,(4-й кв.)'                //18
          ,'Сума, тис. грн. без ПДВ (4-й кв.)'    //19
          ,'Користувач, який створив запис'                             //20
          ,'Дата створення'                                             //21
          ,'Користувач, який вніс зміни'                                //22
          ,'Дата зміни'                                                 //23
          ,'Примітка'                                                   // 24
        );
   
class function TfrmENIPItemShow.chooseFromList : ENIPItemShort;
var
  f1 : ENIPItemFilter;
  frmENIPItemShow : TfrmENIPItemShow;
  selected : ENIPItemShort;
begin
  inherited;
     selected := nil;
     f1 := ENIPItemFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENIPItemShow := TfrmENIPItemShow.Create(Application, fmNormal, f1);
       try
          with frmENIPItemShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENIPItemShort(sgENIPItem.Objects[0, sgENIPItem.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENIPItemShow.Free;
       end;
end;

procedure TfrmENIPItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENIPItemShow:=nil;
  inherited;
end;


procedure TfrmENIPItemShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENIPItemShow.FormShow(Sender: TObject);
var
  TempENIPItem: ENIPItemControllerSoapPort;
  i: Integer;
  ENIPItemList: ENIPItemShortList;
begin
  SetGridHeaders(ENIPItemHeaders, sgENIPItem.ColumnHeaders);
  ColCount:=100;
  TempENIPItem :=  HTTPRIOENIPItem as ENIPItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENIPItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIPItemList := TempENIPItem.getScrollableFilteredList(ENIPItemFilter(FilterObject),0,ColCount);
  LastCount:=High(ENIPItemList.list);

  if LastCount > -1 then
     sgENIPItem.RowCount:=LastCount+2
  else
     sgENIPItem.RowCount:=2;

   with sgENIPItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIPItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENIPItemList.list[i].code)
        else
        Cells[0,i+1] := '';


        Cells[1,i+1] := ENIPItemList.list[i].invGroupRefName;
        Cells[2,i+1] := ENIPItemList.list[i].itemNumber;

        // цільова програма

        Cells[3,i+1] := ENIPItemList.list[i].purposeProgramRefName;


        Cells[4,i+1] := ENIPItemList.list[i].name;
        Cells[5,i+1] := ENIPItemList.list[i].buhName;

        Cells[6,i+1] := ENIPItemList.list[i].invNumber;
        if ENIPItemList.list[i].isProjectDocument = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(ENIPItemList.list[i].isProjectDocument);

        Cells[8,i+1] := ENIPItemList.list[i].financing;


        if ENIPItemList.list[i].countGen = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENIPItemList.list[i].countGen.DecimalString;
        if ENIPItemList.list[i].price = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENIPItemList.list[i].price.DecimalString;
        if ENIPItemList.list[i].sumGen = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := ENIPItemList.list[i].sumGen.DecimalString;
        if ENIPItemList.list[i].quarter1count = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := ENIPItemList.list[i].quarter1count.DecimalString;
        if ENIPItemList.list[i].quarter1sum = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := ENIPItemList.list[i].quarter1sum.DecimalString;
        if ENIPItemList.list[i].quarter2count = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := ENIPItemList.list[i].quarter2count.DecimalString;
        if ENIPItemList.list[i].quarter2sum = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := ENIPItemList.list[i].quarter2sum.DecimalString;
        if ENIPItemList.list[i].quarter3count = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := ENIPItemList.list[i].quarter3count.DecimalString;
        if ENIPItemList.list[i].quarter3sum = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := ENIPItemList.list[i].quarter3sum.DecimalString;
        if ENIPItemList.list[i].quarter4count = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := ENIPItemList.list[i].quarter4count.DecimalString;
        if ENIPItemList.list[i].quarter4sum = nil then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := ENIPItemList.list[i].quarter4sum.DecimalString;

        Cells[20,i+1] := ENIPItemList.list[i].userAdd;

        if ENIPItemList.list[i].dateAdd = nil then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := XSDateTimeWithDate2String(ENIPItemList.list[i].dateAdd);

        Cells[22,i+1] := ENIPItemList.list[i].userGen;

        if ENIPItemList.list[i].dateEdit = nil then
          Cells[23,i+1] := ''
        else
          Cells[23,i+1] := XSDateTimeWithDate2String(ENIPItemList.list[i].dateEdit);

        Cells[24,i+1] := ENIPItemList.list[i].commentGen;
        LastRow:=i+1;
        sgENIPItem.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENIPItem.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENIPItem.RowCount > selectedRow then
      sgENIPItem.Row := selectedRow
    else
      sgENIPItem.Row := sgENIPItem.RowCount - 1;
    end
    else
      sgENIPItem.Row:=1;   
end;


procedure TfrmENIPItemShow.sgENIPItemTopLeftChanged(Sender: TObject);
var
  TempENIPItem: ENIPItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENIPItemList: ENIPItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENIPItem.TopRow + sgENIPItem.VisibleRowCount) = ColCount
  then
    begin
      TempENIPItem :=  HTTPRIOENIPItem as ENIPItemControllerSoapPort;
      CurrentRow:=sgENIPItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENIPItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIPItemList := TempENIPItem.getScrollableFilteredList(ENIPItemFilter(FilterObject),ColCount-1, 100);


  sgENIPItem.RowCount:=sgENIPItem.RowCount+100;
  LastCount:=High(ENIPItemList.list);
  with sgENIPItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIPItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENIPItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';


        Cells[1,i+CurrentRow] := ENIPItemList.list[i].invGroupRefName;
        Cells[2,i+CurrentRow] := ENIPItemList.list[i].itemNumber;

        // цільова програма

        Cells[3,i+CurrentRow] := ENIPItemList.list[i].purposeProgramRefName;


        Cells[4,i+CurrentRow] := ENIPItemList.list[i].name;
        Cells[5,i+CurrentRow] := ENIPItemList.list[i].buhName;

        Cells[6,i+CurrentRow] := ENIPItemList.list[i].invNumber;
        if ENIPItemList.list[i].isProjectDocument = Low(Integer) then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := IntToStr(ENIPItemList.list[i].isProjectDocument);

        Cells[8,i+CurrentRow] := ENIPItemList.list[i].financing;


        if ENIPItemList.list[i].countGen = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENIPItemList.list[i].countGen.DecimalString;
        if ENIPItemList.list[i].price = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := ENIPItemList.list[i].price.DecimalString;
        if ENIPItemList.list[i].sumGen = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := ENIPItemList.list[i].sumGen.DecimalString;
        if ENIPItemList.list[i].quarter1count = nil then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := ENIPItemList.list[i].quarter1count.DecimalString;
        if ENIPItemList.list[i].quarter1sum = nil then
          Cells[13,i+CurrentRow] := ''
        else
          Cells[13,i+CurrentRow] := ENIPItemList.list[i].quarter1sum.DecimalString;
        if ENIPItemList.list[i].quarter2count = nil then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := ENIPItemList.list[i].quarter2count.DecimalString;
        if ENIPItemList.list[i].quarter2sum = nil then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := ENIPItemList.list[i].quarter2sum.DecimalString;
        if ENIPItemList.list[i].quarter3count = nil then
          Cells[16,i+CurrentRow] := ''
        else
          Cells[16,i+CurrentRow] := ENIPItemList.list[i].quarter3count.DecimalString;
        if ENIPItemList.list[i].quarter3sum = nil then
          Cells[17,i+CurrentRow] := ''
        else
          Cells[17,i+CurrentRow] := ENIPItemList.list[i].quarter3sum.DecimalString;
        if ENIPItemList.list[i].quarter4count = nil then
          Cells[18,i+CurrentRow] := ''
        else
          Cells[18,i+CurrentRow] := ENIPItemList.list[i].quarter4count.DecimalString;
        if ENIPItemList.list[i].quarter4sum = nil then
          Cells[19,i+CurrentRow] := ''
        else
          Cells[19,i+CurrentRow] := ENIPItemList.list[i].quarter4sum.DecimalString;

        Cells[20,i+CurrentRow] := ENIPItemList.list[i].userAdd;

        if ENIPItemList.list[i].dateAdd = nil then
          Cells[21,i+CurrentRow] := ''
        else
          Cells[21,i+CurrentRow] := XSDateTimeWithDate2String(ENIPItemList.list[i].dateAdd);

        Cells[22,i+CurrentRow] := ENIPItemList.list[i].userGen;

        if ENIPItemList.list[i].dateEdit = nil then
          Cells[23,i+CurrentRow] := ''
        else
          Cells[23,i+CurrentRow] := XSDateTimeWithDate2String(ENIPItemList.list[i].dateEdit);

        Cells[24,i+CurrentRow] := ENIPItemList.list[i].commentGen;
        Objects[0, i+CurrentRow] := ENIPItemList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENIPItem.Row:=CurrentRow-5;
   sgENIPItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENIPItemShow.sgENIPItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENIPItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENIPItemShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENIPItem.RowCount-1 do
   for j:=0 to sgENIPItem.ColCount-1 do
     sgENIPItem.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENIPItemShow.actViewExecute(Sender: TObject);
var 
  TempENIPItem: ENIPItemControllerSoapPort;
begin
  TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;
  try
    ENIPItemObj := TempENIPItem.getObject(StrToInt(sgENIPItem.Cells[0, sgENIPItem.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENIPItemEdit := TfrmENIPItemEdit.Create(Application, dsView);
  try
    frmENIPItemEdit.ShowModal;
  finally
    frmENIPItemEdit.Free;
    frmENIPItemEdit := nil;
  end;
end;


procedure TfrmENIPItemShow.actEditExecute(Sender: TObject);
var 
  TempENIPItem: ENIPItemControllerSoapPort;
begin
  TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;
  try
    ENIPItemObj := TempENIPItem.getObject(StrToInt(sgENIPItem.Cells[0,sgENIPItem.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENIPItem.Row;
  frmENIPItemEdit:=TfrmENIPItemEdit.Create(Application, dsEdit);
  
  try
    if frmENIPItemEdit.ShowModal= mrOk then
      begin
        //TempENIPItem.save(ENIPItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENIPItemEdit.Free;
    frmENIPItemEdit:=nil;
  end;

  if sgENIPItem.RowCount > selectedRow then
    sgENIPItem.Row := selectedRow
  else
    sgENIPItem.Row := sgENIPItem.RowCount - 1;
  
end;


procedure TfrmENIPItemShow.actDeleteExecute(Sender: TObject);
Var TempENIPItem: ENIPItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENIPItem.Cells[0,sgENIPItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Пункти інвестпрограми )?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENIPItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENIPItemShow.actInsertExecute(Sender: TObject);
// Var TempENIPItem: ENIPItemControllerSoapPort; 
begin
  // TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENIPItemObj:=ENIPItem.Create;
  SetNullIntProps(ENIPItemObj);
  SetNullXSProps(ENIPItemObj);

   //ENIPItemObj.countGen:= TXSDecimal.Create;
   //ENIPItemObj.price:= TXSDecimal.Create;
   //ENIPItemObj.sumGen:= TXSDecimal.Create;
   //ENIPItemObj.quarter1count:= TXSDecimal.Create;
   //ENIPItemObj.quarter1sum:= TXSDecimal.Create;
   //ENIPItemObj.quarter2count:= TXSDecimal.Create;
   //ENIPItemObj.quarter2sum:= TXSDecimal.Create;
   //ENIPItemObj.quarter3count:= TXSDecimal.Create;
   //ENIPItemObj.quarter3sum:= TXSDecimal.Create;
   //ENIPItemObj.quarter4count:= TXSDecimal.Create;
   //ENIPItemObj.quarter4sum:= TXSDecimal.Create;
   //ENIPItemObj.countGenInside:= TXSDecimal.Create;
   //ENIPItemObj.priceInside:= TXSDecimal.Create;
   //ENIPItemObj.sumGenInside:= TXSDecimal.Create;
   //ENIPItemObj.mm1countInside:= TXSDecimal.Create;
   //ENIPItemObj.mm1sumInside:= TXSDecimal.Create;
   //ENIPItemObj.mm2countInside:= TXSDecimal.Create;
   //ENIPItemObj.mm2sumInside:= TXSDecimal.Create;
   //ENIPItemObj.mm3countInside:= TXSDecimal.Create;
   //ENIPItemObj.mm3sumInside:= TXSDecimal.Create;
   //ENIPItemObj.mm4countInside:= TXSDecimal.Create;
   //ENIPItemObj.mm4sumInside:= TXSDecimal.Create;
   //ENIPItemObj.mm5countInside:= TXSDecimal.Create;
   //ENIPItemObj.mm5sumInside:= TXSDecimal.Create;
   //ENIPItemObj.mm6countInside:= TXSDecimal.Create;
   //ENIPItemObj.mm6sumInside:= TXSDecimal.Create;
   //ENIPItemObj.mm7countInside:= TXSDecimal.Create;
   //ENIPItemObj.mm7sumInside:= TXSDecimal.Create;
   //ENIPItemObj.mm8countInside:= TXSDecimal.Create;
   //ENIPItemObj.mm8sumInside:= TXSDecimal.Create;
   //ENIPItemObj.mm9countInside:= TXSDecimal.Create;
   //ENIPItemObj.mm9sumInside:= TXSDecimal.Create;
   //ENIPItemObj.mm10countInside:= TXSDecimal.Create;
   //ENIPItemObj.mm10sumInside:= TXSDecimal.Create;
   //ENIPItemObj.mm11countInside:= TXSDecimal.Create;
   //ENIPItemObj.mm11sumInside:= TXSDecimal.Create;
   //ENIPItemObj.mm12countInside:= TXSDecimal.Create;
   //ENIPItemObj.mm12sumInside:= TXSDecimal.Create;
   //ENIPItemObj.dateAdd:= TXSDateTime.Create;
   
   //ENIPItemObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENIPItemEdit:=TfrmENIPItemEdit.Create(Application, dsInsert);
    try
      if frmENIPItemEdit.ShowModal = mrOk then
      begin
        if ENIPItemObj<>nil then
            //TempENIPItem.add(ENIPItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENIPItemEdit.Free;
      frmENIPItemEdit:=nil;
    end;
  finally
    ENIPItemObj.Free;
  end;
end;


procedure TfrmENIPItemShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENIPItemShow.actFilterExecute(Sender: TObject);
begin
frmENIPItemFilterEdit:=TfrmENIPItemFilterEdit.Create(Application, dsInsert);
  try
    ENIPItemFilterObj := ENIPItemFilter.Create;
    SetNullIntProps(ENIPItemFilterObj);
    SetNullXSProps(ENIPItemFilterObj);

    if frmENIPItemFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENIPItemFilter.Create;
      FilterObject := ENIPItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENIPItemFilterEdit.Free;
    frmENIPItemFilterEdit:=nil;
  end;
end;


procedure TfrmENIPItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.