
unit ShowENSubst150Switch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubst150SwitchController ;


type
  TfrmENSubst150SwitchShow = class(TChildForm)  
  HTTPRIOENSubst150Switch: THTTPRIO;
    ImageList1: TImageList;
    sgENSubst150Switch: TAdvStringGrid;
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
procedure sgENSubst150SwitchTopLeftChanged(Sender: TObject);
procedure sgENSubst150SwitchDblClick(Sender: TObject);
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
 // ENSubst150SwitchObj: ENSubst150Switch;
 // ENSubst150SwitchFilterObj: ENSubst150SwitchFilter;
  
  
implementation

uses Main, EditENSubst150Switch, EditENSubst150SwitchFilter;


{$R *.dfm}

var
  //frmENSubst150SwitchShow : TfrmENSubst150SwitchShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubst150SwitchHeaders: array [1..7] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Номинальный ток, А'
          ,'Ток отключения, кА'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );
   

procedure TfrmENSubst150SwitchShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSubst150SwitchShow:=nil;
    inherited;
  end;


procedure TfrmENSubst150SwitchShow.FormShow(Sender: TObject);
var
  TempENSubst150Switch: ENSubst150SwitchControllerSoapPort;
  i: Integer;
  ENSubst150SwitchList: ENSubst150SwitchShortList;
  begin
  SetGridHeaders(ENSubst150SwitchHeaders, sgENSubst150Switch.ColumnHeaders);
  ColCount:=100;
  TempENSubst150Switch :=  HTTPRIOENSubst150Switch as ENSubst150SwitchControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150SwitchFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150SwitchList := TempENSubst150Switch.getScrollableFilteredList(ENSubst150SwitchFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSubst150SwitchList.list);

  if LastCount > -1 then
     sgENSubst150Switch.RowCount:=LastCount+2
  else
     sgENSubst150Switch.RowCount:=2;

   with sgENSubst150Switch do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150SwitchList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150SwitchList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150SwitchList.list[i].name;
        Cells[2,i+1] := ENSubst150SwitchList.list[i].factoryNumber;
        if ENSubst150SwitchList.list[i].currentNominal = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENSubst150SwitchList.list[i].currentNominal.DecimalString;
        if ENSubst150SwitchList.list[i].currentDisconnection = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENSubst150SwitchList.list[i].currentDisconnection.DecimalString;
        Cells[5,i+1] := ENSubst150SwitchList.list[i].commentGen;
        Cells[6,i+1] := ENSubst150SwitchList.list[i].userGen;
        LastRow:=i+1;
        sgENSubst150Switch.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSubst150Switch.Row:=1;
end;

procedure TfrmENSubst150SwitchShow.sgENSubst150SwitchTopLeftChanged(Sender: TObject);
var
  TempENSubst150Switch: ENSubst150SwitchControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubst150SwitchList: ENSubst150SwitchShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSubst150Switch.TopRow + sgENSubst150Switch.VisibleRowCount) = ColCount
  then
    begin
      TempENSubst150Switch :=  HTTPRIOENSubst150Switch as ENSubst150SwitchControllerSoapPort;
      CurrentRow:=sgENSubst150Switch.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150SwitchFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150SwitchList := TempENSubst150Switch.getScrollableFilteredList(ENSubst150SwitchFilter(FilterObject),ColCount-1, 100);



  sgENSubst150Switch.RowCount:=sgENSubst150Switch.RowCount+100;
  LastCount:=High(ENSubst150SwitchList.list);
  with sgENSubst150Switch do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150SwitchList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubst150SwitchList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubst150SwitchList.list[i].name;
        Cells[2,i+CurrentRow] := ENSubst150SwitchList.list[i].factoryNumber;
        if ENSubst150SwitchList.list[i].currentNominal = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENSubst150SwitchList.list[i].currentNominal.DecimalString;
        if ENSubst150SwitchList.list[i].currentDisconnection = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENSubst150SwitchList.list[i].currentDisconnection.DecimalString;
        Cells[5,i+CurrentRow] := ENSubst150SwitchList.list[i].commentGen;
        Cells[6,i+CurrentRow] := ENSubst150SwitchList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSubst150Switch.Row:=CurrentRow-5;
   sgENSubst150Switch.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSubst150SwitchShow.sgENSubst150SwitchDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSubst150Switch,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSubst150SwitchShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubst150Switch.RowCount-1 do
   for j:=0 to sgENSubst150Switch.ColCount-1 do
     sgENSubst150Switch.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubst150SwitchShow.actViewExecute(Sender: TObject);
