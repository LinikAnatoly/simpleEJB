
unit ShowENTravelSheetFuel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTravelSheetFuelController, AdvObj ;


type
  TfrmENTravelSheetFuelShow = class(TChildForm)  
  HTTPRIOENTravelSheetFuel: THTTPRIO;
    ImageList1: TImageList;
    sgENTravelSheetFuel: TAdvStringGrid;
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
procedure sgENTravelSheetFuelTopLeftChanged(Sender: TObject);
procedure sgENTravelSheetFuelDblClick(Sender: TObject);
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
 // ENTravelSheetFuelObj: ENTravelSheetFuel;
 // ENTravelSheetFuelFilterObj: ENTravelSheetFuelFilter;
  
  
implementation

uses Main, EditENTravelSheetFuel, EditENTravelSheetFuelFilter;


{$R *.dfm}

var
  //frmENTravelSheetFuelShow : TfrmENTravelSheetFuelShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTravelSheetFuelHeaders: array [1..5] of String =
        ( 'Код'
          ,'кількість'
          ,'Серія'
          ,'Номера'
          ,'Дата видачі'
        );
   

procedure TfrmENTravelSheetFuelShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTravelSheetFuelShow:=nil;
    inherited;
  end;


procedure TfrmENTravelSheetFuelShow.FormShow(Sender: TObject);
var
  TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;
  i: Integer;
  ENTravelSheetFuelList: ENTravelSheetFuelShortList;
  begin
  SetGridHeaders(ENTravelSheetFuelHeaders, sgENTravelSheetFuel.ColumnHeaders);
  ColCount:=100;
  TempENTravelSheetFuel :=  HTTPRIOENTravelSheetFuel as ENTravelSheetFuelControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetFuelFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetFuelList := TempENTravelSheetFuel.getScrollableFilteredList(ENTravelSheetFuelFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTravelSheetFuelList.list);

  if LastCount > -1 then
     sgENTravelSheetFuel.RowCount:=LastCount+2
  else
     sgENTravelSheetFuel.RowCount:=2;

   with sgENTravelSheetFuel do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetFuelList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetFuelList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENTravelSheetFuelList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENTravelSheetFuelList.list[i].countGen.DecimalString;
        Cells[2,i+1] := ENTravelSheetFuelList.list[i].series;
        Cells[3,i+1] := ENTravelSheetFuelList.list[i].numbers;
        if ENTravelSheetFuelList.list[i].dateGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENTravelSheetFuelList.list[i].dateGen);
        LastRow:=i+1;
        sgENTravelSheetFuel.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTravelSheetFuel.Row:=1;
end;

procedure TfrmENTravelSheetFuelShow.sgENTravelSheetFuelTopLeftChanged(Sender: TObject);
var
  TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;
  i,CurrentRow: Integer;
  ENTravelSheetFuelList: ENTravelSheetFuelShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTravelSheetFuel.TopRow + sgENTravelSheetFuel.VisibleRowCount) = ColCount
  then
    begin
      TempENTravelSheetFuel :=  HTTPRIOENTravelSheetFuel as ENTravelSheetFuelControllerSoapPort;
      CurrentRow:=sgENTravelSheetFuel.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetFuelFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetFuelList := TempENTravelSheetFuel.getScrollableFilteredList(ENTravelSheetFuelFilter(FilterObject),ColCount-1, 100);



  sgENTravelSheetFuel.RowCount:=sgENTravelSheetFuel.RowCount+100;
  LastCount:=High(ENTravelSheetFuelList.list);
  with sgENTravelSheetFuel do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetFuelList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTravelSheetFuelList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENTravelSheetFuelList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENTravelSheetFuelList.list[i].countGen.DecimalString;
        Cells[2,i+CurrentRow] := ENTravelSheetFuelList.list[i].series;
        Cells[3,i+CurrentRow] := ENTravelSheetFuelList.list[i].numbers;
        if ENTravelSheetFuelList.list[i].dateGen = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENTravelSheetFuelList.list[i].dateGen);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTravelSheetFuel.Row:=CurrentRow-5;
   sgENTravelSheetFuel.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTravelSheetFuelShow.sgENTravelSheetFuelDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTravelSheetFuel,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTravelSheetFuelShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTravelSheetFuel.RowCount-1 do
   for j:=0 to sgENTravelSheetFuel.ColCount-1 do
     sgENTravelSheetFuel.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTravelSheetFuelShow.actViewExecute(Sender: TObject);
