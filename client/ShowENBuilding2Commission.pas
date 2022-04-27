
unit ShowENBuilding2Commission;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENBuilding2CommissionController, AdvObj ;


type
    TfrmENBuilding2CommissionShow = class(TChildForm)  
    HTTPRIOENBuilding2Commission: THTTPRIO;
    ImageList1: TImageList;
    sgENBuilding2Commission: TAdvStringGrid;
    ActionListCommission: TActionList;
    actViewcommission: TAction;
    actInsertcommission: TAction;
    actDeletecommission: TAction;
    actEditcommission: TAction;
    actUpdatecommission: TAction;
    actFiltercommission: TAction;
    actNoFiltercommission: TAction;
    PopupMenuCommission: TPopupMenu;
    ppviewcommission: TMenuItem;
    ppinsertcommission: TMenuItem;
    ppdeletecommission: TMenuItem;
    ppeditcommission: TMenuItem;
    ppupdatecommission: TMenuItem;
    ppfiltercommission: TMenuItem;
    ppnofiltercommission: TMenuItem;
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
    procedure sgENBuilding2CommissionTopLeftChanged(Sender: TObject);
    procedure sgENBuilding2CommissionDblClick(Sender: TObject);
    procedure actViewcommissionExecute(Sender: TObject);
    procedure actEditcommissionExecute(Sender: TObject);
    procedure actDeletecommissionExecute(Sender: TObject);
    procedure actInsertcommissionExecute(Sender: TObject);
    procedure actUpdatecommissionExecute(Sender: TObject);
    procedure actFiltercommissionExecute(Sender: TObject);
    procedure actNoFiltercommissionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;


var
  frmENBuilding2CommissionShow: TfrmENBuilding2CommissionShow;
  
  
implementation

uses Main, EditENBuilding2Commission, EditENBuilding2CommissionFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBuilding2CommissionHeaders: array [1..5] of String =
        ( 'Код'
          ,'Табельний номер'
          ,'П.І.Б члена коміссії'
          ,'П.І.Б члена коміссії (скорочено)'
          ,'Посада'
        );
   

procedure TfrmENBuilding2CommissionShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENBuilding2CommissionShow:=nil;
  inherited;
end;


procedure TfrmENBuilding2CommissionShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENBuilding2CommissionShow.FormShow(Sender: TObject);
var
  TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort;
  i: Integer;
  ENBuilding2CommissionList: ENBuilding2CommissionShortList;
begin
  SetGridHeaders(ENBuilding2CommissionHeaders, sgENBuilding2Commission.ColumnHeaders);
  ColCount:=100;
  TempENBuilding2Commission :=  HTTPRIOENBuilding2Commission as ENBuilding2CommissionControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBuilding2CommissionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuilding2CommissionList := TempENBuilding2Commission.getScrollableFilteredList(ENBuilding2CommissionFilter(FilterObject),0,ColCount);
  LastCount:=High(ENBuilding2CommissionList.list);

  if LastCount > -1 then
     sgENBuilding2Commission.RowCount:=LastCount+2
  else
     sgENBuilding2Commission.RowCount:=2;

   with sgENBuilding2Commission do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuilding2CommissionList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuilding2CommissionList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBuilding2CommissionList.list[i].tabNumber;
        Cells[2,i+1] := ENBuilding2CommissionList.list[i].FIO;
        Cells[3,i+1] := ENBuilding2CommissionList.list[i].shortFIO;
        Cells[4,i+1] := ENBuilding2CommissionList.list[i].positionName;
        LastRow:=i+1;
        sgENBuilding2Commission.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENBuilding2Commission.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENBuilding2Commission.RowCount > selectedRow then
      sgENBuilding2Commission.Row := selectedRow
    else
      sgENBuilding2Commission.Row := sgENBuilding2Commission.RowCount - 1;
    end
    else
      sgENBuilding2Commission.Row:=1;   
end;


procedure TfrmENBuilding2CommissionShow.sgENBuilding2CommissionTopLeftChanged(Sender: TObject);
var
  TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort;
  i,CurrentRow: Integer;
  ENBuilding2CommissionList: ENBuilding2CommissionShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBuilding2Commission.TopRow + sgENBuilding2Commission.VisibleRowCount) = ColCount
  then
    begin
      TempENBuilding2Commission :=  HTTPRIOENBuilding2Commission as ENBuilding2CommissionControllerSoapPort;
      CurrentRow:=sgENBuilding2Commission.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBuilding2CommissionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuilding2CommissionList := TempENBuilding2Commission.getScrollableFilteredList(ENBuilding2CommissionFilter(FilterObject),ColCount-1, 100);


  sgENBuilding2Commission.RowCount:=sgENBuilding2Commission.RowCount+100;
  LastCount:=High(ENBuilding2CommissionList.list);
  with sgENBuilding2Commission do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuilding2CommissionList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBuilding2CommissionList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBuilding2CommissionList.list[i].tabNumber;
        Cells[2,i+CurrentRow] := ENBuilding2CommissionList.list[i].FIO;
        Cells[3,i+CurrentRow] := ENBuilding2CommissionList.list[i].shortFIO;
        Cells[4,i+CurrentRow] := ENBuilding2CommissionList.list[i].positionName;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBuilding2Commission.Row:=CurrentRow-5;
   sgENBuilding2Commission.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBuilding2CommissionShow.sgENBuilding2CommissionDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBuilding2Commission,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENBuilding2CommissionShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENBuilding2Commission.RowCount-1 do
   for j:=0 to sgENBuilding2Commission.ColCount-1 do
     sgENBuilding2Commission.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENBuilding2CommissionShow.actViewcommissionExecute(Sender: TObject);
