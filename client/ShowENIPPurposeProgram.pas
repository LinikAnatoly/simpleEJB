
unit ShowENIPPurposeProgram;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENIPPurposeProgramController, AdvObj ;


type
  TfrmENIPPurposeProgramShow = class(TChildForm)  
  HTTPRIOENIPPurposeProgram: THTTPRIO;
    ImageList1: TImageList;
    sgENIPPurposeProgram: TAdvStringGrid;
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
procedure sgENIPPurposeProgramTopLeftChanged(Sender: TObject);
procedure sgENIPPurposeProgramDblClick(Sender: TObject);
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
 frmENIPPurposeProgramShow : TfrmENIPPurposeProgramShow;
 // ENIPPurposeProgramObj: ENIPPurposeProgram;
 // ENIPPurposeProgramFilterObj: ENIPPurposeProgramFilter;
  
  
implementation

uses Main, EditENIPPurposeProgram, EditENIPPurposeProgramFilter;


{$R *.dfm}

var
  //frmENIPPurposeProgramShow : TfrmENIPPurposeProgramShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENIPPurposeProgramHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування програми'
        );
   

procedure TfrmENIPPurposeProgramShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENIPPurposeProgramShow:=nil;
    inherited;
  end;


procedure TfrmENIPPurposeProgramShow.FormShow(Sender: TObject);
var
  TempENIPPurposeProgram: ENIPPurposeProgramControllerSoapPort;
  i: Integer;
  ENIPPurposeProgramList: ENIPPurposeProgramShortList;
  begin
  SetGridHeaders(ENIPPurposeProgramHeaders, sgENIPPurposeProgram.ColumnHeaders);
  ColCount:=100;
  TempENIPPurposeProgram :=  HTTPRIOENIPPurposeProgram as ENIPPurposeProgramControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENIPPurposeProgramFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIPPurposeProgramList := TempENIPPurposeProgram.getScrollableFilteredList(ENIPPurposeProgramFilter(FilterObject),0,ColCount);


  LastCount:=High(ENIPPurposeProgramList.list);

  if LastCount > -1 then
     sgENIPPurposeProgram.RowCount:=LastCount+2
  else
     sgENIPPurposeProgram.RowCount:=2;

   with sgENIPPurposeProgram do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIPPurposeProgramList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENIPPurposeProgramList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENIPPurposeProgramList.list[i].name;
        LastRow:=i+1;
        sgENIPPurposeProgram.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENIPPurposeProgram.Row:=1;
end;

procedure TfrmENIPPurposeProgramShow.sgENIPPurposeProgramTopLeftChanged(Sender: TObject);
var
  TempENIPPurposeProgram: ENIPPurposeProgramControllerSoapPort;
  i,CurrentRow: Integer;
  ENIPPurposeProgramList: ENIPPurposeProgramShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENIPPurposeProgram.TopRow + sgENIPPurposeProgram.VisibleRowCount) = ColCount
  then
    begin
      TempENIPPurposeProgram :=  HTTPRIOENIPPurposeProgram as ENIPPurposeProgramControllerSoapPort;
      CurrentRow:=sgENIPPurposeProgram.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENIPPurposeProgramFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIPPurposeProgramList := TempENIPPurposeProgram.getScrollableFilteredList(ENIPPurposeProgramFilter(FilterObject),ColCount-1, 100);



  sgENIPPurposeProgram.RowCount:=sgENIPPurposeProgram.RowCount+100;
  LastCount:=High(ENIPPurposeProgramList.list);
  with sgENIPPurposeProgram do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIPPurposeProgramList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENIPPurposeProgramList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENIPPurposeProgramList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENIPPurposeProgram.Row:=CurrentRow-5;
   sgENIPPurposeProgram.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENIPPurposeProgramShow.sgENIPPurposeProgramDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENIPPurposeProgram,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENIPPurposeProgramShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENIPPurposeProgram.RowCount-1 do
   for j:=0 to sgENIPPurposeProgram.ColCount-1 do
     sgENIPPurposeProgram.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENIPPurposeProgramShow.actViewExecute(Sender: TObject);
