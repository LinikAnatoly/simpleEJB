
unit ShowENTransportOrder2TransportItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransportOrder2TransportItemController ;


type
  TfrmENTransportOrder2TransportItemShow = class(TChildForm)  
  HTTPRIOENTransportOrder2TransportItem: THTTPRIO;
    ImageList1: TImageList;
    sgENTransportOrder2TransportItem: TAdvStringGrid;
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
procedure sgENTransportOrder2TransportItemTopLeftChanged(Sender: TObject);
procedure sgENTransportOrder2TransportItemDblClick(Sender: TObject);
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
 // ENTransportOrder2TransportItemObj: ENTransportOrder2TransportItem;
 // ENTransportOrder2TransportItemFilterObj: ENTransportOrder2TransportItemFilter;
  
  
implementation

uses Main, EditENTransportOrder2TransportItem, EditENTransportOrder2TransportItemFilter;


{$R *.dfm}

var
  //frmENTransportOrder2TransportItemShow : TfrmENTransportOrder2TransportItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransportOrder2TransportItemHeaders: array [1..2] of String =
        ( 'Код',''
        );
   

procedure TfrmENTransportOrder2TransportItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransportOrder2TransportItemShow:=nil;
    inherited;
  end;


procedure TfrmENTransportOrder2TransportItemShow.FormShow(Sender: TObject);
var
  TempENTransportOrder2TransportItem: ENTransportOrder2TransportItemControllerSoapPort;
  i: Integer;
  ENTransportOrder2TransportItemList: ENTransportOrder2TransportItemShortList;
  begin
  SetGridHeaders(ENTransportOrder2TransportItemHeaders, sgENTransportOrder2TransportItem.ColumnHeaders);
  ColCount:=100;
  TempENTransportOrder2TransportItem :=  HTTPRIOENTransportOrder2TransportItem as ENTransportOrder2TransportItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportOrder2TransportItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportOrder2TransportItemList := TempENTransportOrder2TransportItem.getScrollableFilteredList(ENTransportOrder2TransportItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransportOrder2TransportItemList.list);

  if LastCount > -1 then
     sgENTransportOrder2TransportItem.RowCount:=LastCount+2
  else
     sgENTransportOrder2TransportItem.RowCount:=2;

   with sgENTransportOrder2TransportItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportOrder2TransportItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportOrder2TransportItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENTransportOrder2TransportItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransportOrder2TransportItem.Row:=1;
end;

procedure TfrmENTransportOrder2TransportItemShow.sgENTransportOrder2TransportItemTopLeftChanged(Sender: TObject);
var
  TempENTransportOrder2TransportItem: ENTransportOrder2TransportItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransportOrder2TransportItemList: ENTransportOrder2TransportItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransportOrder2TransportItem.TopRow + sgENTransportOrder2TransportItem.VisibleRowCount) = ColCount
  then
    begin
      TempENTransportOrder2TransportItem :=  HTTPRIOENTransportOrder2TransportItem as ENTransportOrder2TransportItemControllerSoapPort;
      CurrentRow:=sgENTransportOrder2TransportItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportOrder2TransportItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportOrder2TransportItemList := TempENTransportOrder2TransportItem.getScrollableFilteredList(ENTransportOrder2TransportItemFilter(FilterObject),ColCount-1, 100);



  sgENTransportOrder2TransportItem.RowCount:=sgENTransportOrder2TransportItem.RowCount+100;
  LastCount:=High(ENTransportOrder2TransportItemList.list);
  with sgENTransportOrder2TransportItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportOrder2TransportItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportOrder2TransportItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransportOrder2TransportItem.Row:=CurrentRow-5;
   sgENTransportOrder2TransportItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransportOrder2TransportItemShow.sgENTransportOrder2TransportItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransportOrder2TransportItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransportOrder2TransportItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransportOrder2TransportItem.RowCount-1 do
   for j:=0 to sgENTransportOrder2TransportItem.ColCount-1 do
     sgENTransportOrder2TransportItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransportOrder2TransportItemShow.actViewExecute(Sender: TObject);
