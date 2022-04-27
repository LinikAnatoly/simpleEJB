
unit ShowENCalcPowerReserve;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENCalcPowerReserveController, AdvObj ;


type
    TfrmENCalcPowerReserveShow = class(TChildForm)  
    HTTPRIOENCalcPowerReserve: THTTPRIO;
    ImageList1: TImageList;
    sgENCalcPowerReserve: TAdvStringGrid;
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
    procedure sgENCalcPowerReserveTopLeftChanged(Sender: TObject);
    procedure sgENCalcPowerReserveDblClick(Sender: TObject);
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

//var
 // ENCalcPowerReserveObj: ENCalcPowerReserve;
 // ENCalcPowerReserveFilterObj: ENCalcPowerReserveFilter;
  
  
implementation

uses Main, EditENCalcPowerReserve, EditENCalcPowerReserveFilter;


{$R *.dfm}

var
  //frmENCalcPowerReserveShow : TfrmENCalcPowerReserveShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCalcPowerReserveHeaders: array [1..3] of String =
        ( 'Код'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );


procedure TfrmENCalcPowerReserveShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENCalcPowerReserveShow:=nil;
  inherited;
end;


procedure TfrmENCalcPowerReserveShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENCalcPowerReserveShow.FormShow(Sender: TObject);
var
  TempENCalcPowerReserve: ENCalcPowerReserveControllerSoapPort;
  i: Integer;
  ENCalcPowerReserveList: ENCalcPowerReserveShortList;
begin
  SetGridHeaders(ENCalcPowerReserveHeaders, sgENCalcPowerReserve.ColumnHeaders);
  ColCount:=100;
  TempENCalcPowerReserve :=  HTTPRIOENCalcPowerReserve as ENCalcPowerReserveControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCalcPowerReserveFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCalcPowerReserveList := TempENCalcPowerReserve.getScrollableFilteredList(ENCalcPowerReserveFilter(FilterObject),0,ColCount);
  LastCount:=High(ENCalcPowerReserveList.list);

  if LastCount > -1 then
     sgENCalcPowerReserve.RowCount:=LastCount+2
  else
     sgENCalcPowerReserve.RowCount:=2;

   with sgENCalcPowerReserve do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCalcPowerReserveList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCalcPowerReserveList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENCalcPowerReserveList.list[i].userGen;
        if ENCalcPowerReserveList.list[i].dateEdit = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENCalcPowerReserveList.list[i].dateEdit);
        LastRow:=i+1;
        sgENCalcPowerReserve.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENCalcPowerReserve.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENCalcPowerReserve.RowCount > selectedRow then
      sgENCalcPowerReserve.Row := selectedRow
    else
      sgENCalcPowerReserve.Row := sgENCalcPowerReserve.RowCount - 1;
    end
    else
      sgENCalcPowerReserve.Row:=1;   
end;


procedure TfrmENCalcPowerReserveShow.sgENCalcPowerReserveTopLeftChanged(Sender: TObject);
var
  TempENCalcPowerReserve: ENCalcPowerReserveControllerSoapPort;
  i,CurrentRow: Integer;
  ENCalcPowerReserveList: ENCalcPowerReserveShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCalcPowerReserve.TopRow + sgENCalcPowerReserve.VisibleRowCount) = ColCount
  then
    begin
      TempENCalcPowerReserve :=  HTTPRIOENCalcPowerReserve as ENCalcPowerReserveControllerSoapPort;
      CurrentRow:=sgENCalcPowerReserve.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCalcPowerReserveFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCalcPowerReserveList := TempENCalcPowerReserve.getScrollableFilteredList(ENCalcPowerReserveFilter(FilterObject),ColCount-1, 100);


  sgENCalcPowerReserve.RowCount:=sgENCalcPowerReserve.RowCount+100;
  LastCount:=High(ENCalcPowerReserveList.list);
  with sgENCalcPowerReserve do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCalcPowerReserveList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCalcPowerReserveList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENCalcPowerReserveList.list[i].userGen;
        if ENCalcPowerReserveList.list[i].dateEdit = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENCalcPowerReserveList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCalcPowerReserve.Row:=CurrentRow-5;
   sgENCalcPowerReserve.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCalcPowerReserveShow.sgENCalcPowerReserveDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCalcPowerReserve,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENCalcPowerReserveShow.UpdateGrid(Sender: TObject);
var
  i, j: Integer;
begin
 for i:=1 to sgENCalcPowerReserve.RowCount-1 do
   for j:=0 to sgENCalcPowerReserve.ColCount-1 do
     sgENCalcPowerReserve.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENCalcPowerReserveShow.actViewExecute(Sender: TObject);
