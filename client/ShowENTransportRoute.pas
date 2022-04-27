
unit ShowENTransportRoute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransportRouteController ;


type
  TfrmENTransportRouteShow = class(TChildForm)  
  HTTPRIOENTransportRoute: THTTPRIO;
    ImageList1: TImageList;
    sgENTransportRoute: TAdvStringGrid;
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
procedure sgENTransportRouteTopLeftChanged(Sender: TObject);
procedure sgENTransportRouteDblClick(Sender: TObject);
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
 // ENTransportRouteObj: ENTransportRoute;
 // ENTransportRouteFilterObj: ENTransportRouteFilter;
  
  
implementation

uses Main, EditENTransportRoute, EditENTransportRouteFilter;


{$R *.dfm}

var
  //frmENTransportRouteShow : TfrmENTransportRouteShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransportRouteHeaders: array [1..5] of String =
        ( 'Код'
          ,'Дистанція, км.'
          ,'Маса, кг.'
          ,'Дата зміни'
          ,'користувач'
        );
   

procedure TfrmENTransportRouteShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransportRouteShow:=nil;
    inherited;
  end;


procedure TfrmENTransportRouteShow.FormShow(Sender: TObject);
var
  TempENTransportRoute: ENTransportRouteControllerSoapPort;
  i: Integer;
  ENTransportRouteList: ENTransportRouteShortList;
  begin
  SetGridHeaders(ENTransportRouteHeaders, sgENTransportRoute.ColumnHeaders);
  ColCount:=100;
  TempENTransportRoute :=  HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportRouteFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportRouteList := TempENTransportRoute.getScrollableFilteredList(ENTransportRouteFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransportRouteList.list);

  if LastCount > -1 then
     sgENTransportRoute.RowCount:=LastCount+2
  else
     sgENTransportRoute.RowCount:=2;

   with sgENTransportRoute do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportRouteList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportRouteList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENTransportRouteList.list[i].distance = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENTransportRouteList.list[i].distance.DecimalString;
        if ENTransportRouteList.list[i].weight = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENTransportRouteList.list[i].weight.DecimalString;
        if ENTransportRouteList.list[i].dateEdit = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENTransportRouteList.list[i].dateEdit);
        Cells[4,i+1] := ENTransportRouteList.list[i].userGen;
        LastRow:=i+1;
        sgENTransportRoute.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransportRoute.Row:=1;
end;

procedure TfrmENTransportRouteShow.sgENTransportRouteTopLeftChanged(Sender: TObject);
var
  TempENTransportRoute: ENTransportRouteControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransportRouteList: ENTransportRouteShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransportRoute.TopRow + sgENTransportRoute.VisibleRowCount) = ColCount
  then
    begin
      TempENTransportRoute :=  HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
      CurrentRow:=sgENTransportRoute.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportRouteFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportRouteList := TempENTransportRoute.getScrollableFilteredList(ENTransportRouteFilter(FilterObject),ColCount-1, 100);



  sgENTransportRoute.RowCount:=sgENTransportRoute.RowCount+100;
  LastCount:=High(ENTransportRouteList.list);
  with sgENTransportRoute do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportRouteList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportRouteList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENTransportRouteList.list[i].distance = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENTransportRouteList.list[i].distance.DecimalString;
        if ENTransportRouteList.list[i].weight = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENTransportRouteList.list[i].weight.DecimalString;
        if ENTransportRouteList.list[i].dateEdit = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDateTimeWithDate2String(ENTransportRouteList.list[i].dateEdit);		  
        Cells[4,i+CurrentRow] := ENTransportRouteList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransportRoute.Row:=CurrentRow-5;
   sgENTransportRoute.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransportRouteShow.sgENTransportRouteDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransportRoute,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransportRouteShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransportRoute.RowCount-1 do
   for j:=0 to sgENTransportRoute.ColCount-1 do
     sgENTransportRoute.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransportRouteShow.actViewExecute(Sender: TObject);
Var TempENTransportRoute: ENTransportRouteControllerSoapPort;
begin
 TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
   try
     ENTransportRouteObj := TempENTransportRoute.getObject(StrToInt(sgENTransportRoute.Cells[0,sgENTransportRoute.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportRouteEdit:=TfrmENTransportRouteEdit.Create(Application, dsView);
  try
    frmENTransportRouteEdit.ShowModal;
  finally
    frmENTransportRouteEdit.Free;
    frmENTransportRouteEdit:=nil;
  end;
end;

procedure TfrmENTransportRouteShow.actEditExecute(Sender: TObject);
Var TempENTransportRoute: ENTransportRouteControllerSoapPort;
begin
 TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
   try
     ENTransportRouteObj := TempENTransportRoute.getObject(StrToInt(sgENTransportRoute.Cells[0,sgENTransportRoute.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportRouteEdit:=TfrmENTransportRouteEdit.Create(Application, dsEdit);
  try
    if frmENTransportRouteEdit.ShowModal= mrOk then
      begin
        //TempENTransportRoute.save(ENTransportRouteObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransportRouteEdit.Free;
    frmENTransportRouteEdit:=nil;
  end;
end;

procedure TfrmENTransportRouteShow.actDeleteExecute(Sender: TObject);
Var TempENTransportRoute: ENTransportRouteControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportRoute.Cells[0,sgENTransportRoute.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Маршрут) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportRoute.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransportRouteShow.actInsertExecute(Sender: TObject);
// Var TempENTransportRoute: ENTransportRouteControllerSoapPort; 
begin
  // TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENTransportRouteObj:=ENTransportRoute.Create;

   //ENTransportRouteObj.distance:= TXSDecimal.Create;
   //ENTransportRouteObj.weight:= TXSDecimal.Create;
   //ENTransportRouteObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENTransportRouteEdit:=TfrmENTransportRouteEdit.Create(Application, dsInsert);
    try
      if frmENTransportRouteEdit.ShowModal = mrOk then
      begin
        if ENTransportRouteObj<>nil then
            //TempENTransportRoute.add(ENTransportRouteObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportRouteEdit.Free;
      frmENTransportRouteEdit:=nil;
    end;
  finally
    ENTransportRouteObj.Free;
  end;
end;

procedure TfrmENTransportRouteShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransportRouteShow.actFilterExecute(Sender: TObject);
begin
{frmENTransportRouteFilterEdit:=TfrmENTransportRouteFilterEdit.Create(Application, dsInsert);
  try
    ENTransportRouteFilterObj := ENTransportRouteFilter.Create;
    SetNullIntProps(ENTransportRouteFilterObj);
    SetNullXSProps(ENTransportRouteFilterObj);

    if frmENTransportRouteFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTransportRouteFilter.Create;
      FilterObject := ENTransportRouteFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransportRouteFilterEdit.Free;
    frmENTransportRouteFilterEdit:=nil;
  end;}
end;

procedure TfrmENTransportRouteShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.