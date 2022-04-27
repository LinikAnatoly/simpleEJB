
unit ShowRQCentralExportGraphItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQCentralExportGraphItemController, AdvObj ;


type
  TfrmRQCentralExportGraphItemShow = class(TChildForm)  
  HTTPRIORQCentralExportGraphItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQCentralExportGraphItem: TAdvStringGrid;
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
procedure sgRQCentralExportGraphItemTopLeftChanged(Sender: TObject);
procedure sgRQCentralExportGraphItemDblClick(Sender: TObject);
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
 // RQCentralExportGraphItemObj: RQCentralExportGraphItem;
 // RQCentralExportGraphItemFilterObj: RQCentralExportGraphItemFilter;
  
  
implementation

uses Main, EditRQCentralExportGraphItem, EditRQCentralExportGraphItemFilter;


{$R *.dfm}

var
  //frmRQCentralExportGraphItemShow : TfrmRQCentralExportGraphItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQCentralExportGraphItemHeaders: array [1..2] of String =
        ( 'Код'
          ,'Дата центровивозу'
        );
   

procedure TfrmRQCentralExportGraphItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQCentralExportGraphItemShow:=nil;
    inherited;
  end;


procedure TfrmRQCentralExportGraphItemShow.FormShow(Sender: TObject);
var
  TempRQCentralExportGraphItem: RQCentralExportGraphItemControllerSoapPort;
  i: Integer;
  RQCentralExportGraphItemList: RQCentralExportGraphItemShortList;
  begin
  SetGridHeaders(RQCentralExportGraphItemHeaders, sgRQCentralExportGraphItem.ColumnHeaders);
  ColCount:=100;
  TempRQCentralExportGraphItem :=  HTTPRIORQCentralExportGraphItem as RQCentralExportGraphItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQCentralExportGraphItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQCentralExportGraphItemList := TempRQCentralExportGraphItem.getScrollableFilteredList(RQCentralExportGraphItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQCentralExportGraphItemList.list);

  if LastCount > -1 then
     sgRQCentralExportGraphItem.RowCount:=LastCount+2
  else
     sgRQCentralExportGraphItem.RowCount:=2;

   with sgRQCentralExportGraphItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQCentralExportGraphItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQCentralExportGraphItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQCentralExportGraphItemList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(RQCentralExportGraphItemList.list[i].dateGen);
        LastRow:=i+1;
        sgRQCentralExportGraphItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQCentralExportGraphItem.Row:=1;
end;

procedure TfrmRQCentralExportGraphItemShow.sgRQCentralExportGraphItemTopLeftChanged(Sender: TObject);
var
  TempRQCentralExportGraphItem: RQCentralExportGraphItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQCentralExportGraphItemList: RQCentralExportGraphItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQCentralExportGraphItem.TopRow + sgRQCentralExportGraphItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQCentralExportGraphItem :=  HTTPRIORQCentralExportGraphItem as RQCentralExportGraphItemControllerSoapPort;
      CurrentRow:=sgRQCentralExportGraphItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQCentralExportGraphItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQCentralExportGraphItemList := TempRQCentralExportGraphItem.getScrollableFilteredList(RQCentralExportGraphItemFilter(FilterObject),ColCount-1, 100);



  sgRQCentralExportGraphItem.RowCount:=sgRQCentralExportGraphItem.RowCount+100;
  LastCount:=High(RQCentralExportGraphItemList.list);
  with sgRQCentralExportGraphItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQCentralExportGraphItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQCentralExportGraphItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQCentralExportGraphItemList.list[i].dateGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(RQCentralExportGraphItemList.list[i].dateGen);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQCentralExportGraphItem.Row:=CurrentRow-5;
   sgRQCentralExportGraphItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQCentralExportGraphItemShow.sgRQCentralExportGraphItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQCentralExportGraphItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQCentralExportGraphItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQCentralExportGraphItem.RowCount-1 do
   for j:=0 to sgRQCentralExportGraphItem.ColCount-1 do
     sgRQCentralExportGraphItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQCentralExportGraphItemShow.actViewExecute(Sender: TObject);
