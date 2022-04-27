
unit ShowENAct2ENPlanWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAct2ENPlanWorkController ;


type
  TfrmENAct2ENPlanWorkShow = class(TChildForm)  
  HTTPRIOENAct2ENPlanWork: THTTPRIO;
    ImageList1: TImageList;
    sgENAct2ENPlanWork: TAdvStringGrid;
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
procedure sgENAct2ENPlanWorkTopLeftChanged(Sender: TObject);
procedure sgENAct2ENPlanWorkDblClick(Sender: TObject);
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
 // ENAct2ENPlanWorkObj: ENAct2ENPlanWork;
 // ENAct2ENPlanWorkFilterObj: ENAct2ENPlanWorkFilter;
  
  
implementation

uses Main, EditENAct2ENPlanWork, EditENAct2ENPlanWorkFilter;


{$R *.dfm}

var
  //frmENAct2ENPlanWorkShow : TfrmENAct2ENPlanWorkShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAct2ENPlanWorkHeaders: array [1..3] of String =
        ( 'Код'
        ,'дата виконання'
        ,'вид ремонту'
        );
   

procedure TfrmENAct2ENPlanWorkShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAct2ENPlanWorkShow:=nil;
    inherited;
  end;


procedure TfrmENAct2ENPlanWorkShow.FormShow(Sender: TObject);
var
  TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
  i: Integer;
  ENAct2ENPlanWorkList: ENAct2ENPlanWorkShortList;
  begin
  SetGridHeaders(ENAct2ENPlanWorkHeaders, sgENAct2ENPlanWork.ColumnHeaders);
  ColCount:=100;
  TempENAct2ENPlanWork :=  HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAct2ENPlanWorkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAct2ENPlanWorkList := TempENAct2ENPlanWork.getScrollableFilteredList(ENAct2ENPlanWorkFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAct2ENPlanWorkList.list);

  if LastCount > -1 then
     sgENAct2ENPlanWork.RowCount:=LastCount+2
  else
     sgENAct2ENPlanWork.RowCount:=2;

   with sgENAct2ENPlanWork do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAct2ENPlanWorkList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAct2ENPlanWorkList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENAct2ENPlanWork.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAct2ENPlanWork.Row:=1;
end;

procedure TfrmENAct2ENPlanWorkShow.sgENAct2ENPlanWorkTopLeftChanged(Sender: TObject);
var
  TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
  i,CurrentRow: Integer;
  ENAct2ENPlanWorkList: ENAct2ENPlanWorkShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAct2ENPlanWork.TopRow + sgENAct2ENPlanWork.VisibleRowCount) = ColCount
  then
    begin
      TempENAct2ENPlanWork :=  HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;
      CurrentRow:=sgENAct2ENPlanWork.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAct2ENPlanWorkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAct2ENPlanWorkList := TempENAct2ENPlanWork.getScrollableFilteredList(ENAct2ENPlanWorkFilter(FilterObject),ColCount-1, 100);



  sgENAct2ENPlanWork.RowCount:=sgENAct2ENPlanWork.RowCount+100;
  LastCount:=High(ENAct2ENPlanWorkList.list);
  with sgENAct2ENPlanWork do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAct2ENPlanWorkList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAct2ENPlanWorkList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAct2ENPlanWork.Row:=CurrentRow-5;
   sgENAct2ENPlanWork.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAct2ENPlanWorkShow.sgENAct2ENPlanWorkDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAct2ENPlanWork,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAct2ENPlanWorkShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAct2ENPlanWork.RowCount-1 do
   for j:=0 to sgENAct2ENPlanWork.ColCount-1 do
     sgENAct2ENPlanWork.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAct2ENPlanWorkShow.actViewExecute(Sender: TObject);
Var TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
begin
 TempENAct2ENPlanWork := HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;
   try
     ENAct2ENPlanWorkObj := TempENAct2ENPlanWork.getObject(StrToInt(sgENAct2ENPlanWork.Cells[0,sgENAct2ENPlanWork.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAct2ENPlanWorkEdit:=TfrmENAct2ENPlanWorkEdit.Create(Application, dsView);
  try
    frmENAct2ENPlanWorkEdit.ShowModal;
  finally
    frmENAct2ENPlanWorkEdit.Free;
    frmENAct2ENPlanWorkEdit:=nil;
  end;
end;

procedure TfrmENAct2ENPlanWorkShow.actEditExecute(Sender: TObject);
Var TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
begin
 TempENAct2ENPlanWork := HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;
   try
     ENAct2ENPlanWorkObj := TempENAct2ENPlanWork.getObject(StrToInt(sgENAct2ENPlanWork.Cells[0,sgENAct2ENPlanWork.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAct2ENPlanWorkEdit:=TfrmENAct2ENPlanWorkEdit.Create(Application, dsEdit);
  try
    if frmENAct2ENPlanWorkEdit.ShowModal= mrOk then
      begin
        //TempENAct2ENPlanWork.save(ENAct2ENPlanWorkObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAct2ENPlanWorkEdit.Free;
    frmENAct2ENPlanWorkEdit:=nil;
  end;
end;

procedure TfrmENAct2ENPlanWorkShow.actDeleteExecute(Sender: TObject);
Var TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAct2ENPlanWork := HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAct2ENPlanWork.Cells[0,sgENAct2ENPlanWork.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Акти виконаних робіт і плани) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAct2ENPlanWork.remove(ObjCode, 1);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAct2ENPlanWorkShow.actInsertExecute(Sender: TObject);
Var TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
begin
  TempENAct2ENPlanWork := HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;
  ENAct2ENPlanWorkObj:=ENAct2ENPlanWork.Create;



  try
    frmENAct2ENPlanWorkEdit:=TfrmENAct2ENPlanWorkEdit.Create(Application, dsInsert);
    try
      if frmENAct2ENPlanWorkEdit.ShowModal = mrOk then
      begin
        if ENAct2ENPlanWorkObj<>nil then
            //TempENAct2ENPlanWork.add(ENAct2ENPlanWorkObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAct2ENPlanWorkEdit.Free;
      frmENAct2ENPlanWorkEdit:=nil;
    end;
  finally
    ENAct2ENPlanWorkObj.Free;
  end;
end;

procedure TfrmENAct2ENPlanWorkShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAct2ENPlanWorkShow.actFilterExecute(Sender: TObject);
begin
{frmENAct2ENPlanWorkFilterEdit:=TfrmENAct2ENPlanWorkFilterEdit.Create(Application, dsEdit);
  try
    ENAct2ENPlanWorkFilterObj := ENAct2ENPlanWorkFilter.Create;
    SetNullIntProps(ENAct2ENPlanWorkFilterObj);
    SetNullXSProps(ENAct2ENPlanWorkFilterObj);

    if frmENAct2ENPlanWorkFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAct2ENPlanWorkFilter.Create;
      FilterObject := ENAct2ENPlanWorkFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAct2ENPlanWorkFilterEdit.Free;
    frmENAct2ENPlanWorkFilterEdit:=nil;
  end;}
end;

procedure TfrmENAct2ENPlanWorkShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.