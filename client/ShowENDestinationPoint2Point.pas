
unit ShowENDestinationPoint2Point;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDestinationPoint2PointController ;


type
  TfrmENDestinationPoint2PointShow = class(TChildForm)  
  HTTPRIOENDestinationPoint2Point: THTTPRIO;
    ImageList1: TImageList;
    sgENDestinationPoint2Point: TAdvStringGrid;
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
procedure sgENDestinationPoint2PointTopLeftChanged(Sender: TObject);
procedure sgENDestinationPoint2PointDblClick(Sender: TObject);
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
 // ENDestinationPoint2PointObj: ENDestinationPoint2Point;
 // ENDestinationPoint2PointFilterObj: ENDestinationPoint2PointFilter;
  
  
implementation

uses Main, EditENDestinationPoint2Point, EditENDestinationPoint2PointFilter;


{$R *.dfm}

var
  //frmENDestinationPoint2PointShow : TfrmENDestinationPoint2PointShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDestinationPoint2PointHeaders: array [1..2] of String =
        ( 'Код'
          ,'Дистанція, км.'
        );
   

procedure TfrmENDestinationPoint2PointShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDestinationPoint2PointShow:=nil;
    inherited;
  end;


procedure TfrmENDestinationPoint2PointShow.FormShow(Sender: TObject);
var
  TempENDestinationPoint2Point: ENDestinationPoint2PointControllerSoapPort;
  i: Integer;
  ENDestinationPoint2PointList: ENDestinationPoint2PointShortList;
  begin
  SetGridHeaders(ENDestinationPoint2PointHeaders, sgENDestinationPoint2Point.ColumnHeaders);
  ColCount:=100;
  TempENDestinationPoint2Point :=  HTTPRIOENDestinationPoint2Point as ENDestinationPoint2PointControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDestinationPoint2PointFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDestinationPoint2PointList := TempENDestinationPoint2Point.getScrollableFilteredList(ENDestinationPoint2PointFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDestinationPoint2PointList.list);

  if LastCount > -1 then
     sgENDestinationPoint2Point.RowCount:=LastCount+2
  else
     sgENDestinationPoint2Point.RowCount:=2;

   with sgENDestinationPoint2Point do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDestinationPoint2PointList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDestinationPoint2PointList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENDestinationPoint2PointList.list[i].distance = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENDestinationPoint2PointList.list[i].distance.DecimalString;
        LastRow:=i+1;
        sgENDestinationPoint2Point.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDestinationPoint2Point.Row:=1;
end;

procedure TfrmENDestinationPoint2PointShow.sgENDestinationPoint2PointTopLeftChanged(Sender: TObject);
var
  TempENDestinationPoint2Point: ENDestinationPoint2PointControllerSoapPort;
  i,CurrentRow: Integer;
  ENDestinationPoint2PointList: ENDestinationPoint2PointShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDestinationPoint2Point.TopRow + sgENDestinationPoint2Point.VisibleRowCount) = ColCount
  then
    begin
      TempENDestinationPoint2Point :=  HTTPRIOENDestinationPoint2Point as ENDestinationPoint2PointControllerSoapPort;
      CurrentRow:=sgENDestinationPoint2Point.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDestinationPoint2PointFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDestinationPoint2PointList := TempENDestinationPoint2Point.getScrollableFilteredList(ENDestinationPoint2PointFilter(FilterObject),ColCount-1, 100);



  sgENDestinationPoint2Point.RowCount:=sgENDestinationPoint2Point.RowCount+100;
  LastCount:=High(ENDestinationPoint2PointList.list);
  with sgENDestinationPoint2Point do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDestinationPoint2PointList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDestinationPoint2PointList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENDestinationPoint2PointList.list[i].distance = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENDestinationPoint2PointList.list[i].distance.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDestinationPoint2Point.Row:=CurrentRow-5;
   sgENDestinationPoint2Point.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDestinationPoint2PointShow.sgENDestinationPoint2PointDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDestinationPoint2Point,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDestinationPoint2PointShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDestinationPoint2Point.RowCount-1 do
   for j:=0 to sgENDestinationPoint2Point.ColCount-1 do
     sgENDestinationPoint2Point.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDestinationPoint2PointShow.actViewExecute(Sender: TObject);
