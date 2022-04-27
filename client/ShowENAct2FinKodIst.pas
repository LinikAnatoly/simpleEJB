
unit ShowENAct2FinKodIst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAct2FinKodIstController, AdvObj ;


type
  TfrmENAct2FinKodIstShow = class(TChildForm)  
  HTTPRIOENAct2FinKodIst: THTTPRIO;
    ImageList1: TImageList;
    sgENAct2FinKodIst: TAdvStringGrid;
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
procedure sgENAct2FinKodIstTopLeftChanged(Sender: TObject);
procedure sgENAct2FinKodIstDblClick(Sender: TObject);
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
 // ENAct2FinKodIstObj: ENAct2FinKodIst;
 // ENAct2FinKodIstFilterObj: ENAct2FinKodIstFilter;
  
  
implementation

uses Main, EditENAct2FinKodIst, EditENAct2FinKodIstFilter;


{$R *.dfm}

var
  //frmENAct2FinKodIstShow : TfrmENAct2FinKodIstShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAct2FinKodIstHeaders: array [1..1] of String =
        ( 'Код'
        );
   

procedure TfrmENAct2FinKodIstShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAct2FinKodIstShow:=nil;
    inherited;
  end;


procedure TfrmENAct2FinKodIstShow.FormShow(Sender: TObject);
var
  TempENAct2FinKodIst: ENAct2FinKodIstControllerSoapPort;
  i: Integer;
  ENAct2FinKodIstList: ENAct2FinKodIstShortList;
  begin
  SetGridHeaders(ENAct2FinKodIstHeaders, sgENAct2FinKodIst.ColumnHeaders);
  ColCount:=100;
  TempENAct2FinKodIst :=  HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAct2FinKodIstFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAct2FinKodIstList := TempENAct2FinKodIst.getScrollableFilteredList(ENAct2FinKodIstFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAct2FinKodIstList.list);

  if LastCount > -1 then
     sgENAct2FinKodIst.RowCount:=LastCount+2
  else
     sgENAct2FinKodIst.RowCount:=2;

   with sgENAct2FinKodIst do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAct2FinKodIstList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAct2FinKodIstList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENAct2FinKodIst.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAct2FinKodIst.Row:=1;
end;

procedure TfrmENAct2FinKodIstShow.sgENAct2FinKodIstTopLeftChanged(Sender: TObject);
var
  TempENAct2FinKodIst: ENAct2FinKodIstControllerSoapPort;
  i,CurrentRow: Integer;
  ENAct2FinKodIstList: ENAct2FinKodIstShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAct2FinKodIst.TopRow + sgENAct2FinKodIst.VisibleRowCount) = ColCount
  then
    begin
      TempENAct2FinKodIst :=  HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;
      CurrentRow:=sgENAct2FinKodIst.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAct2FinKodIstFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAct2FinKodIstList := TempENAct2FinKodIst.getScrollableFilteredList(ENAct2FinKodIstFilter(FilterObject),ColCount-1, 100);



  sgENAct2FinKodIst.RowCount:=sgENAct2FinKodIst.RowCount+100;
  LastCount:=High(ENAct2FinKodIstList.list);
  with sgENAct2FinKodIst do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAct2FinKodIstList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAct2FinKodIstList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAct2FinKodIst.Row:=CurrentRow-5;
   sgENAct2FinKodIst.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAct2FinKodIstShow.sgENAct2FinKodIstDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAct2FinKodIst,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAct2FinKodIstShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAct2FinKodIst.RowCount-1 do
   for j:=0 to sgENAct2FinKodIst.ColCount-1 do
     sgENAct2FinKodIst.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAct2FinKodIstShow.actViewExecute(Sender: TObject);
Var TempENAct2FinKodIst: ENAct2FinKodIstControllerSoapPort;
begin
 TempENAct2FinKodIst := HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;
   try
     ENAct2FinKodIstObj := TempENAct2FinKodIst.getObject(StrToInt(sgENAct2FinKodIst.Cells[0,sgENAct2FinKodIst.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAct2FinKodIstEdit:=TfrmENAct2FinKodIstEdit.Create(Application, dsView);
  try
    frmENAct2FinKodIstEdit.ShowModal;
  finally
    frmENAct2FinKodIstEdit.Free;
    frmENAct2FinKodIstEdit:=nil;
  end;
end;

procedure TfrmENAct2FinKodIstShow.actEditExecute(Sender: TObject);
Var TempENAct2FinKodIst: ENAct2FinKodIstControllerSoapPort;
begin
 TempENAct2FinKodIst := HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;
   try
     ENAct2FinKodIstObj := TempENAct2FinKodIst.getObject(StrToInt(sgENAct2FinKodIst.Cells[0,sgENAct2FinKodIst.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAct2FinKodIstEdit:=TfrmENAct2FinKodIstEdit.Create(Application, dsEdit);
  try
    if frmENAct2FinKodIstEdit.ShowModal= mrOk then
      begin
        //TempENAct2FinKodIst.save(ENAct2FinKodIstObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAct2FinKodIstEdit.Free;
    frmENAct2FinKodIstEdit:=nil;
  end;
end;

procedure TfrmENAct2FinKodIstShow.actDeleteExecute(Sender: TObject);
Var TempENAct2FinKodIst: ENAct2FinKodIstControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAct2FinKodIst := HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAct2FinKodIst.Cells[0,sgENAct2FinKodIst.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связка акта и источника из ФК) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAct2FinKodIst.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAct2FinKodIstShow.actInsertExecute(Sender: TObject);
// Var TempENAct2FinKodIst: ENAct2FinKodIstControllerSoapPort; 
begin
  // TempENAct2FinKodIst := HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENAct2FinKodIstObj:=ENAct2FinKodIst.Create;

  try
    frmENAct2FinKodIstEdit:=TfrmENAct2FinKodIstEdit.Create(Application, dsInsert);
    try
      if frmENAct2FinKodIstEdit.ShowModal = mrOk then
      begin
        if ENAct2FinKodIstObj<>nil then
            //TempENAct2FinKodIst.add(ENAct2FinKodIstObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAct2FinKodIstEdit.Free;
      frmENAct2FinKodIstEdit:=nil;
    end;
  finally
    ENAct2FinKodIstObj.Free;
  end;
end;

procedure TfrmENAct2FinKodIstShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAct2FinKodIstShow.actFilterExecute(Sender: TObject);
begin
{frmENAct2FinKodIstFilterEdit:=TfrmENAct2FinKodIstFilterEdit.Create(Application, dsInsert);
  try
    ENAct2FinKodIstFilterObj := ENAct2FinKodIstFilter.Create;
    SetNullIntProps(ENAct2FinKodIstFilterObj);
    SetNullXSProps(ENAct2FinKodIstFilterObj);

    if frmENAct2FinKodIstFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAct2FinKodIstFilter.Create;
      FilterObject := ENAct2FinKodIstFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAct2FinKodIstFilterEdit.Free;
    frmENAct2FinKodIstFilterEdit:=nil;
  end;}
end;

procedure TfrmENAct2FinKodIstShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.