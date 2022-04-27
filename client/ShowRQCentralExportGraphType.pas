
unit ShowRQCentralExportGraphType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQCentralExportGraphTypeController, AdvObj ;


type
  TfrmRQCentralExportGraphTypeShow = class(TChildForm)  
  HTTPRIORQCentralExportGraphType: THTTPRIO;
    ImageList1: TImageList;
    sgRQCentralExportGraphType: TAdvStringGrid;
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
procedure sgRQCentralExportGraphTypeTopLeftChanged(Sender: TObject);
procedure sgRQCentralExportGraphTypeDblClick(Sender: TObject);
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
 // RQCentralExportGraphTypeObj: RQCentralExportGraphType;
 // RQCentralExportGraphTypeFilterObj: RQCentralExportGraphTypeFilter;
  
  
implementation

uses Main, EditRQCentralExportGraphType, EditRQCentralExportGraphTypeFilter;


{$R *.dfm}

var
  //frmRQCentralExportGraphTypeShow : TfrmRQCentralExportGraphTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQCentralExportGraphTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmRQCentralExportGraphTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQCentralExportGraphTypeShow:=nil;
    inherited;
  end;


procedure TfrmRQCentralExportGraphTypeShow.FormShow(Sender: TObject);
var
  TempRQCentralExportGraphType: RQCentralExportGraphTypeControllerSoapPort;
  i: Integer;
  RQCentralExportGraphTypeList: RQCentralExportGraphTypeShortList;
  begin
  SetGridHeaders(RQCentralExportGraphTypeHeaders, sgRQCentralExportGraphType.ColumnHeaders);
  ColCount:=100;
  TempRQCentralExportGraphType :=  HTTPRIORQCentralExportGraphType as RQCentralExportGraphTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQCentralExportGraphTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQCentralExportGraphTypeList := TempRQCentralExportGraphType.getScrollableFilteredList(RQCentralExportGraphTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(RQCentralExportGraphTypeList.list);

  if LastCount > -1 then
     sgRQCentralExportGraphType.RowCount:=LastCount+2
  else
     sgRQCentralExportGraphType.RowCount:=2;

   with sgRQCentralExportGraphType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQCentralExportGraphTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQCentralExportGraphTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQCentralExportGraphTypeList.list[i].name;
        LastRow:=i+1;
        sgRQCentralExportGraphType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQCentralExportGraphType.Row:=1;
end;

procedure TfrmRQCentralExportGraphTypeShow.sgRQCentralExportGraphTypeTopLeftChanged(Sender: TObject);
var
  TempRQCentralExportGraphType: RQCentralExportGraphTypeControllerSoapPort;
  i,CurrentRow: Integer;
  RQCentralExportGraphTypeList: RQCentralExportGraphTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQCentralExportGraphType.TopRow + sgRQCentralExportGraphType.VisibleRowCount) = ColCount
  then
    begin
      TempRQCentralExportGraphType :=  HTTPRIORQCentralExportGraphType as RQCentralExportGraphTypeControllerSoapPort;
      CurrentRow:=sgRQCentralExportGraphType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQCentralExportGraphTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQCentralExportGraphTypeList := TempRQCentralExportGraphType.getScrollableFilteredList(RQCentralExportGraphTypeFilter(FilterObject),ColCount-1, 100);



  sgRQCentralExportGraphType.RowCount:=sgRQCentralExportGraphType.RowCount+100;
  LastCount:=High(RQCentralExportGraphTypeList.list);
  with sgRQCentralExportGraphType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQCentralExportGraphTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQCentralExportGraphTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQCentralExportGraphTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQCentralExportGraphType.Row:=CurrentRow-5;
   sgRQCentralExportGraphType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQCentralExportGraphTypeShow.sgRQCentralExportGraphTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQCentralExportGraphType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQCentralExportGraphTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQCentralExportGraphType.RowCount-1 do
   for j:=0 to sgRQCentralExportGraphType.ColCount-1 do
     sgRQCentralExportGraphType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQCentralExportGraphTypeShow.actViewExecute(Sender: TObject);
