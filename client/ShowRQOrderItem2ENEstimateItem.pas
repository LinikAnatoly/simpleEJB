
unit ShowRQOrderItem2ENEstimateItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrderItem2ENEstimateItemController ;


type
  TfrmRQOrderItem2ENEstimateItemShow = class(TChildForm)  
  HTTPRIORQOrderItem2ENEstimateItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrderItem2ENEstimateItem: TAdvStringGrid;
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
procedure sgRQOrderItem2ENEstimateItemTopLeftChanged(Sender: TObject);
procedure sgRQOrderItem2ENEstimateItemDblClick(Sender: TObject);
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
 // RQOrderItem2ENEstimateItemObj: RQOrderItem2ENEstimateItem;
 // RQOrderItem2ENEstimateItemFilterObj: RQOrderItem2ENEstimateItemFilter;
  
  
implementation

uses Main, EditRQOrderItem2ENEstimateItem, EditRQOrderItem2ENEstimateItemFilter;


{$R *.dfm}

var
  //frmRQOrderItem2ENEstimateItemShow : TfrmRQOrderItem2ENEstimateItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrderItem2ENEstimateItemHeaders: array [1..2] of String =
        ( 'Код'
          ,'кількість у заявці'
        );
   

procedure TfrmRQOrderItem2ENEstimateItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrderItem2ENEstimateItemShow:=nil;
    inherited;
  end;


procedure TfrmRQOrderItem2ENEstimateItemShow.FormShow(Sender: TObject);
var
  TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
  i: Integer;
  RQOrderItem2ENEstimateItemList: RQOrderItem2ENEstimateItemShortList;
  begin
  SetGridHeaders(RQOrderItem2ENEstimateItemHeaders, sgRQOrderItem2ENEstimateItem.ColumnHeaders);
  ColCount:=100;
  TempRQOrderItem2ENEstimateItem :=  HTTPRIORQOrderItem2ENEstimateItem as RQOrderItem2ENEstimateItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderItem2ENEstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderItem2ENEstimateItemList := TempRQOrderItem2ENEstimateItem.getScrollableFilteredList(RQOrderItem2ENEstimateItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrderItem2ENEstimateItemList.list);

  if LastCount > -1 then
     sgRQOrderItem2ENEstimateItem.RowCount:=LastCount+2
  else
     sgRQOrderItem2ENEstimateItem.RowCount:=2;

   with sgRQOrderItem2ENEstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderItem2ENEstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrderItem2ENEstimateItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQOrderItem2ENEstimateItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQOrderItem2ENEstimateItemList.list[i].countGen.DecimalString;
        LastRow:=i+1;
        sgRQOrderItem2ENEstimateItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrderItem2ENEstimateItem.Row:=1;
end;

procedure TfrmRQOrderItem2ENEstimateItemShow.sgRQOrderItem2ENEstimateItemTopLeftChanged(Sender: TObject);
var
  TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrderItem2ENEstimateItemList: RQOrderItem2ENEstimateItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrderItem2ENEstimateItem.TopRow + sgRQOrderItem2ENEstimateItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrderItem2ENEstimateItem :=  HTTPRIORQOrderItem2ENEstimateItem as RQOrderItem2ENEstimateItemControllerSoapPort;
      CurrentRow:=sgRQOrderItem2ENEstimateItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderItem2ENEstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderItem2ENEstimateItemList := TempRQOrderItem2ENEstimateItem.getScrollableFilteredList(RQOrderItem2ENEstimateItemFilter(FilterObject),ColCount-1, 100);



  sgRQOrderItem2ENEstimateItem.RowCount:=sgRQOrderItem2ENEstimateItem.RowCount+100;
  LastCount:=High(RQOrderItem2ENEstimateItemList.list);
  with sgRQOrderItem2ENEstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderItem2ENEstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrderItem2ENEstimateItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQOrderItem2ENEstimateItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQOrderItem2ENEstimateItemList.list[i].countGen.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrderItem2ENEstimateItem.Row:=CurrentRow-5;
   sgRQOrderItem2ENEstimateItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemShow.sgRQOrderItem2ENEstimateItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrderItem2ENEstimateItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrderItem2ENEstimateItem.RowCount-1 do
   for j:=0 to sgRQOrderItem2ENEstimateItem.ColCount-1 do
     sgRQOrderItem2ENEstimateItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrderItem2ENEstimateItemShow.actViewExecute(Sender: TObject);
