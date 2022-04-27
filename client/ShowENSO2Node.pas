
unit ShowENSO2Node;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSO2NodeController, AdvObj ;


type
    TfrmENSO2NodeShow = class(TChildForm)  
    HTTPRIOENSO2Node: THTTPRIO;
    ImageList1: TImageList;
    sgENSO2Node: TAdvStringGrid;
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
    procedure sgENSO2NodeTopLeftChanged(Sender: TObject);
    procedure sgENSO2NodeDblClick(Sender: TObject);
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
 // ENSO2NodeObj: ENSO2Node;
 // ENSO2NodeFilterObj: ENSO2NodeFilter;
  
  
implementation

uses Main, EditENSO2Node, EditENSO2NodeFilter;


{$R *.dfm}

var
  frmENSO2NodeShow : TfrmENSO2NodeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSO2NodeHeaders: array [1..7] of String =
        ( 'Код'
          ,'код узла'
          ,'Мощность по точке, кВт'
          ,'Опис точки'
          ,'Приймає участь у розрахунку?'
          ,'Користувач, який змінив запис'
          ,'Дата зміни'
        );
   

procedure TfrmENSO2NodeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSO2NodeShow:=nil;
  inherited;
end;


procedure TfrmENSO2NodeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSO2NodeShow.FormShow(Sender: TObject);
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
  i: Integer;
  ENSO2NodeList: ENSO2NodeShortList;
begin
  SetGridHeaders(ENSO2NodeHeaders, sgENSO2Node.ColumnHeaders);
  ColCount:=100;
  TempENSO2Node :=  HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSO2NodeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSO2NodeList := TempENSO2Node.getScrollableFilteredList(ENSO2NodeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSO2NodeList.list);

  if LastCount > -1 then
     sgENSO2Node.RowCount:=LastCount+2
  else
     sgENSO2Node.RowCount:=2;

   with sgENSO2Node do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSO2NodeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2NodeList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENSO2NodeList.list[i].ccNodeCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENSO2NodeList.list[i].ccNodeCode);
        if ENSO2NodeList.list[i].power = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENSO2NodeList.list[i].power.DecimalString;
        Cells[3,i+1] := ENSO2NodeList.list[i].description;
        if ENSO2NodeList.list[i].isCalc = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(ENSO2NodeList.list[i].isCalc);
        Cells[5,i+1] := ENSO2NodeList.list[i].userGen;
        if ENSO2NodeList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENSO2NodeList.list[i].dateEdit);
        LastRow:=i+1;
        sgENSO2Node.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSO2Node.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSO2Node.RowCount > selectedRow then
      sgENSO2Node.Row := selectedRow
    else
      sgENSO2Node.Row := sgENSO2Node.RowCount - 1;
    end
    else
      sgENSO2Node.Row:=1;   
end;


procedure TfrmENSO2NodeShow.sgENSO2NodeTopLeftChanged(Sender: TObject);
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSO2NodeList: ENSO2NodeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSO2Node.TopRow + sgENSO2Node.VisibleRowCount) = ColCount
  then
    begin
      TempENSO2Node :=  HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;
      CurrentRow:=sgENSO2Node.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSO2NodeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSO2NodeList := TempENSO2Node.getScrollableFilteredList(ENSO2NodeFilter(FilterObject),ColCount-1, 100);


  sgENSO2Node.RowCount:=sgENSO2Node.RowCount+100;
  LastCount:=High(ENSO2NodeList.list);
  with sgENSO2Node do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSO2NodeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSO2NodeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENSO2NodeList.list[i].ccNodeCode = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(ENSO2NodeList.list[i].ccNodeCode);
        if ENSO2NodeList.list[i].power = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENSO2NodeList.list[i].power.DecimalString;
        Cells[3,i+CurrentRow] := ENSO2NodeList.list[i].description;
        if ENSO2NodeList.list[i].isCalc = Low(Integer) then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := IntToStr(ENSO2NodeList.list[i].isCalc);
        Cells[5,i+CurrentRow] := ENSO2NodeList.list[i].userGen;
        if ENSO2NodeList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENSO2NodeList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSO2Node.Row:=CurrentRow-5;
   sgENSO2Node.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSO2NodeShow.sgENSO2NodeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSO2Node,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSO2NodeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSO2Node.RowCount-1 do
   for j:=0 to sgENSO2Node.ColCount-1 do
     sgENSO2Node.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSO2NodeShow.actViewExecute(Sender: TObject);
