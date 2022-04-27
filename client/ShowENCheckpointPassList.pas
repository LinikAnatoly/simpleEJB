
unit ShowENCheckpointPassList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENCheckpointPassListController, AdvObj ;


type
  TfrmENCheckpointPassListShow = class(TChildForm)  
  HTTPRIOENCheckpointPassList: THTTPRIO;
    ImageList1: TImageList;
    sgENCheckpointPassList: TAdvStringGrid;
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
    ToolButton4: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENCheckpointPassListTopLeftChanged(Sender: TObject);
procedure sgENCheckpointPassListDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENCheckpointPassListObj: ENCheckpointPassList;
 // ENCheckpointPassListFilterObj: ENCheckpointPassListFilter;
  
  
implementation

uses Main, EditENCheckpointPassList, EditENCheckpointPassListFilter,
  DMReportsUnit;


{$R *.dfm}

var
  //frmENCheckpointPassListShow : TfrmENCheckpointPassListShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCheckpointPassListHeaders: array [1..7] of String =
        ( 'Код'
          , 'КПП'
          , 'Транспортний відділ'
          ,'Дата с'
          ,'Дата по'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENCheckpointPassListShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCheckpointPassListShow:=nil;
    inherited;
  end;


procedure TfrmENCheckpointPassListShow.FormShow(Sender: TObject);
var
  TempENCheckpointPassList: ENCheckpointPassListControllerSoapPort;
  i: Integer;
  ENCheckpointPassListList: ENCheckpointPassListShortList;
  begin
  SetGridHeaders(ENCheckpointPassListHeaders, sgENCheckpointPassList.ColumnHeaders);
  ColCount:=100;
  TempENCheckpointPassList :=  HTTPRIOENCheckpointPassList as ENCheckpointPassListControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCheckpointPassListFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;
  
  ENCheckpointPassListFilter(FilterObject).orderBySQL := 'encheckpointpasslist.datestart desc, encheckpointpasslist.code desc';

  ENCheckpointPassListList := TempENCheckpointPassList.getScrollableFilteredList(ENCheckpointPassListFilter(FilterObject),0,ColCount);


  LastCount:=High(ENCheckpointPassListList.list);

  if LastCount > -1 then
     sgENCheckpointPassList.RowCount:=LastCount+2
  else
     sgENCheckpointPassList.RowCount:=2;

   with sgENCheckpointPassList do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCheckpointPassListList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCheckpointPassListList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENCheckpointPassListList.list[i].checkpointRefName;

        Cells[2,i+1] := ENCheckpointPassListList.list[i].transportDepartmentRefName;

        if ENCheckpointPassListList.list[i].dateStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENCheckpointPassListList.list[i].dateStart);
        if ENCheckpointPassListList.list[i].dateFinal = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENCheckpointPassListList.list[i].dateFinal);
        Cells[5,i+1] := ENCheckpointPassListList.list[i].userGen;
        if ENCheckpointPassListList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENCheckpointPassListList.list[i].dateEdit);
        LastRow:=i+1;
        sgENCheckpointPassList.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENCheckpointPassList.Row:=1;
end;

procedure TfrmENCheckpointPassListShow.sgENCheckpointPassListTopLeftChanged(Sender: TObject);
var
  TempENCheckpointPassList: ENCheckpointPassListControllerSoapPort;
  i,CurrentRow: Integer;
  ENCheckpointPassListList: ENCheckpointPassListShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCheckpointPassList.TopRow + sgENCheckpointPassList.VisibleRowCount) = ColCount
  then
    begin
      TempENCheckpointPassList :=  HTTPRIOENCheckpointPassList as ENCheckpointPassListControllerSoapPort;
      CurrentRow:=sgENCheckpointPassList.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCheckpointPassListFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCheckpointPassListFilter(FilterObject).orderBySQL := 'encheckpointpasslist.datestart desc, encheckpointpasslist.code desc';
  ENCheckpointPassListList := TempENCheckpointPassList.getScrollableFilteredList(ENCheckpointPassListFilter(FilterObject),ColCount-1, 100);



  sgENCheckpointPassList.RowCount:=sgENCheckpointPassList.RowCount+100;
  LastCount:=High(ENCheckpointPassListList.list);
  with sgENCheckpointPassList do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCheckpointPassListList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCheckpointPassListList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENCheckpointPassListList.list[i].checkpointRefName;

        Cells[2,i+CurrentRow] := ENCheckpointPassListList.list[i].transportDepartmentRefName;


        if ENCheckpointPassListList.list[i].dateStart = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDateTimeWithDate2String(ENCheckpointPassListList.list[i].dateStart);
        if ENCheckpointPassListList.list[i].dateFinal = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(ENCheckpointPassListList.list[i].dateFinal);
        Cells[5,i+CurrentRow] := ENCheckpointPassListList.list[i].userGen;
        if ENCheckpointPassListList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENCheckpointPassListList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCheckpointPassList.Row:=CurrentRow-5;
   sgENCheckpointPassList.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCheckpointPassListShow.ToolButton4Click(Sender: TObject);
