
unit ShowENConnectionPowerPoint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENConnectionPowerPointController, AdvObj ;


type
    TfrmENConnectionPowerPointShow = class(TChildForm)  
    HTTPRIOENConnectionPowerPoint: THTTPRIO;
    ImageList1: TImageList;
    sgENConnectionPowerPoint: TAdvStringGrid;
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
    procedure sgENConnectionPowerPointTopLeftChanged(Sender: TObject);
    procedure sgENConnectionPowerPointDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENConnectionPowerPointShow : TfrmENConnectionPowerPointShow;
 // ENConnectionPowerPointObj: ENConnectionPowerPoint;
 // ENConnectionPowerPointFilterObj: ENConnectionPowerPointFilter;
  
  
implementation

uses Main, EditENConnectionPowerPoint, EditENConnectionPowerPointFilter;


{$R *.dfm}

var
  //frmENConnectionPowerPointShow : TfrmENConnectionPowerPointShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConnectionPowerPointHeaders: array [1..3] of String =
        ( 'Код'
          ,'Ступінь напруги в точці приєднання'
          ,'Коефіцієнт'
        );
   

procedure TfrmENConnectionPowerPointShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENConnectionPowerPointShow:=nil;
  inherited;
end;


procedure TfrmENConnectionPowerPointShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENConnectionPowerPointShow.FormShow(Sender: TObject);
var
  TempENConnectionPowerPoint: ENConnectionPowerPointControllerSoapPort;
  i: Integer;
  ENConnectionPowerPointList: ENConnectionPowerPointShortList;
begin
  SetGridHeaders(ENConnectionPowerPointHeaders, sgENConnectionPowerPoint.ColumnHeaders);
  ColCount:=100;
  TempENConnectionPowerPoint :=  HTTPRIOENConnectionPowerPoint as ENConnectionPowerPointControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionPowerPointFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionPowerPointList := TempENConnectionPowerPoint.getScrollableFilteredList(ENConnectionPowerPointFilter(FilterObject),0,ColCount);
  LastCount:=High(ENConnectionPowerPointList.list);

  if LastCount > -1 then
     sgENConnectionPowerPoint.RowCount:=LastCount+2
  else
     sgENConnectionPowerPoint.RowCount:=2;

   with sgENConnectionPowerPoint do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionPowerPointList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENConnectionPowerPointList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENConnectionPowerPointList.list[i].name;
        if ENConnectionPowerPointList.list[i].coef = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENConnectionPowerPointList.list[i].coef.DecimalString;
        LastRow:=i+1;
        sgENConnectionPowerPoint.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENConnectionPowerPoint.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENConnectionPowerPoint.RowCount > selectedRow then
      sgENConnectionPowerPoint.Row := selectedRow
    else
      sgENConnectionPowerPoint.Row := sgENConnectionPowerPoint.RowCount - 1;
    end
    else
      sgENConnectionPowerPoint.Row:=1;   
end;


procedure TfrmENConnectionPowerPointShow.sgENConnectionPowerPointTopLeftChanged(Sender: TObject);
var
  TempENConnectionPowerPoint: ENConnectionPowerPointControllerSoapPort;
  i,CurrentRow: Integer;
  ENConnectionPowerPointList: ENConnectionPowerPointShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENConnectionPowerPoint.TopRow + sgENConnectionPowerPoint.VisibleRowCount) = ColCount
  then
    begin
      TempENConnectionPowerPoint :=  HTTPRIOENConnectionPowerPoint as ENConnectionPowerPointControllerSoapPort;
      CurrentRow:=sgENConnectionPowerPoint.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionPowerPointFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionPowerPointList := TempENConnectionPowerPoint.getScrollableFilteredList(ENConnectionPowerPointFilter(FilterObject),ColCount-1, 100);


  sgENConnectionPowerPoint.RowCount:=sgENConnectionPowerPoint.RowCount+100;
  LastCount:=High(ENConnectionPowerPointList.list);
  with sgENConnectionPowerPoint do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionPowerPointList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENConnectionPowerPointList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENConnectionPowerPointList.list[i].name;
        if ENConnectionPowerPointList.list[i].coef = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENConnectionPowerPointList.list[i].coef.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENConnectionPowerPoint.Row:=CurrentRow-5;
   sgENConnectionPowerPoint.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENConnectionPowerPointShow.sgENConnectionPowerPointDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENConnectionPowerPoint,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENConnectionPowerPointShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENConnectionPowerPoint.RowCount-1 do
   for j:=0 to sgENConnectionPowerPoint.ColCount-1 do
     sgENConnectionPowerPoint.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENConnectionPowerPointShow.actViewExecute(Sender: TObject);
