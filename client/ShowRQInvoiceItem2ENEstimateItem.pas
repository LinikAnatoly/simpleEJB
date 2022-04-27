
unit ShowRQInvoiceItem2ENEstimateItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQInvoiceItem2ENEstimateItemController ;


type
  TfrmRQInvoiceItem2ENEstimateItemShow = class(TChildForm)  
  HTTPRIORQInvoiceItem2ENEstimateItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQInvoiceItem2ENEstimateItem: TAdvStringGrid;
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
procedure sgRQInvoiceItem2ENEstimateItemTopLeftChanged(Sender: TObject);
procedure sgRQInvoiceItem2ENEstimateItemDblClick(Sender: TObject);
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
 // RQInvoiceItem2ENEstimateItemObj: RQInvoiceItem2ENEstimateItem;
 // RQInvoiceItem2ENEstimateItemFilterObj: RQInvoiceItem2ENEstimateItemFilter;
  
  
implementation

uses Main, EditRQInvoiceItem2ENEstimateItem, EditRQInvoiceItem2ENEstimateItemFilter;


{$R *.dfm}

var
  //frmRQInvoiceItem2ENEstimateItemShow : TfrmRQInvoiceItem2ENEstimateItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQInvoiceItem2ENEstimateItemHeaders: array [1..2] of String =
        ( 'Код'
          ,'кількість'
        );
   

procedure TfrmRQInvoiceItem2ENEstimateItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQInvoiceItem2ENEstimateItemShow:=nil;
    inherited;
  end;


procedure TfrmRQInvoiceItem2ENEstimateItemShow.FormShow(Sender: TObject);
var
  TempRQInvoiceItem2ENEstimateItem: RQInvoiceItem2ENEstimateItemControllerSoapPort;
  i: Integer;
  RQInvoiceItem2ENEstimateItemList: RQInvoiceItem2ENEstimateItemShortList;
  begin
  SetGridHeaders(RQInvoiceItem2ENEstimateItemHeaders, sgRQInvoiceItem2ENEstimateItem.ColumnHeaders);
  ColCount:=100;
  TempRQInvoiceItem2ENEstimateItem :=  HTTPRIORQInvoiceItem2ENEstimateItem as RQInvoiceItem2ENEstimateItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQInvoiceItem2ENEstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQInvoiceItem2ENEstimateItemList := TempRQInvoiceItem2ENEstimateItem.getScrollableFilteredList(RQInvoiceItem2ENEstimateItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQInvoiceItem2ENEstimateItemList.list);

  if LastCount > -1 then
     sgRQInvoiceItem2ENEstimateItem.RowCount:=LastCount+2
  else
     sgRQInvoiceItem2ENEstimateItem.RowCount:=2;

   with sgRQInvoiceItem2ENEstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQInvoiceItem2ENEstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQInvoiceItem2ENEstimateItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQInvoiceItem2ENEstimateItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQInvoiceItem2ENEstimateItemList.list[i].countGen.DecimalString;
        LastRow:=i+1;
        sgRQInvoiceItem2ENEstimateItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQInvoiceItem2ENEstimateItem.Row:=1;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemShow.sgRQInvoiceItem2ENEstimateItemTopLeftChanged(Sender: TObject);
var
  TempRQInvoiceItem2ENEstimateItem: RQInvoiceItem2ENEstimateItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQInvoiceItem2ENEstimateItemList: RQInvoiceItem2ENEstimateItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQInvoiceItem2ENEstimateItem.TopRow + sgRQInvoiceItem2ENEstimateItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQInvoiceItem2ENEstimateItem :=  HTTPRIORQInvoiceItem2ENEstimateItem as RQInvoiceItem2ENEstimateItemControllerSoapPort;
      CurrentRow:=sgRQInvoiceItem2ENEstimateItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQInvoiceItem2ENEstimateItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQInvoiceItem2ENEstimateItemList := TempRQInvoiceItem2ENEstimateItem.getScrollableFilteredList(RQInvoiceItem2ENEstimateItemFilter(FilterObject),ColCount-1, 100);



  sgRQInvoiceItem2ENEstimateItem.RowCount:=sgRQInvoiceItem2ENEstimateItem.RowCount+100;
  LastCount:=High(RQInvoiceItem2ENEstimateItemList.list);
  with sgRQInvoiceItem2ENEstimateItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQInvoiceItem2ENEstimateItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQInvoiceItem2ENEstimateItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQInvoiceItem2ENEstimateItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQInvoiceItem2ENEstimateItemList.list[i].countGen.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQInvoiceItem2ENEstimateItem.Row:=CurrentRow-5;
   sgRQInvoiceItem2ENEstimateItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemShow.sgRQInvoiceItem2ENEstimateItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQInvoiceItem2ENEstimateItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQInvoiceItem2ENEstimateItem.RowCount-1 do
   for j:=0 to sgRQInvoiceItem2ENEstimateItem.ColCount-1 do
     sgRQInvoiceItem2ENEstimateItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQInvoiceItem2ENEstimateItemShow.actViewExecute(Sender: TObject);
