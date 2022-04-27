
unit ShowENWires;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENWiresController ;


type
  TfrmENWiresShow = class(TChildForm)  
  HTTPRIOENWires: THTTPRIO;
    ImageList1: TImageList;
    sgENWires: TAdvStringGrid;
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
procedure sgENWiresTopLeftChanged(Sender: TObject);
procedure sgENWiresDblClick(Sender: TObject);
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
 // ENWiresObj: ENWires;
 // ENWiresFilterObj: ENWiresFilter;
  
  
implementation

uses Main, EditENWires, EditENWiresFilter;


{$R *.dfm}

var
  //frmENWiresShow : TfrmENWiresShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWiresHeaders: array [1..6] of String =
        ( 'Код'
          ,'№ прольота'
          ,'Кількість проводів'
          ,'Довжина проводів, м'
          ,'Сторонні організації при наявності проводів сумісного підвісу'
          ,'Кабель/провод (1,0)'
        );
   

procedure TfrmENWiresShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENWiresShow:=nil;
    inherited;
  end;


procedure TfrmENWiresShow.FormShow(Sender: TObject);
var
  TempENWires: ENWiresControllerSoapPort;
  i: Integer;
  ENWiresList: ENWiresShortList;
  begin
  SetGridHeaders(ENWiresHeaders, sgENWires.ColumnHeaders);
  ColCount:=100;
  TempENWires :=  HTTPRIOENWires as ENWiresControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENWiresFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWiresList := TempENWires.getScrollableFilteredList(ENWiresFilter(FilterObject),0,ColCount);


  LastCount:=High(ENWiresList.list);

  if LastCount > -1 then
     sgENWires.RowCount:=LastCount+2
  else
     sgENWires.RowCount:=2;

   with sgENWires do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWiresList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWiresList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENWiresList.list[i].numberGen;
        if ENWiresList.list[i].countWires = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENWiresList.list[i].countWires);
        if ENWiresList.list[i].wireLength = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENWiresList.list[i].wireLength.DecimalString;
        Cells[4,i+1] := ENWiresList.list[i].externOrg;
        if ENWiresList.list[i].isCabel = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(ENWiresList.list[i].isCabel);
        LastRow:=i+1;
        sgENWires.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENWires.Row:=1;
end;

procedure TfrmENWiresShow.sgENWiresTopLeftChanged(Sender: TObject);
var
  TempENWires: ENWiresControllerSoapPort;
  i,CurrentRow: Integer;
  ENWiresList: ENWiresShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENWires.TopRow + sgENWires.VisibleRowCount) = ColCount
  then
    begin
      TempENWires :=  HTTPRIOENWires as ENWiresControllerSoapPort;
      CurrentRow:=sgENWires.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENWiresFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWiresList := TempENWires.getScrollableFilteredList(ENWiresFilter(FilterObject),ColCount-1, 100);



  sgENWires.RowCount:=sgENWires.RowCount+100;
  LastCount:=High(ENWiresList.list);
  with sgENWires do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWiresList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENWiresList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENWiresList.list[i].numberGen;
        if ENWiresList.list[i].countWires = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENWiresList.list[i].countWires);
        if ENWiresList.list[i].wireLength = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENWiresList.list[i].wireLength.DecimalString;
        Cells[4,i+CurrentRow] := ENWiresList.list[i].externOrg;
        if ENWiresList.list[i].isCabel = Low(Integer) then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := IntToStr(ENWiresList.list[i].isCabel);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENWires.Row:=CurrentRow-5;
   sgENWires.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENWiresShow.sgENWiresDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWires,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWiresShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENWires.RowCount-1 do
   for j:=0 to sgENWires.ColCount-1 do
     sgENWires.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENWiresShow.actViewExecute(Sender: TObject);
Var TempENWires: ENWiresControllerSoapPort;
begin
 TempENWires := HTTPRIOENWires as ENWiresControllerSoapPort;
   try
     ENWiresObj := TempENWires.getObject(StrToInt(sgENWires.Cells[0,sgENWires.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWiresEdit:=TfrmENWiresEdit.Create(Application, dsView);
  try
    frmENWiresEdit.ShowModal;
  finally
    frmENWiresEdit.Free;
    frmENWiresEdit:=nil;
  end;
end;

procedure TfrmENWiresShow.actEditExecute(Sender: TObject);
Var TempENWires: ENWiresControllerSoapPort;
begin
 TempENWires := HTTPRIOENWires as ENWiresControllerSoapPort;
   try
     ENWiresObj := TempENWires.getObject(StrToInt(sgENWires.Cells[0,sgENWires.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWiresEdit:=TfrmENWiresEdit.Create(Application, dsEdit);
  try
    if frmENWiresEdit.ShowModal= mrOk then
      begin
        //TempENWires.save(ENWiresObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENWiresEdit.Free;
    frmENWiresEdit:=nil;
  end;
end;

procedure TfrmENWiresShow.actDeleteExecute(Sender: TObject);
Var TempENWires: ENWiresControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWires := HTTPRIOENWires as ENWiresControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWires.Cells[0,sgENWires.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Характеристики проводів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWires.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWiresShow.actInsertExecute(Sender: TObject);
// Var TempENWires: ENWiresControllerSoapPort; 
begin
  // TempENWires := HTTPRIOENWires as ENWiresControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENWiresObj:=ENWires.Create;

   //ENWiresObj.wireLength:= TXSDecimal.Create;


  try
    frmENWiresEdit:=TfrmENWiresEdit.Create(Application, dsInsert);
    try
      if frmENWiresEdit.ShowModal = mrOk then
      begin
        if ENWiresObj<>nil then
            //TempENWires.add(ENWiresObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWiresEdit.Free;
      frmENWiresEdit:=nil;
    end;
  finally
    ENWiresObj.Free;
  end;
end;

procedure TfrmENWiresShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENWiresShow.actFilterExecute(Sender: TObject);
begin
{frmENWiresFilterEdit:=TfrmENWiresFilterEdit.Create(Application, dsInsert);
  try
    ENWiresFilterObj := ENWiresFilter.Create;
    SetNullIntProps(ENWiresFilterObj);
    SetNullXSProps(ENWiresFilterObj);

    if frmENWiresFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWiresFilter.Create;
      FilterObject := ENWiresFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWiresFilterEdit.Free;
    frmENWiresFilterEdit:=nil;
  end;}
end;

procedure TfrmENWiresShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.