var 
  TempENConnectionPowerPoint: ENConnectionPowerPointControllerSoapPort;
begin
  TempENConnectionPowerPoint := HTTPRIOENConnectionPowerPoint as ENConnectionPowerPointControllerSoapPort;
  try
    ENConnectionPowerPointObj := TempENConnectionPowerPoint.getObject(StrToInt(sgENConnectionPowerPoint.Cells[0,sgENConnectionPowerPoint.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENConnectionPowerPoint.Row;
  frmENConnectionPowerPointEdit:=TfrmENConnectionPowerPointEdit.Create(Application, dsView);
  
  try
    frmENConnectionPowerPointEdit.ShowModal;
  finally
    frmENConnectionPowerPointEdit.Free;
    frmENConnectionPowerPointEdit:=nil;
  end;

  if sgENConnectionPowerPoint.RowCount > selectedRow then
    sgENConnectionPowerPoint.Row := selectedRow
  else
    sgENConnectionPowerPoint.Row := sgENConnectionPowerPoint.RowCount - 1;
  
end;


procedure TfrmENConnectionPowerPointShow.actEditExecute(Sender: TObject);
var 
  TempENConnectionPowerPoint: ENConnectionPowerPointControllerSoapPort;
begin
  TempENConnectionPowerPoint := HTTPRIOENConnectionPowerPoint as ENConnectionPowerPointControllerSoapPort;
  try
    ENConnectionPowerPointObj := TempENConnectionPowerPoint.getObject(StrToInt(sgENConnectionPowerPoint.Cells[0,sgENConnectionPowerPoint.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENConnectionPowerPoint.Row;
  frmENConnectionPowerPointEdit:=TfrmENConnectionPowerPointEdit.Create(Application, dsEdit);
  
  try
    if frmENConnectionPowerPointEdit.ShowModal= mrOk then
      begin
        //TempENConnectionPowerPoint.save(ENConnectionPowerPointObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENConnectionPowerPointEdit.Free;
    frmENConnectionPowerPointEdit:=nil;
  end;

  if sgENConnectionPowerPoint.RowCount > selectedRow then
    sgENConnectionPowerPoint.Row := selectedRow
  else
    sgENConnectionPowerPoint.Row := sgENConnectionPowerPoint.RowCount - 1;
  
end;


procedure TfrmENConnectionPowerPointShow.actDeleteExecute(Sender: TObject);
Var TempENConnectionPowerPoint: ENConnectionPowerPointControllerSoapPort;
  ObjCode: Integer;
begin
 TempENConnectionPowerPoint := HTTPRIOENConnectionPowerPoint as ENConnectionPowerPointControllerSoapPort;
   try
     ObjCode := StrToInt(sgENConnectionPowerPoint.Cells[0,sgENConnectionPowerPoint.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Ступінь напруги в точці приєднання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConnectionPowerPoint.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConnectionPowerPointShow.actInsertExecute(Sender: TObject);
// Var TempENConnectionPowerPoint: ENConnectionPowerPointControllerSoapPort; 
begin
  // TempENConnectionPowerPoint := HTTPRIOENConnectionPowerPoint as ENConnectionPowerPointControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENConnectionPowerPointObj:=ENConnectionPowerPoint.Create;
  SetNullIntProps(ENConnectionPowerPointObj);
  SetNullXSProps(ENConnectionPowerPointObj);

   //ENConnectionPowerPointObj.coef:= TXSDecimal.Create;


  try
    frmENConnectionPowerPointEdit:=TfrmENConnectionPowerPointEdit.Create(Application, dsInsert);
    try
      if frmENConnectionPowerPointEdit.ShowModal = mrOk then
      begin
        if ENConnectionPowerPointObj<>nil then
            //TempENConnectionPowerPoint.add(ENConnectionPowerPointObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENConnectionPowerPointEdit.Free;
      frmENConnectionPowerPointEdit:=nil;
    end;
  finally
    ENConnectionPowerPointObj.Free;
  end;
end;


procedure TfrmENConnectionPowerPointShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENConnectionPowerPointShow.actFilterExecute(Sender: TObject);
begin
{frmENConnectionPowerPointFilterEdit:=TfrmENConnectionPowerPointFilterEdit.Create(Application, dsInsert);
  try
    ENConnectionPowerPointFilterObj := ENConnectionPowerPointFilter.Create;
    SetNullIntProps(ENConnectionPowerPointFilterObj);
    SetNullXSProps(ENConnectionPowerPointFilterObj);

    if frmENConnectionPowerPointFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENConnectionPowerPointFilter.Create;
      FilterObject := ENConnectionPowerPointFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENConnectionPowerPointFilterEdit.Free;
    frmENConnectionPowerPointFilterEdit:=nil;
  end;}
end;


procedure TfrmENConnectionPowerPointShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.