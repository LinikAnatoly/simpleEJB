
unit ShowENPlanWorkMoveReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkMoveReasonController, AdvObj ;


type
  TfrmENPlanWorkMoveReasonShow = class(TChildForm)  
  HTTPRIOENPlanWorkMoveReason: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWorkMoveReason: TAdvStringGrid;
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
procedure sgENPlanWorkMoveReasonTopLeftChanged(Sender: TObject);
procedure sgENPlanWorkMoveReasonDblClick(Sender: TObject);
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
 frmENPlanWorkMoveReasonShow : TfrmENPlanWorkMoveReasonShow;
 // ENPlanWorkMoveReasonObj: ENPlanWorkMoveReason;
 // ENPlanWorkMoveReasonFilterObj: ENPlanWorkMoveReasonFilter;
  
  
implementation

uses Main, EditENPlanWorkMoveReason, EditENPlanWorkMoveReasonFilter;


{$R *.dfm}

var
  //frmENPlanWorkMoveReasonShow : TfrmENPlanWorkMoveReasonShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkMoveReasonHeaders: array [1..2] of String =
        ( 'Код'
          ,'Причина перенесення плану ремонта'
        );
   

procedure TfrmENPlanWorkMoveReasonShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWorkMoveReasonShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkMoveReasonShow.FormShow(Sender: TObject);
var
  TempENPlanWorkMoveReason: ENPlanWorkMoveReasonControllerSoapPort;
  i: Integer;
  ENPlanWorkMoveReasonList: ENPlanWorkMoveReasonShortList;
  begin
  SetGridHeaders(ENPlanWorkMoveReasonHeaders, sgENPlanWorkMoveReason.ColumnHeaders);
  ColCount:=100;
  TempENPlanWorkMoveReason :=  HTTPRIOENPlanWorkMoveReason as ENPlanWorkMoveReasonControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkMoveReasonFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkMoveReasonList := TempENPlanWorkMoveReason.getScrollableFilteredList(ENPlanWorkMoveReasonFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanWorkMoveReasonList.list);

  if LastCount > -1 then
     sgENPlanWorkMoveReason.RowCount:=LastCount+2
  else
     sgENPlanWorkMoveReason.RowCount:=2;

   with sgENPlanWorkMoveReason do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkMoveReasonList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWorkMoveReasonList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanWorkMoveReasonList.list[i].name;
        LastRow:=i+1;
        sgENPlanWorkMoveReason.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanWorkMoveReason.Row:=1;
end;

procedure TfrmENPlanWorkMoveReasonShow.sgENPlanWorkMoveReasonTopLeftChanged(Sender: TObject);
var
  TempENPlanWorkMoveReason: ENPlanWorkMoveReasonControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanWorkMoveReasonList: ENPlanWorkMoveReasonShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanWorkMoveReason.TopRow + sgENPlanWorkMoveReason.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWorkMoveReason :=  HTTPRIOENPlanWorkMoveReason as ENPlanWorkMoveReasonControllerSoapPort;
      CurrentRow:=sgENPlanWorkMoveReason.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkMoveReasonFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkMoveReasonList := TempENPlanWorkMoveReason.getScrollableFilteredList(ENPlanWorkMoveReasonFilter(FilterObject),ColCount-1, 100);



  sgENPlanWorkMoveReason.RowCount:=sgENPlanWorkMoveReason.RowCount+100;
  LastCount:=High(ENPlanWorkMoveReasonList.list);
  with sgENPlanWorkMoveReason do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkMoveReasonList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanWorkMoveReasonList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPlanWorkMoveReasonList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanWorkMoveReason.Row:=CurrentRow-5;
   sgENPlanWorkMoveReason.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanWorkMoveReasonShow.sgENPlanWorkMoveReasonDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanWorkMoveReason,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanWorkMoveReasonShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWorkMoveReason.RowCount-1 do
   for j:=0 to sgENPlanWorkMoveReason.ColCount-1 do
     sgENPlanWorkMoveReason.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanWorkMoveReasonShow.actViewExecute(Sender: TObject);
Var TempENPlanWorkMoveReason: ENPlanWorkMoveReasonControllerSoapPort;
begin
 TempENPlanWorkMoveReason := HTTPRIOENPlanWorkMoveReason as ENPlanWorkMoveReasonControllerSoapPort;
   try
     ENPlanWorkMoveReasonObj := TempENPlanWorkMoveReason.getObject(StrToInt(sgENPlanWorkMoveReason.Cells[0,sgENPlanWorkMoveReason.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkMoveReasonEdit:=TfrmENPlanWorkMoveReasonEdit.Create(Application, dsView);
  try
    frmENPlanWorkMoveReasonEdit.ShowModal;
  finally
    frmENPlanWorkMoveReasonEdit.Free;
    frmENPlanWorkMoveReasonEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkMoveReasonShow.actEditExecute(Sender: TObject);
Var TempENPlanWorkMoveReason: ENPlanWorkMoveReasonControllerSoapPort;
begin
 TempENPlanWorkMoveReason := HTTPRIOENPlanWorkMoveReason as ENPlanWorkMoveReasonControllerSoapPort;
   try
     ENPlanWorkMoveReasonObj := TempENPlanWorkMoveReason.getObject(StrToInt(sgENPlanWorkMoveReason.Cells[0,sgENPlanWorkMoveReason.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkMoveReasonEdit:=TfrmENPlanWorkMoveReasonEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkMoveReasonEdit.ShowModal= mrOk then
      begin
        //TempENPlanWorkMoveReason.save(ENPlanWorkMoveReasonObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWorkMoveReasonEdit.Free;
    frmENPlanWorkMoveReasonEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkMoveReasonShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkMoveReason: ENPlanWorkMoveReasonControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanWorkMoveReason := HTTPRIOENPlanWorkMoveReason as ENPlanWorkMoveReasonControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanWorkMoveReason.Cells[0,sgENPlanWorkMoveReason.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Причина перенесення плану ремонта) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanWorkMoveReason.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkMoveReasonShow.actInsertExecute(Sender: TObject);
Var TempENPlanWorkMoveReason: ENPlanWorkMoveReasonControllerSoapPort;
begin
  TempENPlanWorkMoveReason := HTTPRIOENPlanWorkMoveReason as ENPlanWorkMoveReasonControllerSoapPort;
  ENPlanWorkMoveReasonObj:=ENPlanWorkMoveReason.Create;



  try
    frmENPlanWorkMoveReasonEdit:=TfrmENPlanWorkMoveReasonEdit.Create(Application, dsInsert);
    try
      if frmENPlanWorkMoveReasonEdit.ShowModal = mrOk then
      begin
        if ENPlanWorkMoveReasonObj<>nil then
            //TempENPlanWorkMoveReason.add(ENPlanWorkMoveReasonObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkMoveReasonEdit.Free;
      frmENPlanWorkMoveReasonEdit:=nil;
    end;
  finally
    ENPlanWorkMoveReasonObj.Free;
  end;
end;

procedure TfrmENPlanWorkMoveReasonShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanWorkMoveReasonShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanWorkMoveReasonFilterEdit:=TfrmENPlanWorkMoveReasonFilterEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkMoveReasonFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENPlanWorkMoveReasonFilter.Create;
      FilterObject := ENPlanWorkMoveReasonFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkMoveReasonFilterEdit.Free;
    frmENPlanWorkMoveReasonFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanWorkMoveReasonShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.