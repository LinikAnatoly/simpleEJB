
unit ShowFINMolType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINMolTypeController ;


type
  TfrmFINMolTypeShow = class(TChildForm)  
  HTTPRIOFINMolType: THTTPRIO;
    ImageList1: TImageList;
    sgFINMolType: TAdvStringGrid;
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
procedure sgFINMolTypeTopLeftChanged(Sender: TObject);
procedure sgFINMolTypeDblClick(Sender: TObject);
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
 // FINMolTypeObj: FINMolType;
 // FINMolTypeFilterObj: FINMolTypeFilter;
  
  
implementation

uses Main, EditFINMolType, EditFINMolTypeFilter;


{$R *.dfm}

var
  //frmFINMolTypeShow : TfrmFINMolTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINMolTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип МОЛа'
        );
   

procedure TfrmFINMolTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINMolTypeShow:=nil;
    inherited;
  end;


procedure TfrmFINMolTypeShow.FormShow(Sender: TObject);
var
  TempFINMolType: FINMolTypeControllerSoapPort;
  i: Integer;
  FINMolTypeList: FINMolTypeShortList;
  begin
  SetGridHeaders(FINMolTypeHeaders, sgFINMolType.ColumnHeaders);
  ColCount:=100;
  TempFINMolType :=  HTTPRIOFINMolType as FINMolTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINMolTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINMolTypeList := TempFINMolType.getScrollableFilteredList(FINMolTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(FINMolTypeList.list);

  if LastCount > -1 then
     sgFINMolType.RowCount:=LastCount+2
  else
     sgFINMolType.RowCount:=2;

   with sgFINMolType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINMolTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINMolTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINMolTypeList.list[i].name;
        LastRow:=i+1;
        sgFINMolType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINMolType.Row:=1;
end;

procedure TfrmFINMolTypeShow.sgFINMolTypeTopLeftChanged(Sender: TObject);
var
  TempFINMolType: FINMolTypeControllerSoapPort;
  i,CurrentRow: Integer;
  FINMolTypeList: FINMolTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINMolType.TopRow + sgFINMolType.VisibleRowCount) = ColCount
  then
    begin
      TempFINMolType :=  HTTPRIOFINMolType as FINMolTypeControllerSoapPort;
      CurrentRow:=sgFINMolType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINMolTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINMolTypeList := TempFINMolType.getScrollableFilteredList(FINMolTypeFilter(FilterObject),ColCount-1, 100);



  sgFINMolType.RowCount:=sgFINMolType.RowCount+100;
  LastCount:=High(FINMolTypeList.list);
  with sgFINMolType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINMolTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINMolTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := FINMolTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINMolType.Row:=CurrentRow-5;
   sgFINMolType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINMolTypeShow.sgFINMolTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINMolType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINMolTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINMolType.RowCount-1 do
   for j:=0 to sgFINMolType.ColCount-1 do
     sgFINMolType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINMolTypeShow.actViewExecute(Sender: TObject);
Var TempFINMolType: FINMolTypeControllerSoapPort;
begin
 TempFINMolType := HTTPRIOFINMolType as FINMolTypeControllerSoapPort;
   try
     FINMolTypeObj := TempFINMolType.getObject(StrToInt(sgFINMolType.Cells[0,sgFINMolType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINMolTypeEdit:=TfrmFINMolTypeEdit.Create(Application, dsView);
  try
    frmFINMolTypeEdit.ShowModal;
  finally
    frmFINMolTypeEdit.Free;
    frmFINMolTypeEdit:=nil;
  end;
end;

procedure TfrmFINMolTypeShow.actEditExecute(Sender: TObject);
Var TempFINMolType: FINMolTypeControllerSoapPort;
begin
 TempFINMolType := HTTPRIOFINMolType as FINMolTypeControllerSoapPort;
   try
     FINMolTypeObj := TempFINMolType.getObject(StrToInt(sgFINMolType.Cells[0,sgFINMolType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINMolTypeEdit:=TfrmFINMolTypeEdit.Create(Application, dsEdit);
  try
    if frmFINMolTypeEdit.ShowModal= mrOk then
      begin
        //TempFINMolType.save(FINMolTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINMolTypeEdit.Free;
    frmFINMolTypeEdit:=nil;
  end;
end;

procedure TfrmFINMolTypeShow.actDeleteExecute(Sender: TObject);
Var TempFINMolType: FINMolTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINMolType := HTTPRIOFINMolType as FINMolTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINMolType.Cells[0,sgFINMolType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип МОЛа (мастер/механик/еще кто-то)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINMolType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINMolTypeShow.actInsertExecute(Sender: TObject);
Var TempFINMolType: FINMolTypeControllerSoapPort;
begin
  TempFINMolType := HTTPRIOFINMolType as FINMolTypeControllerSoapPort;
  FINMolTypeObj:=FINMolType.Create;



  try
    frmFINMolTypeEdit:=TfrmFINMolTypeEdit.Create(Application, dsInsert);
    try
      if frmFINMolTypeEdit.ShowModal = mrOk then
      begin
        if FINMolTypeObj<>nil then
            //TempFINMolType.add(FINMolTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINMolTypeEdit.Free;
      frmFINMolTypeEdit:=nil;
    end;
  finally
    FINMolTypeObj.Free;
  end;
end;

procedure TfrmFINMolTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINMolTypeShow.actFilterExecute(Sender: TObject);
begin
{frmFINMolTypeFilterEdit:=TfrmFINMolTypeFilterEdit.Create(Application, dsEdit);
  try
    FINMolTypeFilterObj := FINMolTypeFilter.Create;
    SetNullIntProps(FINMolTypeFilterObj);
    SetNullXSProps(FINMolTypeFilterObj);

    if frmFINMolTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINMolTypeFilter.Create;
      FilterObject := FINMolTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINMolTypeFilterEdit.Free;
    frmFINMolTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmFINMolTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.