Var TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;
begin
 TempENTravelSheetFuel := HTTPRIOENTravelSheetFuel as ENTravelSheetFuelControllerSoapPort;
   try
     ENTravelSheetFuelObj := TempENTravelSheetFuel.getObject(StrToInt(sgENTravelSheetFuel.Cells[0,sgENTravelSheetFuel.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetFuelEdit:=TfrmENTravelSheetFuelEdit.Create(Application, dsView);
  try
    frmENTravelSheetFuelEdit.ShowModal;
  finally
    frmENTravelSheetFuelEdit.Free;
    frmENTravelSheetFuelEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetFuelShow.actEditExecute(Sender: TObject);
Var TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;
begin
 TempENTravelSheetFuel := HTTPRIOENTravelSheetFuel as ENTravelSheetFuelControllerSoapPort;
   try
     ENTravelSheetFuelObj := TempENTravelSheetFuel.getObject(StrToInt(sgENTravelSheetFuel.Cells[0,sgENTravelSheetFuel.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetFuelEdit:=TfrmENTravelSheetFuelEdit.Create(Application, dsEdit);
  try
    if frmENTravelSheetFuelEdit.ShowModal= mrOk then
      begin
        //TempENTravelSheetFuel.save(ENTravelSheetFuelObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTravelSheetFuelEdit.Free;
    frmENTravelSheetFuelEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetFuelShow.actDeleteExecute(Sender: TObject);
Var TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTravelSheetFuel := HTTPRIOENTravelSheetFuel as ENTravelSheetFuelControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravelSheetFuel.Cells[0,sgENTravelSheetFuel.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Видача ПММ на подорожній лист) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelSheetFuel.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTravelSheetFuelShow.actInsertExecute(Sender: TObject);
Var TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;
begin
  TempENTravelSheetFuel := HTTPRIOENTravelSheetFuel as ENTravelSheetFuelControllerSoapPort;
  ENTravelSheetFuelObj:=ENTravelSheetFuel.Create;

   //ENTravelSheetFuelObj.countGen:= TXSDecimal.Create;
   //ENTravelSheetFuelObj.dateGen:= TXSDate.Create;


  try
    frmENTravelSheetFuelEdit:=TfrmENTravelSheetFuelEdit.Create(Application, dsInsert);
    try
      if frmENTravelSheetFuelEdit.ShowModal = mrOk then
      begin
        if ENTravelSheetFuelObj<>nil then
            //TempENTravelSheetFuel.add(ENTravelSheetFuelObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTravelSheetFuelEdit.Free;
      frmENTravelSheetFuelEdit:=nil;
    end;
  finally
    ENTravelSheetFuelObj.Free;
  end;
end;

procedure TfrmENTravelSheetFuelShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTravelSheetFuelShow.actFilterExecute(Sender: TObject);
begin
{frmENTravelSheetFuelFilterEdit:=TfrmENTravelSheetFuelFilterEdit.Create(Application, dsInsert);
  try
    ENTravelSheetFuelFilterObj := ENTravelSheetFuelFilter.Create;
    SetNullIntProps(ENTravelSheetFuelFilterObj);
    SetNullXSProps(ENTravelSheetFuelFilterObj);

    if frmENTravelSheetFuelFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTravelSheetFuelFilter.Create;
      FilterObject := ENTravelSheetFuelFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTravelSheetFuelFilterEdit.Free;
    frmENTravelSheetFuelFilterEdit:=nil;
  end;}
end;

procedure TfrmENTravelSheetFuelShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.