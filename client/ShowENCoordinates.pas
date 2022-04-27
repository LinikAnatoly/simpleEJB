
unit ShowENCoordinates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENCoordinatesController ;


type
  TfrmENCoordinatesShow = class(TChildForm)  
  HTTPRIOENCoordinates: THTTPRIO;
    ImageList1: TImageList;
    sgENCoordinates: TAdvStringGrid;
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
procedure sgENCoordinatesTopLeftChanged(Sender: TObject);
procedure sgENCoordinatesDblClick(Sender: TObject);
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
 // ENCoordinatesObj: ENCoordinates;
 // ENCoordinatesFilterObj: ENCoordinatesFilter;
  
  
implementation

uses Main, EditENCoordinates, EditENCoordinatesFilter;


{$R *.dfm}

var
  //frmENCoordinatesShow : TfrmENCoordinatesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCoordinatesHeaders: array [1..6] of String =
        ( 'Код'
          ,'Географическая широта центра / южного или западного начала объекта энергетики'
          ,'Географическая долгота центра / южного или западного начала объекта энергетики'
          ,'Географическая широта северного или восточного конца объекта энергетики'
          ,'Географическая долгота северного или восточного конца объекта энергетики'
          ,'Географический код объекта энергетики'
        );
   

procedure TfrmENCoordinatesShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCoordinatesShow:=nil;
    inherited;
  end;


procedure TfrmENCoordinatesShow.FormShow(Sender: TObject);
var
  TempENCoordinates: ENCoordinatesControllerSoapPort;
  i: Integer;
  ENCoordinatesList: ENCoordinatesShortList;
  begin
  SetGridHeaders(ENCoordinatesHeaders, sgENCoordinates.ColumnHeaders);
  ColCount:=100;
  TempENCoordinates :=  HTTPRIOENCoordinates as ENCoordinatesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCoordinatesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCoordinatesList := TempENCoordinates.getScrollableFilteredList(ENCoordinatesFilter(FilterObject),0,ColCount);


  LastCount:=High(ENCoordinatesList.list);

  if LastCount > -1 then
     sgENCoordinates.RowCount:=LastCount+2
  else
     sgENCoordinates.RowCount:=2;

   with sgENCoordinates do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCoordinatesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCoordinatesList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENCoordinatesList.list[i].latitude = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENCoordinatesList.list[i].latitude.DecimalString;
        if ENCoordinatesList.list[i].longitude = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENCoordinatesList.list[i].longitude.DecimalString;
        if ENCoordinatesList.list[i].latitude2 = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENCoordinatesList.list[i].latitude2.DecimalString;
        if ENCoordinatesList.list[i].longitude2 = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENCoordinatesList.list[i].longitude2.DecimalString;
        Cells[5,i+1] := ENCoordinatesList.list[i].geographicCode;
        LastRow:=i+1;
        sgENCoordinates.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENCoordinates.Row:=1;
end;

procedure TfrmENCoordinatesShow.sgENCoordinatesTopLeftChanged(Sender: TObject);
var
  TempENCoordinates: ENCoordinatesControllerSoapPort;
  i,CurrentRow: Integer;
  ENCoordinatesList: ENCoordinatesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCoordinates.TopRow + sgENCoordinates.VisibleRowCount) = ColCount
  then
    begin
      TempENCoordinates :=  HTTPRIOENCoordinates as ENCoordinatesControllerSoapPort;
      CurrentRow:=sgENCoordinates.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCoordinatesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCoordinatesList := TempENCoordinates.getScrollableFilteredList(ENCoordinatesFilter(FilterObject),ColCount-1, 100);



  sgENCoordinates.RowCount:=sgENCoordinates.RowCount+100;
  LastCount:=High(ENCoordinatesList.list);
  with sgENCoordinates do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCoordinatesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCoordinatesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENCoordinatesList.list[i].latitude = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENCoordinatesList.list[i].latitude.DecimalString;
        if ENCoordinatesList.list[i].longitude = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENCoordinatesList.list[i].longitude.DecimalString;
        if ENCoordinatesList.list[i].latitude2 = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENCoordinatesList.list[i].latitude2.DecimalString;
        if ENCoordinatesList.list[i].longitude2 = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENCoordinatesList.list[i].longitude2.DecimalString;
        Cells[5,i+CurrentRow] := ENCoordinatesList.list[i].geographicCode;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCoordinates.Row:=CurrentRow-5;
   sgENCoordinates.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCoordinatesShow.sgENCoordinatesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCoordinates,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCoordinatesShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENCoordinates.RowCount-1 do
   for j:=0 to sgENCoordinates.ColCount-1 do
     sgENCoordinates.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENCoordinatesShow.actViewExecute(Sender: TObject);
