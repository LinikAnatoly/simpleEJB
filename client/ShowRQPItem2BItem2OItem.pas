
unit ShowRQPItem2BItem2OItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPItem2BItem2OItemController ;


type
  TfrmRQPItem2BItem2OItemShow = class(TChildForm)  
  HTTPRIORQPItem2BItem2OItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQPItem2BItem2OItem: TAdvStringGrid;
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
procedure sgRQPItem2BItem2OItemTopLeftChanged(Sender: TObject);
procedure sgRQPItem2BItem2OItemDblClick(Sender: TObject);
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
 // RQPItem2BItem2OItemObj: RQPItem2BItem2OItem;
 // RQPItem2BItem2OItemFilterObj: RQPItem2BItem2OItemFilter;
  
  
implementation

uses Main, EditRQPItem2BItem2OItem, EditRQPItem2BItem2OItemFilter;


{$R *.dfm}

var
  //frmRQPItem2BItem2OItemShow : TfrmRQPItem2BItem2OItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPItem2BItem2OItemHeaders: array [1..2] of String =
        ( 'Код'
          ,'Сума платежу'
        );
   

procedure TfrmRQPItem2BItem2OItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPItem2BItem2OItemShow:=nil;
    inherited;
  end;


procedure TfrmRQPItem2BItem2OItemShow.FormShow(Sender: TObject);
var
  TempRQPItem2BItem2OItem: RQPItem2BItem2OItemControllerSoapPort;
  i: Integer;
  RQPItem2BItem2OItemList: RQPItem2BItem2OItemShortList;
  begin
  SetGridHeaders(RQPItem2BItem2OItemHeaders, sgRQPItem2BItem2OItem.ColumnHeaders);
  ColCount:=100;
  TempRQPItem2BItem2OItem :=  HTTPRIORQPItem2BItem2OItem as RQPItem2BItem2OItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPItem2BItem2OItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPItem2BItem2OItemList := TempRQPItem2BItem2OItem.getScrollableFilteredList(RQPItem2BItem2OItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPItem2BItem2OItemList.list);

  if LastCount > -1 then
     sgRQPItem2BItem2OItem.RowCount:=LastCount+2
  else
     sgRQPItem2BItem2OItem.RowCount:=2;

   with sgRQPItem2BItem2OItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPItem2BItem2OItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPItem2BItem2OItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQPItem2BItem2OItemList.list[i].summaGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQPItem2BItem2OItemList.list[i].summaGen.DecimalString;
        LastRow:=i+1;
        sgRQPItem2BItem2OItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPItem2BItem2OItem.Row:=1;
end;

procedure TfrmRQPItem2BItem2OItemShow.sgRQPItem2BItem2OItemTopLeftChanged(Sender: TObject);
var
  TempRQPItem2BItem2OItem: RQPItem2BItem2OItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQPItem2BItem2OItemList: RQPItem2BItem2OItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPItem2BItem2OItem.TopRow + sgRQPItem2BItem2OItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQPItem2BItem2OItem :=  HTTPRIORQPItem2BItem2OItem as RQPItem2BItem2OItemControllerSoapPort;
      CurrentRow:=sgRQPItem2BItem2OItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPItem2BItem2OItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPItem2BItem2OItemList := TempRQPItem2BItem2OItem.getScrollableFilteredList(RQPItem2BItem2OItemFilter(FilterObject),ColCount-1, 100);



  sgRQPItem2BItem2OItem.RowCount:=sgRQPItem2BItem2OItem.RowCount+100;
  LastCount:=High(RQPItem2BItem2OItemList.list);
  with sgRQPItem2BItem2OItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPItem2BItem2OItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPItem2BItem2OItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQPItem2BItem2OItemList.list[i].summaGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQPItem2BItem2OItemList.list[i].summaGen.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPItem2BItem2OItem.Row:=CurrentRow-5;
   sgRQPItem2BItem2OItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPItem2BItem2OItemShow.sgRQPItem2BItem2OItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPItem2BItem2OItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPItem2BItem2OItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPItem2BItem2OItem.RowCount-1 do
   for j:=0 to sgRQPItem2BItem2OItem.ColCount-1 do
     sgRQPItem2BItem2OItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPItem2BItem2OItemShow.actViewExecute(Sender: TObject);
