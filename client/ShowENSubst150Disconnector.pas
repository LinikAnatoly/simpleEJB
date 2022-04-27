
unit ShowENSubst150Disconnector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubst150DisconnectorController ;


type
  TfrmENSubst150DisconnectorShow = class(TChildForm)  
  HTTPRIOENSubst150Disconnector: THTTPRIO;
    ImageList1: TImageList;
    sgENSubst150Disconnector: TAdvStringGrid;
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
procedure sgENSubst150DisconnectorTopLeftChanged(Sender: TObject);
procedure sgENSubst150DisconnectorDblClick(Sender: TObject);
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
 // ENSubst150DisconnectorObj: ENSubst150Disconnector;
 // ENSubst150DisconnectorFilterObj: ENSubst150DisconnectorFilter;
  
  
implementation

uses Main, EditENSubst150Disconnector, EditENSubst150DisconnectorFilter;


{$R *.dfm}

var
  //frmENSubst150DisconnectorShow : TfrmENSubst150DisconnectorShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubst150DisconnectorHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Номинальный ток, А'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );
   

procedure TfrmENSubst150DisconnectorShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSubst150DisconnectorShow:=nil;
    inherited;
  end;


procedure TfrmENSubst150DisconnectorShow.FormShow(Sender: TObject);
var
  TempENSubst150Disconnector: ENSubst150DisconnectorControllerSoapPort;
  i: Integer;
  ENSubst150DisconnectorList: ENSubst150DisconnectorShortList;
  begin
  SetGridHeaders(ENSubst150DisconnectorHeaders, sgENSubst150Disconnector.ColumnHeaders);
  ColCount:=100;
  TempENSubst150Disconnector :=  HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150DisconnectorFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150DisconnectorList := TempENSubst150Disconnector.getScrollableFilteredList(ENSubst150DisconnectorFilter(FilterObject),0,ColCount);

  LastCount:=High(ENSubst150DisconnectorList.list);

  if LastCount > -1 then
     sgENSubst150Disconnector.RowCount:=LastCount+2
  else
     sgENSubst150Disconnector.RowCount:=2;

   with sgENSubst150Disconnector do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150DisconnectorList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150DisconnectorList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150DisconnectorList.list[i].name;
        Cells[2,i+1] := ENSubst150DisconnectorList.list[i].factoryNumber;
        if ENSubst150DisconnectorList.list[i].currentNominal = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENSubst150DisconnectorList.list[i].currentNominal.DecimalString;
        Cells[4,i+1] := ENSubst150DisconnectorList.list[i].commentGen;
        Cells[5,i+1] := ENSubst150DisconnectorList.list[i].userGen;
        LastRow:=i+1;
        sgENSubst150Disconnector.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSubst150Disconnector.Row:=1;
end;

procedure TfrmENSubst150DisconnectorShow.sgENSubst150DisconnectorTopLeftChanged(Sender: TObject);
var
  TempENSubst150Disconnector: ENSubst150DisconnectorControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubst150DisconnectorList: ENSubst150DisconnectorShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSubst150Disconnector.TopRow + sgENSubst150Disconnector.VisibleRowCount) = ColCount
  then
    begin
      TempENSubst150Disconnector :=  HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;
      CurrentRow:=sgENSubst150Disconnector.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150DisconnectorFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150DisconnectorList := TempENSubst150Disconnector.getScrollableFilteredList(ENSubst150DisconnectorFilter(FilterObject),ColCount-1, 100);



  sgENSubst150Disconnector.RowCount:=sgENSubst150Disconnector.RowCount+100;
  LastCount:=High(ENSubst150DisconnectorList.list);
  with sgENSubst150Disconnector do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150DisconnectorList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubst150DisconnectorList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubst150DisconnectorList.list[i].name;
        Cells[2,i+CurrentRow] := ENSubst150DisconnectorList.list[i].factoryNumber;
        if ENSubst150DisconnectorList.list[i].currentNominal = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENSubst150DisconnectorList.list[i].currentNominal.DecimalString;
        Cells[4,i+CurrentRow] := ENSubst150DisconnectorList.list[i].commentGen;
        Cells[5,i+CurrentRow] := ENSubst150DisconnectorList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSubst150Disconnector.Row:=CurrentRow-5;
   sgENSubst150Disconnector.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSubst150DisconnectorShow.sgENSubst150DisconnectorDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSubst150Disconnector,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSubst150DisconnectorShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubst150Disconnector.RowCount-1 do
   for j:=0 to sgENSubst150Disconnector.ColCount-1 do
     sgENSubst150Disconnector.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubst150DisconnectorShow.actViewExecute(Sender: TObject);
