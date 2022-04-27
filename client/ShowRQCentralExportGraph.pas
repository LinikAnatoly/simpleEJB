
unit ShowRQCentralExportGraph;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQCentralExportGraphController, AdvObj ;


type
  TfrmRQCentralExportGraphShow = class(TChildForm)  
  HTTPRIORQCentralExportGraph: THTTPRIO;
    ImageList1: TImageList;
    sgRQCentralExportGraph: TAdvStringGrid;
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
procedure sgRQCentralExportGraphTopLeftChanged(Sender: TObject);
procedure sgRQCentralExportGraphDblClick(Sender: TObject);
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
 // RQCentralExportGraphObj: RQCentralExportGraph;
 // RQCentralExportGraphFilterObj: RQCentralExportGraphFilter;
  
  
implementation

uses Main, EditRQCentralExportGraph, EditRQCentralExportGraphFilter, ENConsts;


{$R *.dfm}

var
  //frmRQCentralExportGraphShow : TfrmRQCentralExportGraphShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQCentralExportGraphHeaders: array [1..5] of String =
        ( 'Код'
          ,'Місяць '
          ,'Рік '
          ,'Підрозділ'
          ,'Вид графіку'
        );
   

procedure TfrmRQCentralExportGraphShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQCentralExportGraphShow:=nil;
    inherited;
  end;


procedure TfrmRQCentralExportGraphShow.FormShow(Sender: TObject);
var
  TempRQCentralExportGraph: RQCentralExportGraphControllerSoapPort;
  i: Integer;
  RQCentralExportGraphList: RQCentralExportGraphShortList;
  monthGen : String;
  begin
  SetGridHeaders(RQCentralExportGraphHeaders, sgRQCentralExportGraph.ColumnHeaders);
  ColCount:=100;
  TempRQCentralExportGraph :=  HTTPRIORQCentralExportGraph as RQCentralExportGraphControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQCentralExportGraphFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;
  RQCentralExportGraphFilter(FilterObject).orderBySQL := ' yeargen desc , monthgen desc , departmentcode';

  RQCentralExportGraphList := TempRQCentralExportGraph.getScrollableFilteredList(RQCentralExportGraphFilter(FilterObject),0,ColCount);


  LastCount:=High(RQCentralExportGraphList.list);

  if LastCount > -1 then
     sgRQCentralExportGraph.RowCount:=LastCount+2
  else
     sgRQCentralExportGraph.RowCount:=2;

   with sgRQCentralExportGraph do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQCentralExportGraphList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQCentralExportGraphList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQCentralExportGraphList.list[i].monthGen = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := MonthesNames[RQCentralExportGraphList.list[i].monthGen] ;

        if RQCentralExportGraphList.list[i].yearGen = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(RQCentralExportGraphList.list[i].yearGen);

        Cells[3,i+1] := RQCentralExportGraphList.list[i].departmentShortName;

        Cells[4,i+1] := RQCentralExportGraphList.list[i].exportGraphTypeName;

        LastRow:=i+1;
        sgRQCentralExportGraph.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQCentralExportGraph.Row:=1;
end;

procedure TfrmRQCentralExportGraphShow.sgRQCentralExportGraphTopLeftChanged(Sender: TObject);
var
  TempRQCentralExportGraph: RQCentralExportGraphControllerSoapPort;
  i,CurrentRow: Integer;
  RQCentralExportGraphList: RQCentralExportGraphShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQCentralExportGraph.TopRow + sgRQCentralExportGraph.VisibleRowCount) = ColCount
  then
    begin
      TempRQCentralExportGraph :=  HTTPRIORQCentralExportGraph as RQCentralExportGraphControllerSoapPort;
      CurrentRow:=sgRQCentralExportGraph.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQCentralExportGraphFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;
  RQCentralExportGraphFilter(FilterObject).orderBySQL := ' yeargen desc , monthgen desc , departmentcode';

  RQCentralExportGraphList := TempRQCentralExportGraph.getScrollableFilteredList(RQCentralExportGraphFilter(FilterObject),ColCount-1, 100);



  sgRQCentralExportGraph.RowCount:=sgRQCentralExportGraph.RowCount+100;
  LastCount:=High(RQCentralExportGraphList.list);
  with sgRQCentralExportGraph do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQCentralExportGraphList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQCentralExportGraphList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQCentralExportGraphList.list[i].monthGen = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := MonthesNames[RQCentralExportGraphList.list[i].monthGen] ;
        if RQCentralExportGraphList.list[i].yearGen = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(RQCentralExportGraphList.list[i].yearGen);

          Cells[3,i+CurrentRow] := RQCentralExportGraphList.list[i].departmentShortName;

          Cells[4,i+CurrentRow] := RQCentralExportGraphList.list[i].exportGraphTypeName;

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQCentralExportGraph.Row:=CurrentRow-5;
   sgRQCentralExportGraph.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQCentralExportGraphShow.sgRQCentralExportGraphDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQCentralExportGraph,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQCentralExportGraphShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQCentralExportGraph.RowCount-1 do
   for j:=0 to sgRQCentralExportGraph.ColCount-1 do
     sgRQCentralExportGraph.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQCentralExportGraphShow.actViewExecute(Sender: TObject);
