
unit ShowENNormVolumeAVZItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit,
  InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENNormVolumeAVZItemController, AdvObj ;


type
  TfrmENNormVolumeAVZItemShow = class(TChildForm)  
  HTTPRIOENNormVolumeAVZItem: THTTPRIO;
    ImageList1: TImageList;
    sgENNormVolumeAVZItem: TAdvStringGrid;
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
procedure sgENNormVolumeAVZItemTopLeftChanged(Sender: TObject);
procedure sgENNormVolumeAVZItemDblClick(Sender: TObject);
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
 // ENNormVolumeAVZItemObj: ENNormVolumeAVZItem;
 // ENNormVolumeAVZItemFilterObj: ENNormVolumeAVZItemFilter;
  
  
implementation

uses Main, EditENNormVolumeAVZItem, EditENNormVolumeAVZItemFilter;


{$R *.dfm}

var
  //frmENNormVolumeAVZItemShow : TfrmENNormVolumeAVZItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENNormVolumeAVZItemHeaders: array [1..4] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Од.виміру'
          ,'Нормативна кількість'
        );
   

procedure TfrmENNormVolumeAVZItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENNormVolumeAVZItemShow:=nil;
    inherited;
  end;


procedure TfrmENNormVolumeAVZItemShow.FormShow(Sender: TObject);
var
  TempENNormVolumeAVZItem: ENNormVolumeAVZItemControllerSoapPort;
  i: Integer;
  ENNormVolumeAVZItemList: ENNormVolumeAVZItemShortList;
begin
  SetGridHeaders(ENNormVolumeAVZItemHeaders, sgENNormVolumeAVZItem.ColumnHeaders);
  ColCount:=100;
  TempENNormVolumeAVZItem :=  HTTPRIOENNormVolumeAVZItem as ENNormVolumeAVZItemControllerSoapPort;

  if FilterObject = nil then
  begin
    FilterObject := ENNormVolumeAVZItemFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
  end;

  ENNormVolumeAVZItemList := TempENNormVolumeAVZItem.getScrollableFilteredList(ENNormVolumeAVZItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENNormVolumeAVZItemList.list);

  if LastCount > -1 then
     sgENNormVolumeAVZItem.RowCount:=LastCount+2
  else
     sgENNormVolumeAVZItem.RowCount:=2;

   with sgENNormVolumeAVZItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENNormVolumeAVZItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENNormVolumeAVZItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENNormVolumeAVZItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENNormVolumeAVZItemList.list[i].countGen.DecimalString;
        Cells[2,i+1] := ENNormVolumeAVZItemList.list[i].userGen;
        if ENNormVolumeAVZItemList.list[i].dateEdit = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENNormVolumeAVZItemList.list[i].dateEdit);
        LastRow:=i+1;
        sgENNormVolumeAVZItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENNormVolumeAVZItem.Row:=1;
end;