Var TempENSubst150Disconnector: ENSubst150DisconnectorControllerSoapPort;
begin
 TempENSubst150Disconnector := HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;
   try
     ENSubst150DisconnectorObj := TempENSubst150Disconnector.getObject(StrToInt(sgENSubst150Disconnector.Cells[0,sgENSubst150Disconnector.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150DisconnectorEdit:=TfrmENSubst150DisconnectorEdit.Create(Application, dsView);
  try
    frmENSubst150DisconnectorEdit.ShowModal;
  finally
    frmENSubst150DisconnectorEdit.Free;
    frmENSubst150DisconnectorEdit:=nil;
  end;
end;

procedure TfrmENSubst150DisconnectorShow.actEditExecute(Sender: TObject);
Var TempENSubst150Disconnector: ENSubst150DisconnectorControllerSoapPort;
begin
 TempENSubst150Disconnector := HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;
   try
     ENSubst150DisconnectorObj := TempENSubst150Disconnector.getObject(StrToInt(sgENSubst150Disconnector.Cells[0,sgENSubst150Disconnector.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150DisconnectorEdit:=TfrmENSubst150DisconnectorEdit.Create(Application, dsEdit);
  try
    if frmENSubst150DisconnectorEdit.ShowModal= mrOk then
      begin
        //TempENSubst150Disconnector.save(ENSubst150DisconnectorObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubst150DisconnectorEdit.Free;
    frmENSubst150DisconnectorEdit:=nil;
  end;
end;

procedure TfrmENSubst150DisconnectorShow.actDeleteExecute(Sender: TObject);
Var TempENSubst150Disconnector: ENSubst150DisconnectorControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubst150Disconnector := HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubst150Disconnector.Cells[0,sgENSubst150Disconnector.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Разъединители) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubst150Disconnector.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubst150DisconnectorShow.actInsertExecute(Sender: TObject);
// Var TempENSubst150Disconnector: ENSubst150DisconnectorControllerSoapPort; 
begin
  // TempENSubst150Disconnector := HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSubst150DisconnectorObj:=ENSubst150Disconnector.Create;

   //ENSubst150DisconnectorObj.currentNominal:= TXSDecimal.Create;
   //ENSubst150DisconnectorObj.dateEdit:= TXSDate.Create;


  try
    frmENSubst150DisconnectorEdit:=TfrmENSubst150DisconnectorEdit.Create(Application, dsInsert);
    try
      if frmENSubst150DisconnectorEdit.ShowModal = mrOk then
      begin
        if ENSubst150DisconnectorObj<>nil then
            //TempENSubst150Disconnector.add(ENSubst150DisconnectorObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubst150DisconnectorEdit.Free;
      frmENSubst150DisconnectorEdit:=nil;
    end;
  finally
    ENSubst150DisconnectorObj.Free;
  end;
end;

procedure TfrmENSubst150DisconnectorShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubst150DisconnectorShow.actFilterExecute(Sender: TObject);
begin
{frmENSubst150DisconnectorFilterEdit:=TfrmENSubst150DisconnectorFilterEdit.Create(Application, dsInsert);
  try
    ENSubst150DisconnectorFilterObj := ENSubst150DisconnectorFilter.Create;
    SetNullIntProps(ENSubst150DisconnectorFilterObj);
    SetNullXSProps(ENSubst150DisconnectorFilterObj);

    if frmENSubst150DisconnectorFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubst150DisconnectorFilter.Create;
      FilterObject := ENSubst150DisconnectorFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubst150DisconnectorFilterEdit.Free;
    frmENSubst150DisconnectorFilterEdit:=nil;
  end;}
end;

procedure TfrmENSubst150DisconnectorShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.