
unit ShowENBranch10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBranch10Controller ;


type
  TfrmENBranch10Show = class(TChildForm)  
  HTTPRIOENBranch10: THTTPRIO;
    ImageList1: TImageList;
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
    sgENBranch10: TAdvStringGrid;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENBranch10TopLeftChanged(Sender: TObject);
procedure sgENBranch10DblClick(Sender: TObject);
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
 // ENBranch10Obj: ENBranch10;
 // ENBranch10FilterObj: ENBranch10Filter;
  
  
implementation

uses Main, EditENBranch10, EditENBranch10Filter;


{$R *.dfm}

var
  //frmENBranch10Show : TfrmENBranch10Show;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBranch10Headers: array [1..5] of String =
        (  'Код'
          ,'Напрямок (призначення)'
          ,'Довжина, км'
          ,'Вимикаючий пункт'
          ,'№ опори, від якої здійснено відгалудження'
        );
   

procedure TfrmENBranch10Show.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBranch10Show:=nil;
    inherited;
  end;


procedure TfrmENBranch10Show.FormShow(Sender: TObject);
var
  TempENBranch10: ENBranch10ControllerSoapPort;
  i: Integer;
  ENBranch10List: ENBranch10ShortList;
  begin
  SetGridHeaders(ENBranch10Headers, sgENBranch10.ColumnHeaders);
  ColCount:=100;
  TempENBranch10 :=  HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBranch10Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBranch10List := TempENBranch10.getScrollableFilteredList(ENBranch10Filter(FilterObject),0,ColCount);


  LastCount:=High(ENBranch10List.list);

  if LastCount > -1 then
     sgENBranch10.RowCount:=LastCount+2
  else
     sgENBranch10.RowCount:=2;

  with sgENBranch10 do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBranch10List.list[i].code <> Low(Integer) then //Код
          Cells[0, i + 1] := IntToStr(ENBranch10List.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENBranch10List.list[i].name; //Напрямок
        if ENBranch10List.list[i].branchLength = nil then //Довжина, км
          Cells[2, i + 1] := ''
        else
          Cells[2, i + 1] :=
            ENBranch10List.list[i].branchLength.DecimalString;
        Cells[3, i + 1] := //Вимикаючий Пункт
          ENBranch10List.list[i].dispOffName;
        Cells[4, i + 1] := //Номер опори, від якої здійснено відгалудження
          ENBranch10List.list[i].postOutRefPostNumberGen;
        LastRow := i + 1;
        sgENBranch10.RowCount := LastRow + 1;
      end;
   ColCount:=ColCount+1;
   sgENBranch10.Row:=1;
end;

procedure TfrmENBranch10Show.sgENBranch10TopLeftChanged(Sender: TObject);
var
  TempENBranch10: ENBranch10ControllerSoapPort;
  i,CurrentRow: Integer;
  ENBranch10List: ENBranch10ShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBranch10.TopRow + sgENBranch10.VisibleRowCount) = ColCount
  then
    begin
      TempENBranch10 :=  HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;
      CurrentRow:=sgENBranch10.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBranch10Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBranch10List := TempENBranch10.getScrollableFilteredList(ENBranch10Filter(FilterObject),ColCount-1, 100);



  sgENBranch10.RowCount:=sgENBranch10.RowCount+100;
  LastCount:=High(ENBranch10List.list);
  with sgENBranch10 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBranch10List.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBranch10List.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENBranch10List.list[i].branchLength = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENBranch10List.list[i].branchLength.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBranch10.Row:=CurrentRow-5;
   sgENBranch10.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBranch10Show.sgENBranch10DblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBranch10,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBranch10Show.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBranch10.RowCount-1 do
   for j:=0 to sgENBranch10.ColCount-1 do
     sgENBranch10.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBranch10Show.actViewExecute(Sender: TObject);
Var TempENBranch10: ENBranch10ControllerSoapPort;
begin
 TempENBranch10 := HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;
   try
     ENBranch10Obj := TempENBranch10.getObject(StrToInt(sgENBranch10.Cells[0,sgENBranch10.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBranch10Edit:=TfrmENBranch10Edit.Create(Application, dsView);
  try
    frmENBranch10Edit.ShowModal;
  finally
    frmENBranch10Edit.Free;
    frmENBranch10Edit:=nil;
  end;
end;

procedure TfrmENBranch10Show.actEditExecute(Sender: TObject);
Var TempENBranch10: ENBranch10ControllerSoapPort;
begin
 TempENBranch10 := HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;
   try
     ENBranch10Obj := TempENBranch10.getObject(StrToInt(sgENBranch10.Cells[0,sgENBranch10.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBranch10Edit:=TfrmENBranch10Edit.Create(Application, dsEdit);
  try
    if frmENBranch10Edit.ShowModal= mrOk then
      begin
        //TempENBranch10.save(ENBranch10Obj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBranch10Edit.Free;
    frmENBranch10Edit:=nil;
  end;
end;

procedure TfrmENBranch10Show.actDeleteExecute(Sender: TObject);
Var TempENBranch10: ENBranch10ControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBranch10 := HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBranch10.Cells[0,sgENBranch10.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Відгалудження від ПЛ 6-10) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBranch10.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBranch10Show.actInsertExecute(Sender: TObject);
// Var TempENBranch10: ENBranch10ControllerSoapPort; 
begin
  // TempENBranch10 := HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBranch10Obj:=ENBranch10.Create;

   //ENBranch10Obj.branchLength:= TXSDecimal.Create;


  try
    frmENBranch10Edit:=TfrmENBranch10Edit.Create(Application, dsInsert);
    try
      if frmENBranch10Edit.ShowModal = mrOk then
      begin
        if ENBranch10Obj<>nil then
            //TempENBranch10.add(ENBranch10Obj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBranch10Edit.Free;
      frmENBranch10Edit:=nil;
    end;
  finally
    ENBranch10Obj.Free;
  end;
end;

procedure TfrmENBranch10Show.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBranch10Show.actFilterExecute(Sender: TObject);
begin
{frmENBranch10FilterEdit:=TfrmENBranch10FilterEdit.Create(Application, dsInsert);
  try
    ENBranch10FilterObj := ENBranch10Filter.Create;
    SetNullIntProps(ENBranch10FilterObj);
    SetNullXSProps(ENBranch10FilterObj);

    if frmENBranch10FilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBranch10Filter.Create;
      FilterObject := ENBranch10FilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBranch10FilterEdit.Free;
    frmENBranch10FilterEdit:=nil;
  end;}
end;

procedure TfrmENBranch10Show.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.