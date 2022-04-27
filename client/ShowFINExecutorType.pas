
unit ShowFINExecutorType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINExecutorTypeController ;


type
  TfrmFINExecutorTypeShow = class(TChildForm)  
  HTTPRIOFINExecutorType: THTTPRIO;
    ImageList1: TImageList;
    sgFINExecutorType: TAdvStringGrid;
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
procedure sgFINExecutorTypeTopLeftChanged(Sender: TObject);
procedure sgFINExecutorTypeDblClick(Sender: TObject);
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
 // FINExecutorTypeObj: FINExecutorType;
 // FINExecutorTypeFilterObj: FINExecutorTypeFilter;
  
  
implementation

uses Main, EditFINExecutorType, EditFINExecutorTypeFilter;


{$R *.dfm}

var
  //frmFINExecutorTypeShow : TfrmFINExecutorTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINExecutorTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );
   

procedure TfrmFINExecutorTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINExecutorTypeShow:=nil;
    inherited;
  end;


procedure TfrmFINExecutorTypeShow.FormShow(Sender: TObject);
var
  TempFINExecutorType: FINExecutorTypeControllerSoapPort;
  i: Integer;
  FINExecutorTypeList: FINExecutorTypeShortList;
  begin
  SetGridHeaders(FINExecutorTypeHeaders, sgFINExecutorType.ColumnHeaders);
  ColCount:=100;
  TempFINExecutorType :=  HTTPRIOFINExecutorType as FINExecutorTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINExecutorTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINExecutorTypeList := TempFINExecutorType.getScrollableFilteredList(FINExecutorTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(FINExecutorTypeList.list);

  if LastCount > -1 then
     sgFINExecutorType.RowCount:=LastCount+2
  else
     sgFINExecutorType.RowCount:=2;

   with sgFINExecutorType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINExecutorTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINExecutorTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINExecutorTypeList.list[i].name;
        LastRow:=i+1;
        sgFINExecutorType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINExecutorType.Row:=1;
end;

procedure TfrmFINExecutorTypeShow.sgFINExecutorTypeTopLeftChanged(Sender: TObject);
var
  TempFINExecutorType: FINExecutorTypeControllerSoapPort;
  i,CurrentRow: Integer;
  FINExecutorTypeList: FINExecutorTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINExecutorType.TopRow + sgFINExecutorType.VisibleRowCount) = ColCount
  then
    begin
      TempFINExecutorType :=  HTTPRIOFINExecutorType as FINExecutorTypeControllerSoapPort;
      CurrentRow:=sgFINExecutorType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINExecutorTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINExecutorTypeList := TempFINExecutorType.getScrollableFilteredList(FINExecutorTypeFilter(FilterObject),ColCount-1, 100);



  sgFINExecutorType.RowCount:=sgFINExecutorType.RowCount+100;
  LastCount:=High(FINExecutorTypeList.list);
  with sgFINExecutorType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINExecutorTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINExecutorTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := FINExecutorTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINExecutorType.Row:=CurrentRow-5;
   sgFINExecutorType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINExecutorTypeShow.sgFINExecutorTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINExecutorType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINExecutorTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINExecutorType.RowCount-1 do
   for j:=0 to sgFINExecutorType.ColCount-1 do
     sgFINExecutorType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINExecutorTypeShow.actViewExecute(Sender: TObject);
Var TempFINExecutorType: FINExecutorTypeControllerSoapPort;
begin
 TempFINExecutorType := HTTPRIOFINExecutorType as FINExecutorTypeControllerSoapPort;
   try
     FINExecutorTypeObj := TempFINExecutorType.getObject(StrToInt(sgFINExecutorType.Cells[0,sgFINExecutorType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINExecutorTypeEdit:=TfrmFINExecutorTypeEdit.Create(Application, dsView);
  try
    frmFINExecutorTypeEdit.ShowModal;
  finally
    frmFINExecutorTypeEdit.Free;
    frmFINExecutorTypeEdit:=nil;
  end;
end;

procedure TfrmFINExecutorTypeShow.actEditExecute(Sender: TObject);
Var TempFINExecutorType: FINExecutorTypeControllerSoapPort;
begin
 TempFINExecutorType := HTTPRIOFINExecutorType as FINExecutorTypeControllerSoapPort;
   try
     FINExecutorTypeObj := TempFINExecutorType.getObject(StrToInt(sgFINExecutorType.Cells[0,sgFINExecutorType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINExecutorTypeEdit:=TfrmFINExecutorTypeEdit.Create(Application, dsEdit);
  try
    if frmFINExecutorTypeEdit.ShowModal= mrOk then
      begin
        //TempFINExecutorType.save(FINExecutorTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINExecutorTypeEdit.Free;
    frmFINExecutorTypeEdit:=nil;
  end;
end;

procedure TfrmFINExecutorTypeShow.actDeleteExecute(Sender: TObject);
Var TempFINExecutorType: FINExecutorTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINExecutorType := HTTPRIOFINExecutorType as FINExecutorTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINExecutorType.Cells[0,sgFINExecutorType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип виконавця плану (основний/додатковий)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINExecutorType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINExecutorTypeShow.actInsertExecute(Sender: TObject);
// Var TempFINExecutorType: FINExecutorTypeControllerSoapPort; 
begin
  // TempFINExecutorType := HTTPRIOFINExecutorType as FINExecutorTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  FINExecutorTypeObj:=FINExecutorType.Create;



  try
    frmFINExecutorTypeEdit:=TfrmFINExecutorTypeEdit.Create(Application, dsInsert);
    try
      if frmFINExecutorTypeEdit.ShowModal = mrOk then
      begin
        if FINExecutorTypeObj<>nil then
            //TempFINExecutorType.add(FINExecutorTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINExecutorTypeEdit.Free;
      frmFINExecutorTypeEdit:=nil;
    end;
  finally
    FINExecutorTypeObj.Free;
  end;
end;

procedure TfrmFINExecutorTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINExecutorTypeShow.actFilterExecute(Sender: TObject);
begin
{frmFINExecutorTypeFilterEdit:=TfrmFINExecutorTypeFilterEdit.Create(Application, dsInsert);
  try
    FINExecutorTypeFilterObj := FINExecutorTypeFilter.Create;
    SetNullIntProps(FINExecutorTypeFilterObj);
    SetNullXSProps(FINExecutorTypeFilterObj);

    if frmFINExecutorTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINExecutorTypeFilter.Create;
      FilterObject := FINExecutorTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINExecutorTypeFilterEdit.Free;
    frmFINExecutorTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmFINExecutorTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.