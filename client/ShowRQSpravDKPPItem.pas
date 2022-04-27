
unit ShowRQSpravDKPPItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQSpravDKPPItemController, AdvObj ;


type
  TfrmRQSpravDKPPItemShow = class(TChildForm)
  HTTPRIORQSpravDKPPItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQSpravDKPPItem: TAdvStringGrid;
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
procedure sgRQSpravDKPPItemTopLeftChanged(Sender: TObject);
procedure sgRQSpravDKPPItemDblClick(Sender: TObject);
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
 // RQSpravDKPPItemObj: RQSpravDKPPItem;
 // RQSpravDKPPItemFilterObj: RQSpravDKPPItemFilter;
  
  
implementation

uses Main, EditRQSpravDKPPItem, EditRQSpravDKPPItemFilter;


{$R *.dfm}

var
  //frmRQSpravDKPPItemShow : TfrmRQSpravDKPPItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQSpravDKPPItemHeaders: array [1..4] of String =
        ( 'Код'
          ,'Текстовый код'
          ,'Назва'
          ,'Класифікатор'
        );
   

procedure TfrmRQSpravDKPPItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQSpravDKPPItemShow:=nil;
    inherited;
  end;


procedure TfrmRQSpravDKPPItemShow.FormShow(Sender: TObject);
var
  TempRQSpravDKPPItem: RQSpravDKPPItemControllerSoapPort;
  i: Integer;
  RQSpravDKPPItemList: RQSpravDKPPItemShortList;
  begin
  SetGridHeaders(RQSpravDKPPItemHeaders, sgRQSpravDKPPItem.ColumnHeaders);
  ColCount:=100;
  TempRQSpravDKPPItem :=  HTTPRIORQSpravDKPPItem as RQSpravDKPPItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQSpravDKPPItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQSpravDKPPItemList := TempRQSpravDKPPItem.getScrollableFilteredList(RQSpravDKPPItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQSpravDKPPItemList.list);

  if LastCount > -1 then
     sgRQSpravDKPPItem.RowCount:=LastCount+2
  else
     sgRQSpravDKPPItem.RowCount:=2;

   with sgRQSpravDKPPItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQSpravDKPPItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQSpravDKPPItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQSpravDKPPItemList.list[i].numberGen;
        Cells[2,i+1] := RQSpravDKPPItemList.list[i].name;
        Cells[3,i+1] := RQSpravDKPPItemList.list[i].spravDKPPRefName;
        LastRow:=i+1;
        sgRQSpravDKPPItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQSpravDKPPItem.Row:=1;
end;

procedure TfrmRQSpravDKPPItemShow.sgRQSpravDKPPItemTopLeftChanged(Sender: TObject);
var
  TempRQSpravDKPPItem: RQSpravDKPPItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQSpravDKPPItemList: RQSpravDKPPItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQSpravDKPPItem.TopRow + sgRQSpravDKPPItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQSpravDKPPItem :=  HTTPRIORQSpravDKPPItem as RQSpravDKPPItemControllerSoapPort;
      CurrentRow:=sgRQSpravDKPPItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQSpravDKPPItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQSpravDKPPItemList := TempRQSpravDKPPItem.getScrollableFilteredList(RQSpravDKPPItemFilter(FilterObject),ColCount-1, 100);



  sgRQSpravDKPPItem.RowCount:=sgRQSpravDKPPItem.RowCount+100;
  LastCount:=High(RQSpravDKPPItemList.list);
  with sgRQSpravDKPPItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQSpravDKPPItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQSpravDKPPItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQSpravDKPPItemList.list[i].numberGen;
        Cells[2,i+CurrentRow] := RQSpravDKPPItemList.list[i].name;
        Cells[3,i+CurrentRow] := RQSpravDKPPItemList.list[i].spravDKPPRefName;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQSpravDKPPItem.Row:=CurrentRow-5;
   sgRQSpravDKPPItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQSpravDKPPItemShow.sgRQSpravDKPPItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQSpravDKPPItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQSpravDKPPItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQSpravDKPPItem.RowCount-1 do
   for j:=0 to sgRQSpravDKPPItem.ColCount-1 do
     sgRQSpravDKPPItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQSpravDKPPItemShow.actViewExecute(Sender: TObject);