var 
  TempENCalcPowerReserve: ENCalcPowerReserveControllerSoapPort;
begin
  TempENCalcPowerReserve := HTTPRIOENCalcPowerReserve as ENCalcPowerReserveControllerSoapPort;
  try
    ENCalcPowerReserveObj := TempENCalcPowerReserve.getObject(StrToInt(sgENCalcPowerReserve.Cells[0,sgENCalcPowerReserve.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENCalcPowerReserve.Row;
  frmENCalcPowerReserveEdit:=TfrmENCalcPowerReserveEdit.Create(Application, dsView);
  
  try
    frmENCalcPowerReserveEdit.ShowModal;
  finally
    frmENCalcPowerReserveEdit.Free;
    frmENCalcPowerReserveEdit:=nil;
  end;

  if sgENCalcPowerReserve.RowCount > selectedRow then
    sgENCalcPowerReserve.Row := selectedRow
  else
    sgENCalcPowerReserve.Row := sgENCalcPowerReserve.RowCount - 1;
  
end;


procedure TfrmENCalcPowerReserveShow.actEditExecute(Sender: TObject);
var 
  TempENCalcPowerReserve: ENCalcPowerReserveControllerSoapPort;
begin
  TempENCalcPowerReserve := HTTPRIOENCalcPowerReserve as ENCalcPowerReserveControllerSoapPort;
  try
    ENCalcPowerReserveObj := TempENCalcPowerReserve.getObject(StrToInt(sgENCalcPowerReserve.Cells[0,sgENCalcPowerReserve.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENCalcPowerReserve.Row;
  frmENCalcPowerReserveEdit:=TfrmENCalcPowerReserveEdit.Create(Application, dsEdit);
  
  try
    if frmENCalcPowerReserveEdit.ShowModal= mrOk then
      begin
        //TempENCalcPowerReserve.save(ENCalcPowerReserveObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCalcPowerReserveEdit.Free;
    frmENCalcPowerReserveEdit:=nil;
  end;

  if sgENCalcPowerReserve.RowCount > selectedRow then
    sgENCalcPowerReserve.Row := selectedRow
  else
    sgENCalcPowerReserve.Row := sgENCalcPowerReserve.RowCount - 1;
  
end;


procedure TfrmENCalcPowerReserveShow.actDeleteExecute(Sender: TObject);
Var TempENCalcPowerReserve: ENCalcPowerReserveControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCalcPowerReserve := HTTPRIOENCalcPowerReserve as ENCalcPowerReserveControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCalcPowerReserve.Cells[0,sgENCalcPowerReserve.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Расчет резерва для присоединения) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCalcPowerReserve.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCalcPowerReserveShow.actInsertExecute(Sender: TObject);
// Var TempENCalcPowerReserve: ENCalcPowerReserveControllerSoapPort; 
begin
  // TempENCalcPowerReserve := HTTPRIOENCalcPowerReserve as ENCalcPowerReserveControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCalcPowerReserveObj:=ENCalcPowerReserve.Create;
  SetNullIntProps(ENCalcPowerReserveObj);
  SetNullXSProps(ENCalcPowerReserveObj);

   //ENCalcPowerReserveObj.dateAdd:= TXSDateTime.Create;

   //ENCalcPowerReserveObj.dateEdit:= TXSDateTime.Create;



  try
    frmENCalcPowerReserveEdit:=TfrmENCalcPowerReserveEdit.Create(Application, dsInsert);
    try
      if frmENCalcPowerReserveEdit.ShowModal = mrOk then
      begin
        if ENCalcPowerReserveObj<>nil then
            //TempENCalcPowerReserve.add(ENCalcPowerReserveObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCalcPowerReserveEdit.Free;
      frmENCalcPowerReserveEdit:=nil;
    end;
  finally
    ENCalcPowerReserveObj.Free;
  end;
end;


procedure TfrmENCalcPowerReserveShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENCalcPowerReserveShow.actFilterExecute(Sender: TObject);
begin
{frmENCalcPowerReserveFilterEdit:=TfrmENCalcPowerReserveFilterEdit.Create(Application, dsInsert);
  try
    ENCalcPowerReserveFilterObj := ENCalcPowerReserveFilter.Create;
    SetNullIntProps(ENCalcPowerReserveFilterObj);
    SetNullXSProps(ENCalcPowerReserveFilterObj);

    if frmENCalcPowerReserveFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENCalcPowerReserveFilter.Create;
      FilterObject := ENCalcPowerReserveFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCalcPowerReserveFilterEdit.Free;
    frmENCalcPowerReserveFilterEdit:=nil;
  end;}
end;


procedure TfrmENCalcPowerReserveShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.