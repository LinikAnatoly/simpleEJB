
unit ShowENConnectionLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENConnectionLevelController, AdvObj ;


type
  TfrmENConnectionLevelShow = class(TChildForm)  
  HTTPRIOENConnectionLevel: THTTPRIO;
    ImageList1: TImageList;
    sgENConnectionLevel: TAdvStringGrid;
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
procedure sgENConnectionLevelTopLeftChanged(Sender: TObject);
procedure sgENConnectionLevelDblClick(Sender: TObject);
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
 frmENConnectionLevelShow : TfrmENConnectionLevelShow;
 // ENConnectionLevelObj: ENConnectionLevel;
 // ENConnectionLevelFilterObj: ENConnectionLevelFilter;
  
  
implementation

uses Main, EditENConnectionLevel, EditENConnectionLevelFilter;


{$R *.dfm}

var
  //frmENConnectionLevelShow : TfrmENConnectionLevelShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConnectionLevelHeaders: array [1..2] of String =
        ( 'Код'
          ,'Ступінь ставки'
        );
   

procedure TfrmENConnectionLevelShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENConnectionLevelShow:=nil;
    inherited;
  end;


procedure TfrmENConnectionLevelShow.FormShow(Sender: TObject);
var
  TempENConnectionLevel: ENConnectionLevelControllerSoapPort;
  i: Integer;
  ENConnectionLevelList: ENConnectionLevelShortList;
  begin
  SetGridHeaders(ENConnectionLevelHeaders, sgENConnectionLevel.ColumnHeaders);
  ColCount:=100;
  TempENConnectionLevel :=  HTTPRIOENConnectionLevel as ENConnectionLevelControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionLevelFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionLevelList := TempENConnectionLevel.getScrollableFilteredList(ENConnectionLevelFilter(FilterObject),0,ColCount);


  LastCount:=High(ENConnectionLevelList.list);

  if LastCount > -1 then
     sgENConnectionLevel.RowCount:=LastCount+2
  else
     sgENConnectionLevel.RowCount:=2;

   with sgENConnectionLevel do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionLevelList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENConnectionLevelList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENConnectionLevelList.list[i].name;
        LastRow:=i+1;
        sgENConnectionLevel.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENConnectionLevel.Row:=1;
end;

procedure TfrmENConnectionLevelShow.sgENConnectionLevelTopLeftChanged(Sender: TObject);
var
  TempENConnectionLevel: ENConnectionLevelControllerSoapPort;
  i,CurrentRow: Integer;
  ENConnectionLevelList: ENConnectionLevelShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENConnectionLevel.TopRow + sgENConnectionLevel.VisibleRowCount) = ColCount
  then
    begin
      TempENConnectionLevel :=  HTTPRIOENConnectionLevel as ENConnectionLevelControllerSoapPort;
      CurrentRow:=sgENConnectionLevel.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionLevelFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionLevelList := TempENConnectionLevel.getScrollableFilteredList(ENConnectionLevelFilter(FilterObject),ColCount-1, 100);



  sgENConnectionLevel.RowCount:=sgENConnectionLevel.RowCount+100;
  LastCount:=High(ENConnectionLevelList.list);
  with sgENConnectionLevel do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionLevelList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENConnectionLevelList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENConnectionLevelList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENConnectionLevel.Row:=CurrentRow-5;
   sgENConnectionLevel.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENConnectionLevelShow.sgENConnectionLevelDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENConnectionLevel,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENConnectionLevelShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENConnectionLevel.RowCount-1 do
   for j:=0 to sgENConnectionLevel.ColCount-1 do
     sgENConnectionLevel.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENConnectionLevelShow.actViewExecute(Sender: TObject);
Var TempENConnectionLevel: ENConnectionLevelControllerSoapPort;
begin
 TempENConnectionLevel := HTTPRIOENConnectionLevel as ENConnectionLevelControllerSoapPort;
   try
     ENConnectionLevelObj := TempENConnectionLevel.getObject(StrToInt(sgENConnectionLevel.Cells[0,sgENConnectionLevel.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENConnectionLevelEdit:=TfrmENConnectionLevelEdit.Create(Application, dsView);
  try
    frmENConnectionLevelEdit.ShowModal;
  finally
    frmENConnectionLevelEdit.Free;
    frmENConnectionLevelEdit:=nil;
  end;
end;

procedure TfrmENConnectionLevelShow.actEditExecute(Sender: TObject);
Var TempENConnectionLevel: ENConnectionLevelControllerSoapPort;
begin
 TempENConnectionLevel := HTTPRIOENConnectionLevel as ENConnectionLevelControllerSoapPort;
   try
     ENConnectionLevelObj := TempENConnectionLevel.getObject(StrToInt(sgENConnectionLevel.Cells[0,sgENConnectionLevel.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENConnectionLevelEdit:=TfrmENConnectionLevelEdit.Create(Application, dsEdit);
  try
    if frmENConnectionLevelEdit.ShowModal= mrOk then
      begin
        //TempENConnectionLevel.save(ENConnectionLevelObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENConnectionLevelEdit.Free;
    frmENConnectionLevelEdit:=nil;
  end;
end;

procedure TfrmENConnectionLevelShow.actDeleteExecute(Sender: TObject);
Var TempENConnectionLevel: ENConnectionLevelControllerSoapPort;
  ObjCode: Integer;
begin
 TempENConnectionLevel := HTTPRIOENConnectionLevel as ENConnectionLevelControllerSoapPort;
   try
     ObjCode := StrToInt(sgENConnectionLevel.Cells[0,sgENConnectionLevel.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Ступінь електричних мереж) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConnectionLevel.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConnectionLevelShow.actInsertExecute(Sender: TObject);
// Var TempENConnectionLevel: ENConnectionLevelControllerSoapPort; 
begin
  // TempENConnectionLevel := HTTPRIOENConnectionLevel as ENConnectionLevelControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENConnectionLevelObj:=ENConnectionLevel.Create;



  try
    frmENConnectionLevelEdit:=TfrmENConnectionLevelEdit.Create(Application, dsInsert);
    try
      if frmENConnectionLevelEdit.ShowModal = mrOk then
      begin
        if ENConnectionLevelObj<>nil then
            //TempENConnectionLevel.add(ENConnectionLevelObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENConnectionLevelEdit.Free;
      frmENConnectionLevelEdit:=nil;
    end;
  finally
    ENConnectionLevelObj.Free;
  end;
end;

procedure TfrmENConnectionLevelShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENConnectionLevelShow.actFilterExecute(Sender: TObject);
begin
{frmENConnectionLevelFilterEdit:=TfrmENConnectionLevelFilterEdit.Create(Application, dsInsert);
  try
    ENConnectionLevelFilterObj := ENConnectionLevelFilter.Create;
    SetNullIntProps(ENConnectionLevelFilterObj);
    SetNullXSProps(ENConnectionLevelFilterObj);

    if frmENConnectionLevelFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENConnectionLevelFilter.Create;
      FilterObject := ENConnectionLevelFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENConnectionLevelFilterEdit.Free;
    frmENConnectionLevelFilterEdit:=nil;
  end;}
end;

procedure TfrmENConnectionLevelShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.