
unit ShowENMethodExecuteWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMethodExecuteWorkController, AdvObj ;


type
  TfrmENMethodExecuteWorkShow = class(TChildForm)  
  HTTPRIOENMethodExecuteWork: THTTPRIO;
    ImageList1: TImageList;
    sgENMethodExecuteWork: TAdvStringGrid;
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
procedure sgENMethodExecuteWorkTopLeftChanged(Sender: TObject);
procedure sgENMethodExecuteWorkDblClick(Sender: TObject);
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

var
 frmENMethodExecuteWorkShow : TfrmENMethodExecuteWorkShow;
 // ENMethodExecuteWorkObj: ENMethodExecuteWork;
 // ENMethodExecuteWorkFilterObj: ENMethodExecuteWorkFilter;
  
  
implementation

uses Main, EditENMethodExecuteWork, EditENMethodExecuteWorkFilter;


{$R *.dfm}

var
  //frmENMethodExecuteWorkShow : TfrmENMethodExecuteWorkShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMethodExecuteWorkHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );
   

procedure TfrmENMethodExecuteWorkShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMethodExecuteWorkShow:=nil;
    inherited;
  end;


procedure TfrmENMethodExecuteWorkShow.FormShow(Sender: TObject);
var
  TempENMethodExecuteWork: ENMethodExecuteWorkControllerSoapPort;
  i: Integer;
  ENMethodExecuteWorkList: ENMethodExecuteWorkShortList;
  begin
  SetGridHeaders(ENMethodExecuteWorkHeaders, sgENMethodExecuteWork.ColumnHeaders);
  ColCount:=100;
  TempENMethodExecuteWork :=  HTTPRIOENMethodExecuteWork as ENMethodExecuteWorkControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMethodExecuteWorkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMethodExecuteWorkList := TempENMethodExecuteWork.getScrollableFilteredList(ENMethodExecuteWorkFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMethodExecuteWorkList.list);

  if LastCount > -1 then
     sgENMethodExecuteWork.RowCount:=LastCount+2
  else
     sgENMethodExecuteWork.RowCount:=2;

   with sgENMethodExecuteWork do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMethodExecuteWorkList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMethodExecuteWorkList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMethodExecuteWorkList.list[i].name;
        LastRow:=i+1;
        sgENMethodExecuteWork.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMethodExecuteWork.Row:=1;
end;

procedure TfrmENMethodExecuteWorkShow.sgENMethodExecuteWorkTopLeftChanged(Sender: TObject);
var
  TempENMethodExecuteWork: ENMethodExecuteWorkControllerSoapPort;
  i,CurrentRow: Integer;
  ENMethodExecuteWorkList: ENMethodExecuteWorkShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMethodExecuteWork.TopRow + sgENMethodExecuteWork.VisibleRowCount) = ColCount
  then
    begin
      TempENMethodExecuteWork :=  HTTPRIOENMethodExecuteWork as ENMethodExecuteWorkControllerSoapPort;
      CurrentRow:=sgENMethodExecuteWork.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMethodExecuteWorkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMethodExecuteWorkList := TempENMethodExecuteWork.getScrollableFilteredList(ENMethodExecuteWorkFilter(FilterObject),ColCount-1, 100);



  sgENMethodExecuteWork.RowCount:=sgENMethodExecuteWork.RowCount+100;
  LastCount:=High(ENMethodExecuteWorkList.list);
  with sgENMethodExecuteWork do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMethodExecuteWorkList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMethodExecuteWorkList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMethodExecuteWorkList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMethodExecuteWork.Row:=CurrentRow-5;
   sgENMethodExecuteWork.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMethodExecuteWorkShow.sgENMethodExecuteWorkDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMethodExecuteWork,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMethodExecuteWorkShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMethodExecuteWork.RowCount-1 do
   for j:=0 to sgENMethodExecuteWork.ColCount-1 do
     sgENMethodExecuteWork.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMethodExecuteWorkShow.actViewExecute(Sender: TObject);
