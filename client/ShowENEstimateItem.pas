
unit ShowENEstimateItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENEstimateItemController, AdvObj ;


type
  TfrmENEstimateItemShow = class(TChildForm)  
  HTTPRIOENEstimateItem: THTTPRIO;
    ImageList1: TImageList;
    sgENEstimateItem: TAdvStringGrid;
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
procedure sgENEstimateItemTopLeftChanged(Sender: TObject);
procedure sgENEstimateItemDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENEstimateItemShow : TfrmENEstimateItemShow;
 // ENEstimateItemObj: ENEstimateItem;
 // ENEstimateItemFilterObj: ENEstimateItemFilter;
  
  
implementation

uses Main, EditENEstimateItem, EditENEstimateItemFilter, DMReportsUnit;


{$R *.dfm}

var
  //frmENEstimateItemShow : TfrmENEstimateItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
//  ENEstimateItemHeaders: array [1..5] of String =
//        ( 'Код'
//          ,'кількість нормативна'
//          ,'кількість скорегована'
//          ,'пользователь внесший изменение'
//          ,'дата последнего изменения'
//        );

  ENEstimateItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используеться при разноске с ФинКол !!!
          ,'Од. виміру'
          ,'Код роботи'
          ,'Робота'
          ,'Тип строки кошторису'
          ,'Статус'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );


procedure TfrmENEstimateItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENEstimateItemShow:=nil;
    inherited;
  end;


procedure TfrmENEstimateItemShow.FormShow(Sender: TObject);
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  i: Integer;
  ENEstimateItemList: ENEstimateItemShortList;
  begin
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  ColCount:=100;
  TempENEstimateItem :=  HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENEstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(ENEstimateItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENEstimateItemList.list);

  if LastCount > -1 then
     sgENEstimateItem.RowCount:=LastCount+2
  else
     sgENEstimateItem.RowCount:=2;

  with sgENEstimateItem do
       for i := 0 to LastCount do
       begin
         Application.ProcessMessages;

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         if ENEstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;

         if ENEstimateItemList.list[i].countFact = nil then
           Cells[3,i+1] := ''
         else
           Cells[3,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

         Cells[4,i+1] := ENEstimateItemList.list[i].measureType;

         Cells[5,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[6,i+1] := ENEstimateItemList.list[i].kartaRefName;

         Cells[7,i+1] := ENEstimateItemList.list[i].typeRefName;

         Cells[8,i+1] := ENEstimateItemList.list[i].statusRefName;

         Cells[9,i+1] := ENEstimateItemList.list[i].userGen;

         if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[10,i+1] := ''
         else
           Cells[10,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);


         Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);

         Objects[1,i+1] := TObject(ENEstimateItemList.list[i].statusRefCode);

         LastRow := i + 1;
         sgENEstimateItem.RowCount := LastRow + 1;
       end;

     //sgENEstimateItem.RowColor[1] := clGreen;

     ColCount := ColCount + 1;
     sgENEstimateItem.Row := 1;
end;

procedure TfrmENEstimateItemShow.sgENEstimateItemTopLeftChanged(Sender: TObject);
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENEstimateItemList: ENEstimateItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENEstimateItem.TopRow + sgENEstimateItem.VisibleRowCount) = ColCount
  then
    begin
      TempENEstimateItem :=  HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
      CurrentRow:=sgENEstimateItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENEstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(ENEstimateItemFilter(FilterObject),ColCount-1, 100);



  sgENEstimateItem.RowCount:=sgENEstimateItem.RowCount+100;
  LastCount:=High(ENEstimateItemList.list);
  with sgENEstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENEstimateItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENEstimateItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENEstimateItemList.list[i].countGen.DecimalString;
        if ENEstimateItemList.list[i].countFact = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENEstimateItemList.list[i].countFact.DecimalString;
        Cells[3,i+CurrentRow] := ENEstimateItemList.list[i].userGen;
        if ENEstimateItemList.list[i].dateEdit = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENEstimateItemList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENEstimateItem.Row:=CurrentRow-5;
   sgENEstimateItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENEstimateItemShow.sgENEstimateItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENEstimateItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENEstimateItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENEstimateItem.RowCount-1 do
   for j:=0 to sgENEstimateItem.ColCount-1 do
     sgENEstimateItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENEstimateItemShow.actViewExecute(Sender: TObject);
Var TempENEstimateItem: ENEstimateItemControllerSoapPort;
begin
 TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
   try
     ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEstimateItemEdit:=TfrmENEstimateItemEdit.Create(Application, dsView);
  try
    frmENEstimateItemEdit.ShowModal;
  finally
    frmENEstimateItemEdit.Free;
    frmENEstimateItemEdit:=nil;
  end;
end;

procedure TfrmENEstimateItemShow.actEditExecute(Sender: TObject);
Var TempENEstimateItem: ENEstimateItemControllerSoapPort;
begin
 TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
   try
     ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEstimateItemEdit:=TfrmENEstimateItemEdit.Create(Application, dsEdit);
  try
    if frmENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempENEstimateItem.save(ENEstimateItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENEstimateItemEdit.Free;
    frmENEstimateItemEdit:=nil;
  end;
end;

procedure TfrmENEstimateItemShow.actDeleteExecute(Sender: TObject);
Var TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ObjCode, eType: Integer;
begin
 TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Кошторис робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
            {
            eType := DMReports.getElementTypeByEstimateItem(ObjCode);
            case eType of
              1,2,3 : TempENEstimateItem.removeBySRS(ObjCode);
              5 : TempENEstimateItem.removeBySVES(ObjCode);
              6 : TempENEstimateItem.removeBySPS(ObjCode);
              else
              begin
                Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
                exit;
              end;              
            end;
            }
      TempENEstimateItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENEstimateItemShow.actInsertExecute(Sender: TObject);
Var TempENEstimateItem: ENEstimateItemControllerSoapPort;
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  ENEstimateItemObj:=ENEstimateItem.Create;

  ENEstimateItemObj.countGen:= TXSDecimal.Create;
  ENEstimateItemObj.countFact:= TXSDecimal.Create;
  ENEstimateItemObj.dateEdit:= TXSDate.Create;

  try
    frmENEstimateItemEdit:=TfrmENEstimateItemEdit.Create(Application, dsInsert);
    try
      if frmENEstimateItemEdit.ShowModal = mrOk then
      begin
        if ENEstimateItemObj<>nil then
            //TempENEstimateItem.add(ENEstimateItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit:=nil;
    end;
  finally
    ENEstimateItemObj.Free;
  end;
end;

procedure TfrmENEstimateItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENEstimateItemShow.actFilterExecute(Sender: TObject);
begin
{frmENEstimateItemFilterEdit:=TfrmENEstimateItemFilterEdit.Create(Application, dsEdit);
  try
    if frmENEstimateItemFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENEstimateItemFilter.Create;
      FilterObject := ENEstimateItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENEstimateItemFilterEdit.Free;
    frmENEstimateItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENEstimateItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.
