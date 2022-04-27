
unit ShowENConnectionTariffType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENConnectionTariffTypeController, AdvObj ;


type
    TfrmENConnectionTariffTypeShow = class(TChildForm)  
    HTTPRIOENConnectionTariffType: THTTPRIO;
    ImageList1: TImageList;
    sgENConnectionTariffType: TAdvStringGrid;
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
    procedure sgENConnectionTariffTypeTopLeftChanged(Sender: TObject);
    procedure sgENConnectionTariffTypeDblClick(Sender: TObject);
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
 // ENConnectionTariffTypeObj: ENConnectionTariffType;
 // ENConnectionTariffTypeFilterObj: ENConnectionTariffTypeFilter;
  
  
implementation

uses Main, EditENConnectionTariffType, EditENConnectionTariffTypeFilter;


{$R *.dfm}

var
  frmENConnectionTariffTypeShow : TfrmENConnectionTariffTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConnectionTariffTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENConnectionTariffTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENConnectionTariffTypeShow:=nil;
  inherited;
end;


procedure TfrmENConnectionTariffTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENConnectionTariffTypeShow.FormShow(Sender: TObject);
var
  TempENConnectionTariffType: ENConnectionTariffTypeControllerSoapPort;
  i: Integer;
  ENConnectionTariffTypeList: ENConnectionTariffTypeShortList;
begin
  SetGridHeaders(ENConnectionTariffTypeHeaders, sgENConnectionTariffType.ColumnHeaders);
  ColCount:=100;
  TempENConnectionTariffType :=  HTTPRIOENConnectionTariffType as ENConnectionTariffTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionTariffTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionTariffTypeList := TempENConnectionTariffType.getScrollableFilteredList(ENConnectionTariffTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENConnectionTariffTypeList.list);

  if LastCount > -1 then
     sgENConnectionTariffType.RowCount:=LastCount+2
  else
     sgENConnectionTariffType.RowCount:=2;

   with sgENConnectionTariffType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionTariffTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENConnectionTariffTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENConnectionTariffTypeList.list[i].name;
        LastRow:=i+1;
        sgENConnectionTariffType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENConnectionTariffType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENConnectionTariffType.RowCount > selectedRow then
      sgENConnectionTariffType.Row := selectedRow
    else
      sgENConnectionTariffType.Row := sgENConnectionTariffType.RowCount - 1;
    end
    else
      sgENConnectionTariffType.Row:=1;   
end;


procedure TfrmENConnectionTariffTypeShow.sgENConnectionTariffTypeTopLeftChanged(Sender: TObject);
var
  TempENConnectionTariffType: ENConnectionTariffTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENConnectionTariffTypeList: ENConnectionTariffTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENConnectionTariffType.TopRow + sgENConnectionTariffType.VisibleRowCount) = ColCount
  then
    begin
      TempENConnectionTariffType :=  HTTPRIOENConnectionTariffType as ENConnectionTariffTypeControllerSoapPort;
      CurrentRow:=sgENConnectionTariffType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionTariffTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionTariffTypeList := TempENConnectionTariffType.getScrollableFilteredList(ENConnectionTariffTypeFilter(FilterObject),ColCount-1, 100);


  sgENConnectionTariffType.RowCount:=sgENConnectionTariffType.RowCount+100;
  LastCount:=High(ENConnectionTariffTypeList.list);
  with sgENConnectionTariffType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionTariffTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENConnectionTariffTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENConnectionTariffTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENConnectionTariffType.Row:=CurrentRow-5;
   sgENConnectionTariffType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENConnectionTariffTypeShow.sgENConnectionTariffTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENConnectionTariffType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENConnectionTariffTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENConnectionTariffType.RowCount-1 do
   for j:=0 to sgENConnectionTariffType.ColCount-1 do
     sgENConnectionTariffType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENConnectionTariffTypeShow.actViewExecute(Sender: TObject);
var 
  TempENConnectionTariffType: ENConnectionTariffTypeControllerSoapPort;
