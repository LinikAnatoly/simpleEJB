
unit ShowENMOL2PlanWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMOL2PlanWorkController ;


type
  TfrmENMOL2PlanWorkShow = class(TChildForm)  
  HTTPRIOENMOL2PlanWork: THTTPRIO;
    ImageList1: TImageList;
    sgENMOL2PlanWork: TAdvStringGrid;
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
procedure sgENMOL2PlanWorkTopLeftChanged(Sender: TObject);
procedure sgENMOL2PlanWorkDblClick(Sender: TObject);
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
 // ENMOL2PlanWorkObj: ENMOL2PlanWork;
 // ENMOL2PlanWorkFilterObj: ENMOL2PlanWorkFilter;
  
  
implementation

uses Main, EditENMOL2PlanWork, EditENMOL2PlanWorkFilter;


{$R *.dfm}

var
  //frmENMOL2PlanWorkShow : TfrmENMOL2PlanWorkShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMOL2PlanWorkHeaders: array [1..3] of String =
        ( 'Код'
          ,'ФІО мола'
          ,'Примітка'
        );
   

procedure TfrmENMOL2PlanWorkShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMOL2PlanWorkShow:=nil;
    inherited;
  end;


procedure TfrmENMOL2PlanWorkShow.FormShow(Sender: TObject);
var
  TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
  i: Integer;
  ENMOL2PlanWorkList: ENMOL2PlanWorkShortList;
  begin
  SetGridHeaders(ENMOL2PlanWorkHeaders, sgENMOL2PlanWork.ColumnHeaders);
  ColCount:=100;
  TempENMOL2PlanWork :=  HTTPRIOENMOL2PlanWork as ENMOL2PlanWorkControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMOL2PlanWorkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMOL2PlanWorkList := TempENMOL2PlanWork.getScrollableFilteredList(ENMOL2PlanWorkFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMOL2PlanWorkList.list);

  if LastCount > -1 then
     sgENMOL2PlanWork.RowCount:=LastCount+2
  else
     sgENMOL2PlanWork.RowCount:=2;

   with sgENMOL2PlanWork do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMOL2PlanWorkList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMOL2PlanWorkList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMOL2PlanWorkList.list[i].molName;
        Cells[2,i+1] := ENMOL2PlanWorkList.list[i].molCode;
        LastRow:=i+1;
        sgENMOL2PlanWork.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMOL2PlanWork.Row:=1;
end;

procedure TfrmENMOL2PlanWorkShow.sgENMOL2PlanWorkTopLeftChanged(Sender: TObject);
var
  TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
  i,CurrentRow: Integer;
  ENMOL2PlanWorkList: ENMOL2PlanWorkShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMOL2PlanWork.TopRow + sgENMOL2PlanWork.VisibleRowCount) = ColCount
  then
    begin
      TempENMOL2PlanWork :=  HTTPRIOENMOL2PlanWork as ENMOL2PlanWorkControllerSoapPort;
      CurrentRow:=sgENMOL2PlanWork.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMOL2PlanWorkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMOL2PlanWorkList := TempENMOL2PlanWork.getScrollableFilteredList(ENMOL2PlanWorkFilter(FilterObject),ColCount-1, 100);



  sgENMOL2PlanWork.RowCount:=sgENMOL2PlanWork.RowCount+100;
  LastCount:=High(ENMOL2PlanWorkList.list);
  with sgENMOL2PlanWork do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMOL2PlanWorkList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMOL2PlanWorkList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMOL2PlanWorkList.list[i].molName;
        Cells[2,i+CurrentRow] := ENMOL2PlanWorkList.list[i].molCode;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMOL2PlanWork.Row:=CurrentRow-5;
   sgENMOL2PlanWork.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMOL2PlanWorkShow.sgENMOL2PlanWorkDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMOL2PlanWork,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMOL2PlanWorkShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMOL2PlanWork.RowCount-1 do
   for j:=0 to sgENMOL2PlanWork.ColCount-1 do
     sgENMOL2PlanWork.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMOL2PlanWorkShow.actViewExecute(Sender: TObject);
Var TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
begin
 TempENMOL2PlanWork := HTTPRIOENMOL2PlanWork as ENMOL2PlanWorkControllerSoapPort;
   try
     ENMOL2PlanWorkObj := TempENMOL2PlanWork.getObject(StrToInt(sgENMOL2PlanWork.Cells[0,sgENMOL2PlanWork.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMOL2PlanWorkEdit:=TfrmENMOL2PlanWorkEdit.Create(Application, dsView);
  try
    frmENMOL2PlanWorkEdit.ShowModal;
  finally
    frmENMOL2PlanWorkEdit.Free;
    frmENMOL2PlanWorkEdit:=nil;
  end;
end;

procedure TfrmENMOL2PlanWorkShow.actEditExecute(Sender: TObject);
Var TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
begin
 TempENMOL2PlanWork := HTTPRIOENMOL2PlanWork as ENMOL2PlanWorkControllerSoapPort;
   try
     ENMOL2PlanWorkObj := TempENMOL2PlanWork.getObject(StrToInt(sgENMOL2PlanWork.Cells[0,sgENMOL2PlanWork.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMOL2PlanWorkEdit:=TfrmENMOL2PlanWorkEdit.Create(Application, dsEdit);
  try
    if frmENMOL2PlanWorkEdit.ShowModal= mrOk then
      begin
        //TempENMOL2PlanWork.save(ENMOL2PlanWorkObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMOL2PlanWorkEdit.Free;
    frmENMOL2PlanWorkEdit:=nil;
  end;
end;

procedure TfrmENMOL2PlanWorkShow.actDeleteExecute(Sender: TObject);
Var TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMOL2PlanWork := HTTPRIOENMOL2PlanWork as ENMOL2PlanWorkControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMOL2PlanWork.Cells[0,sgENMOL2PlanWork.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (МОЛи на Планах) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMOL2PlanWork.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMOL2PlanWorkShow.actInsertExecute(Sender: TObject);
Var TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
begin
  TempENMOL2PlanWork := HTTPRIOENMOL2PlanWork as ENMOL2PlanWorkControllerSoapPort;
  ENMOL2PlanWorkObj:=ENMOL2PlanWork.Create;



  try
    frmENMOL2PlanWorkEdit:=TfrmENMOL2PlanWorkEdit.Create(Application, dsInsert);
    try
      if frmENMOL2PlanWorkEdit.ShowModal = mrOk then
      begin
        if ENMOL2PlanWorkObj<>nil then
            //TempENMOL2PlanWork.add(ENMOL2PlanWorkObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMOL2PlanWorkEdit.Free;
      frmENMOL2PlanWorkEdit:=nil;
    end;
  finally
    ENMOL2PlanWorkObj.Free;
  end;
end;

procedure TfrmENMOL2PlanWorkShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMOL2PlanWorkShow.actFilterExecute(Sender: TObject);
begin
{frmENMOL2PlanWorkFilterEdit:=TfrmENMOL2PlanWorkFilterEdit.Create(Application, dsEdit);
  try
    ENMOL2PlanWorkFilterObj := ENMOL2PlanWorkFilter.Create;
    SetNullIntProps(ENMOL2PlanWorkFilterObj);
    SetNullXSProps(ENMOL2PlanWorkFilterObj);

    if frmENMOL2PlanWorkFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMOL2PlanWorkFilter.Create;
      FilterObject := ENMOL2PlanWorkFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMOL2PlanWorkFilterEdit.Free;
    frmENMOL2PlanWorkFilterEdit:=nil;
  end;}
end;

procedure TfrmENMOL2PlanWorkShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.