Var TempENSubst150Switch: ENSubst150SwitchControllerSoapPort;
begin
 TempENSubst150Switch := HTTPRIOENSubst150Switch as ENSubst150SwitchControllerSoapPort;
   try
     ENSubst150SwitchObj := TempENSubst150Switch.getObject(StrToInt(sgENSubst150Switch.Cells[0,sgENSubst150Switch.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150SwitchEdit:=TfrmENSubst150SwitchEdit.Create(Application, dsView);
  try
    frmENSubst150SwitchEdit.ShowModal;
  finally
    frmENSubst150SwitchEdit.Free;
    frmENSubst150SwitchEdit:=nil;
  end;
end;

procedure TfrmENSubst150SwitchShow.actEditExecute(Sender: TObject);
Var TempENSubst150Switch: ENSubst150SwitchControllerSoapPort;
begin
 TempENSubst150Switch := HTTPRIOENSubst150Switch as ENSubst150SwitchControllerSoapPort;
   try
     ENSubst150SwitchObj := TempENSubst150Switch.getObject(StrToInt(sgENSubst150Switch.Cells[0,sgENSubst150Switch.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150SwitchEdit:=TfrmENSubst150SwitchEdit.Create(Application, dsEdit);
  try
    if frmENSubst150SwitchEdit.ShowModal= mrOk then
      begin
        //TempENSubst150Switch.save(ENSubst150SwitchObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubst150SwitchEdit.Free;
    frmENSubst150SwitchEdit:=nil;
  end;
end;

procedure TfrmENSubst150SwitchShow.actDeleteExecute(Sender: TObject);
Var TempENSubst150Switch: ENSubst150SwitchControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubst150Switch := HTTPRIOENSubst150Switch as ENSubst150SwitchControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubst150Switch.Cells[0,sgENSubst150Switch.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Выключатели) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubst150Switch.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubst150SwitchShow.actInsertExecute(Sender: TObject);
// Var TempENSubst150Switch: ENSubst150SwitchControllerSoapPort; 
begin
  // TempENSubst150Switch := HTTPRIOENSubst150Switch as ENSubst150SwitchControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSubst150SwitchObj:=ENSubst150Switch.Create;

   //ENSubst150SwitchObj.currentNominal:= TXSDecimal.Create;
   //ENSubst150SwitchObj.currentDisconnection:= TXSDecimal.Create;
   //ENSubst150SwitchObj.dateEdit:= TXSDate.Create;


  try
    frmENSubst150SwitchEdit:=TfrmENSubst150SwitchEdit.Create(Application, dsInsert);
    try
      if frmENSubst150SwitchEdit.ShowModal = mrOk then
      begin
        if ENSubst150SwitchObj<>nil then
            //TempENSubst150Switch.add(ENSubst150SwitchObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubst150SwitchEdit.Free;
      frmENSubst150SwitchEdit:=nil;
    end;
  finally
    ENSubst150SwitchObj.Free;
  end;
end;

procedure TfrmENSubst150SwitchShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubst150SwitchShow.actFilterExecute(Sender: TObject);
begin
{frmENSubst150SwitchFilterEdit:=TfrmENSubst150SwitchFilterEdit.Create(Application, dsInsert);
  try
    ENSubst150SwitchFilterObj := ENSubst150SwitchFilter.Create;
    SetNullIntProps(ENSubst150SwitchFilterObj);
    SetNullXSProps(ENSubst150SwitchFilterObj);

    if frmENSubst150SwitchFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubst150SwitchFilter.Create;
      FilterObject := ENSubst150SwitchFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubst150SwitchFilterEdit.Free;
    frmENSubst150SwitchFilterEdit:=nil;
  end;}
end;

procedure TfrmENSubst150SwitchShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.