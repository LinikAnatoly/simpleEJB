
unit ShowENActInTechCond2ENAct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENActInTechCond2ENActController ;


type
  TfrmENActInTechCond2ENActShow = class(TChildForm)  
  HTTPRIOENActInTechCond2ENAct: THTTPRIO;
    ImageList1: TImageList;
    sgENActInTechCond2ENAct: TAdvStringGrid;
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
procedure sgENActInTechCond2ENActTopLeftChanged(Sender: TObject);
procedure sgENActInTechCond2ENActDblClick(Sender: TObject);
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
 // ENActInTechCond2ENActObj: ENActInTechCond2ENAct;
 // ENActInTechCond2ENActFilterObj: ENActInTechCond2ENActFilter;
  
  
implementation

uses Main, EditENActInTechCond2ENAct, EditENActInTechCond2ENActFilter;


{$R *.dfm}

var
  //frmENActInTechCond2ENActShow : TfrmENActInTechCond2ENActShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActInTechCond2ENActHeaders: array [1..2] of String =
        ( 'Код'
          ,'Кошторисна вартість акту'
        );
   

procedure TfrmENActInTechCond2ENActShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENActInTechCond2ENActShow:=nil;
    inherited;
  end;


procedure TfrmENActInTechCond2ENActShow.FormShow(Sender: TObject);
var
  TempENActInTechCond2ENAct: ENActInTechCond2ENActControllerSoapPort;
  i: Integer;
  ENActInTechCond2ENActList: ENActInTechCond2ENActShortList;
  begin
  SetGridHeaders(ENActInTechCond2ENActHeaders, sgENActInTechCond2ENAct.ColumnHeaders);
  ColCount:=100;
  TempENActInTechCond2ENAct :=  HTTPRIOENActInTechCond2ENAct as ENActInTechCond2ENActControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActInTechCond2ENActFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActInTechCond2ENActList := TempENActInTechCond2ENAct.getScrollableFilteredList(ENActInTechCond2ENActFilter(FilterObject),0,ColCount);


  LastCount:=High(ENActInTechCond2ENActList.list);

  if LastCount > -1 then
     sgENActInTechCond2ENAct.RowCount:=LastCount+2
  else
     sgENActInTechCond2ENAct.RowCount:=2;

   with sgENActInTechCond2ENAct do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActInTechCond2ENActList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActInTechCond2ENActList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENActInTechCond2ENActList.list[i].summaGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENActInTechCond2ENActList.list[i].summaGen.DecimalString;
        LastRow:=i+1;
        sgENActInTechCond2ENAct.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENActInTechCond2ENAct.Row:=1;
end;

procedure TfrmENActInTechCond2ENActShow.sgENActInTechCond2ENActTopLeftChanged(Sender: TObject);
var
  TempENActInTechCond2ENAct: ENActInTechCond2ENActControllerSoapPort;
  i,CurrentRow: Integer;
  ENActInTechCond2ENActList: ENActInTechCond2ENActShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActInTechCond2ENAct.TopRow + sgENActInTechCond2ENAct.VisibleRowCount) = ColCount
  then
    begin
      TempENActInTechCond2ENAct :=  HTTPRIOENActInTechCond2ENAct as ENActInTechCond2ENActControllerSoapPort;
      CurrentRow:=sgENActInTechCond2ENAct.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActInTechCond2ENActFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActInTechCond2ENActList := TempENActInTechCond2ENAct.getScrollableFilteredList(ENActInTechCond2ENActFilter(FilterObject),ColCount-1, 100);



  sgENActInTechCond2ENAct.RowCount:=sgENActInTechCond2ENAct.RowCount+100;
  LastCount:=High(ENActInTechCond2ENActList.list);
  with sgENActInTechCond2ENAct do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActInTechCond2ENActList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActInTechCond2ENActList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENActInTechCond2ENActList.list[i].summaGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENActInTechCond2ENActList.list[i].summaGen.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActInTechCond2ENAct.Row:=CurrentRow-5;
   sgENActInTechCond2ENAct.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActInTechCond2ENActShow.sgENActInTechCond2ENActDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActInTechCond2ENAct,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENActInTechCond2ENActShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENActInTechCond2ENAct.RowCount-1 do
   for j:=0 to sgENActInTechCond2ENAct.ColCount-1 do
     sgENActInTechCond2ENAct.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENActInTechCond2ENActShow.actViewExecute(Sender: TObject);
