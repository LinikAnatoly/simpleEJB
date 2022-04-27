
unit ShowENAirCrossing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAirCrossingController, AdvObj ;


type
  TfrmENAirCrossingShow = class(TChildForm)  
  HTTPRIOENAirCrossing: THTTPRIO;
    ImageList1: TImageList;
    sgENAirCrossing: TAdvStringGrid;
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
procedure sgENAirCrossingTopLeftChanged(Sender: TObject);
procedure sgENAirCrossingDblClick(Sender: TObject);
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
 frmENAirCrossingShow : TfrmENAirCrossingShow;
 // ENAirCrossingObj: ENAirCrossing;
 // ENAirCrossingFilterObj: ENAirCrossingFilter;
  
  
implementation

uses Main, EditENAirCrossing, EditENAirCrossingFilter;


{$R *.dfm}

var
  //frmENAirCrossingShow : TfrmENAirCrossingShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAirCrossingHeaders: array [1..3] of String =
        ( 'Код'
          ,'Характеристика об''єкту який перетинання'
          ,'Довжина прольоту, м'
        );
   

procedure TfrmENAirCrossingShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAirCrossingShow:=nil;
    inherited;
  end;


procedure TfrmENAirCrossingShow.FormShow(Sender: TObject);
var
  TempENAirCrossing: ENAirCrossingControllerSoapPort;
  i: Integer;
  ENAirCrossingList: ENAirCrossingShortList;
  begin
  SetGridHeaders(ENAirCrossingHeaders, sgENAirCrossing.ColumnHeaders);
  ColCount:=100;
  TempENAirCrossing :=  HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAirCrossingFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAirCrossingList := TempENAirCrossing.getScrollableFilteredList(ENAirCrossingFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAirCrossingList.list);

  if LastCount > -1 then
     sgENAirCrossing.RowCount:=LastCount+2
  else
     sgENAirCrossing.RowCount:=2;

   with sgENAirCrossing do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAirCrossingList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAirCrossingList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENAirCrossingList.list[i].name;
        if ENAirCrossingList.list[i].flightLength = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENAirCrossingList.list[i].flightLength.DecimalString;
        LastRow:=i+1;
        sgENAirCrossing.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAirCrossing.Row:=1;
end;

procedure TfrmENAirCrossingShow.sgENAirCrossingTopLeftChanged(Sender: TObject);
var
  TempENAirCrossing: ENAirCrossingControllerSoapPort;
  i,CurrentRow: Integer;
  ENAirCrossingList: ENAirCrossingShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAirCrossing.TopRow + sgENAirCrossing.VisibleRowCount) = ColCount
  then
    begin
      TempENAirCrossing :=  HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;
      CurrentRow:=sgENAirCrossing.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAirCrossingFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAirCrossingList := TempENAirCrossing.getScrollableFilteredList(ENAirCrossingFilter(FilterObject),ColCount-1, 100);



  sgENAirCrossing.RowCount:=sgENAirCrossing.RowCount+100;
  LastCount:=High(ENAirCrossingList.list);
  with sgENAirCrossing do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAirCrossingList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAirCrossingList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENAirCrossingList.list[i].name;
        if ENAirCrossingList.list[i].flightLength = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENAirCrossingList.list[i].flightLength.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAirCrossing.Row:=CurrentRow-5;
   sgENAirCrossing.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAirCrossingShow.sgENAirCrossingDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAirCrossing,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAirCrossingShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAirCrossing.RowCount-1 do
   for j:=0 to sgENAirCrossing.ColCount-1 do
     sgENAirCrossing.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAirCrossingShow.actViewExecute(Sender: TObject);
Var TempENAirCrossing: ENAirCrossingControllerSoapPort;
begin
 TempENAirCrossing := HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;
   try
     ENAirCrossingObj := TempENAirCrossing.getObject(StrToInt(sgENAirCrossing.Cells[0,sgENAirCrossing.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAirCrossingEdit:=TfrmENAirCrossingEdit.Create(Application, dsView);
  try
    frmENAirCrossingEdit.ShowModal;
  finally
    frmENAirCrossingEdit.Free;
    frmENAirCrossingEdit:=nil;
  end;
end;

procedure TfrmENAirCrossingShow.actEditExecute(Sender: TObject);
Var TempENAirCrossing: ENAirCrossingControllerSoapPort;
begin
 TempENAirCrossing := HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;
   try
     ENAirCrossingObj := TempENAirCrossing.getObject(StrToInt(sgENAirCrossing.Cells[0,sgENAirCrossing.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAirCrossingEdit:=TfrmENAirCrossingEdit.Create(Application, dsEdit);
  try
    if frmENAirCrossingEdit.ShowModal= mrOk then
      begin
        //TempENAirCrossing.save(ENAirCrossingObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAirCrossingEdit.Free;
    frmENAirCrossingEdit:=nil;
  end;
end;

procedure TfrmENAirCrossingShow.actDeleteExecute(Sender: TObject);
Var TempENAirCrossing: ENAirCrossingControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAirCrossing := HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAirCrossing.Cells[0,sgENAirCrossing.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Повітряні перетинання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAirCrossing.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAirCrossingShow.actInsertExecute(Sender: TObject);
// Var TempENAirCrossing: ENAirCrossingControllerSoapPort; 
begin
  // TempENAirCrossing := HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENAirCrossingObj:=ENAirCrossing.Create;

   //ENAirCrossingObj.sizeBottomLength:= TXSDecimal.Create;
   //ENAirCrossingObj.flightLength:= TXSDecimal.Create;


  try
    frmENAirCrossingEdit:=TfrmENAirCrossingEdit.Create(Application, dsInsert);
    try
      if frmENAirCrossingEdit.ShowModal = mrOk then
      begin
        if ENAirCrossingObj<>nil then
            //TempENAirCrossing.add(ENAirCrossingObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAirCrossingEdit.Free;
      frmENAirCrossingEdit:=nil;
    end;
  finally
    ENAirCrossingObj.Free;
  end;
end;

procedure TfrmENAirCrossingShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAirCrossingShow.actFilterExecute(Sender: TObject);
begin
{frmENAirCrossingFilterEdit:=TfrmENAirCrossingFilterEdit.Create(Application, dsInsert);
  try
    ENAirCrossingFilterObj := ENAirCrossingFilter.Create;
    SetNullIntProps(ENAirCrossingFilterObj);
    SetNullXSProps(ENAirCrossingFilterObj);

    if frmENAirCrossingFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAirCrossingFilter.Create;
      FilterObject := ENAirCrossingFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAirCrossingFilterEdit.Free;
    frmENAirCrossingFilterEdit:=nil;
  end;}
end;

procedure TfrmENAirCrossingShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.