Var TempENDestinationPoint2Point: ENDestinationPoint2PointControllerSoapPort;
begin
 TempENDestinationPoint2Point := HTTPRIOENDestinationPoint2Point as ENDestinationPoint2PointControllerSoapPort;
   try
     ENDestinationPoint2PointObj := TempENDestinationPoint2Point.getObject(StrToInt(sgENDestinationPoint2Point.Cells[0,sgENDestinationPoint2Point.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDestinationPoint2PointEdit:=TfrmENDestinationPoint2PointEdit.Create(Application, dsView);
  try
    frmENDestinationPoint2PointEdit.ShowModal;
  finally
    frmENDestinationPoint2PointEdit.Free;
    frmENDestinationPoint2PointEdit:=nil;
  end;
end;

procedure TfrmENDestinationPoint2PointShow.actEditExecute(Sender: TObject);
Var TempENDestinationPoint2Point: ENDestinationPoint2PointControllerSoapPort;
begin
 TempENDestinationPoint2Point := HTTPRIOENDestinationPoint2Point as ENDestinationPoint2PointControllerSoapPort;
   try
     ENDestinationPoint2PointObj := TempENDestinationPoint2Point.getObject(StrToInt(sgENDestinationPoint2Point.Cells[0,sgENDestinationPoint2Point.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDestinationPoint2PointEdit:=TfrmENDestinationPoint2PointEdit.Create(Application, dsEdit);
  try
    if frmENDestinationPoint2PointEdit.ShowModal= mrOk then
      begin
        //TempENDestinationPoint2Point.save(ENDestinationPoint2PointObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDestinationPoint2PointEdit.Free;
    frmENDestinationPoint2PointEdit:=nil;
  end;
end;

procedure TfrmENDestinationPoint2PointShow.actDeleteExecute(Sender: TObject);
Var TempENDestinationPoint2Point: ENDestinationPoint2PointControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDestinationPoint2Point := HTTPRIOENDestinationPoint2Point as ENDestinationPoint2PointControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDestinationPoint2Point.Cells[0,sgENDestinationPoint2Point.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Відстань від пункту до пункту) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDestinationPoint2Point.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDestinationPoint2PointShow.actInsertExecute(Sender: TObject);
// Var TempENDestinationPoint2Point: ENDestinationPoint2PointControllerSoapPort; 
begin
  // TempENDestinationPoint2Point := HTTPRIOENDestinationPoint2Point as ENDestinationPoint2PointControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDestinationPoint2PointObj:=ENDestinationPoint2Point.Create;

   //ENDestinationPoint2PointObj.distance:= TXSDecimal.Create;


  try
    frmENDestinationPoint2PointEdit:=TfrmENDestinationPoint2PointEdit.Create(Application, dsInsert);
    try
      if frmENDestinationPoint2PointEdit.ShowModal = mrOk then
      begin
        if ENDestinationPoint2PointObj<>nil then
            //TempENDestinationPoint2Point.add(ENDestinationPoint2PointObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDestinationPoint2PointEdit.Free;
      frmENDestinationPoint2PointEdit:=nil;
    end;
  finally
    ENDestinationPoint2PointObj.Free;
  end;
end;

procedure TfrmENDestinationPoint2PointShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDestinationPoint2PointShow.actFilterExecute(Sender: TObject);
begin
{frmENDestinationPoint2PointFilterEdit:=TfrmENDestinationPoint2PointFilterEdit.Create(Application, dsInsert);
  try
    ENDestinationPoint2PointFilterObj := ENDestinationPoint2PointFilter.Create;
    SetNullIntProps(ENDestinationPoint2PointFilterObj);
    SetNullXSProps(ENDestinationPoint2PointFilterObj);

    if frmENDestinationPoint2PointFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDestinationPoint2PointFilter.Create;
      FilterObject := ENDestinationPoint2PointFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDestinationPoint2PointFilterEdit.Free;
    frmENDestinationPoint2PointFilterEdit:=nil;
  end;}
end;

procedure TfrmENDestinationPoint2PointShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.