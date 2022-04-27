
unit ShowENWiresFastening;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENWiresFasteningController, AdvObj ;


type
  TfrmENWiresFasteningShow = class(TChildForm)  
  HTTPRIOENWiresFastening: THTTPRIO;
    ImageList1: TImageList;
    sgENWiresFastening: TAdvStringGrid;
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
procedure sgENWiresFasteningTopLeftChanged(Sender: TObject);
procedure sgENWiresFasteningDblClick(Sender: TObject);
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
 frmENWiresFasteningShow : TfrmENWiresFasteningShow;
 // ENWiresFasteningObj: ENWiresFastening;
 // ENWiresFasteningFilterObj: ENWiresFasteningFilter;
  
  
implementation

uses Main, EditENWiresFastening, EditENWiresFasteningFilter;


{$R *.dfm}

var
  //frmENWiresFasteningShow : TfrmENWiresFasteningShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWiresFasteningHeaders: array [1..2] of String =
        ( 'Код'
          ,'Название крепления'
        );
   

procedure TfrmENWiresFasteningShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENWiresFasteningShow:=nil;
    inherited;
  end;


procedure TfrmENWiresFasteningShow.FormShow(Sender: TObject);
var
  TempENWiresFastening: ENWiresFasteningControllerSoapPort;
  i: Integer;
  ENWiresFasteningList: ENWiresFasteningShortList;
  begin
  SetGridHeaders(ENWiresFasteningHeaders, sgENWiresFastening.ColumnHeaders);
  ColCount:=100;
  TempENWiresFastening :=  HTTPRIOENWiresFastening as ENWiresFasteningControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENWiresFasteningFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWiresFasteningList := TempENWiresFastening.getScrollableFilteredList(ENWiresFasteningFilter(FilterObject),0,ColCount);


  LastCount:=High(ENWiresFasteningList.list);

  if LastCount > -1 then
     sgENWiresFastening.RowCount:=LastCount+2
  else
     sgENWiresFastening.RowCount:=2;

   with sgENWiresFastening do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWiresFasteningList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWiresFasteningList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENWiresFasteningList.list[i].name;
        LastRow:=i+1;
        sgENWiresFastening.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENWiresFastening.Row:=1;
end;

procedure TfrmENWiresFasteningShow.sgENWiresFasteningTopLeftChanged(Sender: TObject);
var
  TempENWiresFastening: ENWiresFasteningControllerSoapPort;
  i,CurrentRow: Integer;
  ENWiresFasteningList: ENWiresFasteningShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENWiresFastening.TopRow + sgENWiresFastening.VisibleRowCount) = ColCount
  then
    begin
      TempENWiresFastening :=  HTTPRIOENWiresFastening as ENWiresFasteningControllerSoapPort;
      CurrentRow:=sgENWiresFastening.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENWiresFasteningFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWiresFasteningList := TempENWiresFastening.getScrollableFilteredList(ENWiresFasteningFilter(FilterObject),ColCount-1, 100);



  sgENWiresFastening.RowCount:=sgENWiresFastening.RowCount+100;
  LastCount:=High(ENWiresFasteningList.list);
  with sgENWiresFastening do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWiresFasteningList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENWiresFasteningList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENWiresFasteningList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENWiresFastening.Row:=CurrentRow-5;
   sgENWiresFastening.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENWiresFasteningShow.sgENWiresFasteningDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWiresFastening,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWiresFasteningShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENWiresFastening.RowCount-1 do
   for j:=0 to sgENWiresFastening.ColCount-1 do
     sgENWiresFastening.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENWiresFasteningShow.actViewExecute(Sender: TObject);
Var TempENWiresFastening: ENWiresFasteningControllerSoapPort;
begin
 TempENWiresFastening := HTTPRIOENWiresFastening as ENWiresFasteningControllerSoapPort;
   try
     ENWiresFasteningObj := TempENWiresFastening.getObject(StrToInt(sgENWiresFastening.Cells[0,sgENWiresFastening.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWiresFasteningEdit:=TfrmENWiresFasteningEdit.Create(Application, dsView);
  try
    frmENWiresFasteningEdit.ShowModal;
  finally
    frmENWiresFasteningEdit.Free;
    frmENWiresFasteningEdit:=nil;
  end;
end;

procedure TfrmENWiresFasteningShow.actEditExecute(Sender: TObject);
Var TempENWiresFastening: ENWiresFasteningControllerSoapPort;
begin
 TempENWiresFastening := HTTPRIOENWiresFastening as ENWiresFasteningControllerSoapPort;
   try
     ENWiresFasteningObj := TempENWiresFastening.getObject(StrToInt(sgENWiresFastening.Cells[0,sgENWiresFastening.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWiresFasteningEdit:=TfrmENWiresFasteningEdit.Create(Application, dsEdit);
  try
    if frmENWiresFasteningEdit.ShowModal= mrOk then
      begin
        //TempENWiresFastening.save(ENWiresFasteningObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENWiresFasteningEdit.Free;
    frmENWiresFasteningEdit:=nil;
  end;
end;

procedure TfrmENWiresFasteningShow.actDeleteExecute(Sender: TObject);
Var TempENWiresFastening: ENWiresFasteningControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWiresFastening := HTTPRIOENWiresFastening as ENWiresFasteningControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWiresFastening.Cells[0,sgENWiresFastening.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Крепления проводов) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWiresFastening.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWiresFasteningShow.actInsertExecute(Sender: TObject);
// Var TempENWiresFastening: ENWiresFasteningControllerSoapPort; 
begin
  // TempENWiresFastening := HTTPRIOENWiresFastening as ENWiresFasteningControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENWiresFasteningObj:=ENWiresFastening.Create;



  try
    frmENWiresFasteningEdit:=TfrmENWiresFasteningEdit.Create(Application, dsInsert);
    try
      if frmENWiresFasteningEdit.ShowModal = mrOk then
      begin
        if ENWiresFasteningObj<>nil then
            //TempENWiresFastening.add(ENWiresFasteningObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWiresFasteningEdit.Free;
      frmENWiresFasteningEdit:=nil;
    end;
  finally
    ENWiresFasteningObj.Free;
  end;
end;

procedure TfrmENWiresFasteningShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENWiresFasteningShow.actFilterExecute(Sender: TObject);
begin
{frmENWiresFasteningFilterEdit:=TfrmENWiresFasteningFilterEdit.Create(Application, dsInsert);
  try
    ENWiresFasteningFilterObj := ENWiresFasteningFilter.Create;
    SetNullIntProps(ENWiresFasteningFilterObj);
    SetNullXSProps(ENWiresFasteningFilterObj);

    if frmENWiresFasteningFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWiresFasteningFilter.Create;
      FilterObject := ENWiresFasteningFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWiresFasteningFilterEdit.Free;
    frmENWiresFasteningFilterEdit:=nil;
  end;}
end;

procedure TfrmENWiresFasteningShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.