Var TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
begin
 TempRQOrderItem2ENEstimateItem := HTTPRIORQOrderItem2ENEstimateItem as RQOrderItem2ENEstimateItemControllerSoapPort;
   try
     RQOrderItem2ENEstimateItemObj := TempRQOrderItem2ENEstimateItem.getObject(StrToInt(sgRQOrderItem2ENEstimateItem.Cells[0,sgRQOrderItem2ENEstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderItem2ENEstimateItemEdit:=TfrmRQOrderItem2ENEstimateItemEdit.Create(Application, dsView);
  try
    frmRQOrderItem2ENEstimateItemEdit.ShowModal;
  finally
    frmRQOrderItem2ENEstimateItemEdit.Free;
    frmRQOrderItem2ENEstimateItemEdit:=nil;
  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemShow.actEditExecute(Sender: TObject);
Var TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
begin
 TempRQOrderItem2ENEstimateItem := HTTPRIORQOrderItem2ENEstimateItem as RQOrderItem2ENEstimateItemControllerSoapPort;
   try
     RQOrderItem2ENEstimateItemObj := TempRQOrderItem2ENEstimateItem.getObject(StrToInt(sgRQOrderItem2ENEstimateItem.Cells[0,sgRQOrderItem2ENEstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderItem2ENEstimateItemEdit:=TfrmRQOrderItem2ENEstimateItemEdit.Create(Application, dsEdit);
  try
    if frmRQOrderItem2ENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempRQOrderItem2ENEstimateItem.save(RQOrderItem2ENEstimateItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrderItem2ENEstimateItemEdit.Free;
    frmRQOrderItem2ENEstimateItemEdit:=nil;
  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemShow.actDeleteExecute(Sender: TObject);
Var TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrderItem2ENEstimateItem := HTTPRIORQOrderItem2ENEstimateItem as RQOrderItem2ENEstimateItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrderItem2ENEstimateItem.Cells[0,sgRQOrderItem2ENEstimateItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Звьязок строк заявки з Матеріалами на планах) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrderItem2ENEstimateItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemShow.actInsertExecute(Sender: TObject);
Var TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
begin
  TempRQOrderItem2ENEstimateItem := HTTPRIORQOrderItem2ENEstimateItem as RQOrderItem2ENEstimateItemControllerSoapPort;
  RQOrderItem2ENEstimateItemObj:=RQOrderItem2ENEstimateItem.Create;

   RQOrderItem2ENEstimateItemObj.countGen:= TXSDecimal.Create;


  try
    frmRQOrderItem2ENEstimateItemEdit:=TfrmRQOrderItem2ENEstimateItemEdit.Create(Application, dsInsert);
    try
      if frmRQOrderItem2ENEstimateItemEdit.ShowModal = mrOk then
      begin
        if RQOrderItem2ENEstimateItemObj<>nil then
            //TempRQOrderItem2ENEstimateItem.add(RQOrderItem2ENEstimateItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrderItem2ENEstimateItemEdit.Free;
      frmRQOrderItem2ENEstimateItemEdit:=nil;
    end;
  finally
    RQOrderItem2ENEstimateItemObj.Free;
  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrderItem2ENEstimateItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQOrderItem2ENEstimateItemFilterEdit:=TfrmRQOrderItem2ENEstimateItemFilterEdit.Create(Application, dsEdit);
  try
    RQOrderItem2ENEstimateItemFilterObj := RQOrderItem2ENEstimateItemFilter.Create;
    SetNullIntProps(RQOrderItem2ENEstimateItemFilterObj);
    SetNullXSProps(RQOrderItem2ENEstimateItemFilterObj);

    if frmRQOrderItem2ENEstimateItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrderItem2ENEstimateItemFilter.Create;
      FilterObject := RQOrderItem2ENEstimateItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrderItem2ENEstimateItemFilterEdit.Free;
    frmRQOrderItem2ENEstimateItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQOrderItem2ENEstimateItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.