procedure TfrmENNormVolumeAVZItemShow.sgENNormVolumeAVZItemTopLeftChanged(Sender: TObject);
var
  TempENNormVolumeAVZItem: ENNormVolumeAVZItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENNormVolumeAVZItemList: ENNormVolumeAVZItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENNormVolumeAVZItem.TopRow + sgENNormVolumeAVZItem.VisibleRowCount) = ColCount
  then
    begin
      TempENNormVolumeAVZItem :=  HTTPRIOENNormVolumeAVZItem as ENNormVolumeAVZItemControllerSoapPort;
      CurrentRow:=sgENNormVolumeAVZItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENNormVolumeAVZItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENNormVolumeAVZItemList := TempENNormVolumeAVZItem.getScrollableFilteredList(ENNormVolumeAVZItemFilter(FilterObject),ColCount-1, 100);



  sgENNormVolumeAVZItem.RowCount:=sgENNormVolumeAVZItem.RowCount+100;
  LastCount:=High(ENNormVolumeAVZItemList.list);
  with sgENNormVolumeAVZItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENNormVolumeAVZItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENNormVolumeAVZItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENNormVolumeAVZItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENNormVolumeAVZItemList.list[i].countGen.DecimalString;
        Cells[2,i+CurrentRow] := ENNormVolumeAVZItemList.list[i].userGen;
        if ENNormVolumeAVZItemList.list[i].dateEdit = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDateTimeWithDate2String(ENNormVolumeAVZItemList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENNormVolumeAVZItem.Row:=CurrentRow-5;
   sgENNormVolumeAVZItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENNormVolumeAVZItemShow.sgENNormVolumeAVZItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENNormVolumeAVZItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENNormVolumeAVZItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENNormVolumeAVZItem.RowCount-1 do
   for j:=0 to sgENNormVolumeAVZItem.ColCount-1 do
     sgENNormVolumeAVZItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENNormVolumeAVZItemShow.actViewExecute(Sender: TObject);
Var TempENNormVolumeAVZItem: ENNormVolumeAVZItemControllerSoapPort;
begin
 TempENNormVolumeAVZItem := HTTPRIOENNormVolumeAVZItem as ENNormVolumeAVZItemControllerSoapPort;
   try
     ENNormVolumeAVZItemObj := TempENNormVolumeAVZItem.getObject(StrToInt(sgENNormVolumeAVZItem.Cells[0,sgENNormVolumeAVZItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENNormVolumeAVZItemEdit:=TfrmENNormVolumeAVZItemEdit.Create(Application, dsView);
  try
    frmENNormVolumeAVZItemEdit.ShowModal;
  finally
    frmENNormVolumeAVZItemEdit.Free;
    frmENNormVolumeAVZItemEdit:=nil;
  end;
end;

procedure TfrmENNormVolumeAVZItemShow.actEditExecute(Sender: TObject);
Var TempENNormVolumeAVZItem: ENNormVolumeAVZItemControllerSoapPort;
begin
 TempENNormVolumeAVZItem := HTTPRIOENNormVolumeAVZItem as ENNormVolumeAVZItemControllerSoapPort;
   try
     ENNormVolumeAVZItemObj := TempENNormVolumeAVZItem.getObject(StrToInt(sgENNormVolumeAVZItem.Cells[0,sgENNormVolumeAVZItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENNormVolumeAVZItemEdit:=TfrmENNormVolumeAVZItemEdit.Create(Application, dsEdit);
  try
    if frmENNormVolumeAVZItemEdit.ShowModal= mrOk then
      begin
        //TempENNormVolumeAVZItem.save(ENNormVolumeAVZItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENNormVolumeAVZItemEdit.Free;
    frmENNormVolumeAVZItemEdit:=nil;
  end;
end;

procedure TfrmENNormVolumeAVZItemShow.actDeleteExecute(Sender: TObject);
Var TempENNormVolumeAVZItem: ENNormVolumeAVZItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENNormVolumeAVZItem := HTTPRIOENNormVolumeAVZItem as ENNormVolumeAVZItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENNormVolumeAVZItem.Cells[0,sgENNormVolumeAVZItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строка довідника нормативних обсягів АВЗ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENNormVolumeAVZItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENNormVolumeAVZItemShow.actInsertExecute(Sender: TObject);
// Var TempENNormVolumeAVZItem: ENNormVolumeAVZItemControllerSoapPort; 
begin
  // TempENNormVolumeAVZItem := HTTPRIOENNormVolumeAVZItem as ENNormVolumeAVZItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENNormVolumeAVZItemObj:=ENNormVolumeAVZItem.Create;

   //ENNormVolumeAVZItemObj.countGen:= TXSDecimal.Create;
   //ENNormVolumeAVZItemObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENNormVolumeAVZItemEdit:=TfrmENNormVolumeAVZItemEdit.Create(Application, dsInsert);
    try
      if frmENNormVolumeAVZItemEdit.ShowModal = mrOk then
      begin
        if ENNormVolumeAVZItemObj<>nil then
            //TempENNormVolumeAVZItem.add(ENNormVolumeAVZItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENNormVolumeAVZItemEdit.Free;
      frmENNormVolumeAVZItemEdit:=nil;
    end;
  finally
    ENNormVolumeAVZItemObj.Free;
  end;
end;

procedure TfrmENNormVolumeAVZItemShow.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


procedure TfrmENNormVolumeAVZItemShow.actFilterExecute(Sender: TObject);
begin
{frmENNormVolumeAVZItemFilterEdit:=TfrmENNormVolumeAVZItemFilterEdit.Create(Application, dsInsert);
  try
    ENNormVolumeAVZItemFilterObj := ENNormVolumeAVZItemFilter.Create;
    SetNullIntProps(ENNormVolumeAVZItemFilterObj);
    SetNullXSProps(ENNormVolumeAVZItemFilterObj);

    if frmENNormVolumeAVZItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENNormVolumeAVZItemFilter.Create;
      FilterObject := ENNormVolumeAVZItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENNormVolumeAVZItemFilterEdit.Free;
    frmENNormVolumeAVZItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENNormVolumeAVZItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.