Var TempRQInvoiceItem2ENEstimateItem: RQInvoiceItem2ENEstimateItemControllerSoapPort;
begin
 TempRQInvoiceItem2ENEstimateItem := HTTPRIORQInvoiceItem2ENEstimateItem as RQInvoiceItem2ENEstimateItemControllerSoapPort;
   try
     RQInvoiceItem2ENEstimateItemObj := TempRQInvoiceItem2ENEstimateItem.getObject(StrToInt(sgRQInvoiceItem2ENEstimateItem.Cells[0,sgRQInvoiceItem2ENEstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQInvoiceItem2ENEstimateItemEdit:=TfrmRQInvoiceItem2ENEstimateItemEdit.Create(Application, dsView);
  try
    frmRQInvoiceItem2ENEstimateItemEdit.ShowModal;
  finally
    frmRQInvoiceItem2ENEstimateItemEdit.Free;
    frmRQInvoiceItem2ENEstimateItemEdit:=nil;
  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemShow.actEditExecute(Sender: TObject);
Var TempRQInvoiceItem2ENEstimateItem: RQInvoiceItem2ENEstimateItemControllerSoapPort;
begin
 TempRQInvoiceItem2ENEstimateItem := HTTPRIORQInvoiceItem2ENEstimateItem as RQInvoiceItem2ENEstimateItemControllerSoapPort;
   try
     RQInvoiceItem2ENEstimateItemObj := TempRQInvoiceItem2ENEstimateItem.getObject(StrToInt(sgRQInvoiceItem2ENEstimateItem.Cells[0,sgRQInvoiceItem2ENEstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQInvoiceItem2ENEstimateItemEdit:=TfrmRQInvoiceItem2ENEstimateItemEdit.Create(Application, dsEdit);
  try
    if frmRQInvoiceItem2ENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempRQInvoiceItem2ENEstimateItem.save(RQInvoiceItem2ENEstimateItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQInvoiceItem2ENEstimateItemEdit.Free;
    frmRQInvoiceItem2ENEstimateItemEdit:=nil;
  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemShow.actDeleteExecute(Sender: TObject);
Var TempRQInvoiceItem2ENEstimateItem: RQInvoiceItem2ENEstimateItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQInvoiceItem2ENEstimateItem := HTTPRIORQInvoiceItem2ENEstimateItem as RQInvoiceItem2ENEstimateItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQInvoiceItem2ENEstimateItem.Cells[0,sgRQInvoiceItem2ENEstimateItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Звьязок строк накладної з Матеріалами на планах) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQInvoiceItem2ENEstimateItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemShow.actInsertExecute(Sender: TObject);
Var TempRQInvoiceItem2ENEstimateItem: RQInvoiceItem2ENEstimateItemControllerSoapPort;
begin
  TempRQInvoiceItem2ENEstimateItem := HTTPRIORQInvoiceItem2ENEstimateItem as RQInvoiceItem2ENEstimateItemControllerSoapPort;
  RQInvoiceItem2ENEstimateItemObj:=RQInvoiceItem2ENEstimateItem.Create;

   RQInvoiceItem2ENEstimateItemObj.countGen:= TXSDecimal.Create;


  try
    frmRQInvoiceItem2ENEstimateItemEdit:=TfrmRQInvoiceItem2ENEstimateItemEdit.Create(Application, dsInsert);
    try
      if frmRQInvoiceItem2ENEstimateItemEdit.ShowModal = mrOk then
      begin
        if RQInvoiceItem2ENEstimateItemObj<>nil then
            //TempRQInvoiceItem2ENEstimateItem.add(RQInvoiceItem2ENEstimateItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQInvoiceItem2ENEstimateItemEdit.Free;
      frmRQInvoiceItem2ENEstimateItemEdit:=nil;
    end;
  finally
    RQInvoiceItem2ENEstimateItemObj.Free;
  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQInvoiceItem2ENEstimateItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQInvoiceItem2ENEstimateItemFilterEdit:=TfrmRQInvoiceItem2ENEstimateItemFilterEdit.Create(Application, dsEdit);
  try
    RQInvoiceItem2ENEstimateItemFilterObj := RQInvoiceItem2ENEstimateItemFilter.Create;
    SetNullIntProps(RQInvoiceItem2ENEstimateItemFilterObj);
    SetNullXSProps(RQInvoiceItem2ENEstimateItemFilterObj);

    if frmRQInvoiceItem2ENEstimateItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQInvoiceItem2ENEstimateItemFilter.Create;
      FilterObject := RQInvoiceItem2ENEstimateItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQInvoiceItem2ENEstimateItemFilterEdit.Free;
    frmRQInvoiceItem2ENEstimateItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQInvoiceItem2ENEstimateItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.