begin
  TempENConnectionTariffType := HTTPRIOENConnectionTariffType as ENConnectionTariffTypeControllerSoapPort;
  try
    ENConnectionTariffTypeObj := TempENConnectionTariffType.getObject(StrToInt(sgENConnectionTariffType.Cells[0,sgENConnectionTariffType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENConnectionTariffType.Row;
  frmENConnectionTariffTypeEdit:=TfrmENConnectionTariffTypeEdit.Create(Application, dsView);
  
  try
    frmENConnectionTariffTypeEdit.ShowModal;
  finally
    frmENConnectionTariffTypeEdit.Free;
    frmENConnectionTariffTypeEdit:=nil;
  end;

  if sgENConnectionTariffType.RowCount > selectedRow then
    sgENConnectionTariffType.Row := selectedRow
  else
    sgENConnectionTariffType.Row := sgENConnectionTariffType.RowCount - 1;
  
end;


procedure TfrmENConnectionTariffTypeShow.actEditExecute(Sender: TObject);
var 
  TempENConnectionTariffType: ENConnectionTariffTypeControllerSoapPort;
begin
  TempENConnectionTariffType := HTTPRIOENConnectionTariffType as ENConnectionTariffTypeControllerSoapPort;
  try
    ENConnectionTariffTypeObj := TempENConnectionTariffType.getObject(StrToInt(sgENConnectionTariffType.Cells[0,sgENConnectionTariffType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENConnectionTariffType.Row;
  frmENConnectionTariffTypeEdit:=TfrmENConnectionTariffTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENConnectionTariffTypeEdit.ShowModal= mrOk then
      begin
        //TempENConnectionTariffType.save(ENConnectionTariffTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENConnectionTariffTypeEdit.Free;
    frmENConnectionTariffTypeEdit:=nil;
  end;

  if sgENConnectionTariffType.RowCount > selectedRow then
    sgENConnectionTariffType.Row := selectedRow
  else
    sgENConnectionTariffType.Row := sgENConnectionTariffType.RowCount - 1;
  
end;


procedure TfrmENConnectionTariffTypeShow.actDeleteExecute(Sender: TObject);
Var TempENConnectionTariffType: ENConnectionTariffTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENConnectionTariffType := HTTPRIOENConnectionTariffType as ENConnectionTariffTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENConnectionTariffType.Cells[0,sgENConnectionTariffType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип ставки плати за приєднання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConnectionTariffType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConnectionTariffTypeShow.actInsertExecute(Sender: TObject);
// Var TempENConnectionTariffType: ENConnectionTariffTypeControllerSoapPort; 
begin
  // TempENConnectionTariffType := HTTPRIOENConnectionTariffType as ENConnectionTariffTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENConnectionTariffTypeObj:=ENConnectionTariffType.Create;
  SetNullIntProps(ENConnectionTariffTypeObj);
  SetNullXSProps(ENConnectionTariffTypeObj);



  try
    frmENConnectionTariffTypeEdit:=TfrmENConnectionTariffTypeEdit.Create(Application, dsInsert);
    try
      if frmENConnectionTariffTypeEdit.ShowModal = mrOk then
      begin
        if ENConnectionTariffTypeObj<>nil then
            //TempENConnectionTariffType.add(ENConnectionTariffTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENConnectionTariffTypeEdit.Free;
      frmENConnectionTariffTypeEdit:=nil;
    end;
  finally
    ENConnectionTariffTypeObj.Free;
  end;
end;


procedure TfrmENConnectionTariffTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENConnectionTariffTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENConnectionTariffTypeFilterEdit:=TfrmENConnectionTariffTypeFilterEdit.Create(Application, dsInsert);
  try
    ENConnectionTariffTypeFilterObj := ENConnectionTariffTypeFilter.Create;
    SetNullIntProps(ENConnectionTariffTypeFilterObj);
    SetNullXSProps(ENConnectionTariffTypeFilterObj);

    if frmENConnectionTariffTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENConnectionTariffTypeFilter.Create;
      FilterObject := ENConnectionTariffTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENConnectionTariffTypeFilterEdit.Free;
    frmENConnectionTariffTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENConnectionTariffTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.