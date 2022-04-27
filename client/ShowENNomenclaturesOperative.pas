
unit ShowENNomenclaturesOperative;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENNomenclaturesOperativeController ;


type
  TfrmENNomenclaturesOperativeShow = class(TChildForm)  
  HTTPRIOENNomenclaturesOperative: THTTPRIO;
    ImageList1: TImageList;
    sgENNomenclaturesOperative: TAdvStringGrid;
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
procedure sgENNomenclaturesOperativeTopLeftChanged(Sender: TObject);
procedure sgENNomenclaturesOperativeDblClick(Sender: TObject);
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
 // ENNomenclaturesOperativeObj: ENNomenclaturesOperative;
 // ENNomenclaturesOperativeFilterObj: ENNomenclaturesOperativeFilter;
  
  
implementation

uses Main, EditENNomenclaturesOperative, EditENNomenclaturesOperativeFilter;


{$R *.dfm}

var
  //frmENNomenclaturesOperativeShow : TfrmENNomenclaturesOperativeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENNomenclaturesOperativeHeaders: array [1..5] of String =
        ( 'Код'
          ,'Код у ФК'
          ,'Номенклатурний номер матеріалу'
          ,'Назва матеріалу'
          ,'Бал. рахунок'
          //,'Користувач, який вніс зміни'
          //,'Дата зміни'
        );
   

procedure TfrmENNomenclaturesOperativeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENNomenclaturesOperativeShow:=nil;
    inherited;
  end;


procedure TfrmENNomenclaturesOperativeShow.FormShow(Sender: TObject);
var
  TempENNomenclaturesOperative: ENNomenclaturesOperativeControllerSoapPort;
  i: Integer;
  ENNomenclaturesOperativeList: ENNomenclaturesOperativeShortList;
begin
  SetGridHeaders(ENNomenclaturesOperativeHeaders, sgENNomenclaturesOperative.ColumnHeaders);

  // Не стоит заменять одну номенклатуру на другую - пусть добавляют новую/удаляют старую!
  DisableActions([actEdit]);

  ColCount:=100;
  TempENNomenclaturesOperative :=  HTTPRIOENNomenclaturesOperative as ENNomenclaturesOperativeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENNomenclaturesOperativeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENNomenclaturesOperativeList := TempENNomenclaturesOperative.getScrollableFilteredList(ENNomenclaturesOperativeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENNomenclaturesOperativeList.list);

  if LastCount > -1 then
     sgENNomenclaturesOperative.RowCount:=LastCount+2
  else
     sgENNomenclaturesOperative.RowCount:=2;

   with sgENNomenclaturesOperative do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENNomenclaturesOperativeList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENNomenclaturesOperativeList.list[i].code)
        else
          Cells[0,i+1] := '';
        if ENNomenclaturesOperativeList.list[i].id = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENNomenclaturesOperativeList.list[i].id);
        Cells[2,i+1] := ENNomenclaturesOperativeList.list[i].nn;
        Cells[3,i+1] := ENNomenclaturesOperativeList.list[i].name;
        Cells[4,i+1] := ENNomenclaturesOperativeList.list[i].bal_sch;
        {
        Cells[5,i+1] := ENNomenclaturesOperativeList.list[i].userGen;
        if ENNomenclaturesOperativeList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENNomenclaturesOperativeList.list[i].dateEdit);
        }
        LastRow:=i+1;
        sgENNomenclaturesOperative.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENNomenclaturesOperative.Row:=1;
end;

procedure TfrmENNomenclaturesOperativeShow.sgENNomenclaturesOperativeTopLeftChanged(Sender: TObject);
var
  TempENNomenclaturesOperative: ENNomenclaturesOperativeControllerSoapPort;
  i,CurrentRow: Integer;
  ENNomenclaturesOperativeList: ENNomenclaturesOperativeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENNomenclaturesOperative.TopRow + sgENNomenclaturesOperative.VisibleRowCount) = ColCount
  then
    begin
      TempENNomenclaturesOperative :=  HTTPRIOENNomenclaturesOperative as ENNomenclaturesOperativeControllerSoapPort;
      CurrentRow:=sgENNomenclaturesOperative.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENNomenclaturesOperativeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENNomenclaturesOperativeList := TempENNomenclaturesOperative.getScrollableFilteredList(ENNomenclaturesOperativeFilter(FilterObject),ColCount-1, 100);



  sgENNomenclaturesOperative.RowCount:=sgENNomenclaturesOperative.RowCount+100;
  LastCount:=High(ENNomenclaturesOperativeList.list);
  with sgENNomenclaturesOperative do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENNomenclaturesOperativeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENNomenclaturesOperativeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENNomenclaturesOperativeList.list[i].id = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(ENNomenclaturesOperativeList.list[i].id);
        Cells[2,i+CurrentRow] := ENNomenclaturesOperativeList.list[i].nn;
        Cells[3,i+CurrentRow] := ENNomenclaturesOperativeList.list[i].name;
        Cells[4,i+CurrentRow] := ENNomenclaturesOperativeList.list[i].bal_sch;
        {
        Cells[5,i+CurrentRow] := ENNomenclaturesOperativeList.list[i].userGen;
        if ENNomenclaturesOperativeList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENNomenclaturesOperativeList.list[i].dateEdit);
        }
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENNomenclaturesOperative.Row:=CurrentRow-5;
   sgENNomenclaturesOperative.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENNomenclaturesOperativeShow.sgENNomenclaturesOperativeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENNomenclaturesOperative,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENNomenclaturesOperativeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENNomenclaturesOperative.RowCount-1 do
   for j:=0 to sgENNomenclaturesOperative.ColCount-1 do
     sgENNomenclaturesOperative.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENNomenclaturesOperativeShow.actViewExecute(Sender: TObject);
