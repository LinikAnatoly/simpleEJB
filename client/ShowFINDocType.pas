
unit ShowFINDocType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINDocTypeController ;


type
  TfrmFINDocTypeShow = class(TChildForm)  
  HTTPRIOFINDocType: THTTPRIO;
    ImageList1: TImageList;
    sgFINDocType: TAdvStringGrid;
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
procedure sgFINDocTypeTopLeftChanged(Sender: TObject);
procedure sgFINDocTypeDblClick(Sender: TObject);
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
 // FINDocTypeObj: FINDocType;
 // FINDocTypeFilterObj: FINDocTypeFilter;
  
  
implementation

uses Main, EditFINDocType, EditFINDocTypeFilter;


{$R *.dfm}

var
  //frmFINDocTypeShow : TfrmFINDocTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINDocTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Наименование '
        );
   

procedure TfrmFINDocTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINDocTypeShow:=nil;
    inherited;
  end;


procedure TfrmFINDocTypeShow.FormShow(Sender: TObject);
var
  TempFINDocType: FINDocTypeControllerSoapPort;
  i: Integer;
  FINDocTypeList: FINDocTypeShortList;
  begin
  SetGridHeaders(FINDocTypeHeaders, sgFINDocType.ColumnHeaders);
  ColCount:=100;
  TempFINDocType :=  HTTPRIOFINDocType as FINDocTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINDocTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINDocTypeList := TempFINDocType.getScrollableFilteredList(FINDocTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(FINDocTypeList.list);

  if LastCount > -1 then
     sgFINDocType.RowCount:=LastCount+2
  else
     sgFINDocType.RowCount:=2;

   with sgFINDocType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINDocTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINDocTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINDocTypeList.list[i].name;
        LastRow:=i+1;
        sgFINDocType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINDocType.Row:=1;
end;

procedure TfrmFINDocTypeShow.sgFINDocTypeTopLeftChanged(Sender: TObject);
var
  TempFINDocType: FINDocTypeControllerSoapPort;
  i,CurrentRow: Integer;
  FINDocTypeList: FINDocTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINDocType.TopRow + sgFINDocType.VisibleRowCount) = ColCount
  then
    begin
      TempFINDocType :=  HTTPRIOFINDocType as FINDocTypeControllerSoapPort;
      CurrentRow:=sgFINDocType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINDocTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINDocTypeList := TempFINDocType.getScrollableFilteredList(FINDocTypeFilter(FilterObject),ColCount-1, 100);



  sgFINDocType.RowCount:=sgFINDocType.RowCount+100;
  LastCount:=High(FINDocTypeList.list);
  with sgFINDocType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINDocTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINDocTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := FINDocTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINDocType.Row:=CurrentRow-5;
   sgFINDocType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINDocTypeShow.sgFINDocTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINDocType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINDocTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINDocType.RowCount-1 do
   for j:=0 to sgFINDocType.ColCount-1 do
     sgFINDocType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINDocTypeShow.actViewExecute(Sender: TObject);
Var TempFINDocType: FINDocTypeControllerSoapPort;
begin
 TempFINDocType := HTTPRIOFINDocType as FINDocTypeControllerSoapPort;
   try
     FINDocTypeObj := TempFINDocType.getObject(StrToInt(sgFINDocType.Cells[0,sgFINDocType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINDocTypeEdit:=TfrmFINDocTypeEdit.Create(Application, dsView);
  try
    frmFINDocTypeEdit.ShowModal;
  finally
    frmFINDocTypeEdit.Free;
    frmFINDocTypeEdit:=nil;
  end;
end;

procedure TfrmFINDocTypeShow.actEditExecute(Sender: TObject);
Var TempFINDocType: FINDocTypeControllerSoapPort;
begin
 TempFINDocType := HTTPRIOFINDocType as FINDocTypeControllerSoapPort;
   try
     FINDocTypeObj := TempFINDocType.getObject(StrToInt(sgFINDocType.Cells[0,sgFINDocType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINDocTypeEdit:=TfrmFINDocTypeEdit.Create(Application, dsEdit);
  try
    if frmFINDocTypeEdit.ShowModal= mrOk then
      begin
        //TempFINDocType.save(FINDocTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINDocTypeEdit.Free;
    frmFINDocTypeEdit:=nil;
  end;
end;

procedure TfrmFINDocTypeShow.actDeleteExecute(Sender: TObject);
Var TempFINDocType: FINDocTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINDocType := HTTPRIOFINDocType as FINDocTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINDocType.Cells[0,sgFINDocType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (тип документа для ФК) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINDocType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINDocTypeShow.actInsertExecute(Sender: TObject);
Var TempFINDocType: FINDocTypeControllerSoapPort;
begin
  TempFINDocType := HTTPRIOFINDocType as FINDocTypeControllerSoapPort;
  FINDocTypeObj:=FINDocType.Create;



  try
    frmFINDocTypeEdit:=TfrmFINDocTypeEdit.Create(Application, dsInsert);
    try
      if frmFINDocTypeEdit.ShowModal = mrOk then
      begin
        if FINDocTypeObj<>nil then
            //TempFINDocType.add(FINDocTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINDocTypeEdit.Free;
      frmFINDocTypeEdit:=nil;
    end;
  finally
    FINDocTypeObj.Free;
  end;
end;

procedure TfrmFINDocTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINDocTypeShow.actFilterExecute(Sender: TObject);
begin
{frmFINDocTypeFilterEdit:=TfrmFINDocTypeFilterEdit.Create(Application, dsEdit);
  try
    FINDocTypeFilterObj := FINDocTypeFilter.Create;
    SetNullIntProps(FINDocTypeFilterObj);
    SetNullXSProps(FINDocTypeFilterObj);

    if frmFINDocTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINDocTypeFilter.Create;
      FilterObject := FINDocTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINDocTypeFilterEdit.Free;
    frmFINDocTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmFINDocTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.