
unit ShowENConnectionTariffEntry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENConnectionTariffEntryController ;


type
  TfrmENConnectionTariffEntryShow = class(TChildForm)  
  HTTPRIOENConnectionTariffEntry: THTTPRIO;
    ImageList1: TImageList;
    sgENConnectionTariffEntry: TAdvStringGrid;
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
procedure sgENConnectionTariffEntryTopLeftChanged(Sender: TObject);
procedure sgENConnectionTariffEntryDblClick(Sender: TObject);
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
 // ENConnectionTariffEntryObj: ENConnectionTariffEntry;
 // ENConnectionTariffEntryFilterObj: ENConnectionTariffEntryFilter;
  
  
implementation

uses Main, EditENConnectionTariffEntry, EditENConnectionTariffEntryFilter;


{$R *.dfm}

var
  //frmENConnectionTariffEntryShow : TfrmENConnectionTariffEntryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConnectionTariffEntryHeaders: array [1..4] of String =
        ( 'Код'
          ,'Ставка (тис. грн/1 кВт)'
          ,'Дата початку дії'
          ,'Користувач, який вніс зміни'
        );
   

procedure TfrmENConnectionTariffEntryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENConnectionTariffEntryShow:=nil;
    inherited;
  end;


procedure TfrmENConnectionTariffEntryShow.FormShow(Sender: TObject);
var
  TempENConnectionTariffEntry: ENConnectionTariffEntryControllerSoapPort;
  i: Integer;
  ENConnectionTariffEntryList: ENConnectionTariffEntryShortList;
  begin
  SetGridHeaders(ENConnectionTariffEntryHeaders, sgENConnectionTariffEntry.ColumnHeaders);
  ColCount:=100;
  TempENConnectionTariffEntry :=  HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionTariffEntryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionTariffEntryList := TempENConnectionTariffEntry.getScrollableFilteredList(ENConnectionTariffEntryFilter(FilterObject),0,ColCount);


  LastCount:=High(ENConnectionTariffEntryList.list);

  if LastCount > -1 then
     sgENConnectionTariffEntry.RowCount:=LastCount+2
  else
     sgENConnectionTariffEntry.RowCount:=2;

   with sgENConnectionTariffEntry do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionTariffEntryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENConnectionTariffEntryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENConnectionTariffEntryList.list[i].value = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENConnectionTariffEntryList.list[i].value.DecimalString;
        if ENConnectionTariffEntryList.list[i].startDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENConnectionTariffEntryList.list[i].startDate);
        Cells[3,i+1] := ENConnectionTariffEntryList.list[i].userGen;
        LastRow:=i+1;
        sgENConnectionTariffEntry.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENConnectionTariffEntry.Row:=1;
end;

procedure TfrmENConnectionTariffEntryShow.sgENConnectionTariffEntryTopLeftChanged(Sender: TObject);
var
  TempENConnectionTariffEntry: ENConnectionTariffEntryControllerSoapPort;
  i,CurrentRow: Integer;
  ENConnectionTariffEntryList: ENConnectionTariffEntryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENConnectionTariffEntry.TopRow + sgENConnectionTariffEntry.VisibleRowCount) = ColCount
  then
    begin
      TempENConnectionTariffEntry :=  HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;
      CurrentRow:=sgENConnectionTariffEntry.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionTariffEntryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionTariffEntryList := TempENConnectionTariffEntry.getScrollableFilteredList(ENConnectionTariffEntryFilter(FilterObject),ColCount-1, 100);



  sgENConnectionTariffEntry.RowCount:=sgENConnectionTariffEntry.RowCount+100;
  LastCount:=High(ENConnectionTariffEntryList.list);
  with sgENConnectionTariffEntry do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionTariffEntryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENConnectionTariffEntryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENConnectionTariffEntryList.list[i].value = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENConnectionTariffEntryList.list[i].value.DecimalString;
        if ENConnectionTariffEntryList.list[i].startDate = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENConnectionTariffEntryList.list[i].startDate);
        Cells[3,i+CurrentRow] := ENConnectionTariffEntryList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENConnectionTariffEntry.Row:=CurrentRow-5;
   sgENConnectionTariffEntry.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENConnectionTariffEntryShow.sgENConnectionTariffEntryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENConnectionTariffEntry,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENConnectionTariffEntryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENConnectionTariffEntry.RowCount-1 do
   for j:=0 to sgENConnectionTariffEntry.ColCount-1 do
     sgENConnectionTariffEntry.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENConnectionTariffEntryShow.actViewExecute(Sender: TObject);
