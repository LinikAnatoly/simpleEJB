
unit ShowRQFKOrderItem2ENEstimateItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQFKOrderItem2ENEstimateItemController, AdvObj ;


type
  TfrmRQFKOrderItem2ENEstimateItemShow = class(TChildForm)  
  HTTPRIORQFKOrderItem2ENEstimateItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQFKOrderItem2ENEstimateItem: TAdvStringGrid;
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
procedure sgRQFKOrderItem2ENEstimateItemTopLeftChanged(Sender: TObject);
procedure sgRQFKOrderItem2ENEstimateItemDblClick(Sender: TObject);
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
 frmRQFKOrderItem2ENEstimateItemShow : TfrmRQFKOrderItem2ENEstimateItemShow;
 // RQFKOrderItem2ENEstimateItemObj: RQFKOrderItem2ENEstimateItem;
 // RQFKOrderItem2ENEstimateItemFilterObj: RQFKOrderItem2ENEstimateItemFilter;
  
  
implementation

uses Main, EditRQFKOrderItem2ENEstimateItem, EditRQFKOrderItem2ENEstimateItemFilter;


{$R *.dfm}

var
  //frmRQFKOrderItem2ENEstimateItemShow : TfrmRQFKOrderItem2ENEstimateItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQFKOrderItem2ENEstimateItemHeaders: array [1..3] of String =
        ( 'Код'
          ,'кількість у заявці'
          ,'сума у заявці'
        );
   

procedure TfrmRQFKOrderItem2ENEstimateItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQFKOrderItem2ENEstimateItemShow:=nil;
    inherited;
  end;


procedure TfrmRQFKOrderItem2ENEstimateItemShow.FormShow(Sender: TObject);
var
  TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
  i: Integer;
  RQFKOrderItem2ENEstimateItemList: RQFKOrderItem2ENEstimateItemShortList;
  begin
  SetGridHeaders(RQFKOrderItem2ENEstimateItemHeaders, sgRQFKOrderItem2ENEstimateItem.ColumnHeaders);
  ColCount:=100;
  TempRQFKOrderItem2ENEstimateItem :=  HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderItem2ENEstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderItem2ENEstimateItemList := TempRQFKOrderItem2ENEstimateItem.getScrollableFilteredList(RQFKOrderItem2ENEstimateItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQFKOrderItem2ENEstimateItemList.list);

  if LastCount > -1 then
     sgRQFKOrderItem2ENEstimateItem.RowCount:=LastCount+2
  else
     sgRQFKOrderItem2ENEstimateItem.RowCount:=2;

   with sgRQFKOrderItem2ENEstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderItem2ENEstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderItem2ENEstimateItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQFKOrderItem2ENEstimateItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQFKOrderItem2ENEstimateItemList.list[i].countGen.DecimalString;
        if RQFKOrderItem2ENEstimateItemList.list[i].sumWithoutNds = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := RQFKOrderItem2ENEstimateItemList.list[i].sumWithoutNds.DecimalString;
        LastRow:=i+1;
        sgRQFKOrderItem2ENEstimateItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQFKOrderItem2ENEstimateItem.Row:=1;
end;

procedure TfrmRQFKOrderItem2ENEstimateItemShow.sgRQFKOrderItem2ENEstimateItemTopLeftChanged(Sender: TObject);
var
  TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQFKOrderItem2ENEstimateItemList: RQFKOrderItem2ENEstimateItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQFKOrderItem2ENEstimateItem.TopRow + sgRQFKOrderItem2ENEstimateItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQFKOrderItem2ENEstimateItem :=  HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
      CurrentRow:=sgRQFKOrderItem2ENEstimateItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderItem2ENEstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderItem2ENEstimateItemList := TempRQFKOrderItem2ENEstimateItem.getScrollableFilteredList(RQFKOrderItem2ENEstimateItemFilter(FilterObject),ColCount-1, 100);



  sgRQFKOrderItem2ENEstimateItem.RowCount:=sgRQFKOrderItem2ENEstimateItem.RowCount+100;
  LastCount:=High(RQFKOrderItem2ENEstimateItemList.list);
  with sgRQFKOrderItem2ENEstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderItem2ENEstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQFKOrderItem2ENEstimateItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQFKOrderItem2ENEstimateItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQFKOrderItem2ENEstimateItemList.list[i].countGen.DecimalString;
        if RQFKOrderItem2ENEstimateItemList.list[i].sumWithoutNds = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := RQFKOrderItem2ENEstimateItemList.list[i].sumWithoutNds.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQFKOrderItem2ENEstimateItem.Row:=CurrentRow-5;
   sgRQFKOrderItem2ENEstimateItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQFKOrderItem2ENEstimateItemShow.sgRQFKOrderItem2ENEstimateItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQFKOrderItem2ENEstimateItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQFKOrderItem2ENEstimateItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQFKOrderItem2ENEstimateItem.RowCount-1 do
   for j:=0 to sgRQFKOrderItem2ENEstimateItem.ColCount-1 do
     sgRQFKOrderItem2ENEstimateItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQFKOrderItem2ENEstimateItemShow.actViewExecute(Sender: TObject);
