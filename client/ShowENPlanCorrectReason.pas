
unit ShowENPlanCorrectReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanCorrectReasonController, AdvObj ;


type
  TfrmENPlanCorrectReasonShow = class(TChildForm)  
  HTTPRIOENPlanCorrectReason: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanCorrectReason: TAdvStringGrid;
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
procedure sgENPlanCorrectReasonTopLeftChanged(Sender: TObject);
procedure sgENPlanCorrectReasonDblClick(Sender: TObject);
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
 frmENPlanCorrectReasonShow : TfrmENPlanCorrectReasonShow;
 // ENPlanCorrectReasonObj: ENPlanCorrectReason;
 // ENPlanCorrectReasonFilterObj: ENPlanCorrectReasonFilter;
  
  
implementation

uses Main, EditENPlanCorrectReason, EditENPlanCorrectReasonFilter;


{$R *.dfm}

var
  //frmENPlanCorrectReasonShow : TfrmENPlanCorrectReasonShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanCorrectReasonHeaders: array [1..2] of String =
        ( 'Код'
          ,'Причина коригування плану ремонта'
        );
   

procedure TfrmENPlanCorrectReasonShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanCorrectReasonShow:=nil;
    inherited;
  end;


procedure TfrmENPlanCorrectReasonShow.FormShow(Sender: TObject);
var
  TempENPlanCorrectReason: ENPlanCorrectReasonControllerSoapPort;
  i: Integer;
  ENPlanCorrectReasonList: ENPlanCorrectReasonShortList;
  begin
  SetGridHeaders(ENPlanCorrectReasonHeaders, sgENPlanCorrectReason.ColumnHeaders);
  ColCount:=100;
  TempENPlanCorrectReason :=  HTTPRIOENPlanCorrectReason as ENPlanCorrectReasonControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanCorrectReasonFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanCorrectReasonList := TempENPlanCorrectReason.getScrollableFilteredList(ENPlanCorrectReasonFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanCorrectReasonList.list);

  if LastCount > -1 then
     sgENPlanCorrectReason.RowCount:=LastCount+2
  else
     sgENPlanCorrectReason.RowCount:=2;

   with sgENPlanCorrectReason do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanCorrectReasonList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanCorrectReasonList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanCorrectReasonList.list[i].name;
        LastRow:=i+1;
        sgENPlanCorrectReason.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanCorrectReason.Row:=1;
end;

procedure TfrmENPlanCorrectReasonShow.sgENPlanCorrectReasonTopLeftChanged(Sender: TObject);
var
  TempENPlanCorrectReason: ENPlanCorrectReasonControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanCorrectReasonList: ENPlanCorrectReasonShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanCorrectReason.TopRow + sgENPlanCorrectReason.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanCorrectReason :=  HTTPRIOENPlanCorrectReason as ENPlanCorrectReasonControllerSoapPort;
      CurrentRow:=sgENPlanCorrectReason.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanCorrectReasonFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanCorrectReasonList := TempENPlanCorrectReason.getScrollableFilteredList(ENPlanCorrectReasonFilter(FilterObject),ColCount-1, 100);



  sgENPlanCorrectReason.RowCount:=sgENPlanCorrectReason.RowCount+100;
  LastCount:=High(ENPlanCorrectReasonList.list);
  with sgENPlanCorrectReason do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanCorrectReasonList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanCorrectReasonList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPlanCorrectReasonList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanCorrectReason.Row:=CurrentRow-5;
   sgENPlanCorrectReason.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanCorrectReasonShow.sgENPlanCorrectReasonDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanCorrectReason,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanCorrectReasonShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanCorrectReason.RowCount-1 do
   for j:=0 to sgENPlanCorrectReason.ColCount-1 do
     sgENPlanCorrectReason.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanCorrectReasonShow.actViewExecute(Sender: TObject);
Var TempENPlanCorrectReason: ENPlanCorrectReasonControllerSoapPort;
begin
 TempENPlanCorrectReason := HTTPRIOENPlanCorrectReason as ENPlanCorrectReasonControllerSoapPort;
   try
     ENPlanCorrectReasonObj := TempENPlanCorrectReason.getObject(StrToInt(sgENPlanCorrectReason.Cells[0,sgENPlanCorrectReason.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanCorrectReasonEdit:=TfrmENPlanCorrectReasonEdit.Create(Application, dsView);
  try
    frmENPlanCorrectReasonEdit.ShowModal;
  finally
    frmENPlanCorrectReasonEdit.Free;
    frmENPlanCorrectReasonEdit:=nil;
  end;
end;

procedure TfrmENPlanCorrectReasonShow.actEditExecute(Sender: TObject);
Var TempENPlanCorrectReason: ENPlanCorrectReasonControllerSoapPort;
begin
 TempENPlanCorrectReason := HTTPRIOENPlanCorrectReason as ENPlanCorrectReasonControllerSoapPort;
   try
     ENPlanCorrectReasonObj := TempENPlanCorrectReason.getObject(StrToInt(sgENPlanCorrectReason.Cells[0,sgENPlanCorrectReason.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanCorrectReasonEdit:=TfrmENPlanCorrectReasonEdit.Create(Application, dsEdit);
  try
    if frmENPlanCorrectReasonEdit.ShowModal= mrOk then
      begin
        //TempENPlanCorrectReason.save(ENPlanCorrectReasonObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanCorrectReasonEdit.Free;
    frmENPlanCorrectReasonEdit:=nil;
  end;
end;

procedure TfrmENPlanCorrectReasonShow.actDeleteExecute(Sender: TObject);
Var TempENPlanCorrectReason: ENPlanCorrectReasonControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanCorrectReason := HTTPRIOENPlanCorrectReason as ENPlanCorrectReasonControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanCorrectReason.Cells[0,sgENPlanCorrectReason.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Причина коригування плану ремонта) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanCorrectReason.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanCorrectReasonShow.actInsertExecute(Sender: TObject);
Var TempENPlanCorrectReason: ENPlanCorrectReasonControllerSoapPort;
begin
  TempENPlanCorrectReason := HTTPRIOENPlanCorrectReason as ENPlanCorrectReasonControllerSoapPort;
  ENPlanCorrectReasonObj:=ENPlanCorrectReason.Create;



  try
    frmENPlanCorrectReasonEdit:=TfrmENPlanCorrectReasonEdit.Create(Application, dsInsert);
    try
      if frmENPlanCorrectReasonEdit.ShowModal = mrOk then
      begin
        if ENPlanCorrectReasonObj<>nil then
            //TempENPlanCorrectReason.add(ENPlanCorrectReasonObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanCorrectReasonEdit.Free;
      frmENPlanCorrectReasonEdit:=nil;
    end;
  finally
    ENPlanCorrectReasonObj.Free;
  end;
end;

procedure TfrmENPlanCorrectReasonShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanCorrectReasonShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanCorrectReasonFilterEdit:=TfrmENPlanCorrectReasonFilterEdit.Create(Application, dsEdit);
  try
    if frmENPlanCorrectReasonFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENPlanCorrectReasonFilter.Create;
      FilterObject := ENPlanCorrectReasonFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanCorrectReasonFilterEdit.Free;
    frmENPlanCorrectReasonFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanCorrectReasonShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.