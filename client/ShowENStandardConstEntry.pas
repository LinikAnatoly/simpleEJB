
unit ShowENStandardConstEntry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENStandardConstEntryController, AdvObj ;


type
  TfrmENStandardConstEntryShow = class(TChildForm)  
  HTTPRIOENStandardConstEntry: THTTPRIO;
    ImageList1: TImageList;
    sgENStandardConstEntry: TAdvStringGrid;
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
procedure sgENStandardConstEntryTopLeftChanged(Sender: TObject);
procedure sgENStandardConstEntryDblClick(Sender: TObject);
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
 // ENStandardConstEntryObj: ENStandardConstEntry;
 // ENStandardConstEntryFilterObj: ENStandardConstEntryFilter;
  
  
implementation

uses Main, EditENStandardConstEntry, EditENStandardConstEntryFilter;


{$R *.dfm}

var
  //frmENStandardConstEntryShow : TfrmENStandardConstEntryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENStandardConstEntryHeaders: array [1..4] of String =
        ( 'Код'
          ,'Значення (коеф.)'
          ,'Початок дії'
          ,'Кінець дії'
        );
   

procedure TfrmENStandardConstEntryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENStandardConstEntryShow:=nil;
    inherited;
  end;


procedure TfrmENStandardConstEntryShow.FormShow(Sender: TObject);
var
  TempENStandardConstEntry: ENStandardConstEntryControllerSoapPort;
  i: Integer;
  ENStandardConstEntryList: ENStandardConstEntryShortList;
  begin
  SetGridHeaders(ENStandardConstEntryHeaders, sgENStandardConstEntry.ColumnHeaders);
  ColCount:=100;
  TempENStandardConstEntry :=  HTTPRIOENStandardConstEntry as ENStandardConstEntryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENStandardConstEntryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENStandardConstEntryList := TempENStandardConstEntry.getScrollableFilteredList(ENStandardConstEntryFilter(FilterObject),0,ColCount);


  LastCount:=High(ENStandardConstEntryList.list);

  if LastCount > -1 then
     sgENStandardConstEntry.RowCount:=LastCount+2
  else
     sgENStandardConstEntry.RowCount:=2;

   with sgENStandardConstEntry do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENStandardConstEntryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENStandardConstEntryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENStandardConstEntryList.list[i].constEntry = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENStandardConstEntryList.list[i].constEntry.DecimalString;
        if ENStandardConstEntryList.list[i].startDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENStandardConstEntryList.list[i].startDate);
        if ENStandardConstEntryList.list[i].endDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENStandardConstEntryList.list[i].endDate);
        LastRow:=i+1;
        sgENStandardConstEntry.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENStandardConstEntry.Row:=1;
end;

procedure TfrmENStandardConstEntryShow.sgENStandardConstEntryTopLeftChanged(Sender: TObject);
var
  TempENStandardConstEntry: ENStandardConstEntryControllerSoapPort;
  i,CurrentRow: Integer;
  ENStandardConstEntryList: ENStandardConstEntryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENStandardConstEntry.TopRow + sgENStandardConstEntry.VisibleRowCount) = ColCount
  then
    begin
      TempENStandardConstEntry :=  HTTPRIOENStandardConstEntry as ENStandardConstEntryControllerSoapPort;
      CurrentRow:=sgENStandardConstEntry.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENStandardConstEntryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENStandardConstEntryList := TempENStandardConstEntry.getScrollableFilteredList(ENStandardConstEntryFilter(FilterObject),ColCount-1, 100);



  sgENStandardConstEntry.RowCount:=sgENStandardConstEntry.RowCount+100;
  LastCount:=High(ENStandardConstEntryList.list);
  with sgENStandardConstEntry do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENStandardConstEntryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENStandardConstEntryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENStandardConstEntryList.list[i].constEntry = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENStandardConstEntryList.list[i].constEntry.DecimalString;
        if ENStandardConstEntryList.list[i].startDate = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENStandardConstEntryList.list[i].startDate);
        if ENStandardConstEntryList.list[i].endDate = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENStandardConstEntryList.list[i].endDate);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENStandardConstEntry.Row:=CurrentRow-5;
   sgENStandardConstEntry.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENStandardConstEntryShow.sgENStandardConstEntryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENStandardConstEntry,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENStandardConstEntryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENStandardConstEntry.RowCount-1 do
   for j:=0 to sgENStandardConstEntry.ColCount-1 do
     sgENStandardConstEntry.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENStandardConstEntryShow.actViewExecute(Sender: TObject);