Var TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
begin
 TempRQFKOrderItem2ENEstimateItem := HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
   try
     RQFKOrderItem2ENEstimateItemObj := TempRQFKOrderItem2ENEstimateItem.getObject(StrToInt(sgRQFKOrderItem2ENEstimateItem.Cells[0,sgRQFKOrderItem2ENEstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderItem2ENEstimateItemEdit:=TfrmRQFKOrderItem2ENEstimateItemEdit.Create(Application, dsView);
  try
    frmRQFKOrderItem2ENEstimateItemEdit.ShowModal;
  finally
    frmRQFKOrderItem2ENEstimateItemEdit.Free;
    frmRQFKOrderItem2ENEstimateItemEdit:=nil;
  end;
end;

procedure TfrmRQFKOrderItem2ENEstimateItemShow.actEditExecute(Sender: TObject);
Var TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
begin
 TempRQFKOrderItem2ENEstimateItem := HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
   try
     RQFKOrderItem2ENEstimateItemObj := TempRQFKOrderItem2ENEstimateItem.getObject(StrToInt(sgRQFKOrderItem2ENEstimateItem.Cells[0,sgRQFKOrderItem2ENEstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderItem2ENEstimateItemEdit:=TfrmRQFKOrderItem2ENEstimateItemEdit.Create(Application, dsEdit);
  try
    if frmRQFKOrderItem2ENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempRQFKOrderItem2ENEstimateItem.save(RQFKOrderItem2ENEstimateItemObj);
        //UpdateGrid(Sender);
        ModalResult := mrOK;
      end;
  finally
    frmRQFKOrderItem2ENEstimateItemEdit.Free;
    frmRQFKOrderItem2ENEstimateItemEdit:=nil;
  end;
end;

procedure TfrmRQFKOrderItem2ENEstimateItemShow.actDeleteExecute(Sender: TObject);
Var TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQFKOrderItem2ENEstimateItem := HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQFKOrderItem2ENEstimateItem.Cells[0,sgRQFKOrderItem2ENEstimateItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Звьязок строк ордерів з Матеріалами на планах) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQFKOrderItem2ENEstimateItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQFKOrderItem2ENEstimateItemShow.actInsertExecute(Sender: TObject);
Var TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
begin
  TempRQFKOrderItem2ENEstimateItem := HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
  RQFKOrderItem2ENEstimateItemObj:=RQFKOrderItem2ENEstimateItem.Create;

   RQFKOrderItem2ENEstimateItemObj.countGen:= TXSDecimal.Create;
   RQFKOrderItem2ENEstimateItemObj.sumWithoutNds:= TXSDecimal.Create;


  try
    frmRQFKOrderItem2ENEstimateItemEdit:=TfrmRQFKOrderItem2ENEstimateItemEdit.Create(Application, dsInsert);
    try
      if frmRQFKOrderItem2ENEstimateItemEdit.ShowModal = mrOk then
      begin
        if RQFKOrderItem2ENEstimateItemObj<>nil then
            //TempRQFKOrderItem2ENEstimateItem.add(RQFKOrderItem2ENEstimateItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQFKOrderItem2ENEstimateItemEdit.Free;
      frmRQFKOrderItem2ENEstimateItemEdit:=nil;
    end;
  finally
    RQFKOrderItem2ENEstimateItemObj.Free;
  end;
end;

procedure TfrmRQFKOrderItem2ENEstimateItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQFKOrderItem2ENEstimateItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQFKOrderItem2ENEstimateItemFilterEdit:=TfrmRQFKOrderItem2ENEstimateItemFilterEdit.Create(Application, dsEdit);
  try
    RQFKOrderItem2ENEstimateItemFilterObj := RQFKOrderItem2ENEstimateItemFilter.Create;
    SetNullIntProps(RQFKOrderItem2ENEstimateItemFilterObj);
    SetNullXSProps(RQFKOrderItem2ENEstimateItemFilterObj);

    if frmRQFKOrderItem2ENEstimateItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQFKOrderItem2ENEstimateItemFilter.Create;
      FilterObject := RQFKOrderItem2ENEstimateItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQFKOrderItem2ENEstimateItemFilterEdit.Free;
    frmRQFKOrderItem2ENEstimateItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQFKOrderItem2ENEstimateItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.