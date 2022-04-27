
unit ShowENSubst150Separator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubst150SeparatorController ;


type
  TfrmENSubst150SeparatorShow = class(TChildForm)  
  HTTPRIOENSubst150Separator: THTTPRIO;
    ImageList1: TImageList;
    sgENSubst150Separator: TAdvStringGrid;
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
procedure sgENSubst150SeparatorTopLeftChanged(Sender: TObject);
procedure sgENSubst150SeparatorDblClick(Sender: TObject);
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
 // ENSubst150SeparatorObj: ENSubst150Separator;
 // ENSubst150SeparatorFilterObj: ENSubst150SeparatorFilter;
  
  
implementation

uses Main, EditENSubst150Separator, EditENSubst150SeparatorFilter;


{$R *.dfm}

var
  //frmENSubst150SeparatorShow : TfrmENSubst150SeparatorShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubst150SeparatorHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Номинальный ток, А'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );
   

procedure TfrmENSubst150SeparatorShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSubst150SeparatorShow:=nil;
    inherited;
  end;


procedure TfrmENSubst150SeparatorShow.FormShow(Sender: TObject);
var
  TempENSubst150Separator: ENSubst150SeparatorControllerSoapPort;
  i: Integer;
  ENSubst150SeparatorList: ENSubst150SeparatorShortList;
  begin
  SetGridHeaders(ENSubst150SeparatorHeaders, sgENSubst150Separator.ColumnHeaders);
  ColCount:=100;
  TempENSubst150Separator :=  HTTPRIOENSubst150Separator as ENSubst150SeparatorControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150SeparatorFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150SeparatorList := TempENSubst150Separator.getScrollableFilteredList(ENSubst150SeparatorFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSubst150SeparatorList.list);

  if LastCount > -1 then
     sgENSubst150Separator.RowCount:=LastCount+2
  else
     sgENSubst150Separator.RowCount:=2;

   with sgENSubst150Separator do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150SeparatorList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150SeparatorList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150SeparatorList.list[i].name;
        Cells[2,i+1] := ENSubst150SeparatorList.list[i].factoryNumber;
        if ENSubst150SeparatorList.list[i].currentNominal = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENSubst150SeparatorList.list[i].currentNominal.DecimalString;
        Cells[4,i+1] := ENSubst150SeparatorList.list[i].commentGen;
        Cells[5,i+1] := ENSubst150SeparatorList.list[i].userGen;
        LastRow:=i+1;
        sgENSubst150Separator.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSubst150Separator.Row:=1;
end;

procedure TfrmENSubst150SeparatorShow.sgENSubst150SeparatorTopLeftChanged(Sender: TObject);
var
  TempENSubst150Separator: ENSubst150SeparatorControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubst150SeparatorList: ENSubst150SeparatorShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSubst150Separator.TopRow + sgENSubst150Separator.VisibleRowCount) = ColCount
  then
    begin
      TempENSubst150Separator :=  HTTPRIOENSubst150Separator as ENSubst150SeparatorControllerSoapPort;
      CurrentRow:=sgENSubst150Separator.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150SeparatorFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150SeparatorList := TempENSubst150Separator.getScrollableFilteredList(ENSubst150SeparatorFilter(FilterObject),ColCount-1, 100);



  sgENSubst150Separator.RowCount:=sgENSubst150Separator.RowCount+100;
  LastCount:=High(ENSubst150SeparatorList.list);
  with sgENSubst150Separator do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150SeparatorList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubst150SeparatorList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubst150SeparatorList.list[i].name;
        Cells[2,i+CurrentRow] := ENSubst150SeparatorList.list[i].factoryNumber;
        if ENSubst150SeparatorList.list[i].currentNominal = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENSubst150SeparatorList.list[i].currentNominal.DecimalString;
        Cells[4,i+CurrentRow] := ENSubst150SeparatorList.list[i].commentGen;
        Cells[5,i+CurrentRow] := ENSubst150SeparatorList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSubst150Separator.Row:=CurrentRow-5;
   sgENSubst150Separator.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSubst150SeparatorShow.sgENSubst150SeparatorDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSubst150Separator,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSubst150SeparatorShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubst150Separator.RowCount-1 do
   for j:=0 to sgENSubst150Separator.ColCount-1 do
     sgENSubst150Separator.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubst150SeparatorShow.actViewExecute(Sender: TObject);