var 
  TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort;
begin
  TempENBuilding2Commission := HTTPRIOENBuilding2Commission as ENBuilding2CommissionControllerSoapPort;
  try
    ENBuilding2CommissionObj := TempENBuilding2Commission.getObject(StrToInt(sgENBuilding2Commission.Cells[0,sgENBuilding2Commission.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBuilding2Commission.Row;
  frmENBuilding2CommissionEdit:=TfrmENBuilding2CommissionEdit.Create(Application, dsView);
  
  try
    frmENBuilding2CommissionEdit.ShowModal;
  finally
    frmENBuilding2CommissionEdit.Free;
    frmENBuilding2CommissionEdit:=nil;
  end;

  if sgENBuilding2Commission.RowCount > selectedRow then
    sgENBuilding2Commission.Row := selectedRow
  else
    sgENBuilding2Commission.Row := sgENBuilding2Commission.RowCount - 1;
  
end;


procedure TfrmENBuilding2CommissionShow.actEditcommissionExecute(Sender: TObject);
var 
  TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort;
begin
  TempENBuilding2Commission := HTTPRIOENBuilding2Commission as ENBuilding2CommissionControllerSoapPort;
  try
    ENBuilding2CommissionObj := TempENBuilding2Commission.getObject(StrToInt(sgENBuilding2Commission.Cells[0,sgENBuilding2Commission.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBuilding2Commission.Row;
  frmENBuilding2CommissionEdit:=TfrmENBuilding2CommissionEdit.Create(Application, dsEdit);
  
  try
    if frmENBuilding2CommissionEdit.ShowModal= mrOk then
      begin
        //TempENBuilding2Commission.save(ENBuilding2CommissionObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBuilding2CommissionEdit.Free;
    frmENBuilding2CommissionEdit:=nil;
  end;

  if sgENBuilding2Commission.RowCount > selectedRow then
    sgENBuilding2Commission.Row := selectedRow
  else
    sgENBuilding2Commission.Row := sgENBuilding2Commission.RowCount - 1;
  
end;


procedure TfrmENBuilding2CommissionShow.actDeletecommissionExecute(Sender: TObject);
Var TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBuilding2Commission := HTTPRIOENBuilding2Commission as ENBuilding2CommissionControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBuilding2Commission.Cells[0,sgENBuilding2Commission.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (члени комісії для нове будівництво)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBuilding2Commission.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBuilding2CommissionShow.actInsertcommissionExecute(Sender: TObject);
// Var TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort; 
begin
  // TempENBuilding2Commission := HTTPRIOENBuilding2Commission as ENBuilding2CommissionControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBuilding2CommissionObj:=ENBuilding2Commission.Create;
  SetNullIntProps(ENBuilding2CommissionObj);
  SetNullXSProps(ENBuilding2CommissionObj);



  try
    frmENBuilding2CommissionEdit:=TfrmENBuilding2CommissionEdit.Create(Application, dsInsert);
    try
      if frmENBuilding2CommissionEdit.ShowModal = mrOk then
      begin
        if ENBuilding2CommissionObj<>nil then
            //TempENBuilding2Commission.add(ENBuilding2CommissionObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBuilding2CommissionEdit.Free;
      frmENBuilding2CommissionEdit:=nil;
    end;
  finally
    ENBuilding2CommissionObj.Free;
  end;
end;


procedure TfrmENBuilding2CommissionShow.actUpdatecommissionExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENBuilding2CommissionShow.actFiltercommissionExecute(Sender: TObject);
begin
{frmENBuilding2CommissionFilterEdit:=TfrmENBuilding2CommissionFilterEdit.Create(Application, dsInsert);
  try
    ENBuilding2CommissionFilterObj := ENBuilding2CommissionFilter.Create;
    SetNullIntProps(ENBuilding2CommissionFilterObj);
    SetNullXSProps(ENBuilding2CommissionFilterObj);

    if frmENBuilding2CommissionFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENBuilding2CommissionFilter.Create;
      FilterObject := ENBuilding2CommissionFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBuilding2CommissionFilterEdit.Free;
    frmENBuilding2CommissionFilterEdit:=nil;
  end;}
end;


procedure TfrmENBuilding2CommissionShow.actNoFiltercommissionExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.