Var TempENConnectionTariffEntry: ENConnectionTariffEntryControllerSoapPort;
begin
 TempENConnectionTariffEntry := HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;
   try
     ENConnectionTariffEntryObj := TempENConnectionTariffEntry.getObject(StrToInt(sgENConnectionTariffEntry.Cells[0,sgENConnectionTariffEntry.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENConnectionTariffEntryEdit:=TfrmENConnectionTariffEntryEdit.Create(Application, dsView);
  try
    frmENConnectionTariffEntryEdit.ShowModal;
  finally
    frmENConnectionTariffEntryEdit.Free;
    frmENConnectionTariffEntryEdit:=nil;
  end;
end;

procedure TfrmENConnectionTariffEntryShow.actEditExecute(Sender: TObject);
Var TempENConnectionTariffEntry: ENConnectionTariffEntryControllerSoapPort;
begin
 TempENConnectionTariffEntry := HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;
   try
     ENConnectionTariffEntryObj := TempENConnectionTariffEntry.getObject(StrToInt(sgENConnectionTariffEntry.Cells[0,sgENConnectionTariffEntry.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENConnectionTariffEntryEdit:=TfrmENConnectionTariffEntryEdit.Create(Application, dsEdit);
  try
    if frmENConnectionTariffEntryEdit.ShowModal= mrOk then
      begin
        //TempENConnectionTariffEntry.save(ENConnectionTariffEntryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENConnectionTariffEntryEdit.Free;
    frmENConnectionTariffEntryEdit:=nil;
  end;
end;

procedure TfrmENConnectionTariffEntryShow.actDeleteExecute(Sender: TObject);
Var TempENConnectionTariffEntry: ENConnectionTariffEntryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENConnectionTariffEntry := HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENConnectionTariffEntry.Cells[0,sgENConnectionTariffEntry.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Значення ставок плати за стандартне приєднання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConnectionTariffEntry.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConnectionTariffEntryShow.actInsertExecute(Sender: TObject);
// Var TempENConnectionTariffEntry: ENConnectionTariffEntryControllerSoapPort; 
begin
  // TempENConnectionTariffEntry := HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENConnectionTariffEntryObj:=ENConnectionTariffEntry.Create;

   //ENConnectionTariffEntryObj.value:= TXSDecimal.Create;
   //ENConnectionTariffEntryObj.startDate:= TXSDate.Create;


  try
    frmENConnectionTariffEntryEdit:=TfrmENConnectionTariffEntryEdit.Create(Application, dsInsert);
    try
      if frmENConnectionTariffEntryEdit.ShowModal = mrOk then
      begin
        if ENConnectionTariffEntryObj<>nil then
            //TempENConnectionTariffEntry.add(ENConnectionTariffEntryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENConnectionTariffEntryEdit.Free;
      frmENConnectionTariffEntryEdit:=nil;
    end;
  finally
    ENConnectionTariffEntryObj.Free;
  end;
end;

procedure TfrmENConnectionTariffEntryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENConnectionTariffEntryShow.actFilterExecute(Sender: TObject);
begin
{frmENConnectionTariffEntryFilterEdit:=TfrmENConnectionTariffEntryFilterEdit.Create(Application, dsInsert);
  try
    ENConnectionTariffEntryFilterObj := ENConnectionTariffEntryFilter.Create;
    SetNullIntProps(ENConnectionTariffEntryFilterObj);
    SetNullXSProps(ENConnectionTariffEntryFilterObj);

    if frmENConnectionTariffEntryFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENConnectionTariffEntryFilter.Create;
      FilterObject := ENConnectionTariffEntryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENConnectionTariffEntryFilterEdit.Free;
    frmENConnectionTariffEntryFilterEdit:=nil;
  end;}
end;

procedure TfrmENConnectionTariffEntryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.