Var TempENCoordinates: ENCoordinatesControllerSoapPort;
begin
 TempENCoordinates := HTTPRIOENCoordinates as ENCoordinatesControllerSoapPort;
   try
     ENCoordinatesObj := TempENCoordinates.getObject(StrToInt(sgENCoordinates.Cells[0,sgENCoordinates.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCoordinatesEdit:=TfrmENCoordinatesEdit.Create(Application, dsView);
  try
    frmENCoordinatesEdit.ShowModal;
  finally
    frmENCoordinatesEdit.Free;
    frmENCoordinatesEdit:=nil;
  end;
end;

procedure TfrmENCoordinatesShow.actEditExecute(Sender: TObject);
Var TempENCoordinates: ENCoordinatesControllerSoapPort;
begin
 TempENCoordinates := HTTPRIOENCoordinates as ENCoordinatesControllerSoapPort;
   try
     ENCoordinatesObj := TempENCoordinates.getObject(StrToInt(sgENCoordinates.Cells[0,sgENCoordinates.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCoordinatesEdit:=TfrmENCoordinatesEdit.Create(Application, dsEdit);
  try
    if frmENCoordinatesEdit.ShowModal= mrOk then
      begin
        //TempENCoordinates.save(ENCoordinatesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCoordinatesEdit.Free;
    frmENCoordinatesEdit:=nil;
  end;
end;

procedure TfrmENCoordinatesShow.actDeleteExecute(Sender: TObject);
Var TempENCoordinates: ENCoordinatesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCoordinates := HTTPRIOENCoordinates as ENCoordinatesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCoordinates.Cells[0,sgENCoordinates.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Географические координаты объектов энергетики) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCoordinates.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCoordinatesShow.actInsertExecute(Sender: TObject);
// Var TempENCoordinates: ENCoordinatesControllerSoapPort; 
begin
  // TempENCoordinates := HTTPRIOENCoordinates as ENCoordinatesControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCoordinatesObj:=ENCoordinates.Create;

   //ENCoordinatesObj.latitude:= TXSDecimal.Create;
   //ENCoordinatesObj.longitude:= TXSDecimal.Create;
   //ENCoordinatesObj.latitude2:= TXSDecimal.Create;
   //ENCoordinatesObj.longitude2:= TXSDecimal.Create;


  try
    frmENCoordinatesEdit:=TfrmENCoordinatesEdit.Create(Application, dsInsert);
    try
      if frmENCoordinatesEdit.ShowModal = mrOk then
      begin
        if ENCoordinatesObj<>nil then
            //TempENCoordinates.add(ENCoordinatesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCoordinatesEdit.Free;
      frmENCoordinatesEdit:=nil;
    end;
  finally
    ENCoordinatesObj.Free;
  end;
end;

procedure TfrmENCoordinatesShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENCoordinatesShow.actFilterExecute(Sender: TObject);
begin
{frmENCoordinatesFilterEdit:=TfrmENCoordinatesFilterEdit.Create(Application, dsInsert);
  try
    ENCoordinatesFilterObj := ENCoordinatesFilter.Create;
    SetNullIntProps(ENCoordinatesFilterObj);
    SetNullXSProps(ENCoordinatesFilterObj);

    if frmENCoordinatesFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENCoordinatesFilter.Create;
      FilterObject := ENCoordinatesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCoordinatesFilterEdit.Free;
    frmENCoordinatesFilterEdit:=nil;
  end;}
end;

procedure TfrmENCoordinatesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.