Var TempENNomenclaturesOperative: ENNomenclaturesOperativeControllerSoapPort;
begin
 TempENNomenclaturesOperative := HTTPRIOENNomenclaturesOperative as ENNomenclaturesOperativeControllerSoapPort;
   try
     ENNomenclaturesOperativeObj := TempENNomenclaturesOperative.getObject(StrToInt(sgENNomenclaturesOperative.Cells[0,sgENNomenclaturesOperative.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENNomenclaturesOperativeEdit:=TfrmENNomenclaturesOperativeEdit.Create(Application, dsView);
  try
    frmENNomenclaturesOperativeEdit.ShowModal;
  finally
    frmENNomenclaturesOperativeEdit.Free;
    frmENNomenclaturesOperativeEdit:=nil;
  end;
end;

procedure TfrmENNomenclaturesOperativeShow.actEditExecute(Sender: TObject);
Var TempENNomenclaturesOperative: ENNomenclaturesOperativeControllerSoapPort;
begin
 TempENNomenclaturesOperative := HTTPRIOENNomenclaturesOperative as ENNomenclaturesOperativeControllerSoapPort;
   try
     ENNomenclaturesOperativeObj := TempENNomenclaturesOperative.getObject(StrToInt(sgENNomenclaturesOperative.Cells[0,sgENNomenclaturesOperative.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENNomenclaturesOperativeEdit:=TfrmENNomenclaturesOperativeEdit.Create(Application, dsEdit);
  try
    if frmENNomenclaturesOperativeEdit.ShowModal= mrOk then
      begin
        //TempENNomenclaturesOperative.save(ENNomenclaturesOperativeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENNomenclaturesOperativeEdit.Free;
    frmENNomenclaturesOperativeEdit:=nil;
  end;
end;

procedure TfrmENNomenclaturesOperativeShow.actDeleteExecute(Sender: TObject);
Var TempENNomenclaturesOperative: ENNomenclaturesOperativeControllerSoapPort;
    ObjCode: Integer;
begin
  TempENNomenclaturesOperative := HTTPRIOENNomenclaturesOperative as ENNomenclaturesOperativeControllerSoapPort;

  try
    ObjCode := StrToInt(sgENNomenclaturesOperative.Cells[0,sgENNomenclaturesOperative.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить запись ?'),
                            PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENNomenclaturesOperative.remove(ObjCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENNomenclaturesOperativeShow.actInsertExecute(Sender: TObject);
// Var TempENNomenclaturesOperative: ENNomenclaturesOperativeControllerSoapPort; 
begin
  // TempENNomenclaturesOperative := HTTPRIOENNomenclaturesOperative as ENNomenclaturesOperativeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENNomenclaturesOperativeObj:=ENNomenclaturesOperative.Create;

   //ENNomenclaturesOperativeObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENNomenclaturesOperativeEdit:=TfrmENNomenclaturesOperativeEdit.Create(Application, dsInsert);
    try
      if frmENNomenclaturesOperativeEdit.ShowModal = mrOk then
      begin
        if ENNomenclaturesOperativeObj<>nil then
            //TempENNomenclaturesOperative.add(ENNomenclaturesOperativeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENNomenclaturesOperativeEdit.Free;
      frmENNomenclaturesOperativeEdit:=nil;
    end;
  finally
    ENNomenclaturesOperativeObj.Free;
  end;
end;

procedure TfrmENNomenclaturesOperativeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENNomenclaturesOperativeShow.actFilterExecute(Sender: TObject);
begin
  frmENNomenclaturesOperativeFilterEdit := TfrmENNomenclaturesOperativeFilterEdit.Create(Application, dsInsert);
  try
    ENNomenclaturesOperativeFilterObj := ENNomenclaturesOperativeFilter.Create;
    SetNullIntProps(ENNomenclaturesOperativeFilterObj);
    SetNullXSProps(ENNomenclaturesOperativeFilterObj);

    if frmENNomenclaturesOperativeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENNomenclaturesOperativeFilter.Create;
      FilterObject := ENNomenclaturesOperativeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENNomenclaturesOperativeFilterEdit.Free;
    frmENNomenclaturesOperativeFilterEdit := nil;
  end;
end;

procedure TfrmENNomenclaturesOperativeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.