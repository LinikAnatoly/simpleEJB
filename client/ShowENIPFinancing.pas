
unit ShowENIPFinancing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENIPFinancingController, AdvObj ;


type
  TfrmENIPFinancingShow = class(TChildForm)  
  HTTPRIOENIPFinancing: THTTPRIO;
    ImageList1: TImageList;
    sgENIPFinancing: TAdvStringGrid;
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
procedure sgENIPFinancingTopLeftChanged(Sender: TObject);
procedure sgENIPFinancingDblClick(Sender: TObject);
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
 frmENIPFinancingShow : TfrmENIPFinancingShow;
 // ENIPFinancingObj: ENIPFinancing;
 // ENIPFinancingFilterObj: ENIPFinancingFilter;
  
  
implementation

uses Main, EditENIPFinancing, EditENIPFinancingFilter;


{$R *.dfm}

var
  //frmENIPFinancingShow : TfrmENIPFinancingShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENIPFinancingHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );
   

procedure TfrmENIPFinancingShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENIPFinancingShow:=nil;
    inherited;
  end;


procedure TfrmENIPFinancingShow.FormShow(Sender: TObject);
var
  TempENIPFinancing: ENIPFinancingControllerSoapPort;
  i: Integer;
  ENIPFinancingList: ENIPFinancingShortList;
  begin
  SetGridHeaders(ENIPFinancingHeaders, sgENIPFinancing.ColumnHeaders);
  ColCount:=100;
  TempENIPFinancing :=  HTTPRIOENIPFinancing as ENIPFinancingControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENIPFinancingFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIPFinancingList := TempENIPFinancing.getScrollableFilteredList(ENIPFinancingFilter(FilterObject),0,ColCount);


  LastCount:=High(ENIPFinancingList.list);

  if LastCount > -1 then
     sgENIPFinancing.RowCount:=LastCount+2
  else
     sgENIPFinancing.RowCount:=2;

   with sgENIPFinancing do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIPFinancingList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENIPFinancingList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENIPFinancingList.list[i].name;
        LastRow:=i+1;
        sgENIPFinancing.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENIPFinancing.Row:=1;
end;

procedure TfrmENIPFinancingShow.sgENIPFinancingTopLeftChanged(Sender: TObject);
var
  TempENIPFinancing: ENIPFinancingControllerSoapPort;
  i,CurrentRow: Integer;
  ENIPFinancingList: ENIPFinancingShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENIPFinancing.TopRow + sgENIPFinancing.VisibleRowCount) = ColCount
  then
    begin
      TempENIPFinancing :=  HTTPRIOENIPFinancing as ENIPFinancingControllerSoapPort;
      CurrentRow:=sgENIPFinancing.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENIPFinancingFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIPFinancingList := TempENIPFinancing.getScrollableFilteredList(ENIPFinancingFilter(FilterObject),ColCount-1, 100);



  sgENIPFinancing.RowCount:=sgENIPFinancing.RowCount+100;
  LastCount:=High(ENIPFinancingList.list);
  with sgENIPFinancing do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIPFinancingList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENIPFinancingList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENIPFinancingList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENIPFinancing.Row:=CurrentRow-5;
   sgENIPFinancing.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENIPFinancingShow.sgENIPFinancingDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENIPFinancing,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENIPFinancingShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENIPFinancing.RowCount-1 do
   for j:=0 to sgENIPFinancing.ColCount-1 do
     sgENIPFinancing.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENIPFinancingShow.actViewExecute(Sender: TObject);
Var TempENIPFinancing: ENIPFinancingControllerSoapPort;
begin
 TempENIPFinancing := HTTPRIOENIPFinancing as ENIPFinancingControllerSoapPort;
   try
     ENIPFinancingObj := TempENIPFinancing.getObject(StrToInt(sgENIPFinancing.Cells[0,sgENIPFinancing.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIPFinancingEdit:=TfrmENIPFinancingEdit.Create(Application, dsView);
  try
    frmENIPFinancingEdit.ShowModal;
  finally
    frmENIPFinancingEdit.Free;
    frmENIPFinancingEdit:=nil;
  end;
end;

procedure TfrmENIPFinancingShow.actEditExecute(Sender: TObject);
Var TempENIPFinancing: ENIPFinancingControllerSoapPort;
begin
 TempENIPFinancing := HTTPRIOENIPFinancing as ENIPFinancingControllerSoapPort;
   try
     ENIPFinancingObj := TempENIPFinancing.getObject(StrToInt(sgENIPFinancing.Cells[0,sgENIPFinancing.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIPFinancingEdit:=TfrmENIPFinancingEdit.Create(Application, dsEdit);
  try
    if frmENIPFinancingEdit.ShowModal= mrOk then
      begin
        //TempENIPFinancing.save(ENIPFinancingObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENIPFinancingEdit.Free;
    frmENIPFinancingEdit:=nil;
  end;
end;

procedure TfrmENIPFinancingShow.actDeleteExecute(Sender: TObject);
Var TempENIPFinancing: ENIPFinancingControllerSoapPort;
  ObjCode: Integer;
begin
 TempENIPFinancing := HTTPRIOENIPFinancing as ENIPFinancingControllerSoapPort;
   try
     ObjCode := StrToInt(sgENIPFinancing.Cells[0,sgENIPFinancing.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Джерело фінансування ІП) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENIPFinancing.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENIPFinancingShow.actInsertExecute(Sender: TObject);
// Var TempENIPFinancing: ENIPFinancingControllerSoapPort; 
begin
  // TempENIPFinancing := HTTPRIOENIPFinancing as ENIPFinancingControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENIPFinancingObj:=ENIPFinancing.Create;

  try
    frmENIPFinancingEdit:=TfrmENIPFinancingEdit.Create(Application, dsInsert);
    try
      if frmENIPFinancingEdit.ShowModal = mrOk then
      begin
        if ENIPFinancingObj<>nil then
            //TempENIPFinancing.add(ENIPFinancingObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENIPFinancingEdit.Free;
      frmENIPFinancingEdit:=nil;
    end;
  finally
    ENIPFinancingObj.Free;
  end;
end;

procedure TfrmENIPFinancingShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENIPFinancingShow.actFilterExecute(Sender: TObject);
begin
{frmENIPFinancingFilterEdit:=TfrmENIPFinancingFilterEdit.Create(Application, dsInsert);
  try
    ENIPFinancingFilterObj := ENIPFinancingFilter.Create;
    SetNullIntProps(ENIPFinancingFilterObj);
    SetNullXSProps(ENIPFinancingFilterObj);

    if frmENIPFinancingFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENIPFinancingFilter.Create;
      FilterObject := ENIPFinancingFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENIPFinancingFilterEdit.Free;
    frmENIPFinancingFilterEdit:=nil;
  end;}
end;

procedure TfrmENIPFinancingShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.