Var TempRQPItem2BItem2OItem: RQPItem2BItem2OItemControllerSoapPort;
begin
 TempRQPItem2BItem2OItem := HTTPRIORQPItem2BItem2OItem as RQPItem2BItem2OItemControllerSoapPort;
   try
     RQPItem2BItem2OItemObj := TempRQPItem2BItem2OItem.getObject(StrToInt(sgRQPItem2BItem2OItem.Cells[0,sgRQPItem2BItem2OItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPItem2BItem2OItemEdit:=TfrmRQPItem2BItem2OItemEdit.Create(Application, dsView);
  try
    frmRQPItem2BItem2OItemEdit.ShowModal;
  finally
    frmRQPItem2BItem2OItemEdit.Free;
    frmRQPItem2BItem2OItemEdit:=nil;
  end;
end;

procedure TfrmRQPItem2BItem2OItemShow.actEditExecute(Sender: TObject);
Var TempRQPItem2BItem2OItem: RQPItem2BItem2OItemControllerSoapPort;
begin
 TempRQPItem2BItem2OItem := HTTPRIORQPItem2BItem2OItem as RQPItem2BItem2OItemControllerSoapPort;
   try
     RQPItem2BItem2OItemObj := TempRQPItem2BItem2OItem.getObject(StrToInt(sgRQPItem2BItem2OItem.Cells[0,sgRQPItem2BItem2OItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPItem2BItem2OItemEdit:=TfrmRQPItem2BItem2OItemEdit.Create(Application, dsEdit);
  try
    if frmRQPItem2BItem2OItemEdit.ShowModal= mrOk then
      begin
        //TempRQPItem2BItem2OItem.save(RQPItem2BItem2OItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPItem2BItem2OItemEdit.Free;
    frmRQPItem2BItem2OItemEdit:=nil;
  end;
end;

procedure TfrmRQPItem2BItem2OItemShow.actDeleteExecute(Sender: TObject);
Var TempRQPItem2BItem2OItem: RQPItem2BItem2OItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPItem2BItem2OItem := HTTPRIORQPItem2BItem2OItem as RQPItem2BItem2OItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPItem2BItem2OItem.Cells[0,sgRQPItem2BItem2OItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Звьязок строки оплати зі строками рахунку та заявки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPItem2BItem2OItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPItem2BItem2OItemShow.actInsertExecute(Sender: TObject);
Var TempRQPItem2BItem2OItem: RQPItem2BItem2OItemControllerSoapPort;
begin
  TempRQPItem2BItem2OItem := HTTPRIORQPItem2BItem2OItem as RQPItem2BItem2OItemControllerSoapPort;
  RQPItem2BItem2OItemObj:=RQPItem2BItem2OItem.Create;

   RQPItem2BItem2OItemObj.summaGen:= TXSDecimal.Create;


  try
    frmRQPItem2BItem2OItemEdit:=TfrmRQPItem2BItem2OItemEdit.Create(Application, dsInsert);
    try
      if frmRQPItem2BItem2OItemEdit.ShowModal = mrOk then
      begin
        if RQPItem2BItem2OItemObj<>nil then
            //TempRQPItem2BItem2OItem.add(RQPItem2BItem2OItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPItem2BItem2OItemEdit.Free;
      frmRQPItem2BItem2OItemEdit:=nil;
    end;
  finally
    RQPItem2BItem2OItemObj.Free;
  end;
end;

procedure TfrmRQPItem2BItem2OItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPItem2BItem2OItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQPItem2BItem2OItemFilterEdit:=TfrmRQPItem2BItem2OItemFilterEdit.Create(Application, dsEdit);
  try
    RQPItem2BItem2OItemFilterObj := RQPItem2BItem2OItemFilter.Create;
    SetNullIntProps(RQPItem2BItem2OItemFilterObj);
    SetNullXSProps(RQPItem2BItem2OItemFilterObj);

    if frmRQPItem2BItem2OItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPItem2BItem2OItemFilter.Create;
      FilterObject := RQPItem2BItem2OItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPItem2BItem2OItemFilterEdit.Free;
    frmRQPItem2BItem2OItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPItem2BItem2OItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.