
unit ShowRQFKRemainder2EstimateItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQFKRemainder2EstimateItemController ;


type
  TfrmRQFKRemainder2EstimateItemShow = class(TChildForm)  
  HTTPRIORQFKRemainder2EstimateItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQFKRemainder2EstimateItem: TAdvStringGrid;
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
procedure sgRQFKRemainder2EstimateItemTopLeftChanged(Sender: TObject);
procedure sgRQFKRemainder2EstimateItemDblClick(Sender: TObject);
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
 // RQFKRemainder2EstimateItemObj: RQFKRemainder2EstimateItem;
 // RQFKRemainder2EstimateItemFilterObj: RQFKRemainder2EstimateItemFilter;
  
  
implementation

uses Main, EditRQFKRemainder2EstimateItem, EditRQFKRemainder2EstimateItemFilter;


{$R *.dfm}

var
  //frmRQFKRemainder2EstimateItemShow : TfrmRQFKRemainder2EstimateItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQFKRemainder2EstimateItemHeaders: array [1..2] of String =
        ( 'Код'
          ,'кількість у заявці'
        );
   

procedure TfrmRQFKRemainder2EstimateItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQFKRemainder2EstimateItemShow:=nil;
    inherited;
  end;


procedure TfrmRQFKRemainder2EstimateItemShow.FormShow(Sender: TObject);
var
  TempRQFKRemainder2EstimateItem: RQFKRemainder2EstimateItemControllerSoapPort;
  i: Integer;
  RQFKRemainder2EstimateItemList: RQFKRemainder2EstimateItemShortList;
  begin
  SetGridHeaders(RQFKRemainder2EstimateItemHeaders, sgRQFKRemainder2EstimateItem.ColumnHeaders);
  ColCount:=100;
  TempRQFKRemainder2EstimateItem :=  HTTPRIORQFKRemainder2EstimateItem as RQFKRemainder2EstimateItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQFKRemainder2EstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKRemainder2EstimateItemList := TempRQFKRemainder2EstimateItem.getScrollableFilteredList(RQFKRemainder2EstimateItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQFKRemainder2EstimateItemList.list);

  if LastCount > -1 then
     sgRQFKRemainder2EstimateItem.RowCount:=LastCount+2
  else
     sgRQFKRemainder2EstimateItem.RowCount:=2;

   with sgRQFKRemainder2EstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKRemainder2EstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKRemainder2EstimateItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQFKRemainder2EstimateItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQFKRemainder2EstimateItemList.list[i].countGen.DecimalString;
        LastRow:=i+1;
        sgRQFKRemainder2EstimateItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQFKRemainder2EstimateItem.Row:=1;
end;

procedure TfrmRQFKRemainder2EstimateItemShow.sgRQFKRemainder2EstimateItemTopLeftChanged(Sender: TObject);
var
  TempRQFKRemainder2EstimateItem: RQFKRemainder2EstimateItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQFKRemainder2EstimateItemList: RQFKRemainder2EstimateItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQFKRemainder2EstimateItem.TopRow + sgRQFKRemainder2EstimateItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQFKRemainder2EstimateItem :=  HTTPRIORQFKRemainder2EstimateItem as RQFKRemainder2EstimateItemControllerSoapPort;
      CurrentRow:=sgRQFKRemainder2EstimateItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQFKRemainder2EstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKRemainder2EstimateItemList := TempRQFKRemainder2EstimateItem.getScrollableFilteredList(RQFKRemainder2EstimateItemFilter(FilterObject),ColCount-1, 100);



  sgRQFKRemainder2EstimateItem.RowCount:=sgRQFKRemainder2EstimateItem.RowCount+100;
  LastCount:=High(RQFKRemainder2EstimateItemList.list);
  with sgRQFKRemainder2EstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKRemainder2EstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQFKRemainder2EstimateItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQFKRemainder2EstimateItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQFKRemainder2EstimateItemList.list[i].countGen.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQFKRemainder2EstimateItem.Row:=CurrentRow-5;
   sgRQFKRemainder2EstimateItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQFKRemainder2EstimateItemShow.sgRQFKRemainder2EstimateItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQFKRemainder2EstimateItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQFKRemainder2EstimateItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQFKRemainder2EstimateItem.RowCount-1 do
   for j:=0 to sgRQFKRemainder2EstimateItem.ColCount-1 do
     sgRQFKRemainder2EstimateItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQFKRemainder2EstimateItemShow.actViewExecute(Sender: TObject);
