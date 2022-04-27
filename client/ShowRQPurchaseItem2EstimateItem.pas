
unit ShowRQPurchaseItem2EstimateItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPurchaseItem2EstimateItemController, AdvObj ;


type
  TfrmRQPurchaseItem2EstimateItemShow = class(TChildForm)  
  HTTPRIORQPurchaseItem2EstimateItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQPurchaseItem2EstimateItem: TAdvStringGrid;
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
procedure sgRQPurchaseItem2EstimateItemTopLeftChanged(Sender: TObject);
procedure sgRQPurchaseItem2EstimateItemDblClick(Sender: TObject);
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
 // RQPurchaseItem2EstimateItemObj: RQPurchaseItem2EstimateItem;
 // RQPurchaseItem2EstimateItemFilterObj: RQPurchaseItem2EstimateItemFilter;
  
  
implementation

uses Main, EditRQPurchaseItem2EstimateItem, EditRQPurchaseItem2EstimateItemFilter;


{$R *.dfm}

var
  //frmRQPurchaseItem2EstimateItemShow : TfrmRQPurchaseItem2EstimateItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPurchaseItem2EstimateItemHeaders: array [1..4] of String =
        ( 'Код'
          ,'кількість матеріалу з плана енерджинет'
          ,'кількість матеріалу для плана закупок'
          ,'Коментарий при изменении статуса '
        );
   

procedure TfrmRQPurchaseItem2EstimateItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPurchaseItem2EstimateItemShow:=nil;
    inherited;
  end;


procedure TfrmRQPurchaseItem2EstimateItemShow.FormShow(Sender: TObject);
var
  TempRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItemControllerSoapPort;
  i: Integer;
  RQPurchaseItem2EstimateItemList: RQPurchaseItem2EstimateItemShortList;
  begin
  SetGridHeaders(RQPurchaseItem2EstimateItemHeaders, sgRQPurchaseItem2EstimateItem.ColumnHeaders);
  ColCount:=100;
  TempRQPurchaseItem2EstimateItem :=  HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPurchaseItem2EstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPurchaseItem2EstimateItemList := TempRQPurchaseItem2EstimateItem.getScrollableFilteredList(RQPurchaseItem2EstimateItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPurchaseItem2EstimateItemList.list);

  if LastCount > -1 then
     sgRQPurchaseItem2EstimateItem.RowCount:=LastCount+2
  else
     sgRQPurchaseItem2EstimateItem.RowCount:=2;

   with sgRQPurchaseItem2EstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItem2EstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPurchaseItem2EstimateItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQPurchaseItem2EstimateItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQPurchaseItem2EstimateItemList.list[i].countGen.DecimalString;
        if RQPurchaseItem2EstimateItemList.list[i].countPurchase = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := RQPurchaseItem2EstimateItemList.list[i].countPurchase.DecimalString;
        Cells[3,i+1] := RQPurchaseItem2EstimateItemList.list[i].statusComment;
        LastRow:=i+1;
        sgRQPurchaseItem2EstimateItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPurchaseItem2EstimateItem.Row:=1;
end;

procedure TfrmRQPurchaseItem2EstimateItemShow.sgRQPurchaseItem2EstimateItemTopLeftChanged(Sender: TObject);
var
  TempRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQPurchaseItem2EstimateItemList: RQPurchaseItem2EstimateItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPurchaseItem2EstimateItem.TopRow + sgRQPurchaseItem2EstimateItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQPurchaseItem2EstimateItem :=  HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;
      CurrentRow:=sgRQPurchaseItem2EstimateItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPurchaseItem2EstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPurchaseItem2EstimateItemList := TempRQPurchaseItem2EstimateItem.getScrollableFilteredList(RQPurchaseItem2EstimateItemFilter(FilterObject),ColCount-1, 100);



  sgRQPurchaseItem2EstimateItem.RowCount:=sgRQPurchaseItem2EstimateItem.RowCount+100;
  LastCount:=High(RQPurchaseItem2EstimateItemList.list);
  with sgRQPurchaseItem2EstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItem2EstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPurchaseItem2EstimateItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQPurchaseItem2EstimateItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQPurchaseItem2EstimateItemList.list[i].countGen.DecimalString;
        if RQPurchaseItem2EstimateItemList.list[i].countPurchase = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := RQPurchaseItem2EstimateItemList.list[i].countPurchase.DecimalString;
        Cells[3,i+CurrentRow] := RQPurchaseItem2EstimateItemList.list[i].statusComment;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPurchaseItem2EstimateItem.Row:=CurrentRow-5;
   sgRQPurchaseItem2EstimateItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPurchaseItem2EstimateItemShow.sgRQPurchaseItem2EstimateItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPurchaseItem2EstimateItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPurchaseItem2EstimateItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPurchaseItem2EstimateItem.RowCount-1 do
   for j:=0 to sgRQPurchaseItem2EstimateItem.ColCount-1 do
     sgRQPurchaseItem2EstimateItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPurchaseItem2EstimateItemShow.actViewExecute(Sender: TObject);
