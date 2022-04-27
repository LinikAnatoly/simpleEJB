
unit ShowENBranch2Customer04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBranch2Customer04Controller ;


type
  TfrmENBranch2Customer04Show = class(TChildForm)  
  HTTPRIOENBranch2Customer04: THTTPRIO;
    ImageList1: TImageList;
    sgENBranch2Customer04: TAdvStringGrid;
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
procedure sgENBranch2Customer04TopLeftChanged(Sender: TObject);
procedure sgENBranch2Customer04DblClick(Sender: TObject);
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
 // ENBranch2Customer04Obj: ENBranch2Customer04;
 // ENBranch2Customer04FilterObj: ENBranch2Customer04Filter;
  
  
implementation

uses Main, EditENBranch2Customer04, EditENBranch2Customer04Filter;


{$R *.dfm}

var
  //frmENBranch2Customer04Show : TfrmENBranch2Customer04Show;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBranch2Customer04Headers: array [1..3] of String =
        ( 'Код'
          ,'Название связи присоединения 0,4 кВ с потребителем'
          ,'Ток установленного по договору присоединения автомата, А'
        );
   

procedure TfrmENBranch2Customer04Show.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBranch2Customer04Show:=nil;
    inherited;
  end;


procedure TfrmENBranch2Customer04Show.FormShow(Sender: TObject);
var
  TempENBranch2Customer04: ENBranch2Customer04ControllerSoapPort;
  i: Integer;
  ENBranch2Customer04List: ENBranch2Customer04ShortList;
begin
  SetGridHeaders(ENBranch2Customer04Headers, sgENBranch2Customer04.ColumnHeaders);
  ColCount:=100;
  TempENBranch2Customer04 :=  HTTPRIOENBranch2Customer04 as ENBranch2Customer04ControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBranch2Customer04Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBranch2Customer04List := TempENBranch2Customer04.getScrollableFilteredList(ENBranch2Customer04Filter(FilterObject),0,ColCount);


  LastCount:=High(ENBranch2Customer04List.list);

  if LastCount > -1 then
     sgENBranch2Customer04.RowCount:=LastCount+2
  else
     sgENBranch2Customer04.RowCount:=2;

   with sgENBranch2Customer04 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBranch2Customer04List.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBranch2Customer04List.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBranch2Customer04List.list[i].name;
        if ENBranch2Customer04List.list[i].currentAutomat = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENBranch2Customer04List.list[i].currentAutomat.DecimalString;
        LastRow:=i+1;
        sgENBranch2Customer04.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENBranch2Customer04.Row:=1;
end;

procedure TfrmENBranch2Customer04Show.sgENBranch2Customer04TopLeftChanged(Sender: TObject);
var
  TempENBranch2Customer04: ENBranch2Customer04ControllerSoapPort;
  i,CurrentRow: Integer;
  ENBranch2Customer04List: ENBranch2Customer04ShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBranch2Customer04.TopRow + sgENBranch2Customer04.VisibleRowCount) = ColCount
  then
    begin
      TempENBranch2Customer04 :=  HTTPRIOENBranch2Customer04 as ENBranch2Customer04ControllerSoapPort;
      CurrentRow:=sgENBranch2Customer04.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBranch2Customer04Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBranch2Customer04List := TempENBranch2Customer04.getScrollableFilteredList(ENBranch2Customer04Filter(FilterObject),ColCount-1, 100);



  sgENBranch2Customer04.RowCount:=sgENBranch2Customer04.RowCount+100;
  LastCount:=High(ENBranch2Customer04List.list);
  with sgENBranch2Customer04 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBranch2Customer04List.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBranch2Customer04List.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBranch2Customer04List.list[i].name;
        if ENBranch2Customer04List.list[i].currentAutomat = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENBranch2Customer04List.list[i].currentAutomat.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBranch2Customer04.Row:=CurrentRow-5;
   sgENBranch2Customer04.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBranch2Customer04Show.sgENBranch2Customer04DblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBranch2Customer04,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBranch2Customer04Show.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBranch2Customer04.RowCount-1 do
   for j:=0 to sgENBranch2Customer04.ColCount-1 do
     sgENBranch2Customer04.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBranch2Customer04Show.actViewExecute(Sender: TObject);
