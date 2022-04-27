
unit ShowENHumenItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENHumenItemController ;


type
  TfrmENHumenItemShow = class(TChildForm)  
  HTTPRIOENHumenItem: THTTPRIO;
    ImageList1: TImageList;
    sgENHumenItem: TAdvStringGrid;
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
procedure sgENHumenItemTopLeftChanged(Sender: TObject);
procedure sgENHumenItemDblClick(Sender: TObject);
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

//var
 // ENHumenItemObj: ENHumenItem;
 // ENHumenItemFilterObj: ENHumenItemFilter;
  
  
implementation

uses Main, EditENHumenItem, EditENHumenItemFilter;


{$R *.dfm}

var
  //frmENHumenItemShow : TfrmENHumenItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENHumenItemHeaders: array [1..7] of String =
        ( 'Код'
          ,'норма часу нормативна'
          ,'норма часу скорегована'
          ,'Ціна нормачасу'
          ,'Вартість нормочасу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
   

procedure TfrmENHumenItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENHumenItemShow:=nil;
    inherited;
  end;


procedure TfrmENHumenItemShow.FormShow(Sender: TObject);
var
  TempENHumenItem: ENHumenItemControllerSoapPort;
  i: Integer;
  ENHumenItemList: ENHumenItemShortList;
  begin
  SetGridHeaders(ENHumenItemHeaders, sgENHumenItem.ColumnHeaders);
  ColCount:=100;
  TempENHumenItem :=  HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENHumenItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHumenItemList := TempENHumenItem.getScrollableFilteredList(ENHumenItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENHumenItemList.list);

  if LastCount > -1 then
     sgENHumenItem.RowCount:=LastCount+2
  else
     sgENHumenItem.RowCount:=2;

   with sgENHumenItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHumenItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENHumenItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENHumenItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENHumenItemList.list[i].countGen.DecimalString;
        if ENHumenItemList.list[i].countFact = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENHumenItemList.list[i].countFact.DecimalString;
        if ENHumenItemList.list[i].price = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENHumenItemList.list[i].price.DecimalString;
        if ENHumenItemList.list[i].cost = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENHumenItemList.list[i].cost.DecimalString;
        Cells[5,i+1] := ENHumenItemList.list[i].userGen;
        if ENHumenItemList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENHumenItemList.list[i].dateEdit);
        LastRow:=i+1;
        sgENHumenItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENHumenItem.Row:=1;
end;

procedure TfrmENHumenItemShow.sgENHumenItemTopLeftChanged(Sender: TObject);
var
  TempENHumenItem: ENHumenItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENHumenItemList: ENHumenItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENHumenItem.TopRow + sgENHumenItem.VisibleRowCount) = ColCount
  then
    begin
      TempENHumenItem :=  HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
      CurrentRow:=sgENHumenItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENHumenItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHumenItemList := TempENHumenItem.getScrollableFilteredList(ENHumenItemFilter(FilterObject),ColCount-1, 100);



  sgENHumenItem.RowCount:=sgENHumenItem.RowCount+100;
  LastCount:=High(ENHumenItemList.list);
  with sgENHumenItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHumenItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENHumenItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENHumenItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENHumenItemList.list[i].countGen.DecimalString;
        if ENHumenItemList.list[i].countFact = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENHumenItemList.list[i].countFact.DecimalString;
        if ENHumenItemList.list[i].price = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENHumenItemList.list[i].price.DecimalString;
        if ENHumenItemList.list[i].cost = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENHumenItemList.list[i].cost.DecimalString;
        Cells[5,i+CurrentRow] := ENHumenItemList.list[i].userGen;
        if ENHumenItemList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDate2String(ENHumenItemList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENHumenItem.Row:=CurrentRow-5;
   sgENHumenItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENHumenItemShow.sgENHumenItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENHumenItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENHumenItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENHumenItem.RowCount-1 do
   for j:=0 to sgENHumenItem.ColCount-1 do
     sgENHumenItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENHumenItemShow.actViewExecute(Sender: TObject);
Var TempENHumenItem: ENHumenItemControllerSoapPort;
begin
 TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
   try
     ENHumenItemObj := TempENHumenItem.getObject(StrToInt(sgENHumenItem.Cells[0,sgENHumenItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHumenItemEdit:=TfrmENHumenItemEdit.Create(Application, dsView);
  try
    frmENHumenItemEdit.ShowModal;
  finally
    frmENHumenItemEdit.Free;
    frmENHumenItemEdit:=nil;
  end;
end;

procedure TfrmENHumenItemShow.actEditExecute(Sender: TObject);
Var TempENHumenItem: ENHumenItemControllerSoapPort;
begin
 TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
   try
     ENHumenItemObj := TempENHumenItem.getObject(StrToInt(sgENHumenItem.Cells[0,sgENHumenItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHumenItemEdit:=TfrmENHumenItemEdit.Create(Application, dsEdit);
  try
    if frmENHumenItemEdit.ShowModal= mrOk then
      begin
        //TempENHumenItem.save(ENHumenItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENHumenItemEdit.Free;
    frmENHumenItemEdit:=nil;
  end;
end;

procedure TfrmENHumenItemShow.actDeleteExecute(Sender: TObject);
Var TempENHumenItem: ENHumenItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENHumenItem.Cells[0,sgENHumenItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Людські ресурси) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENHumenItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENHumenItemShow.actInsertExecute(Sender: TObject);
Var TempENHumenItem: ENHumenItemControllerSoapPort;
begin
  TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
  ENHumenItemObj:=ENHumenItem.Create;

   ENHumenItemObj.countGen:= TXSDecimal.Create;
   ENHumenItemObj.countFact:= TXSDecimal.Create;
   ENHumenItemObj.price:= TXSDecimal.Create;
   ENHumenItemObj.cost:= TXSDecimal.Create;
   ENHumenItemObj.dateEdit:= TXSDate.Create;


  try
    frmENHumenItemEdit:=TfrmENHumenItemEdit.Create(Application, dsInsert);
    try
      if frmENHumenItemEdit.ShowModal = mrOk then
      begin
        if ENHumenItemObj<>nil then
            //TempENHumenItem.add(ENHumenItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENHumenItemEdit.Free;
      frmENHumenItemEdit:=nil;
    end;
  finally
    ENHumenItemObj.Free;
  end;
end;

procedure TfrmENHumenItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENHumenItemShow.actFilterExecute(Sender: TObject);
begin
{frmENHumenItemFilterEdit:=TfrmENHumenItemFilterEdit.Create(Application, dsEdit);
  try
    ENHumenItemFilterObj := ENHumenItemFilter.Create;
    SetNullIntProps(ENHumenItemFilterObj);
    SetNullXSProps(ENHumenItemFilterObj);

    if frmENHumenItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENHumenItemFilter.Create;
      FilterObject := ENHumenItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENHumenItemFilterEdit.Free;
    frmENHumenItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENHumenItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.