Var TempENMethodExecuteWork: ENMethodExecuteWorkControllerSoapPort;
begin
 TempENMethodExecuteWork := HTTPRIOENMethodExecuteWork as ENMethodExecuteWorkControllerSoapPort;
   try
     ENMethodExecuteWorkObj := TempENMethodExecuteWork.getObject(StrToInt(sgENMethodExecuteWork.Cells[0,sgENMethodExecuteWork.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMethodExecuteWorkEdit:=TfrmENMethodExecuteWorkEdit.Create(Application, dsView);
  try
    frmENMethodExecuteWorkEdit.ShowModal;
  finally
    frmENMethodExecuteWorkEdit.Free;
    frmENMethodExecuteWorkEdit:=nil;
  end;
end;

procedure TfrmENMethodExecuteWorkShow.actEditExecute(Sender: TObject);
Var TempENMethodExecuteWork: ENMethodExecuteWorkControllerSoapPort;
begin
 TempENMethodExecuteWork := HTTPRIOENMethodExecuteWork as ENMethodExecuteWorkControllerSoapPort;
   try
     ENMethodExecuteWorkObj := TempENMethodExecuteWork.getObject(StrToInt(sgENMethodExecuteWork.Cells[0,sgENMethodExecuteWork.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMethodExecuteWorkEdit:=TfrmENMethodExecuteWorkEdit.Create(Application, dsEdit);
  try
    if frmENMethodExecuteWorkEdit.ShowModal= mrOk then
      begin
        //TempENMethodExecuteWork.save(ENMethodExecuteWorkObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMethodExecuteWorkEdit.Free;
    frmENMethodExecuteWorkEdit:=nil;
  end;
end;

procedure TfrmENMethodExecuteWorkShow.actDeleteExecute(Sender: TObject);
Var TempENMethodExecuteWork: ENMethodExecuteWorkControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMethodExecuteWork := HTTPRIOENMethodExecuteWork as ENMethodExecuteWorkControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMethodExecuteWork.Cells[0,sgENMethodExecuteWork.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Спосіб віконання робіт(підрядн/господарський)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMethodExecuteWork.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMethodExecuteWorkShow.actInsertExecute(Sender: TObject);
// Var TempENMethodExecuteWork: ENMethodExecuteWorkControllerSoapPort; 
begin
  // TempENMethodExecuteWork := HTTPRIOENMethodExecuteWork as ENMethodExecuteWorkControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENMethodExecuteWorkObj:=ENMethodExecuteWork.Create;



  try
    frmENMethodExecuteWorkEdit:=TfrmENMethodExecuteWorkEdit.Create(Application, dsInsert);
    try
      if frmENMethodExecuteWorkEdit.ShowModal = mrOk then
      begin
        if ENMethodExecuteWorkObj<>nil then
            //TempENMethodExecuteWork.add(ENMethodExecuteWorkObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMethodExecuteWorkEdit.Free;
      frmENMethodExecuteWorkEdit:=nil;
    end;
  finally
    ENMethodExecuteWorkObj.Free;
  end;
end;

procedure TfrmENMethodExecuteWorkShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMethodExecuteWorkShow.actFilterExecute(Sender: TObject);
begin
{frmENMethodExecuteWorkFilterEdit:=TfrmENMethodExecuteWorkFilterEdit.Create(Application, dsInsert);
  try
    ENMethodExecuteWorkFilterObj := ENMethodExecuteWorkFilter.Create;
    SetNullIntProps(ENMethodExecuteWorkFilterObj);
    SetNullXSProps(ENMethodExecuteWorkFilterObj);

    if frmENMethodExecuteWorkFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMethodExecuteWorkFilter.Create;
      FilterObject := ENMethodExecuteWorkFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMethodExecuteWorkFilterEdit.Free;
    frmENMethodExecuteWorkFilterEdit:=nil;
  end;}
end;

procedure TfrmENMethodExecuteWorkShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.