Var TempENBranch2Customer04: ENBranch2Customer04ControllerSoapPort;
begin
 TempENBranch2Customer04 := HTTPRIOENBranch2Customer04 as ENBranch2Customer04ControllerSoapPort;
   try
     ENBranch2Customer04Obj := TempENBranch2Customer04.getObject(StrToInt(sgENBranch2Customer04.Cells[0,sgENBranch2Customer04.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBranch2Customer04Edit:=TfrmENBranch2Customer04Edit.Create(Application, dsView);
  try
    frmENBranch2Customer04Edit.ShowModal;
  finally
    frmENBranch2Customer04Edit.Free;
    frmENBranch2Customer04Edit:=nil;
  end;
end;

procedure TfrmENBranch2Customer04Show.actEditExecute(Sender: TObject);
Var TempENBranch2Customer04: ENBranch2Customer04ControllerSoapPort;
begin
 TempENBranch2Customer04 := HTTPRIOENBranch2Customer04 as ENBranch2Customer04ControllerSoapPort;
   try
     ENBranch2Customer04Obj := TempENBranch2Customer04.getObject(StrToInt(sgENBranch2Customer04.Cells[0,sgENBranch2Customer04.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBranch2Customer04Edit:=TfrmENBranch2Customer04Edit.Create(Application, dsEdit);
  try
    if frmENBranch2Customer04Edit.ShowModal= mrOk then
      begin
        //TempENBranch2Customer04.save(ENBranch2Customer04Obj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBranch2Customer04Edit.Free;
    frmENBranch2Customer04Edit:=nil;
  end;
end;

procedure TfrmENBranch2Customer04Show.actDeleteExecute(Sender: TObject);
Var TempENBranch2Customer04: ENBranch2Customer04ControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBranch2Customer04 := HTTPRIOENBranch2Customer04 as ENBranch2Customer04ControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBranch2Customer04.Cells[0,sgENBranch2Customer04.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связь потребителей с присоединениями 0,4 кВ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBranch2Customer04.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBranch2Customer04Show.actInsertExecute(Sender: TObject);
// Var TempENBranch2Customer04: ENBranch2Customer04ControllerSoapPort; 
begin
  // TempENBranch2Customer04 := HTTPRIOENBranch2Customer04 as ENBranch2Customer04ControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBranch2Customer04Obj:=ENBranch2Customer04.Create;

   //ENBranch2Customer04Obj.currentAutomat:= TXSDecimal.Create;


  try
    frmENBranch2Customer04Edit:=TfrmENBranch2Customer04Edit.Create(Application, dsInsert);
    try
      if frmENBranch2Customer04Edit.ShowModal = mrOk then
      begin
        if ENBranch2Customer04Obj<>nil then
            //TempENBranch2Customer04.add(ENBranch2Customer04Obj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBranch2Customer04Edit.Free;
      frmENBranch2Customer04Edit:=nil;
    end;
  finally
    ENBranch2Customer04Obj.Free;
  end;
end;

procedure TfrmENBranch2Customer04Show.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBranch2Customer04Show.actFilterExecute(Sender: TObject);
begin
{frmENBranch2Customer04FilterEdit:=TfrmENBranch2Customer04FilterEdit.Create(Application, dsInsert);
  try
    ENBranch2Customer04FilterObj := ENBranch2Customer04Filter.Create;
    SetNullIntProps(ENBranch2Customer04FilterObj);
    SetNullXSProps(ENBranch2Customer04FilterObj);

    if frmENBranch2Customer04FilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBranch2Customer04Filter.Create;
      FilterObject := ENBranch2Customer04FilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBranch2Customer04FilterEdit.Free;
    frmENBranch2Customer04FilterEdit:=nil;
  end;}
end;

procedure TfrmENBranch2Customer04Show.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.