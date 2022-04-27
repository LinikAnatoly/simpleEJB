
unit ShowENMarkBus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMarkBusController, AdvObj ;


type
  TfrmENMarkBusShow = class(TChildForm)  
  HTTPRIOENMarkBus: THTTPRIO;
    ImageList1: TImageList;
    sgENMarkBus: TAdvStringGrid;
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
procedure sgENMarkBusTopLeftChanged(Sender: TObject);
procedure sgENMarkBusDblClick(Sender: TObject);
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
 frmENMarkBusShow : TfrmENMarkBusShow;
 // ENMarkBusObj: ENMarkBus;
 // ENMarkBusFilterObj: ENMarkBusFilter;
  
  
implementation

uses Main, EditENMarkBus, EditENMarkBusFilter;


{$R *.dfm}

var
  //frmENMarkBusShow : TfrmENMarkBusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMarkBusHeaders: array [1..3] of String =
        ( 'Код'
          ,'Марка шины'
          ,'Сечение шины'
        );
   

procedure TfrmENMarkBusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMarkBusShow:=nil;
    inherited;
  end;


procedure TfrmENMarkBusShow.FormShow(Sender: TObject);
var
  TempENMarkBus: ENMarkBusControllerSoapPort;
  i: Integer;
  ENMarkBusList: ENMarkBusShortList;
  begin
  SetGridHeaders(ENMarkBusHeaders, sgENMarkBus.ColumnHeaders);
  ColCount:=100;
  TempENMarkBus :=  HTTPRIOENMarkBus as ENMarkBusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMarkBusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMarkBusList := TempENMarkBus.getScrollableFilteredList(ENMarkBusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMarkBusList.list);

  if LastCount > -1 then
     sgENMarkBus.RowCount:=LastCount+2
  else
     sgENMarkBus.RowCount:=2;

   with sgENMarkBus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMarkBusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMarkBusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMarkBusList.list[i].name;
        if ENMarkBusList.list[i].busSection = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENMarkBusList.list[i].busSection.DecimalString;
        LastRow:=i+1;
        sgENMarkBus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMarkBus.Row:=1;
end;

procedure TfrmENMarkBusShow.sgENMarkBusTopLeftChanged(Sender: TObject);
var
  TempENMarkBus: ENMarkBusControllerSoapPort;
  i,CurrentRow: Integer;
  ENMarkBusList: ENMarkBusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMarkBus.TopRow + sgENMarkBus.VisibleRowCount) = ColCount
  then
    begin
      TempENMarkBus :=  HTTPRIOENMarkBus as ENMarkBusControllerSoapPort;
      CurrentRow:=sgENMarkBus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMarkBusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMarkBusList := TempENMarkBus.getScrollableFilteredList(ENMarkBusFilter(FilterObject),ColCount-1, 100);



  sgENMarkBus.RowCount:=sgENMarkBus.RowCount+100;
  LastCount:=High(ENMarkBusList.list);
  with sgENMarkBus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMarkBusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMarkBusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMarkBusList.list[i].name;
        if ENMarkBusList.list[i].busSection = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENMarkBusList.list[i].busSection.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMarkBus.Row:=CurrentRow-5;
   sgENMarkBus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMarkBusShow.sgENMarkBusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMarkBus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMarkBusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMarkBus.RowCount-1 do
   for j:=0 to sgENMarkBus.ColCount-1 do
     sgENMarkBus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMarkBusShow.actViewExecute(Sender: TObject);
Var TempENMarkBus: ENMarkBusControllerSoapPort;
begin
 TempENMarkBus := HTTPRIOENMarkBus as ENMarkBusControllerSoapPort;
   try
     ENMarkBusObj := TempENMarkBus.getObject(StrToInt(sgENMarkBus.Cells[0,sgENMarkBus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMarkBusEdit:=TfrmENMarkBusEdit.Create(Application, dsView);
  try
    frmENMarkBusEdit.ShowModal;
  finally
    frmENMarkBusEdit.Free;
    frmENMarkBusEdit:=nil;
  end;
end;

procedure TfrmENMarkBusShow.actEditExecute(Sender: TObject);
Var TempENMarkBus: ENMarkBusControllerSoapPort;
begin
 TempENMarkBus := HTTPRIOENMarkBus as ENMarkBusControllerSoapPort;
   try
     ENMarkBusObj := TempENMarkBus.getObject(StrToInt(sgENMarkBus.Cells[0,sgENMarkBus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMarkBusEdit:=TfrmENMarkBusEdit.Create(Application, dsEdit);
  try
    if frmENMarkBusEdit.ShowModal= mrOk then
      begin
        //TempENMarkBus.save(ENMarkBusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMarkBusEdit.Free;
    frmENMarkBusEdit:=nil;
  end;
end;

procedure TfrmENMarkBusShow.actDeleteExecute(Sender: TObject);
Var TempENMarkBus: ENMarkBusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMarkBus := HTTPRIOENMarkBus as ENMarkBusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMarkBus.Cells[0,sgENMarkBus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Справочник марок и сечений шин) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMarkBus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMarkBusShow.actInsertExecute(Sender: TObject);
Var TempENMarkBus: ENMarkBusControllerSoapPort;
begin
  TempENMarkBus := HTTPRIOENMarkBus as ENMarkBusControllerSoapPort;
  ENMarkBusObj:=ENMarkBus.Create;

   //ENMarkBusObj.busSection:= TXSDecimal.Create;


  try
    frmENMarkBusEdit:=TfrmENMarkBusEdit.Create(Application, dsInsert);
    try
      if frmENMarkBusEdit.ShowModal = mrOk then
      begin
        if ENMarkBusObj<>nil then
            //TempENMarkBus.add(ENMarkBusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMarkBusEdit.Free;
      frmENMarkBusEdit:=nil;
    end;
  finally
    ENMarkBusObj.Free;
  end;
end;

procedure TfrmENMarkBusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMarkBusShow.actFilterExecute(Sender: TObject);
begin
{frmENMarkBusFilterEdit:=TfrmENMarkBusFilterEdit.Create(Application, dsInsert);
  try
    ENMarkBusFilterObj := ENMarkBusFilter.Create;
    SetNullIntProps(ENMarkBusFilterObj);
    SetNullXSProps(ENMarkBusFilterObj);

    if frmENMarkBusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMarkBusFilter.Create;
      FilterObject := ENMarkBusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMarkBusFilterEdit.Free;
    frmENMarkBusFilterEdit:=nil;
  end;}
end;

procedure TfrmENMarkBusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.