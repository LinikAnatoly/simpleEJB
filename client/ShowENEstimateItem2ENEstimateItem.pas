
unit ShowENEstimateItem2ENEstimateItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENEstimateItem2ENEstimateItemController
  , ENEstimateItem2TypeController
  ,ENConsts
   ;


type
  TfrmENEstimateItem2ENEstimateItemShow = class(TChildForm)  
  HTTPRIOENEstimateItem2ENEstimateItem: THTTPRIO;
    ImageList1: TImageList;
    sgENEstimateItem2ENEstimateItem: TAdvStringGrid;
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
procedure sgENEstimateItem2ENEstimateItemTopLeftChanged(Sender: TObject);
procedure sgENEstimateItem2ENEstimateItemDblClick(Sender: TObject);
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
 // ENEstimateItem2ENEstimateItemObj: ENEstimateItem2ENEstimateItem;
 // ENEstimateItem2ENEstimateItemFilterObj: ENEstimateItem2ENEstimateItemFilter;
  
  
implementation

uses Main, EditENEstimateItem2ENEstimateItem, EditENEstimateItem2ENEstimateItemFilter;


{$R *.dfm}

var
  //frmENEstimateItem2ENEstimateItemShow : TfrmENEstimateItem2ENEstimateItemShow;

  //Зв'язок Матеріалів на планах з матеріалами (у річнному - у поточному- у НПЗ і т.д.)
  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENEstimateItem2ENEstimateItemHeaders: array [1..2] of String =
        ( 'Код'
          ,'кількість'
        );
   

procedure TfrmENEstimateItem2ENEstimateItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENEstimateItem2ENEstimateItemShow:=nil;
    inherited;
  end;


procedure TfrmENEstimateItem2ENEstimateItemShow.FormShow(Sender: TObject);
var
  TempENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItemControllerSoapPort;
  i: Integer;
  ENEstimateItem2ENEstimateItemList: ENEstimateItem2ENEstimateItemShortList;
  begin
  SetGridHeaders(ENEstimateItem2ENEstimateItemHeaders, sgENEstimateItem2ENEstimateItem.ColumnHeaders);
  ColCount:=100;
  TempENEstimateItem2ENEstimateItem :=  HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENEstimateItem2ENEstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     ENEstimateItem2ENEstimateItemFilter(FilterObject).typeRef := ENEstimateItem2TypeRef.Create;
     ENEstimateItem2ENEstimateItemFilter(FilterObject).typeRef.code := ENESTIMATEITEM2ENESTIMATEITEM_TYPE_OBJECT_MOVED;
  end;

  ENEstimateItem2ENEstimateItemList := TempENEstimateItem2ENEstimateItem.getScrollableFilteredList(ENEstimateItem2ENEstimateItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENEstimateItem2ENEstimateItemList.list);

  if LastCount > -1 then
     sgENEstimateItem2ENEstimateItem.RowCount:=LastCount+2
  else
     sgENEstimateItem2ENEstimateItem.RowCount:=2;

   with sgENEstimateItem2ENEstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEstimateItem2ENEstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENEstimateItem2ENEstimateItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENEstimateItem2ENEstimateItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENEstimateItem2ENEstimateItemList.list[i].countGen.DecimalString;
        LastRow:=i+1;
        sgENEstimateItem2ENEstimateItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENEstimateItem2ENEstimateItem.Row:=1;
end;

procedure TfrmENEstimateItem2ENEstimateItemShow.sgENEstimateItem2ENEstimateItemTopLeftChanged(Sender: TObject);
var
  TempENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENEstimateItem2ENEstimateItemList: ENEstimateItem2ENEstimateItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENEstimateItem2ENEstimateItem.TopRow + sgENEstimateItem2ENEstimateItem.VisibleRowCount) = ColCount
  then
    begin
      TempENEstimateItem2ENEstimateItem :=  HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;
      CurrentRow:=sgENEstimateItem2ENEstimateItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENEstimateItem2ENEstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEstimateItem2ENEstimateItemList := TempENEstimateItem2ENEstimateItem.getScrollableFilteredList(ENEstimateItem2ENEstimateItemFilter(FilterObject),ColCount-1, 100);



  sgENEstimateItem2ENEstimateItem.RowCount:=sgENEstimateItem2ENEstimateItem.RowCount+100;
  LastCount:=High(ENEstimateItem2ENEstimateItemList.list);
  with sgENEstimateItem2ENEstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEstimateItem2ENEstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENEstimateItem2ENEstimateItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENEstimateItem2ENEstimateItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENEstimateItem2ENEstimateItemList.list[i].countGen.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENEstimateItem2ENEstimateItem.Row:=CurrentRow-5;
   sgENEstimateItem2ENEstimateItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENEstimateItem2ENEstimateItemShow.sgENEstimateItem2ENEstimateItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENEstimateItem2ENEstimateItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENEstimateItem2ENEstimateItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENEstimateItem2ENEstimateItem.RowCount-1 do
   for j:=0 to sgENEstimateItem2ENEstimateItem.ColCount-1 do
     sgENEstimateItem2ENEstimateItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENEstimateItem2ENEstimateItemShow.actViewExecute(Sender: TObject);