Var TempENIPPurposeProgram: ENIPPurposeProgramControllerSoapPort;
begin
 TempENIPPurposeProgram := HTTPRIOENIPPurposeProgram as ENIPPurposeProgramControllerSoapPort;
   try
     ENIPPurposeProgramObj := TempENIPPurposeProgram.getObject(StrToInt(sgENIPPurposeProgram.Cells[0,sgENIPPurposeProgram.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIPPurposeProgramEdit:=TfrmENIPPurposeProgramEdit.Create(Application, dsView);
  try
    frmENIPPurposeProgramEdit.ShowModal;
  finally
    frmENIPPurposeProgramEdit.Free;
    frmENIPPurposeProgramEdit:=nil;
  end;
end;

procedure TfrmENIPPurposeProgramShow.actEditExecute(Sender: TObject);
Var TempENIPPurposeProgram: ENIPPurposeProgramControllerSoapPort;
begin
 TempENIPPurposeProgram := HTTPRIOENIPPurposeProgram as ENIPPurposeProgramControllerSoapPort;
   try
     ENIPPurposeProgramObj := TempENIPPurposeProgram.getObject(StrToInt(sgENIPPurposeProgram.Cells[0,sgENIPPurposeProgram.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIPPurposeProgramEdit:=TfrmENIPPurposeProgramEdit.Create(Application, dsEdit);
  try
    if frmENIPPurposeProgramEdit.ShowModal= mrOk then
      begin
        //TempENIPPurposeProgram.save(ENIPPurposeProgramObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENIPPurposeProgramEdit.Free;
    frmENIPPurposeProgramEdit:=nil;
  end;
end;

procedure TfrmENIPPurposeProgramShow.actDeleteExecute(Sender: TObject);
Var TempENIPPurposeProgram: ENIPPurposeProgramControllerSoapPort;
  ObjCode: Integer;
begin
 TempENIPPurposeProgram := HTTPRIOENIPPurposeProgram as ENIPPurposeProgramControllerSoapPort;
   try
     ObjCode := StrToInt(sgENIPPurposeProgram.Cells[0,sgENIPPurposeProgram.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Цільова програма інвестпрограми) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENIPPurposeProgram.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENIPPurposeProgramShow.actInsertExecute(Sender: TObject);
// Var TempENIPPurposeProgram: ENIPPurposeProgramControllerSoapPort; 
begin
  // TempENIPPurposeProgram := HTTPRIOENIPPurposeProgram as ENIPPurposeProgramControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENIPPurposeProgramObj:=ENIPPurposeProgram.Create;



  try
    frmENIPPurposeProgramEdit:=TfrmENIPPurposeProgramEdit.Create(Application, dsInsert);
    try
      if frmENIPPurposeProgramEdit.ShowModal = mrOk then
      begin
        if ENIPPurposeProgramObj<>nil then
            //TempENIPPurposeProgram.add(ENIPPurposeProgramObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENIPPurposeProgramEdit.Free;
      frmENIPPurposeProgramEdit:=nil;
    end;
  finally
    ENIPPurposeProgramObj.Free;
  end;
end;

procedure TfrmENIPPurposeProgramShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENIPPurposeProgramShow.actFilterExecute(Sender: TObject);
begin
frmENIPPurposeProgramFilterEdit:=TfrmENIPPurposeProgramFilterEdit.Create(Application, dsInsert);
  try
    ENIPPurposeProgramFilterObj := ENIPPurposeProgramFilter.Create;
    SetNullIntProps(ENIPPurposeProgramFilterObj);
    SetNullXSProps(ENIPPurposeProgramFilterObj);

    if frmENIPPurposeProgramFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENIPPurposeProgramFilter.Create;
      FilterObject := ENIPPurposeProgramFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENIPPurposeProgramFilterEdit.Free;
    frmENIPPurposeProgramFilterEdit:=nil;
  end;
end;

procedure TfrmENIPPurposeProgramShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.