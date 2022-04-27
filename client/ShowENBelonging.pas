
unit ShowENBelonging;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBelongingController ;


type
  TfrmENBelongingShow = class(TChildForm)  
  HTTPRIOENBelonging: THTTPRIO;
    ImageList1: TImageList;
    sgENBelonging: TAdvStringGrid;
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
procedure sgENBelongingTopLeftChanged(Sender: TObject);
procedure sgENBelongingDblClick(Sender: TObject);
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
 // ENBelongingObj: ENBelonging;
 // ENBelongingFilterObj: ENBelongingFilter;
  
  
implementation

uses Main, EditENBelonging, EditENBelongingFilter;


{$R *.dfm}

var
  //frmENBelongingShow : TfrmENBelongingShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBelongingHeaders: array [1..2] of String =
        ( 'Код'
          ,'Балансова належність'
        );
   

procedure TfrmENBelongingShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBelongingShow:=nil;
    inherited;
  end;


procedure TfrmENBelongingShow.FormShow(Sender: TObject);
var
  TempENBelonging: ENBelongingControllerSoapPort;
  i: Integer;
  ENBelongingList: ENBelongingShortList;
  begin
  SetGridHeaders(ENBelongingHeaders, sgENBelonging.ColumnHeaders);
  ColCount:=100;
  TempENBelonging :=  HTTPRIOENBelonging as ENBelongingControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBelongingFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBelongingList := TempENBelonging.getScrollableFilteredList(ENBelongingFilter(FilterObject),0,ColCount);


  LastCount:=High(ENBelongingList.list);

  if LastCount > -1 then
     sgENBelonging.RowCount:=LastCount+2
  else
     sgENBelonging.RowCount:=2;

   with sgENBelonging do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBelongingList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBelongingList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBelongingList.list[i].name;
        LastRow:=i+1;
        sgENBelonging.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENBelonging.Row:=1;
end;

procedure TfrmENBelongingShow.sgENBelongingTopLeftChanged(Sender: TObject);
var
  TempENBelonging: ENBelongingControllerSoapPort;
  i,CurrentRow: Integer;
  ENBelongingList: ENBelongingShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBelonging.TopRow + sgENBelonging.VisibleRowCount) = ColCount
  then
    begin
      TempENBelonging :=  HTTPRIOENBelonging as ENBelongingControllerSoapPort;
      CurrentRow:=sgENBelonging.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBelongingFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBelongingList := TempENBelonging.getScrollableFilteredList(ENBelongingFilter(FilterObject),ColCount-1, 100);



  sgENBelonging.RowCount:=sgENBelonging.RowCount+100;
  LastCount:=High(ENBelongingList.list);
  with sgENBelonging do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBelongingList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBelongingList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBelongingList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBelonging.Row:=CurrentRow-5;
   sgENBelonging.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBelongingShow.sgENBelongingDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBelonging,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBelongingShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBelonging.RowCount-1 do
   for j:=0 to sgENBelonging.ColCount-1 do
     sgENBelonging.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBelongingShow.actViewExecute(Sender: TObject);
Var TempENBelonging: ENBelongingControllerSoapPort;
begin
 TempENBelonging := HTTPRIOENBelonging as ENBelongingControllerSoapPort;
   try
     ENBelongingObj := TempENBelonging.getObject(StrToInt(sgENBelonging.Cells[0,sgENBelonging.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBelongingEdit:=TfrmENBelongingEdit.Create(Application, dsView);
  try
    frmENBelongingEdit.ShowModal;
  finally
    frmENBelongingEdit.Free;
    frmENBelongingEdit:=nil;
  end;
end;

procedure TfrmENBelongingShow.actEditExecute(Sender: TObject);
Var TempENBelonging: ENBelongingControllerSoapPort;
begin
 TempENBelonging := HTTPRIOENBelonging as ENBelongingControllerSoapPort;
   try
     ENBelongingObj := TempENBelonging.getObject(StrToInt(sgENBelonging.Cells[0,sgENBelonging.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBelongingEdit:=TfrmENBelongingEdit.Create(Application, dsEdit);
  try
    if frmENBelongingEdit.ShowModal= mrOk then
      begin
        //TempENBelonging.save(ENBelongingObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBelongingEdit.Free;
    frmENBelongingEdit:=nil;
  end;
end;

procedure TfrmENBelongingShow.actDeleteExecute(Sender: TObject);
Var TempENBelonging: ENBelongingControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBelonging := HTTPRIOENBelonging as ENBelongingControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBelonging.Cells[0,sgENBelonging.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Балансова належність) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBelonging.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBelongingShow.actInsertExecute(Sender: TObject);
Var TempENBelonging: ENBelongingControllerSoapPort;
begin
  TempENBelonging := HTTPRIOENBelonging as ENBelongingControllerSoapPort;
  ENBelongingObj:=ENBelonging.Create;



  try
    frmENBelongingEdit:=TfrmENBelongingEdit.Create(Application, dsInsert);
    try
      if frmENBelongingEdit.ShowModal = mrOk then
      begin
        if ENBelongingObj<>nil then
            //TempENBelonging.add(ENBelongingObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBelongingEdit.Free;
      frmENBelongingEdit:=nil;
    end;
  finally
    ENBelongingObj.Free;
  end;
end;

procedure TfrmENBelongingShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBelongingShow.actFilterExecute(Sender: TObject);
begin
{frmENBelongingFilterEdit:=TfrmENBelongingFilterEdit.Create(Application, dsEdit);
  try
    if frmENBelongingFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENBelongingFilter.Create;
      FilterObject := ENBelongingFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBelongingFilterEdit.Free;
    frmENBelongingFilterEdit:=nil;
  end;}
end;

procedure TfrmENBelongingShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.