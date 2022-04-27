
unit ShowRQBudgetItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQBudgetItemController, AdvObj ;


type
  TfrmRQBudgetItemShow = class(TChildForm)  
  HTTPRIORQBudgetItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQBudgetItem: TAdvStringGrid;
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
procedure sgRQBudgetItemTopLeftChanged(Sender: TObject);
procedure sgRQBudgetItemDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
   selectedItemIndex : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmRQBudgetItemShow : TfrmRQBudgetItemShow;
 // RQBudgetItemObj: RQBudgetItem;
 // RQBudgetItemFilterObj: RQBudgetItemFilter;
  
  
implementation

uses Main, EditRQBudgetItem, EditRQBudgetItemFilter;


{$R *.dfm}

var
  //frmRQBudgetItemShow : TfrmRQBudgetItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQBudgetItemHeaders: array [1..6] of String =
        ( 'Код'
          ,'Сумма по коду ДДС'
          ,'Код ДДС'
          ,'Назва ДДС'
          ,'Дата зміни'
          ,'Користувач, який вніс зміни'
        );
   

procedure TfrmRQBudgetItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQBudgetItemShow:=nil;
    inherited;
  end;


procedure TfrmRQBudgetItemShow.FormShow(Sender: TObject);
var
  TempRQBudgetItem: RQBudgetItemControllerSoapPort;
  i: Integer;
  RQBudgetItemList: RQBudgetItemShortList;
  begin

  DisableActions( [actInsert, actDelete , actFilter , actNoFilter] );

  SetGridHeaders(RQBudgetItemHeaders, sgRQBudgetItem.ColumnHeaders);
  ColCount:=1000;
  TempRQBudgetItem :=  HTTPRIORQBudgetItem as RQBudgetItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQBudgetItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQBudgetItemList := TempRQBudgetItem.getScrollableFilteredList(RQBudgetItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQBudgetItemList.list);

  if LastCount > -1 then
     sgRQBudgetItem.RowCount:=LastCount+2
  else
     sgRQBudgetItem.RowCount:=2;

   with sgRQBudgetItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQBudgetItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQBudgetItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        if RQBudgetItemList.list[i].sumGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQBudgetItemList.list[i].sumGen.DecimalString;

        Cells[2,i+1] := RQBudgetItemList.list[i].ddscode;

        Cells[3,i+1] := RQBudgetItemList.list[i].ddscodeName;

        if RQBudgetItemList.list[i].dateEdit = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(RQBudgetItemList.list[i].dateEdit);

        Cells[5,i+1] := RQBudgetItemList.list[i].userGen;

        LastRow:=i+1;
        sgRQBudgetItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQBudgetItem.Row:=1;
end;

procedure TfrmRQBudgetItemShow.sgRQBudgetItemTopLeftChanged(Sender: TObject);
var
  TempRQBudgetItem: RQBudgetItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQBudgetItemList: RQBudgetItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQBudgetItem.TopRow + sgRQBudgetItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQBudgetItem :=  HTTPRIORQBudgetItem as RQBudgetItemControllerSoapPort;
      CurrentRow:=sgRQBudgetItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQBudgetItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQBudgetItemList := TempRQBudgetItem.getScrollableFilteredList(RQBudgetItemFilter(FilterObject),ColCount-1, 100);



  sgRQBudgetItem.RowCount:=sgRQBudgetItem.RowCount+100;
  LastCount:=High(RQBudgetItemList.list);
  with sgRQBudgetItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQBudgetItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQBudgetItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        if RQBudgetItemList.list[i].sumGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQBudgetItemList.list[i].sumGen.DecimalString;

        Cells[2,i+CurrentRow] := RQBudgetItemList.list[i].ddscode;
        Cells[3,i+CurrentRow] := RQBudgetItemList.list[i].ddscodeName;


        if RQBudgetItemList.list[i].dateEdit = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(RQBudgetItemList.list[i].dateEdit);

        Cells[5,i+CurrentRow] := RQBudgetItemList.list[i].userGen;

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQBudgetItem.Row:=CurrentRow-5;
   sgRQBudgetItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQBudgetItemShow.sgRQBudgetItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQBudgetItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQBudgetItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQBudgetItem.RowCount-1 do
   for j:=0 to sgRQBudgetItem.ColCount-1 do
     sgRQBudgetItem.Cells[j,i]:='';
   FormShow(Sender);

   