Var TempENActInTechCond2ENAct: ENActInTechCond2ENActControllerSoapPort;
begin
 TempENActInTechCond2ENAct := HTTPRIOENActInTechCond2ENAct as ENActInTechCond2ENActControllerSoapPort;
   try
     ENActInTechCond2ENActObj := TempENActInTechCond2ENAct.getObject(StrToInt(sgENActInTechCond2ENAct.Cells[0,sgENActInTechCond2ENAct.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENActInTechCond2ENActEdit:=TfrmENActInTechCond2ENActEdit.Create(Application, dsView);
  try
    frmENActInTechCond2ENActEdit.ShowModal;
  finally
    frmENActInTechCond2ENActEdit.Free;
    frmENActInTechCond2ENActEdit:=nil;
  end;
end;

procedure TfrmENActInTechCond2ENActShow.actEditExecute(Sender: TObject);
Var TempENActInTechCond2ENAct: ENActInTechCond2ENActControllerSoapPort;
begin
 TempENActInTechCond2ENAct := HTTPRIOENActInTechCond2ENAct as ENActInTechCond2ENActControllerSoapPort;
   try
     ENActInTechCond2ENActObj := TempENActInTechCond2ENAct.getObject(StrToInt(sgENActInTechCond2ENAct.Cells[0,sgENActInTechCond2ENAct.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENActInTechCond2ENActEdit:=TfrmENActInTechCond2ENActEdit.Create(Application, dsEdit);
  try
    if frmENActInTechCond2ENActEdit.ShowModal= mrOk then
      begin
        //TempENActInTechCond2ENAct.save(ENActInTechCond2ENActObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActInTechCond2ENActEdit.Free;
    frmENActInTechCond2ENActEdit:=nil;
  end;
end;

procedure TfrmENActInTechCond2ENActShow.actDeleteExecute(Sender: TObject);
Var TempENActInTechCond2ENAct: ENActInTechCond2ENActControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActInTechCond2ENAct := HTTPRIOENActInTechCond2ENAct as ENActInTechCond2ENActControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActInTechCond2ENAct.Cells[0,sgENActInTechCond2ENAct.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв’язок прибуткового акту з видатковими) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActInTechCond2ENAct.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActInTechCond2ENActShow.actInsertExecute(Sender: TObject);
// Var TempENActInTechCond2ENAct: ENActInTechCond2ENActControllerSoapPort; 
begin
  // TempENActInTechCond2ENAct := HTTPRIOENActInTechCond2ENAct as ENActInTechCond2ENActControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENActInTechCond2ENActObj:=ENActInTechCond2ENAct.Create;

   //ENActInTechCond2ENActObj.summaGen:= TXSDecimal.Create;


  try
    frmENActInTechCond2ENActEdit:=TfrmENActInTechCond2ENActEdit.Create(Application, dsInsert);
    try
      if frmENActInTechCond2ENActEdit.ShowModal = mrOk then
      begin
        if ENActInTechCond2ENActObj<>nil then
            //TempENActInTechCond2ENAct.add(ENActInTechCond2ENActObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENActInTechCond2ENActEdit.Free;
      frmENActInTechCond2ENActEdit:=nil;
    end;
  finally
    ENActInTechCond2ENActObj.Free;
  end;
end;

procedure TfrmENActInTechCond2ENActShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENActInTechCond2ENActShow.actFilterExecute(Sender: TObject);
begin
{frmENActInTechCond2ENActFilterEdit:=TfrmENActInTechCond2ENActFilterEdit.Create(Application, dsInsert);
  try
    ENActInTechCond2ENActFilterObj := ENActInTechCond2ENActFilter.Create;
    SetNullIntProps(ENActInTechCond2ENActFilterObj);
    SetNullXSProps(ENActInTechCond2ENActFilterObj);

    if frmENActInTechCond2ENActFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENActInTechCond2ENActFilter.Create;
      FilterObject := ENActInTechCond2ENActFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActInTechCond2ENActFilterEdit.Free;
    frmENActInTechCond2ENActFilterEdit:=nil;
  end;}
end;

procedure TfrmENActInTechCond2ENActShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.