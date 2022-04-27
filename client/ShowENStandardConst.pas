
unit ShowENStandardConst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENStandardConstController ;


type
  TfrmENStandardConstShow = class(TChildForm)  
  HTTPRIOENStandardConst: THTTPRIO;
    ImageList1: TImageList;
    sgENStandardConst: TAdvStringGrid;
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
procedure sgENStandardConstTopLeftChanged(Sender: TObject);
procedure sgENStandardConstDblClick(Sender: TObject);
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
 // ENStandardConstObj: ENStandardConst;
 // ENStandardConstFilterObj: ENStandardConstFilter;
  
  
implementation

uses Main, EditENStandardConst, EditENStandardConstFilter;


{$R *.dfm}

var
  //frmENStandardConstShow : TfrmENStandardConstShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENStandardConstHeaders: array [1..6] of String =
        ( 'Код'
          ,'Найменування'
          ,'код запису'
          ,'Діючий (коеф.)'
          ,'Початок дії'
          ,'Кінець дії'
        );
   

procedure TfrmENStandardConstShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENStandardConstShow:=nil;
    inherited;
  end;


procedure TfrmENStandardConstShow.FormShow(Sender: TObject);
var
  TempENStandardConst: ENStandardConstControllerSoapPort;
  i: Integer;
  ENStandardConstList: ENStandardConstShortList;
  begin
  SetGridHeaders(ENStandardConstHeaders, sgENStandardConst.ColumnHeaders);
  ColCount:=100;
  TempENStandardConst :=  HTTPRIOENStandardConst as ENStandardConstControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENStandardConstFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENStandardConstList := TempENStandardConst.getScrollableFilteredList(ENStandardConstFilter(FilterObject),0,ColCount);


  LastCount:=High(ENStandardConstList.list);

  if LastCount > -1 then
     sgENStandardConst.RowCount:=LastCount+2
  else
     sgENStandardConst.RowCount:=2;

   with sgENStandardConst do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENStandardConstList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENStandardConstList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENStandardConstList.list[i].name;

        if ENStandardConstList.list[i].entryCode <> Low(Integer) then
          Cells[2,i+1] := IntToStr(ENStandardConstList.list[i].entryCode)
        else
          Cells[2,i+1] := '';

        if ENStandardConstList.list[i].entryValue = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENStandardConstList.list[i].entryValue.DecimalString;

        if ENStandardConstList.list[i].entryStartDate = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENStandardConstList.list[i].entryStartDate);

        if ENStandardConstList.list[i].entryEndDate = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENStandardConstList.list[i].entryEndDate);


        LastRow:=i+1;
        sgENStandardConst.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENStandardConst.Row:=1;
end;

procedure TfrmENStandardConstShow.sgENStandardConstTopLeftChanged(Sender: TObject);
var
  TempENStandardConst: ENStandardConstControllerSoapPort;
  i,CurrentRow: Integer;
  ENStandardConstList: ENStandardConstShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENStandardConst.TopRow + sgENStandardConst.VisibleRowCount) = ColCount
  then
    begin
      TempENStandardConst :=  HTTPRIOENStandardConst as ENStandardConstControllerSoapPort;
      CurrentRow:=sgENStandardConst.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENStandardConstFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENStandardConstList := TempENStandardConst.getScrollableFilteredList(ENStandardConstFilter(FilterObject),ColCount-1, 100);



  sgENStandardConst.RowCount:=sgENStandardConst.RowCount+100;
  LastCount:=High(ENStandardConstList.list);
  with sgENStandardConst do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENStandardConstList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENStandardConstList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENStandardConstList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENStandardConst.Row:=CurrentRow-5;
   sgENStandardConst.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENStandardConstShow.sgENStandardConstDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENStandardConst,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENStandardConstShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENStandardConst.RowCount-1 do
   for j:=0 to sgENStandardConst.ColCount-1 do
     sgENStandardConst.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENStandardConstShow.actViewExecute(Sender: TObject);
Var TempENStandardConst: ENStandardConstControllerSoapPort;
begin
 TempENStandardConst := HTTPRIOENStandardConst as ENStandardConstControllerSoapPort;
   try
     ENStandardConstObj := TempENStandardConst.getObject(StrToInt(sgENStandardConst.Cells[0,sgENStandardConst.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENStandardConstEdit:=TfrmENStandardConstEdit.Create(Application, dsView);
  try
    frmENStandardConstEdit.ShowModal;
  finally
    frmENStandardConstEdit.Free;
    frmENStandardConstEdit:=nil;
  end;
end;

procedure TfrmENStandardConstShow.actEditExecute(Sender: TObject);
Var TempENStandardConst: ENStandardConstControllerSoapPort;
begin
 TempENStandardConst := HTTPRIOENStandardConst as ENStandardConstControllerSoapPort;
   try
     ENStandardConstObj := TempENStandardConst.getObject(StrToInt(sgENStandardConst.Cells[0,sgENStandardConst.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENStandardConstEdit:=TfrmENStandardConstEdit.Create(Application, dsEdit);
  try
    if frmENStandardConstEdit.ShowModal= mrOk then
      begin
        //TempENStandardConst.save(ENStandardConstObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENStandardConstEdit.Free;
    frmENStandardConstEdit:=nil;
  end;
end;

procedure TfrmENStandardConstShow.actDeleteExecute(Sender: TObject);
Var TempENStandardConst: ENStandardConstControllerSoapPort;
  ObjCode: Integer;
begin
 TempENStandardConst := HTTPRIOENStandardConst as ENStandardConstControllerSoapPort;
   try
     ObjCode := StrToInt(sgENStandardConst.Cells[0,sgENStandardConst.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Довідник стандартних величин) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENStandardConst.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENStandardConstShow.actInsertExecute(Sender: TObject);
// Var TempENStandardConst: ENStandardConstControllerSoapPort; 
begin
  // TempENStandardConst := HTTPRIOENStandardConst as ENStandardConstControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENStandardConstObj:=ENStandardConst.Create;



  try
    frmENStandardConstEdit:=TfrmENStandardConstEdit.Create(Application, dsInsert);
    try
      if frmENStandardConstEdit.ShowModal = mrOk then
      begin
        if ENStandardConstObj<>nil then
            //TempENStandardConst.add(ENStandardConstObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENStandardConstEdit.Free;
      frmENStandardConstEdit:=nil;
    end;
  finally
    ENStandardConstObj.Free;
  end;
end;

procedure TfrmENStandardConstShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENStandardConstShow.actFilterExecute(Sender: TObject);
begin
{frmENStandardConstFilterEdit:=TfrmENStandardConstFilterEdit.Create(Application, dsInsert);
  try
    ENStandardConstFilterObj := ENStandardConstFilter.Create;
    SetNullIntProps(ENStandardConstFilterObj);
    SetNullXSProps(ENStandardConstFilterObj);

    if frmENStandardConstFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENStandardConstFilter.Create;
      FilterObject := ENStandardConstFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENStandardConstFilterEdit.Free;
    frmENStandardConstFilterEdit:=nil;
  end;}
end;

procedure TfrmENStandardConstShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.