Var TempENStandardConstEntry: ENStandardConstEntryControllerSoapPort;
begin
 TempENStandardConstEntry := HTTPRIOENStandardConstEntry as ENStandardConstEntryControllerSoapPort;
   try
     ENStandardConstEntryObj := TempENStandardConstEntry.getObject(StrToInt(sgENStandardConstEntry.Cells[0,sgENStandardConstEntry.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENStandardConstEntryEdit:=TfrmENStandardConstEntryEdit.Create(Application, dsView);
  try
    frmENStandardConstEntryEdit.ShowModal;
  finally
    frmENStandardConstEntryEdit.Free;
    frmENStandardConstEntryEdit:=nil;
  end;
end;

procedure TfrmENStandardConstEntryShow.actEditExecute(Sender: TObject);
Var TempENStandardConstEntry: ENStandardConstEntryControllerSoapPort;
begin
 TempENStandardConstEntry := HTTPRIOENStandardConstEntry as ENStandardConstEntryControllerSoapPort;
   try
     ENStandardConstEntryObj := TempENStandardConstEntry.getObject(StrToInt(sgENStandardConstEntry.Cells[0,sgENStandardConstEntry.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENStandardConstEntryEdit:=TfrmENStandardConstEntryEdit.Create(Application, dsEdit);
  try
    if frmENStandardConstEntryEdit.ShowModal= mrOk then
      begin
        //TempENStandardConstEntry.save(ENStandardConstEntryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENStandardConstEntryEdit.Free;
    frmENStandardConstEntryEdit:=nil;
  end;
end;

procedure TfrmENStandardConstEntryShow.actDeleteExecute(Sender: TObject);
Var TempENStandardConstEntry: ENStandardConstEntryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENStandardConstEntry := HTTPRIOENStandardConstEntry as ENStandardConstEntryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENStandardConstEntry.Cells[0,sgENStandardConstEntry.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Значення стандартних величин) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENStandardConstEntry.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENStandardConstEntryShow.actInsertExecute(Sender: TObject);
// Var TempENStandardConstEntry: ENStandardConstEntryControllerSoapPort; 
begin
  // TempENStandardConstEntry := HTTPRIOENStandardConstEntry as ENStandardConstEntryControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENStandardConstEntryObj:=ENStandardConstEntry.Create;

   //ENStandardConstEntryObj.ConstEntry:= TXSDecimal.Create;
   //ENStandardConstEntryObj.startDate:= TXSDate.Create;
   //ENStandardConstEntryObj.endDate:= TXSDate.Create;


  try
    frmENStandardConstEntryEdit:=TfrmENStandardConstEntryEdit.Create(Application, dsInsert);
    try
      if frmENStandardConstEntryEdit.ShowModal = mrOk then
      begin
        if ENStandardConstEntryObj<>nil then
            //TempENStandardConstEntry.add(ENStandardConstEntryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENStandardConstEntryEdit.Free;
      frmENStandardConstEntryEdit:=nil;
    end;
  finally
    ENStandardConstEntryObj.Free;
  end;
end;

procedure TfrmENStandardConstEntryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENStandardConstEntryShow.actFilterExecute(Sender: TObject);
begin
{frmENStandardConstEntryFilterEdit:=TfrmENStandardConstEntryFilterEdit.Create(Application, dsInsert);
  try
    ENStandardConstEntryFilterObj := ENStandardConstEntryFilter.Create;
    SetNullIntProps(ENStandardConstEntryFilterObj);
    SetNullXSProps(ENStandardConstEntryFilterObj);

    if frmENStandardConstEntryFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENStandardConstEntryFilter.Create;
      FilterObject := ENStandardConstEntryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENStandardConstEntryFilterEdit.Free;
    frmENStandardConstEntryFilterEdit:=nil;
  end;}
end;

procedure TfrmENStandardConstEntryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.