Var TempENSubst150Separator: ENSubst150SeparatorControllerSoapPort;
begin
 TempENSubst150Separator := HTTPRIOENSubst150Separator as ENSubst150SeparatorControllerSoapPort;
   try
     ENSubst150SeparatorObj := TempENSubst150Separator.getObject(StrToInt(sgENSubst150Separator.Cells[0,sgENSubst150Separator.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150SeparatorEdit:=TfrmENSubst150SeparatorEdit.Create(Application, dsView);
  try
    frmENSubst150SeparatorEdit.ShowModal;
  finally
    frmENSubst150SeparatorEdit.Free;
    frmENSubst150SeparatorEdit:=nil;
  end;
end;

procedure TfrmENSubst150SeparatorShow.actEditExecute(Sender: TObject);
Var TempENSubst150Separator: ENSubst150SeparatorControllerSoapPort;
begin
 TempENSubst150Separator := HTTPRIOENSubst150Separator as ENSubst150SeparatorControllerSoapPort;
   try
     ENSubst150SeparatorObj := TempENSubst150Separator.getObject(StrToInt(sgENSubst150Separator.Cells[0,sgENSubst150Separator.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150SeparatorEdit:=TfrmENSubst150SeparatorEdit.Create(Application, dsEdit);
  try
    if frmENSubst150SeparatorEdit.ShowModal= mrOk then
      begin
        //TempENSubst150Separator.save(ENSubst150SeparatorObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubst150SeparatorEdit.Free;
    frmENSubst150SeparatorEdit:=nil;
  end;
end;

procedure TfrmENSubst150SeparatorShow.actDeleteExecute(Sender: TObject);
Var TempENSubst150Separator: ENSubst150SeparatorControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubst150Separator := HTTPRIOENSubst150Separator as ENSubst150SeparatorControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubst150Separator.Cells[0,sgENSubst150Separator.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Отделители) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubst150Separator.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubst150SeparatorShow.actInsertExecute(Sender: TObject);
// Var TempENSubst150Separator: ENSubst150SeparatorControllerSoapPort; 
begin
  // TempENSubst150Separator := HTTPRIOENSubst150Separator as ENSubst150SeparatorControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSubst150SeparatorObj:=ENSubst150Separator.Create;

   //ENSubst150SeparatorObj.currentNominal:= TXSDecimal.Create;
   //ENSubst150SeparatorObj.dateEdit:= TXSDate.Create;


  try
    frmENSubst150SeparatorEdit:=TfrmENSubst150SeparatorEdit.Create(Application, dsInsert);
    try
      if frmENSubst150SeparatorEdit.ShowModal = mrOk then
      begin
        if ENSubst150SeparatorObj<>nil then
            //TempENSubst150Separator.add(ENSubst150SeparatorObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubst150SeparatorEdit.Free;
      frmENSubst150SeparatorEdit:=nil;
    end;
  finally
    ENSubst150SeparatorObj.Free;
  end;
end;

procedure TfrmENSubst150SeparatorShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubst150SeparatorShow.actFilterExecute(Sender: TObject);
begin
{frmENSubst150SeparatorFilterEdit:=TfrmENSubst150SeparatorFilterEdit.Create(Application, dsInsert);
  try
    ENSubst150SeparatorFilterObj := ENSubst150SeparatorFilter.Create;
    SetNullIntProps(ENSubst150SeparatorFilterObj);
    SetNullXSProps(ENSubst150SeparatorFilterObj);

    if frmENSubst150SeparatorFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubst150SeparatorFilter.Create;
      FilterObject := ENSubst150SeparatorFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubst150SeparatorFilterEdit.Free;
    frmENSubst150SeparatorFilterEdit:=nil;
  end;}
end;

procedure TfrmENSubst150SeparatorShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.