var argNames, args : ArrayOfString;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);
  argNames[0] := 'void';
  args[0] := '1';
    makeReport('checkpoint_registration', argNames, args,  'pdf');
end;

procedure TfrmENCheckpointPassListShow.sgENCheckpointPassListDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCheckpointPassList,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCheckpointPassListShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENCheckpointPassList.RowCount-1 do
   for j:=0 to sgENCheckpointPassList.ColCount-1 do
     sgENCheckpointPassList.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENCheckpointPassListShow.actViewExecute(Sender: TObject);
Var TempENCheckpointPassList: ENCheckpointPassListControllerSoapPort;
begin
 TempENCheckpointPassList := HTTPRIOENCheckpointPassList as ENCheckpointPassListControllerSoapPort;
   try
     ENCheckpointPassListObj := TempENCheckpointPassList.getObject(StrToInt(sgENCheckpointPassList.Cells[0,sgENCheckpointPassList.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCheckpointPassListEdit:=TfrmENCheckpointPassListEdit.Create(Application, dsView);
  try
    frmENCheckpointPassListEdit.ShowModal;
  finally
    frmENCheckpointPassListEdit.Free;
    frmENCheckpointPassListEdit:=nil;
  end;
end;

procedure TfrmENCheckpointPassListShow.actEditExecute(Sender: TObject);
Var TempENCheckpointPassList: ENCheckpointPassListControllerSoapPort;
begin
 TempENCheckpointPassList := HTTPRIOENCheckpointPassList as ENCheckpointPassListControllerSoapPort;
   try
     ENCheckpointPassListObj := TempENCheckpointPassList.getObject(StrToInt(sgENCheckpointPassList.Cells[0,sgENCheckpointPassList.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCheckpointPassListEdit:=TfrmENCheckpointPassListEdit.Create(Application, dsEdit);
  try
    if frmENCheckpointPassListEdit.ShowModal= mrOk then
      begin
        //TempENCheckpointPassList.save(ENCheckpointPassListObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCheckpointPassListEdit.Free;
    frmENCheckpointPassListEdit:=nil;
  end;
end;

procedure TfrmENCheckpointPassListShow.actDeleteExecute(Sender: TObject);
Var TempENCheckpointPassList: ENCheckpointPassListControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCheckpointPassList := HTTPRIOENCheckpointPassList as ENCheckpointPassListControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCheckpointPassList.Cells[0,sgENCheckpointPassList.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Реестр проезда через кпп) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCheckpointPassList.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCheckpointPassListShow.actInsertExecute(Sender: TObject);
// Var TempENCheckpointPassList: ENCheckpointPassListControllerSoapPort; 
begin
  // TempENCheckpointPassList := HTTPRIOENCheckpointPassList as ENCheckpointPassListControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCheckpointPassListObj:=ENCheckpointPassList.Create;

   //ENCheckpointPassListObj.dateStart:= TXSDateTime.Create;
   
   //ENCheckpointPassListObj.dateFinal:= TXSDateTime.Create;
   
   //ENCheckpointPassListObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENCheckpointPassListEdit:=TfrmENCheckpointPassListEdit.Create(Application, dsInsert);
    try
      if frmENCheckpointPassListEdit.ShowModal = mrOk then
      begin
        if ENCheckpointPassListObj<>nil then
            //TempENCheckpointPassList.add(ENCheckpointPassListObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCheckpointPassListEdit.Free;
      frmENCheckpointPassListEdit:=nil;
    end;
  finally
    ENCheckpointPassListObj.Free;
  end;
end;

procedure TfrmENCheckpointPassListShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENCheckpointPassListShow.actFilterExecute(Sender: TObject);
begin
frmENCheckpointPassListFilterEdit:=TfrmENCheckpointPassListFilterEdit.Create(Application, dsInsert);
  try
    ENCheckpointPassListFilterObj := ENCheckpointPassListFilter.Create;
    SetNullIntProps(ENCheckpointPassListFilterObj);
    SetNullXSProps(ENCheckpointPassListFilterObj);

    if frmENCheckpointPassListFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENCheckpointPassListFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCheckpointPassListFilterEdit.Free;
    frmENCheckpointPassListFilterEdit:=nil;
  end;
end;

procedure TfrmENCheckpointPassListShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.