Var TempRQSpravDKPPItem: RQSpravDKPPItemControllerSoapPort;
begin
 TempRQSpravDKPPItem := HTTPRIORQSpravDKPPItem as RQSpravDKPPItemControllerSoapPort;
   try
     RQSpravDKPPItemObj := TempRQSpravDKPPItem.getObject(StrToInt(sgRQSpravDKPPItem.Cells[0,sgRQSpravDKPPItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQSpravDKPPItemEdit:=TfrmRQSpravDKPPItemEdit.Create(Application, dsView);
  try
    frmRQSpravDKPPItemEdit.ShowModal;
  finally
    frmRQSpravDKPPItemEdit.Free;
    frmRQSpravDKPPItemEdit:=nil;
  end;
end;

procedure TfrmRQSpravDKPPItemShow.actEditExecute(Sender: TObject);
Var TempRQSpravDKPPItem: RQSpravDKPPItemControllerSoapPort;
begin
 TempRQSpravDKPPItem := HTTPRIORQSpravDKPPItem as RQSpravDKPPItemControllerSoapPort;
   try
     RQSpravDKPPItemObj := TempRQSpravDKPPItem.getObject(StrToInt(sgRQSpravDKPPItem.Cells[0,sgRQSpravDKPPItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQSpravDKPPItemEdit:=TfrmRQSpravDKPPItemEdit.Create(Application, dsEdit);
  try
    if frmRQSpravDKPPItemEdit.ShowModal= mrOk then
      begin
        //TempRQSpravDKPPItem.save(RQSpravDKPPItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQSpravDKPPItemEdit.Free;
    frmRQSpravDKPPItemEdit:=nil;
  end;
end;

procedure TfrmRQSpravDKPPItemShow.actDeleteExecute(Sender: TObject);
Var TempRQSpravDKPPItem: RQSpravDKPPItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQSpravDKPPItem := HTTPRIORQSpravDKPPItem as RQSpravDKPPItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQSpravDKPPItem.Cells[0,sgRQSpravDKPPItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки довідника державних класифікаторів продукції та послуг) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQSpravDKPPItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQSpravDKPPItemShow.actInsertExecute(Sender: TObject);
// Var TempRQSpravDKPPItem: RQSpravDKPPItemControllerSoapPort; 
begin
  // TempRQSpravDKPPItem := HTTPRIORQSpravDKPPItem as RQSpravDKPPItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQSpravDKPPItemObj:=RQSpravDKPPItem.Create;



  try
    frmRQSpravDKPPItemEdit:=TfrmRQSpravDKPPItemEdit.Create(Application, dsInsert);
    try
      if frmRQSpravDKPPItemEdit.ShowModal = mrOk then
      begin
        if RQSpravDKPPItemObj<>nil then
            //TempRQSpravDKPPItem.add(RQSpravDKPPItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQSpravDKPPItemEdit.Free;
      frmRQSpravDKPPItemEdit:=nil;
    end;
  finally
    RQSpravDKPPItemObj.Free;
  end;
end;

procedure TfrmRQSpravDKPPItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQSpravDKPPItemShow.actFilterExecute(Sender: TObject);
begin
frmRQSpravDKPPItemFilterEdit:=TfrmRQSpravDKPPItemFilterEdit.Create(Application, dsInsert);
  try
    RQSpravDKPPItemFilterObj := RQSpravDKPPItemFilter.Create;
    SetNullIntProps(RQSpravDKPPItemFilterObj);
    SetNullXSProps(RQSpravDKPPItemFilterObj);

    if frmRQSpravDKPPItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQSpravDKPPItemFilter.Create;
      FilterObject := RQSpravDKPPItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQSpravDKPPItemFilterEdit.Free;
    frmRQSpravDKPPItemFilterEdit:=nil;
  end;
end;

procedure TfrmRQSpravDKPPItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.