end;

procedure TfrmRQBudgetItemShow.actViewExecute(Sender: TObject);
Var TempRQBudgetItem: RQBudgetItemControllerSoapPort;
begin
 TempRQBudgetItem := HTTPRIORQBudgetItem as RQBudgetItemControllerSoapPort;
   try
     RQBudgetItemObj := TempRQBudgetItem.getObject(StrToInt(sgRQBudgetItem.Cells[0,sgRQBudgetItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQBudgetItemEdit:=TfrmRQBudgetItemEdit.Create(Application, dsView);
  try
    frmRQBudgetItemEdit.ShowModal;
  finally
    frmRQBudgetItemEdit.Free;
    frmRQBudgetItemEdit:=nil;
  end;
end;

procedure TfrmRQBudgetItemShow.actEditExecute(Sender: TObject);
Var TempRQBudgetItem: RQBudgetItemControllerSoapPort;
begin

 selectedItemIndex := sgRQBudgetItem.Row;

 TempRQBudgetItem := HTTPRIORQBudgetItem as RQBudgetItemControllerSoapPort;
   try
     RQBudgetItemObj := TempRQBudgetItem.getObject(StrToInt(sgRQBudgetItem.Cells[0,sgRQBudgetItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQBudgetItemEdit:=TfrmRQBudgetItemEdit.Create(Application, dsEdit);
  try
    if frmRQBudgetItemEdit.ShowModal= mrOk then
      begin
        //TempRQBudgetItem.save(RQBudgetItemObj);
        UpdateGrid(Sender);

        if sgRQBudgetItem.RowCount > selectedItemIndex then
           sgRQBudgetItem.Row := selectedItemIndex
        else
           sgRQBudgetItem.Row := sgRQBudgetItem.RowCount - 1;

      end;
  finally
    frmRQBudgetItemEdit.Free;
    frmRQBudgetItemEdit:=nil;
  end;
end;

procedure TfrmRQBudgetItemShow.actDeleteExecute(Sender: TObject);
Var TempRQBudgetItem: RQBudgetItemControllerSoapPort;
  ObjCode: Integer;
begin
 selectedItemIndex := sgRQBudgetItem.Row;

 TempRQBudgetItem := HTTPRIORQBudgetItem as RQBudgetItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQBudgetItem.Cells[0,sgRQBudgetItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки Бюджету у розрізі кодів ДДС) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQBudgetItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQBudgetItemShow.actInsertExecute(Sender: TObject);
// Var TempRQBudgetItem: RQBudgetItemControllerSoapPort; 
begin
  // TempRQBudgetItem := HTTPRIORQBudgetItem as RQBudgetItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQBudgetItemObj:=RQBudgetItem.Create;

   //RQBudgetItemObj.sumGen:= TXSDecimal.Create;
   //RQBudgetItemObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmRQBudgetItemEdit:=TfrmRQBudgetItemEdit.Create(Application, dsInsert);
    try
      if frmRQBudgetItemEdit.ShowModal = mrOk then
      begin
        if RQBudgetItemObj<>nil then
            //TempRQBudgetItem.add(RQBudgetItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQBudgetItemEdit.Free;
      frmRQBudgetItemEdit:=nil;
    end;
  finally
    RQBudgetItemObj.Free;
  end;
end;

procedure TfrmRQBudgetItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQBudgetItemShow.actFilterExecute(Sender: TObject);
begin
frmRQBudgetItemFilterEdit:=TfrmRQBudgetItemFilterEdit.Create(Application, dsInsert);
  try
    RQBudgetItemFilterObj := RQBudgetItemFilter.Create;
    SetNullIntProps(RQBudgetItemFilterObj);
    SetNullXSProps(RQBudgetItemFilterObj);

    if frmRQBudgetItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQBudgetItemFilter.Create;
      FilterObject := RQBudgetItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQBudgetItemFilterEdit.Free;
    frmRQBudgetItemFilterEdit:=nil;
  end;
end;

procedure TfrmRQBudgetItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.