Var TempRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItemControllerSoapPort;
begin
 TempRQPurchaseItem2EstimateItem := HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;
   try
     RQPurchaseItem2EstimateItemObj := TempRQPurchaseItem2EstimateItem.getObject(StrToInt(sgRQPurchaseItem2EstimateItem.Cells[0,sgRQPurchaseItem2EstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItem2EstimateItemEdit:=TfrmRQPurchaseItem2EstimateItemEdit.Create(Application, dsView);
  try
    frmRQPurchaseItem2EstimateItemEdit.ShowModal;
  finally
    frmRQPurchaseItem2EstimateItemEdit.Free;
    frmRQPurchaseItem2EstimateItemEdit:=nil;
  end;
end;

procedure TfrmRQPurchaseItem2EstimateItemShow.actEditExecute(Sender: TObject);
Var TempRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItemControllerSoapPort;
begin
 TempRQPurchaseItem2EstimateItem := HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;
   try
     RQPurchaseItem2EstimateItemObj := TempRQPurchaseItem2EstimateItem.getObject(StrToInt(sgRQPurchaseItem2EstimateItem.Cells[0,sgRQPurchaseItem2EstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItem2EstimateItemEdit:=TfrmRQPurchaseItem2EstimateItemEdit.Create(Application, dsEdit);
  try
    if frmRQPurchaseItem2EstimateItemEdit.ShowModal= mrOk then
      begin
        //TempRQPurchaseItem2EstimateItem.save(RQPurchaseItem2EstimateItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPurchaseItem2EstimateItemEdit.Free;
    frmRQPurchaseItem2EstimateItemEdit:=nil;
  end;
end;

procedure TfrmRQPurchaseItem2EstimateItemShow.actDeleteExecute(Sender: TObject);
Var TempRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPurchaseItem2EstimateItem := HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPurchaseItem2EstimateItem.Cells[0,sgRQPurchaseItem2EstimateItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Звьязок строк плану закупок з Матеріалами на планах) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPurchaseItem2EstimateItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPurchaseItem2EstimateItemShow.actInsertExecute(Sender: TObject);
// Var TempRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItemControllerSoapPort; 
begin
  // TempRQPurchaseItem2EstimateItem := HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPurchaseItem2EstimateItemObj:=RQPurchaseItem2EstimateItem.Create;

   //RQPurchaseItem2EstimateItemObj.countGen:= TXSDecimal.Create;
   //RQPurchaseItem2EstimateItemObj.countPurchase:= TXSDecimal.Create;


  try
    frmRQPurchaseItem2EstimateItemEdit:=TfrmRQPurchaseItem2EstimateItemEdit.Create(Application, dsInsert);
    try
      if frmRQPurchaseItem2EstimateItemEdit.ShowModal = mrOk then
      begin
        if RQPurchaseItem2EstimateItemObj<>nil then
            //TempRQPurchaseItem2EstimateItem.add(RQPurchaseItem2EstimateItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPurchaseItem2EstimateItemEdit.Free;
      frmRQPurchaseItem2EstimateItemEdit:=nil;
    end;
  finally
    RQPurchaseItem2EstimateItemObj.Free;
  end;
end;

procedure TfrmRQPurchaseItem2EstimateItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPurchaseItem2EstimateItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQPurchaseItem2EstimateItemFilterEdit:=TfrmRQPurchaseItem2EstimateItemFilterEdit.Create(Application, dsInsert);
  try
    RQPurchaseItem2EstimateItemFilterObj := RQPurchaseItem2EstimateItemFilter.Create;
    SetNullIntProps(RQPurchaseItem2EstimateItemFilterObj);
    SetNullXSProps(RQPurchaseItem2EstimateItemFilterObj);

    if frmRQPurchaseItem2EstimateItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPurchaseItem2EstimateItemFilter.Create;
      FilterObject := RQPurchaseItem2EstimateItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPurchaseItem2EstimateItemFilterEdit.Free;
    frmRQPurchaseItem2EstimateItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPurchaseItem2EstimateItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.