
unit ShowRQPackingListItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPackingListItemController ;


type
  TfrmRQPackingListItemShow = class(TChildForm)  
  HTTPRIORQPackingListItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQPackingListItem: TAdvStringGrid;
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
procedure sgRQPackingListItemTopLeftChanged(Sender: TObject);
procedure sgRQPackingListItemDblClick(Sender: TObject);
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
 // RQPackingListItemObj: RQPackingListItem;
 // RQPackingListItemFilterObj: RQPackingListItemFilter;
  
  
implementation

uses Main, EditRQPackingListItem, EditRQPackingListItemFilter;


{$R *.dfm}

var
 // frmRQPackingListItemShow : TfrmRQPackingListItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  
  RQPackingListItemHeaders: array [1..8] of String =
        ( 'Код'
          ,'Наименование материала'
          ,'Номенклатурний номер'
          ,'Наименование единицы изменения'
          ,'Необходимое количество'
          ,'Строка эстимэйтов, по которой сформирована строка ведомости'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmRQPackingListItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPackingListItemShow:=nil;
    inherited;
  end;


procedure TfrmRQPackingListItemShow.FormShow(Sender: TObject);
var
  TempRQPackingListItem: RQPackingListItemControllerSoapPort;
  i: Integer;
  RQPackingListItemList: RQPackingListItemShortList;
  begin
  SetGridHeaders(RQPackingListItemHeaders, sgRQPackingListItem.ColumnHeaders);
  ColCount:=100;
  TempRQPackingListItem :=  HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPackingListItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPackingListItemList := TempRQPackingListItem.getScrollableFilteredList(RQPackingListItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPackingListItemList.list);

  if LastCount > -1 then
     sgRQPackingListItem.RowCount:=LastCount+2
  else
     sgRQPackingListItem.RowCount:=2;

   with sgRQPackingListItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPackingListItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPackingListItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPackingListItemList.list[i].materialName;
        Cells[2,i+1] := RQPackingListItemList.list[i].nn;
        Cells[3,i+1] := RQPackingListItemList.list[i].measurementName;
        if RQPackingListItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQPackingListItemList.list[i].countGen.DecimalString;
        Cells[5,i+1] := RQPackingListItemList.list[i].estimateItemString;
        Cells[6,i+1] := RQPackingListItemList.list[i].userGen;
        if RQPackingListItemList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(RQPackingListItemList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQPackingListItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPackingListItem.Row:=1;
end;

procedure TfrmRQPackingListItemShow.sgRQPackingListItemTopLeftChanged(Sender: TObject);
var
  TempRQPackingListItem: RQPackingListItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQPackingListItemList: RQPackingListItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPackingListItem.TopRow + sgRQPackingListItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQPackingListItem :=  HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
      CurrentRow:=sgRQPackingListItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPackingListItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPackingListItemList := TempRQPackingListItem.getScrollableFilteredList(RQPackingListItemFilter(FilterObject),ColCount-1, 100);



  sgRQPackingListItem.RowCount:=sgRQPackingListItem.RowCount+100;
  LastCount:=High(RQPackingListItemList.list);
  with sgRQPackingListItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPackingListItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPackingListItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQPackingListItemList.list[i].materialName;
        Cells[2,i+CurrentRow] := RQPackingListItemList.list[i].nn;
        Cells[3,i+CurrentRow] := RQPackingListItemList.list[i].measurementName;
        if RQPackingListItemList.list[i].countGen = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := RQPackingListItemList.list[i].countGen.DecimalString;
        Cells[5,i+CurrentRow] := RQPackingListItemList.list[i].estimateItemString;
        Cells[6,i+CurrentRow] := RQPackingListItemList.list[i].userGen;
        if RQPackingListItemList.list[i].dateEdit = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDate2String(RQPackingListItemList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPackingListItem.Row:=CurrentRow-5;
   sgRQPackingListItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPackingListItemShow.sgRQPackingListItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPackingListItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPackingListItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPackingListItem.RowCount-1 do
   for j:=0 to sgRQPackingListItem.ColCount-1 do
     sgRQPackingListItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPackingListItemShow.actViewExecute(Sender: TObject);
Var TempRQPackingListItem: RQPackingListItemControllerSoapPort;
begin
 TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
   try
     RQPackingListItemObj := TempRQPackingListItem.getObject(StrToInt(sgRQPackingListItem.Cells[0,sgRQPackingListItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPackingListItemEdit:=TfrmRQPackingListItemEdit.Create(Application, dsView);
  try
    frmRQPackingListItemEdit.ShowModal;
  finally
    frmRQPackingListItemEdit.Free;
    frmRQPackingListItemEdit:=nil;
  end;
end;

procedure TfrmRQPackingListItemShow.actEditExecute(Sender: TObject);
Var TempRQPackingListItem: RQPackingListItemControllerSoapPort;
begin
 TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
   try
     RQPackingListItemObj := TempRQPackingListItem.getObject(StrToInt(sgRQPackingListItem.Cells[0,sgRQPackingListItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPackingListItemEdit:=TfrmRQPackingListItemEdit.Create(Application, dsEdit);
  try
    if frmRQPackingListItemEdit.ShowModal= mrOk then
      begin
        //TempRQPackingListItem.save(RQPackingListItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPackingListItemEdit.Free;
    frmRQPackingListItemEdit:=nil;
  end;
end;

procedure TfrmRQPackingListItemShow.actDeleteExecute(Sender: TObject);
Var TempRQPackingListItem: RQPackingListItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPackingListItem.Cells[0,sgRQPackingListItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки упаковочно-погрузочной ведомости) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPackingListItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPackingListItemShow.actInsertExecute(Sender: TObject);
// Var TempRQPackingListItem: RQPackingListItemControllerSoapPort; 
begin
  // TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPackingListItemObj:=RQPackingListItem.Create;

   //RQPackingListItemObj.countGen:= TXSDecimal.Create;
   //RQPackingListItemObj.dateEdit:= TXSDate.Create;


  try
    frmRQPackingListItemEdit:=TfrmRQPackingListItemEdit.Create(Application, dsInsert);
    try
      if frmRQPackingListItemEdit.ShowModal = mrOk then
      begin
        if RQPackingListItemObj<>nil then
            //TempRQPackingListItem.add(RQPackingListItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPackingListItemEdit.Free;
      frmRQPackingListItemEdit:=nil;
    end;
  finally
    RQPackingListItemObj.Free;
  end;
end;

procedure TfrmRQPackingListItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPackingListItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQPackingListItemFilterEdit:=TfrmRQPackingListItemFilterEdit.Create(Application, dsInsert);
  try
    RQPackingListItemFilterObj := RQPackingListItemFilter.Create;
    SetNullIntProps(RQPackingListItemFilterObj);
    SetNullXSProps(RQPackingListItemFilterObj);

    if frmRQPackingListItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPackingListItemFilter.Create;
      FilterObject := RQPackingListItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPackingListItemFilterEdit.Free;
    frmRQPackingListItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPackingListItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.