Var TempRQCentralExportGraphType: RQCentralExportGraphTypeControllerSoapPort;
begin
 TempRQCentralExportGraphType := HTTPRIORQCentralExportGraphType as RQCentralExportGraphTypeControllerSoapPort;
   try
     RQCentralExportGraphTypeObj := TempRQCentralExportGraphType.getObject(StrToInt(sgRQCentralExportGraphType.Cells[0,sgRQCentralExportGraphType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQCentralExportGraphTypeEdit:=TfrmRQCentralExportGraphTypeEdit.Create(Application, dsView);
  try
    frmRQCentralExportGraphTypeEdit.ShowModal;
  finally
    frmRQCentralExportGraphTypeEdit.Free;
    frmRQCentralExportGraphTypeEdit:=nil;
  end;
end;

procedure TfrmRQCentralExportGraphTypeShow.actEditExecute(Sender: TObject);
Var TempRQCentralExportGraphType: RQCentralExportGraphTypeControllerSoapPort;
begin
 TempRQCentralExportGraphType := HTTPRIORQCentralExportGraphType as RQCentralExportGraphTypeControllerSoapPort;
   try
     RQCentralExportGraphTypeObj := TempRQCentralExportGraphType.getObject(StrToInt(sgRQCentralExportGraphType.Cells[0,sgRQCentralExportGraphType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQCentralExportGraphTypeEdit:=TfrmRQCentralExportGraphTypeEdit.Create(Application, dsEdit);
  try
    if frmRQCentralExportGraphTypeEdit.ShowModal= mrOk then
      begin
        //TempRQCentralExportGraphType.save(RQCentralExportGraphTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQCentralExportGraphTypeEdit.Free;
    frmRQCentralExportGraphTypeEdit:=nil;
  end;
end;

procedure TfrmRQCentralExportGraphTypeShow.actDeleteExecute(Sender: TObject);
Var TempRQCentralExportGraphType: RQCentralExportGraphTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQCentralExportGraphType := HTTPRIORQCentralExportGraphType as RQCentralExportGraphTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQCentralExportGraphType.Cells[0,sgRQCentralExportGraphType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид графіка центровивозу матеріалів ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQCentralExportGraphType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQCentralExportGraphTypeShow.actInsertExecute(Sender: TObject);
// Var TempRQCentralExportGraphType: RQCentralExportGraphTypeControllerSoapPort; 
begin
  // TempRQCentralExportGraphType := HTTPRIORQCentralExportGraphType as RQCentralExportGraphTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQCentralExportGraphTypeObj:=RQCentralExportGraphType.Create;



  try
    frmRQCentralExportGraphTypeEdit:=TfrmRQCentralExportGraphTypeEdit.Create(Application, dsInsert);
    try
      if frmRQCentralExportGraphTypeEdit.ShowModal = mrOk then
      begin
        if RQCentralExportGraphTypeObj<>nil then
            //TempRQCentralExportGraphType.add(RQCentralExportGraphTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQCentralExportGraphTypeEdit.Free;
      frmRQCentralExportGraphTypeEdit:=nil;
    end;
  finally
    RQCentralExportGraphTypeObj.Free;
  end;
end;

procedure TfrmRQCentralExportGraphTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQCentralExportGraphTypeShow.actFilterExecute(Sender: TObject);
begin
{frmRQCentralExportGraphTypeFilterEdit:=TfrmRQCentralExportGraphTypeFilterEdit.Create(Application, dsInsert);
  try
    RQCentralExportGraphTypeFilterObj := RQCentralExportGraphTypeFilter.Create;
    SetNullIntProps(RQCentralExportGraphTypeFilterObj);
    SetNullXSProps(RQCentralExportGraphTypeFilterObj);

    if frmRQCentralExportGraphTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQCentralExportGraphTypeFilter.Create;
      FilterObject := RQCentralExportGraphTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQCentralExportGraphTypeFilterEdit.Free;
    frmRQCentralExportGraphTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmRQCentralExportGraphTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.