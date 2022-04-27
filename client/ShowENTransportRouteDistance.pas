
unit ShowENTransportRouteDistance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransportRouteDistanceController, ENTransportRouteController ;


type
  TfrmENTransportRouteDistanceShow = class(TChildForm)  
  HTTPRIOENTransportRouteDistance: THTTPRIO;
    ImageList1: TImageList;
    sgENTransportRouteDistance: TAdvStringGrid;
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
procedure sgENTransportRouteDistanceTopLeftChanged(Sender: TObject);
procedure sgENTransportRouteDistanceDblClick(Sender: TObject);
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
 public
 transportRouteCode : Integer;
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENTransportRouteDistanceObj: ENTransportRouteDistance;
 // ENTransportRouteDistanceFilterObj: ENTransportRouteDistanceFilter;
  
  
implementation

uses Main, EditENTransportRouteDistance {, EditENTransportRouteDistanceFilter};


{$R *.dfm}

var
  frmENTransportRouteDistanceShow : TfrmENTransportRouteDistanceShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransportRouteDistanceHeaders: array [1..3] of String =
        ( 'Код'
          ,'Довжина дистанції, км.'
          ,'Значення коефіціенту'
        );
   

procedure TfrmENTransportRouteDistanceShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransportRouteDistanceShow:=nil;
    inherited;
  end;


procedure TfrmENTransportRouteDistanceShow.FormShow(Sender: TObject);
var
  TempENTransportRouteDistance: ENTransportRouteDistanceControllerSoapPort;
  i: Integer;
  ENTransportRouteDistanceList: ENTransportRouteDistanceShortList;
  begin
  SetGridHeaders(ENTransportRouteDistanceHeaders, sgENTransportRouteDistance.ColumnHeaders);
  ColCount:=100;
  TempENTransportRouteDistance :=  HTTPRIOENTransportRouteDistance as ENTransportRouteDistanceControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportRouteDistanceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;
  if ENTransportRouteDistanceFilter(FilterObject).transportRouteRef = nil then ENTransportRouteDistanceFilter(FilterObject).transportRouteRef := ENTransportRouteRef.Create;
  ENTransportRouteDistanceFilter(FilterObject).transportRouteRef.code := transportRouteCode;
  ENTransportRouteDistanceList := TempENTransportRouteDistance.getScrollableFilteredList(ENTransportRouteDistanceFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransportRouteDistanceList.list);

  if LastCount > -1 then
     sgENTransportRouteDistance.RowCount:=LastCount+2
  else
     sgENTransportRouteDistance.RowCount:=2;

   with sgENTransportRouteDistance do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportRouteDistanceList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportRouteDistanceList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENTransportRouteDistanceList.list[i].distance = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENTransportRouteDistanceList.list[i].distance.DecimalString;
        if ENTransportRouteDistanceList.list[i].koef = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENTransportRouteDistanceList.list[i].koef.DecimalString;
        LastRow:=i+1;
        sgENTransportRouteDistance.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransportRouteDistance.Row:=1;
end;

procedure TfrmENTransportRouteDistanceShow.sgENTransportRouteDistanceTopLeftChanged(Sender: TObject);
var
  TempENTransportRouteDistance: ENTransportRouteDistanceControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransportRouteDistanceList: ENTransportRouteDistanceShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransportRouteDistance.TopRow + sgENTransportRouteDistance.VisibleRowCount) = ColCount
  then
    begin
      TempENTransportRouteDistance :=  HTTPRIOENTransportRouteDistance as ENTransportRouteDistanceControllerSoapPort;
      CurrentRow:=sgENTransportRouteDistance.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportRouteDistanceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportRouteDistanceList := TempENTransportRouteDistance.getScrollableFilteredList(ENTransportRouteDistanceFilter(FilterObject),ColCount-1, 100);



  sgENTransportRouteDistance.RowCount:=sgENTransportRouteDistance.RowCount+100;
  LastCount:=High(ENTransportRouteDistanceList.list);
  with sgENTransportRouteDistance do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportRouteDistanceList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportRouteDistanceList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENTransportRouteDistanceList.list[i].distance = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENTransportRouteDistanceList.list[i].distance.DecimalString;
        if ENTransportRouteDistanceList.list[i].koef = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENTransportRouteDistanceList.list[i].koef.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransportRouteDistance.Row:=CurrentRow-5;
   sgENTransportRouteDistance.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransportRouteDistanceShow.sgENTransportRouteDistanceDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransportRouteDistance,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransportRouteDistanceShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransportRouteDistance.RowCount-1 do
   for j:=0 to sgENTransportRouteDistance.ColCount-1 do
     sgENTransportRouteDistance.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransportRouteDistanceShow.actViewExecute(Sender: TObject);