Var TempRQFKRemainder2EstimateItem: RQFKRemainder2EstimateItemControllerSoapPort;
begin
 TempRQFKRemainder2EstimateItem := HTTPRIORQFKRemainder2EstimateItem as RQFKRemainder2EstimateItemControllerSoapPort;
   try
     RQFKRemainder2EstimateItemObj := TempRQFKRemainder2EstimateItem.getObject(StrToInt(sgRQFKRemainder2EstimateItem.Cells[0,sgRQFKRemainder2EstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKRemainder2EstimateItemEdit:=TfrmRQFKRemainder2EstimateItemEdit.Create(Application, dsView);
  try
    frmRQFKRemainder2EstimateItemEdit.ShowModal;
  finally
    frmRQFKRemainder2EstimateItemEdit.Free;
    frmRQFKRemainder2EstimateItemEdit:=nil;
  end;
end;

procedure TfrmRQFKRemainder2EstimateItemShow.actEditExecute(Sender: TObject);
Var TempRQFKRemainder2EstimateItem: RQFKRemainder2EstimateItemControllerSoapPort;
begin
 TempRQFKRemainder2EstimateItem := HTTPRIORQFKRemainder2EstimateItem as RQFKRemainder2EstimateItemControllerSoapPort;
   try
     RQFKRemainder2EstimateItemObj := TempRQFKRemainder2EstimateItem.getObject(StrToInt(sgRQFKRemainder2EstimateItem.Cells[0,sgRQFKRemainder2EstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKRemainder2EstimateItemEdit:=TfrmRQFKRemainder2EstimateItemEdit.Create(Application, dsEdit);
  try
    if frmRQFKRemainder2EstimateItemEdit.ShowModal= mrOk then
      begin
        //TempRQFKRemainder2EstimateItem.save(RQFKRemainder2EstimateItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQFKRemainder2EstimateItemEdit.Free;
    frmRQFKRemainder2EstimateItemEdit:=nil;
  end;
end;

procedure TfrmRQFKRemainder2EstimateItemShow.actDeleteExecute(Sender: TObject);
Var TempRQFKRemainder2EstimateItem: RQFKRemainder2EstimateItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQFKRemainder2EstimateItem := HTTPRIORQFKRemainder2EstimateItem as RQFKRemainder2EstimateItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQFKRemainder2EstimateItem.Cells[0,sgRQFKRemainder2EstimateItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв_язок надлишка з матеріалом з наступних планів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQFKRemainder2EstimateItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQFKRemainder2EstimateItemShow.actInsertExecute(Sender: TObject);
Var TempRQFKRemainder2EstimateItem: RQFKRemainder2EstimateItemControllerSoapPort;
begin
  TempRQFKRemainder2EstimateItem := HTTPRIORQFKRemainder2EstimateItem as RQFKRemainder2EstimateItemControllerSoapPort;
  RQFKRemainder2EstimateItemObj:=RQFKRemainder2EstimateItem.Create;

   //RQFKRemainder2EstimateItemObj.countGen:= TXSDecimal.Create;


  try
    frmRQFKRemainder2EstimateItemEdit:=TfrmRQFKRemainder2EstimateItemEdit.Create(Application, dsInsert);
    try
      if frmRQFKRemainder2EstimateItemEdit.ShowModal = mrOk then
      begin
        if RQFKRemainder2EstimateItemObj<>nil then
            //TempRQFKRemainder2EstimateItem.add(RQFKRemainder2EstimateItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQFKRemainder2EstimateItemEdit.Free;
      frmRQFKRemainder2EstimateItemEdit:=nil;
    end;
  finally
    RQFKRemainder2EstimateItemObj.Free;
  end;
end;

procedure TfrmRQFKRemainder2EstimateItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQFKRemainder2EstimateItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQFKRemainder2EstimateItemFilterEdit:=TfrmRQFKRemainder2EstimateItemFilterEdit.Create(Application, dsInsert);
  try
    RQFKRemainder2EstimateItemFilterObj := RQFKRemainder2EstimateItemFilter.Create;
    SetNullIntProps(RQFKRemainder2EstimateItemFilterObj);
    SetNullXSProps(RQFKRemainder2EstimateItemFilterObj);

    if frmRQFKRemainder2EstimateItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQFKRemainder2EstimateItemFilter.Create;
      FilterObject := RQFKRemainder2EstimateItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQFKRemainder2EstimateItemFilterEdit.Free;
    frmRQFKRemainder2EstimateItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQFKRemainder2EstimateItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.