Var TempENTransportOrder2TransportItem: ENTransportOrder2TransportItemControllerSoapPort;
begin
 TempENTransportOrder2TransportItem := HTTPRIOENTransportOrder2TransportItem as ENTransportOrder2TransportItemControllerSoapPort;
   try
     ENTransportOrder2TransportItemObj := TempENTransportOrder2TransportItem.getObject(StrToInt(sgENTransportOrder2TransportItem.Cells[0,sgENTransportOrder2TransportItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportOrder2TransportItemEdit:=TfrmENTransportOrder2TransportItemEdit.Create(Application, dsView);
  try
    frmENTransportOrder2TransportItemEdit.ShowModal;
  finally
    frmENTransportOrder2TransportItemEdit.Free;
    frmENTransportOrder2TransportItemEdit:=nil;
  end;
end;

procedure TfrmENTransportOrder2TransportItemShow.actEditExecute(Sender: TObject);
Var TempENTransportOrder2TransportItem: ENTransportOrder2TransportItemControllerSoapPort;
begin
 TempENTransportOrder2TransportItem := HTTPRIOENTransportOrder2TransportItem as ENTransportOrder2TransportItemControllerSoapPort;
   try
     ENTransportOrder2TransportItemObj := TempENTransportOrder2TransportItem.getObject(StrToInt(sgENTransportOrder2TransportItem.Cells[0,sgENTransportOrder2TransportItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportOrder2TransportItemEdit:=TfrmENTransportOrder2TransportItemEdit.Create(Application, dsEdit);
  try
    if frmENTransportOrder2TransportItemEdit.ShowModal= mrOk then
      begin
        //TempENTransportOrder2TransportItem.save(ENTransportOrder2TransportItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransportOrder2TransportItemEdit.Free;
    frmENTransportOrder2TransportItemEdit:=nil;
  end;
end;

procedure TfrmENTransportOrder2TransportItemShow.actDeleteExecute(Sender: TObject);
Var TempENTransportOrder2TransportItem: ENTransportOrder2TransportItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportOrder2TransportItem := HTTPRIOENTransportOrder2TransportItem as ENTransportOrder2TransportItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportOrder2TransportItem.Cells[0,sgENTransportOrder2TransportItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связка заявки с транспорт айтэмами) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportOrder2TransportItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransportOrder2TransportItemShow.actInsertExecute(Sender: TObject);
Var TempENTransportOrder2TransportItem: ENTransportOrder2TransportItemControllerSoapPort;
begin
  TempENTransportOrder2TransportItem := HTTPRIOENTransportOrder2TransportItem as ENTransportOrder2TransportItemControllerSoapPort;
  ENTransportOrder2TransportItemObj:=ENTransportOrder2TransportItem.Create;



  try
    frmENTransportOrder2TransportItemEdit:=TfrmENTransportOrder2TransportItemEdit.Create(Application, dsInsert);
    try
      if frmENTransportOrder2TransportItemEdit.ShowModal = mrOk then
      begin
        if ENTransportOrder2TransportItemObj<>nil then
            //TempENTransportOrder2TransportItem.add(ENTransportOrder2TransportItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportOrder2TransportItemEdit.Free;
      frmENTransportOrder2TransportItemEdit:=nil;
    end;
  finally
    ENTransportOrder2TransportItemObj.Free;
  end;
end;

procedure TfrmENTransportOrder2TransportItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransportOrder2TransportItemShow.actFilterExecute(Sender: TObject);
begin
{frmENTransportOrder2TransportItemFilterEdit:=TfrmENTransportOrder2TransportItemFilterEdit.Create(Application, dsInsert);
  try
    ENTransportOrder2TransportItemFilterObj := ENTransportOrder2TransportItemFilter.Create;
    SetNullIntProps(ENTransportOrder2TransportItemFilterObj);
    SetNullXSProps(ENTransportOrder2TransportItemFilterObj);

    if frmENTransportOrder2TransportItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTransportOrder2TransportItemFilter.Create;
      FilterObject := ENTransportOrder2TransportItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransportOrder2TransportItemFilterEdit.Free;
    frmENTransportOrder2TransportItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENTransportOrder2TransportItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.