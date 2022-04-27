
unit ShowENLineRoute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLineRouteController ;


type
  TfrmENLineRouteShow = class(TChildForm)  
  HTTPRIOENLineRoute: THTTPRIO;
    ImageList1: TImageList;
    sgENLineRoute: TAdvStringGrid;
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
procedure sgENLineRouteTopLeftChanged(Sender: TObject);
procedure sgENLineRouteDblClick(Sender: TObject);
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
 // ENLineRouteObj: ENLineRoute;
 // ENLineRouteFilterObj: ENLineRouteFilter;
  
  
implementation

uses Main, EditENLineRoute, EditENLineRouteFilter;


{$R *.dfm}

var
  //frmENLineRouteShow : TfrmENLineRouteShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLineRouteHeaders: array [1..3] of String =
        ( 'Код'
          ,'Характеристика ланцюгу траси'
          ,'Дистанція між опорами'
        );
   

procedure TfrmENLineRouteShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLineRouteShow:=nil;
    inherited;
  end;


procedure TfrmENLineRouteShow.FormShow(Sender: TObject);
var
  TempENLineRoute: ENLineRouteControllerSoapPort;
  i: Integer;
  ENLineRouteList: ENLineRouteShortList;
  begin
  SetGridHeaders(ENLineRouteHeaders, sgENLineRoute.ColumnHeaders);
  ColCount:=100;
  TempENLineRoute :=  HTTPRIOENLineRoute as ENLineRouteControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENLineRouteFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLineRouteList := TempENLineRoute.getScrollableFilteredList(ENLineRouteFilter(FilterObject),0,ColCount);


  LastCount:=High(ENLineRouteList.list);

  if LastCount > -1 then
     sgENLineRoute.RowCount:=LastCount+2
  else
     sgENLineRoute.RowCount:=2;

   with sgENLineRoute do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLineRouteList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENLineRouteList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENLineRouteList.list[i].name;
        if ENLineRouteList.list[i].distancePost = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENLineRouteList.list[i].distancePost.DecimalString;
        LastRow:=i+1;
        sgENLineRoute.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENLineRoute.Row:=1;
end;

procedure TfrmENLineRouteShow.sgENLineRouteTopLeftChanged(Sender: TObject);
var
  TempENLineRoute: ENLineRouteControllerSoapPort;
  i,CurrentRow: Integer;
  ENLineRouteList: ENLineRouteShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLineRoute.TopRow + sgENLineRoute.VisibleRowCount) = ColCount
  then
    begin
      TempENLineRoute :=  HTTPRIOENLineRoute as ENLineRouteControllerSoapPort;
      CurrentRow:=sgENLineRoute.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENLineRouteFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLineRouteList := TempENLineRoute.getScrollableFilteredList(ENLineRouteFilter(FilterObject),ColCount-1, 100);



  sgENLineRoute.RowCount:=sgENLineRoute.RowCount+100;
  LastCount:=High(ENLineRouteList.list);
  with sgENLineRoute do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLineRouteList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENLineRouteList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENLineRouteList.list[i].name;
        if ENLineRouteList.list[i].distancePost = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENLineRouteList.list[i].distancePost.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENLineRoute.Row:=CurrentRow-5;
   sgENLineRoute.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENLineRouteShow.sgENLineRouteDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENLineRoute,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLineRouteShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLineRoute.RowCount-1 do
   for j:=0 to sgENLineRoute.ColCount-1 do
     sgENLineRoute.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLineRouteShow.actViewExecute(Sender: TObject);
Var TempENLineRoute: ENLineRouteControllerSoapPort;
begin
 TempENLineRoute := HTTPRIOENLineRoute as ENLineRouteControllerSoapPort;
   try
     ENLineRouteObj := TempENLineRoute.getObject(StrToInt(sgENLineRoute.Cells[0,sgENLineRoute.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLineRouteEdit:=TfrmENLineRouteEdit.Create(Application, dsView);
  try
    frmENLineRouteEdit.ShowModal;
  finally
    frmENLineRouteEdit.Free;
    frmENLineRouteEdit:=nil;
  end;
end;

procedure TfrmENLineRouteShow.actEditExecute(Sender: TObject);
Var TempENLineRoute: ENLineRouteControllerSoapPort;
begin
 TempENLineRoute := HTTPRIOENLineRoute as ENLineRouteControllerSoapPort;
   try
     ENLineRouteObj := TempENLineRoute.getObject(StrToInt(sgENLineRoute.Cells[0,sgENLineRoute.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLineRouteEdit:=TfrmENLineRouteEdit.Create(Application, dsEdit);
  try
    if frmENLineRouteEdit.ShowModal= mrOk then
      begin
        //TempENLineRoute.save(ENLineRouteObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLineRouteEdit.Free;
    frmENLineRouteEdit:=nil;
  end;
end;

procedure TfrmENLineRouteShow.actDeleteExecute(Sender: TObject);
Var TempENLineRoute: ENLineRouteControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLineRoute := HTTPRIOENLineRoute as ENLineRouteControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLineRoute.Cells[0,sgENLineRoute.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Траса Повітряної Лінії) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLineRoute.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLineRouteShow.actInsertExecute(Sender: TObject);
// Var TempENLineRoute: ENLineRouteControllerSoapPort; 
begin
  // TempENLineRoute := HTTPRIOENLineRoute as ENLineRouteControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENLineRouteObj:=ENLineRoute.Create;

   //ENLineRouteObj.distancePost:= TXSDecimal.Create;


  try
    frmENLineRouteEdit:=TfrmENLineRouteEdit.Create(Application, dsInsert);
    try
      if frmENLineRouteEdit.ShowModal = mrOk then
      begin
        if ENLineRouteObj<>nil then
            //TempENLineRoute.add(ENLineRouteObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLineRouteEdit.Free;
      frmENLineRouteEdit:=nil;
    end;
  finally
    ENLineRouteObj.Free;
  end;
end;

procedure TfrmENLineRouteShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLineRouteShow.actFilterExecute(Sender: TObject);
begin
{frmENLineRouteFilterEdit:=TfrmENLineRouteFilterEdit.Create(Application, dsInsert);
  try
    ENLineRouteFilterObj := ENLineRouteFilter.Create;
    SetNullIntProps(ENLineRouteFilterObj);
    SetNullXSProps(ENLineRouteFilterObj);

    if frmENLineRouteFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLineRouteFilter.Create;
      FilterObject := ENLineRouteFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLineRouteFilterEdit.Free;
    frmENLineRouteFilterEdit:=nil;
  end;}
end;

procedure TfrmENLineRouteShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.