Var TempRQCentralExportGraphItem: RQCentralExportGraphItemControllerSoapPort;
begin
 TempRQCentralExportGraphItem := HTTPRIORQCentralExportGraphItem as RQCentralExportGraphItemControllerSoapPort;
   try
     RQCentralExportGraphItemObj := TempRQCentralExportGraphItem.getObject(StrToInt(sgRQCentralExportGraphItem.Cells[0,sgRQCentralExportGraphItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQCentralExportGraphItemEdit:=TfrmRQCentralExportGraphItemEdit.Create(Application, dsView);
  try
    frmRQCentralExportGraphItemEdit.ShowModal;
  finally
    frmRQCentralExportGraphItemEdit.Free;
    frmRQCentralExportGraphItemEdit:=nil;
  end;
end;

procedure TfrmRQCentralExportGraphItemShow.actEditExecute(Sender: TObject);
Var TempRQCentralExportGraphItem: RQCentralExportGraphItemControllerSoapPort;
begin
 TempRQCentralExportGraphItem := HTTPRIORQCentralExportGraphItem as RQCentralExportGraphItemControllerSoapPort;
   try
     RQCentralExportGraphItemObj := TempRQCentralExportGraphItem.getObject(StrToInt(sgRQCentralExportGraphItem.Cells[0,sgRQCentralExportGraphItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQCentralExportGraphItemEdit:=TfrmRQCentralExportGraphItemEdit.Create(Application, dsEdit);
  try
    if frmRQCentralExportGraphItemEdit.ShowModal= mrOk then
      begin
        //TempRQCentralExportGraphItem.save(RQCentralExportGraphItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQCentralExportGraphItemEdit.Free;
    frmRQCentralExportGraphItemEdit:=nil;
  end;
end;

procedure TfrmRQCentralExportGraphItemShow.actDeleteExecute(Sender: TObject);
Var TempRQCentralExportGraphItem: RQCentralExportGraphItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQCentralExportGraphItem := HTTPRIORQCentralExportGraphItem as RQCentralExportGraphItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQCentralExportGraphItem.Cells[0,sgRQCentralExportGraphItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки графіку центровивозу матеріалів ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQCentralExportGraphItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQCentralExportGraphItemShow.actInsertExecute(Sender: TObject);
// Var TempRQCentralExportGraphItem: RQCentralExportGraphItemControllerSoapPort; 
begin
  // TempRQCentralExportGraphItem := HTTPRIORQCentralExportGraphItem as RQCentralExportGraphItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQCentralExportGraphItemObj:=RQCentralExportGraphItem.Create;

   //RQCentralExportGraphItemObj.dateGen:= TXSDate.Create;


  try
    frmRQCentralExportGraphItemEdit:=TfrmRQCentralExportGraphItemEdit.Create(Application, dsInsert);
    try
      if frmRQCentralExportGraphItemEdit.ShowModal = mrOk then
      begin
        if RQCentralExportGraphItemObj<>nil then
            //TempRQCentralExportGraphItem.add(RQCentralExportGraphItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQCentralExportGraphItemEdit.Free;
      frmRQCentralExportGraphItemEdit:=nil;
    end;
  finally
    RQCentralExportGraphItemObj.Free;
  end;
end;

procedure TfrmRQCentralExportGraphItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQCentralExportGraphItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQCentralExportGraphItemFilterEdit:=TfrmRQCentralExportGraphItemFilterEdit.Create(Application, dsInsert);
  try
    RQCentralExportGraphItemFilterObj := RQCentralExportGraphItemFilter.Create;
    SetNullIntProps(RQCentralExportGraphItemFilterObj);
    SetNullXSProps(RQCentralExportGraphItemFilterObj);

    if frmRQCentralExportGraphItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQCentralExportGraphItemFilter.Create;
      FilterObject := RQCentralExportGraphItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQCentralExportGraphItemFilterEdit.Free;
    frmRQCentralExportGraphItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQCentralExportGraphItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.