
unit ShowFINAccountType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  FINAccountTypeController, AdvObj ;


type
    TfrmFINAccountTypeShow = class(TChildForm)  
    HTTPRIOFINAccountType: THTTPRIO;
    ImageList1: TImageList;
    sgFINAccountType: TAdvStringGrid;
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
    procedure sgFINAccountTypeTopLeftChanged(Sender: TObject);
    procedure sgFINAccountTypeDblClick(Sender: TObject);
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
 // FINAccountTypeObj: FINAccountType;
 // FINAccountTypeFilterObj: FINAccountTypeFilter;
  
  
implementation

uses Main, EditFINAccountType, EditFINAccountTypeFilter;


{$R *.dfm}

var
  //frmFINAccountTypeShow : TfrmFINAccountTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINAccountTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );
   

procedure TfrmFINAccountTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmFINAccountTypeShow:=nil;
  inherited;
end;


procedure TfrmFINAccountTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmFINAccountTypeShow.FormShow(Sender: TObject);
var
  TempFINAccountType: FINAccountTypeControllerSoapPort;
  i: Integer;
  FINAccountTypeList: FINAccountTypeShortList;
begin
  SetGridHeaders(FINAccountTypeHeaders, sgFINAccountType.ColumnHeaders);
  ColCount:=100;
  TempFINAccountType :=  HTTPRIOFINAccountType as FINAccountTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINAccountTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINAccountTypeList := TempFINAccountType.getScrollableFilteredList(FINAccountTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(FINAccountTypeList.list);

  if LastCount > -1 then
     sgFINAccountType.RowCount:=LastCount+2
  else
     sgFINAccountType.RowCount:=2;

   with sgFINAccountType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINAccountTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINAccountTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINAccountTypeList.list[i].name;
        LastRow:=i+1;
        sgFINAccountType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgFINAccountType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgFINAccountType.RowCount > selectedRow then
      sgFINAccountType.Row := selectedRow
    else
      sgFINAccountType.Row := sgFINAccountType.RowCount - 1;
    end
    else
      sgFINAccountType.Row:=1;   
end;


procedure TfrmFINAccountTypeShow.sgFINAccountTypeTopLeftChanged(Sender: TObject);
var
  TempFINAccountType: FINAccountTypeControllerSoapPort;
  i,CurrentRow: Integer;
  FINAccountTypeList: FINAccountTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINAccountType.TopRow + sgFINAccountType.VisibleRowCount) = ColCount
  then
    begin
      TempFINAccountType :=  HTTPRIOFINAccountType as FINAccountTypeControllerSoapPort;
      CurrentRow:=sgFINAccountType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINAccountTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINAccountTypeList := TempFINAccountType.getScrollableFilteredList(FINAccountTypeFilter(FilterObject),ColCount-1, 100);


  sgFINAccountType.RowCount:=sgFINAccountType.RowCount+100;
  LastCount:=High(FINAccountTypeList.list);
  with sgFINAccountType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINAccountTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINAccountTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := FINAccountTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINAccountType.Row:=CurrentRow-5;
   sgFINAccountType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINAccountTypeShow.sgFINAccountTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINAccountType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmFINAccountTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgFINAccountType.RowCount-1 do
   for j:=0 to sgFINAccountType.ColCount-1 do
     sgFINAccountType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmFINAccountTypeShow.actViewExecute(Sender: TObject);
var 
  TempFINAccountType: FINAccountTypeControllerSoapPort;
begin
  TempFINAccountType := HTTPRIOFINAccountType as FINAccountTypeControllerSoapPort;
  try
    FINAccountTypeObj := TempFINAccountType.getObject(StrToInt(sgFINAccountType.Cells[0,sgFINAccountType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgFINAccountType.Row;
  frmFINAccountTypeEdit:=TfrmFINAccountTypeEdit.Create(Application, dsView);
  
  try
    frmFINAccountTypeEdit.ShowModal;
  finally
    frmFINAccountTypeEdit.Free;
    frmFINAccountTypeEdit:=nil;
  end;

  if sgFINAccountType.RowCount > selectedRow then
    sgFINAccountType.Row := selectedRow
  else
    sgFINAccountType.Row := sgFINAccountType.RowCount - 1;
  
end;


procedure TfrmFINAccountTypeShow.actEditExecute(Sender: TObject);
var 
  TempFINAccountType: FINAccountTypeControllerSoapPort;
begin
  TempFINAccountType := HTTPRIOFINAccountType as FINAccountTypeControllerSoapPort;
  try
    FINAccountTypeObj := TempFINAccountType.getObject(StrToInt(sgFINAccountType.Cells[0,sgFINAccountType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgFINAccountType.Row;
  frmFINAccountTypeEdit:=TfrmFINAccountTypeEdit.Create(Application, dsEdit);
  
  try
    if frmFINAccountTypeEdit.ShowModal= mrOk then
      begin
        //TempFINAccountType.save(FINAccountTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINAccountTypeEdit.Free;
    frmFINAccountTypeEdit:=nil;
  end;

  if sgFINAccountType.RowCount > selectedRow then
    sgFINAccountType.Row := selectedRow
  else
    sgFINAccountType.Row := sgFINAccountType.RowCount - 1;
  
end;


procedure TfrmFINAccountTypeShow.actDeleteExecute(Sender: TObject);
Var TempFINAccountType: FINAccountTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINAccountType := HTTPRIOFINAccountType as FINAccountTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINAccountType.Cells[0,sgFINAccountType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи рахунків) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINAccountType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINAccountTypeShow.actInsertExecute(Sender: TObject);
// Var TempFINAccountType: FINAccountTypeControllerSoapPort; 
begin
  // TempFINAccountType := HTTPRIOFINAccountType as FINAccountTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  FINAccountTypeObj:=FINAccountType.Create;
  SetNullIntProps(FINAccountTypeObj);
  SetNullXSProps(FINAccountTypeObj);



  try
    frmFINAccountTypeEdit:=TfrmFINAccountTypeEdit.Create(Application, dsInsert);
    try
      if frmFINAccountTypeEdit.ShowModal = mrOk then
      begin
        if FINAccountTypeObj<>nil then
            //TempFINAccountType.add(FINAccountTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINAccountTypeEdit.Free;
      frmFINAccountTypeEdit:=nil;
    end;
  finally
    FINAccountTypeObj.Free;
  end;
end;


procedure TfrmFINAccountTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmFINAccountTypeShow.actFilterExecute(Sender: TObject);
begin
frmFINAccountTypeFilterEdit:=TfrmFINAccountTypeFilterEdit.Create(Application, dsInsert);
  try
    FINAccountTypeFilterObj := FINAccountTypeFilter.Create;
    SetNullIntProps(FINAccountTypeFilterObj);
    SetNullXSProps(FINAccountTypeFilterObj);

    if frmFINAccountTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := FINAccountTypeFilter.Create;
      FilterObject := FINAccountTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINAccountTypeFilterEdit.Free;
    frmFINAccountTypeFilterEdit:=nil;
  end;
end;


procedure TfrmFINAccountTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.