Var TempENTransportRouteDistance: ENTransportRouteDistanceControllerSoapPort;
begin
 TempENTransportRouteDistance := HTTPRIOENTransportRouteDistance as ENTransportRouteDistanceControllerSoapPort;
   try
     ENTransportRouteDistanceObj := TempENTransportRouteDistance.getObject(StrToInt(sgENTransportRouteDistance.Cells[0,sgENTransportRouteDistance.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportRouteDistanceEdit:=TfrmENTransportRouteDistanceEdit.Create(Application, dsView);
  try
    frmENTransportRouteDistanceEdit.ShowModal;
  finally
    frmENTransportRouteDistanceEdit.Free;
    frmENTransportRouteDistanceEdit:=nil;
  end;
end;

procedure TfrmENTransportRouteDistanceShow.actEditExecute(Sender: TObject);
Var TempENTransportRouteDistance: ENTransportRouteDistanceControllerSoapPort;
begin
 TempENTransportRouteDistance := HTTPRIOENTransportRouteDistance as ENTransportRouteDistanceControllerSoapPort;
   try
     ENTransportRouteDistanceObj := TempENTransportRouteDistance.getObject(StrToInt(sgENTransportRouteDistance.Cells[0,sgENTransportRouteDistance.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportRouteDistanceEdit:=TfrmENTransportRouteDistanceEdit.Create(Application, dsEdit);
  try
    if frmENTransportRouteDistanceEdit.ShowModal= mrOk then
      begin
        //TempENTransportRouteDistance.save(ENTransportRouteDistanceObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransportRouteDistanceEdit.Free;
    frmENTransportRouteDistanceEdit:=nil;
  end;
end;

procedure TfrmENTransportRouteDistanceShow.actDeleteExecute(Sender: TObject);
Var TempENTransportRouteDistance: ENTransportRouteDistanceControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportRouteDistance := HTTPRIOENTransportRouteDistance as ENTransportRouteDistanceControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportRouteDistance.Cells[0,sgENTransportRouteDistance.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Пробіг строки маршруту по дистанціях) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportRouteDistance.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransportRouteDistanceShow.actInsertExecute(Sender: TObject);
// Var TempENTransportRouteDistance: ENTransportRouteDistanceControllerSoapPort; 
begin
  // TempENTransportRouteDistance := HTTPRIOENTransportRouteDistance as ENTransportRouteDistanceControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENTransportRouteDistanceObj:=ENTransportRouteDistance.Create;
  if ENTransportRouteDistanceObj.transportRouteRef = nil then  ENTransportRouteDistanceObj.transportRouteRef := ENTransportRouteRef.Create;
  ENTransportRouteDistanceObj.transportRouteRef.code := transportRouteCode;

  try
    frmENTransportRouteDistanceEdit:=TfrmENTransportRouteDistanceEdit.Create(Application, dsInsert);
    try
      if frmENTransportRouteDistanceEdit.ShowModal = mrOk then
      begin
        if ENTransportRouteDistanceObj<>nil then
            //TempENTransportRouteDistance.add(ENTransportRouteDistanceObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportRouteDistanceEdit.Free;
      frmENTransportRouteDistanceEdit:=nil;
    end;
  finally
    ENTransportRouteDistanceObj.Free;
  end;
end;

procedure TfrmENTransportRouteDistanceShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransportRouteDistanceShow.actFilterExecute(Sender: TObject);
begin
{frmENTransportRouteDistanceFilterEdit:=TfrmENTransportRouteDistanceFilterEdit.Create(Application, dsInsert);
  try
    ENTransportRouteDistanceFilterObj := ENTransportRouteDistanceFilter.Create;
    SetNullIntProps(ENTransportRouteDistanceFilterObj);
    SetNullXSProps(ENTransportRouteDistanceFilterObj);

    if frmENTransportRouteDistanceFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTransportRouteDistanceFilter.Create;
      FilterObject := ENTransportRouteDistanceFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransportRouteDistanceFilterEdit.Free;
    frmENTransportRouteDistanceFilterEdit:=nil;
  end;}
end;

procedure TfrmENTransportRouteDistanceShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENTransportRouteDistanceShow.FormCreate(Sender: TObject);
begin
  inherited;
  transportRouteCode := Low(Integer);
end;

end.