Var TempENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItemControllerSoapPort;
begin
 TempENEstimateItem2ENEstimateItem := HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;
   try
     ENEstimateItem2ENEstimateItemObj := TempENEstimateItem2ENEstimateItem.getObject(StrToInt(sgENEstimateItem2ENEstimateItem.Cells[0,sgENEstimateItem2ENEstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEstimateItem2ENEstimateItemEdit:=TfrmENEstimateItem2ENEstimateItemEdit.Create(Application, dsView);
  try
    frmENEstimateItem2ENEstimateItemEdit.ShowModal;
  finally
    frmENEstimateItem2ENEstimateItemEdit.Free;
    frmENEstimateItem2ENEstimateItemEdit:=nil;
  end;
end;

procedure TfrmENEstimateItem2ENEstimateItemShow.actEditExecute(Sender: TObject);
Var TempENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItemControllerSoapPort;
begin
 TempENEstimateItem2ENEstimateItem := HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;
   try
     ENEstimateItem2ENEstimateItemObj := TempENEstimateItem2ENEstimateItem.getObject(StrToInt(sgENEstimateItem2ENEstimateItem.Cells[0,sgENEstimateItem2ENEstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEstimateItem2ENEstimateItemEdit:=TfrmENEstimateItem2ENEstimateItemEdit.Create(Application, dsEdit);
  try
    if frmENEstimateItem2ENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempENEstimateItem2ENEstimateItem.save(ENEstimateItem2ENEstimateItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENEstimateItem2ENEstimateItemEdit.Free;
    frmENEstimateItem2ENEstimateItemEdit:=nil;
  end;
end;

procedure TfrmENEstimateItem2ENEstimateItemShow.actDeleteExecute(Sender: TObject);
Var TempENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENEstimateItem2ENEstimateItem := HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENEstimateItem2ENEstimateItem.Cells[0,sgENEstimateItem2ENEstimateItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Зв''язок матеріалів) ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENEstimateItem2ENEstimateItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENEstimateItem2ENEstimateItemShow.actInsertExecute(Sender: TObject);
Var TempENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItemControllerSoapPort;
begin
  TempENEstimateItem2ENEstimateItem := HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;
  ENEstimateItem2ENEstimateItemObj:=ENEstimateItem2ENEstimateItem.Create;

   ENEstimateItem2ENEstimateItemObj.countGen:= TXSDecimal.Create;


  try
    frmENEstimateItem2ENEstimateItemEdit:=TfrmENEstimateItem2ENEstimateItemEdit.Create(Application, dsInsert);
    try
      if frmENEstimateItem2ENEstimateItemEdit.ShowModal = mrOk then
      begin
        if ENEstimateItem2ENEstimateItemObj<>nil then
            //TempENEstimateItem2ENEstimateItem.add(ENEstimateItem2ENEstimateItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItem2ENEstimateItemEdit.Free;
      frmENEstimateItem2ENEstimateItemEdit:=nil;
    end;
  finally
    ENEstimateItem2ENEstimateItemObj.Free;
  end;
end;

procedure TfrmENEstimateItem2ENEstimateItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENEstimateItem2ENEstimateItemShow.actFilterExecute(Sender: TObject);
begin
{frmENEstimateItem2ENEstimateItemFilterEdit:=TfrmENEstimateItem2ENEstimateItemFilterEdit.Create(Application, dsEdit);
  try
    ENEstimateItem2ENEstimateItemFilterObj := ENEstimateItem2ENEstimateItemFilter.Create;
    SetNullIntProps(ENEstimateItem2ENEstimateItemFilterObj);
    SetNullXSProps(ENEstimateItem2ENEstimateItemFilterObj);

    if frmENEstimateItem2ENEstimateItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENEstimateItem2ENEstimateItemFilter.Create;
      FilterObject := ENEstimateItem2ENEstimateItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENEstimateItem2ENEstimateItemFilterEdit.Free;
    frmENEstimateItem2ENEstimateItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENEstimateItem2ENEstimateItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;

  ENEstimateItem2ENEstimateItemFilter(FilterObject).typeRef := ENEstimateItem2TypeRef.Create;
  ENEstimateItem2ENEstimateItemFilter(FilterObject).typeRef.code := ENESTIMATEITEM2ENESTIMATEITEM_TYPE_OBJECT_MOVED;

  UpdateGrid(Sender);
end;

end.