Var TempRQCentralExportGraph: RQCentralExportGraphControllerSoapPort;
begin
 TempRQCentralExportGraph := HTTPRIORQCentralExportGraph as RQCentralExportGraphControllerSoapPort;
   try
     RQCentralExportGraphObj := TempRQCentralExportGraph.getObject(StrToInt(sgRQCentralExportGraph.Cells[0,sgRQCentralExportGraph.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQCentralExportGraphEdit:=TfrmRQCentralExportGraphEdit.Create(Application, dsView);
  try
    frmRQCentralExportGraphEdit.ShowModal;
  finally
    frmRQCentralExportGraphEdit.Free;
    frmRQCentralExportGraphEdit:=nil;
  end;
end;

procedure TfrmRQCentralExportGraphShow.actEditExecute(Sender: TObject);
Var TempRQCentralExportGraph: RQCentralExportGraphControllerSoapPort;
begin
 TempRQCentralExportGraph := HTTPRIORQCentralExportGraph as RQCentralExportGraphControllerSoapPort;
   try
     RQCentralExportGraphObj := TempRQCentralExportGraph.getObject(StrToInt(sgRQCentralExportGraph.Cells[0,sgRQCentralExportGraph.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQCentralExportGraphEdit:=TfrmRQCentralExportGraphEdit.Create(Application, dsEdit);
  try
    if frmRQCentralExportGraphEdit.ShowModal= mrOk then
      begin
        //TempRQCentralExportGraph.save(RQCentralExportGraphObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQCentralExportGraphEdit.Free;
    frmRQCentralExportGraphEdit:=nil;
  end;
end;

procedure TfrmRQCentralExportGraphShow.actDeleteExecute(Sender: TObject);
Var TempRQCentralExportGraph: RQCentralExportGraphControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQCentralExportGraph := HTTPRIORQCentralExportGraph as RQCentralExportGraphControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQCentralExportGraph.Cells[0,sgRQCentralExportGraph.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Графік центровивозу матеріалів ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQCentralExportGraph.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQCentralExportGraphShow.actInsertExecute(Sender: TObject);
// Var TempRQCentralExportGraph: RQCentralExportGraphControllerSoapPort; 
begin
  // TempRQCentralExportGraph := HTTPRIORQCentralExportGraph as RQCentralExportGraphControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQCentralExportGraphObj:=RQCentralExportGraph.Create;



  try
    frmRQCentralExportGraphEdit:=TfrmRQCentralExportGraphEdit.Create(Application, dsInsert);
    try
      if frmRQCentralExportGraphEdit.ShowModal = mrOk then
      begin
        if RQCentralExportGraphObj<>nil then
            //TempRQCentralExportGraph.add(RQCentralExportGraphObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQCentralExportGraphEdit.Free;
      frmRQCentralExportGraphEdit:=nil;
    end;
  finally
    RQCentralExportGraphObj.Free;
  end;
end;

procedure TfrmRQCentralExportGraphShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQCentralExportGraphShow.actFilterExecute(Sender: TObject);
begin
{frmRQCentralExportGraphFilterEdit:=TfrmRQCentralExportGraphFilterEdit.Create(Application, dsInsert);
  try
    RQCentralExportGraphFilterObj := RQCentralExportGraphFilter.Create;
    SetNullIntProps(RQCentralExportGraphFilterObj);
    SetNullXSProps(RQCentralExportGraphFilterObj);

    if frmRQCentralExportGraphFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQCentralExportGraphFilter.Create;
      FilterObject := RQCentralExportGraphFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQCentralExportGraphFilterEdit.Free;
    frmRQCentralExportGraphFilterEdit:=nil;
  end;}
end;

procedure TfrmRQCentralExportGraphShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.