var 
  TempENSO2Node: ENSO2NodeControllerSoapPort;
begin
  TempENSO2Node := HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;
  try
    ENSO2NodeObj := TempENSO2Node.getObject(StrToInt(sgENSO2Node.Cells[0,sgENSO2Node.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSO2Node.Row;
  frmENSO2NodeEdit:=TfrmENSO2NodeEdit.Create(Application, dsView);
  
  try
    frmENSO2NodeEdit.ShowModal;
  finally
    frmENSO2NodeEdit.Free;
    frmENSO2NodeEdit:=nil;
  end;

  if sgENSO2Node.RowCount > selectedRow then
    sgENSO2Node.Row := selectedRow
  else
    sgENSO2Node.Row := sgENSO2Node.RowCount - 1;
  
end;


procedure TfrmENSO2NodeShow.actEditExecute(Sender: TObject);
var 
  TempENSO2Node: ENSO2NodeControllerSoapPort;
begin
  TempENSO2Node := HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;
  try
    ENSO2NodeObj := TempENSO2Node.getObject(StrToInt(sgENSO2Node.Cells[0,sgENSO2Node.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSO2Node.Row;
  frmENSO2NodeEdit:=TfrmENSO2NodeEdit.Create(Application, dsEdit);
  
  try
    if frmENSO2NodeEdit.ShowModal= mrOk then
      begin
        //TempENSO2Node.save(ENSO2NodeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSO2NodeEdit.Free;
    frmENSO2NodeEdit:=nil;
  end;

  if sgENSO2Node.RowCount > selectedRow then
    sgENSO2Node.Row := selectedRow
  else
    sgENSO2Node.Row := sgENSO2Node.RowCount - 1;
  
end;


procedure TfrmENSO2NodeShow.actDeleteExecute(Sender: TObject);
Var TempENSO2Node: ENSO2NodeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSO2Node := HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSO2Node.Cells[0,sgENSO2Node.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связка ServicesObject с узлом дерева CallCentre) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSO2Node.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSO2NodeShow.actInsertExecute(Sender: TObject);
// Var TempENSO2Node: ENSO2NodeControllerSoapPort; 
begin
  // TempENSO2Node := HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSO2NodeObj:=ENSO2Node.Create;
  SetNullIntProps(ENSO2NodeObj);
  SetNullXSProps(ENSO2NodeObj);

   //ENSO2NodeObj.power:= TXSDecimal.Create;
   //ENSO2NodeObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENSO2NodeEdit:=TfrmENSO2NodeEdit.Create(Application, dsInsert);
    try
      if frmENSO2NodeEdit.ShowModal = mrOk then
      begin
        if ENSO2NodeObj<>nil then
            //TempENSO2Node.add(ENSO2NodeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSO2NodeEdit.Free;
      frmENSO2NodeEdit:=nil;
    end;
  finally
    ENSO2NodeObj.Free;
  end;
end;


procedure TfrmENSO2NodeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSO2NodeShow.actFilterExecute(Sender: TObject);
begin
{frmENSO2NodeFilterEdit:=TfrmENSO2NodeFilterEdit.Create(Application, dsInsert);
  try
    ENSO2NodeFilterObj := ENSO2NodeFilter.Create;
    SetNullIntProps(ENSO2NodeFilterObj);
    SetNullXSProps(ENSO2NodeFilterObj);

    if frmENSO2NodeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSO2NodeFilter.Create;
      FilterObject := ENSO2NodeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSO2NodeFilterEdit.Free;
    frmENSO2NodeFilterEdit:=nil;
  end;}
end;


procedure TfrmENSO2NodeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.