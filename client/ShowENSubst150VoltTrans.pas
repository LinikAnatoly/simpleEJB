
unit ShowENSubst150VoltTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubst150VoltTransController ;


type
  TfrmENSubst150VoltTransShow = class(TChildForm)  
  HTTPRIOENSubst150VoltTrans: THTTPRIO;
    ImageList1: TImageList;
    sgENSubst150VoltTrans: TAdvStringGrid;
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
procedure sgENSubst150VoltTransTopLeftChanged(Sender: TObject);
procedure sgENSubst150VoltTransDblClick(Sender: TObject);
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
 // ENSubst150VoltTransObj: ENSubst150VoltTrans;
 // ENSubst150VoltTransFilterObj: ENSubst150VoltTransFilter;
  
  
implementation

uses Main, EditENSubst150VoltTrans, EditENSubst150VoltTransFilter;


{$R *.dfm}

var
  //frmENSubst150VoltTransShow : TfrmENSubst150VoltTransShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubst150VoltTransHeaders: array [1..5] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );
   

procedure TfrmENSubst150VoltTransShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSubst150VoltTransShow:=nil;
    inherited;
  end;


procedure TfrmENSubst150VoltTransShow.FormShow(Sender: TObject);
var
  TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort;
  i: Integer;
  ENSubst150VoltTransList: ENSubst150VoltTransShortList;
  begin
  SetGridHeaders(ENSubst150VoltTransHeaders, sgENSubst150VoltTrans.ColumnHeaders);
  ColCount:=100;
  TempENSubst150VoltTrans :=  HTTPRIOENSubst150VoltTrans as ENSubst150VoltTransControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150VoltTransFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150VoltTransList := TempENSubst150VoltTrans.getScrollableFilteredList(ENSubst150VoltTransFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSubst150VoltTransList.list);

  if LastCount > -1 then
     sgENSubst150VoltTrans.RowCount:=LastCount+2
  else
     sgENSubst150VoltTrans.RowCount:=2;

   with sgENSubst150VoltTrans do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150VoltTransList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150VoltTransList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150VoltTransList.list[i].name;
        Cells[2,i+1] := ENSubst150VoltTransList.list[i].factoryNumber;
        Cells[3,i+1] := ENSubst150VoltTransList.list[i].commentGen;
        Cells[4,i+1] := ENSubst150VoltTransList.list[i].userGen;
        LastRow:=i+1;
        sgENSubst150VoltTrans.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSubst150VoltTrans.Row:=1;
end;

procedure TfrmENSubst150VoltTransShow.sgENSubst150VoltTransTopLeftChanged(Sender: TObject);
var
  TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubst150VoltTransList: ENSubst150VoltTransShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSubst150VoltTrans.TopRow + sgENSubst150VoltTrans.VisibleRowCount) = ColCount
  then
    begin
      TempENSubst150VoltTrans :=  HTTPRIOENSubst150VoltTrans as ENSubst150VoltTransControllerSoapPort;
      CurrentRow:=sgENSubst150VoltTrans.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150VoltTransFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150VoltTransList := TempENSubst150VoltTrans.getScrollableFilteredList(ENSubst150VoltTransFilter(FilterObject),ColCount-1, 100);



  sgENSubst150VoltTrans.RowCount:=sgENSubst150VoltTrans.RowCount+100;
  LastCount:=High(ENSubst150VoltTransList.list);
  with sgENSubst150VoltTrans do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150VoltTransList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubst150VoltTransList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubst150VoltTransList.list[i].name;
        Cells[2,i+CurrentRow] := ENSubst150VoltTransList.list[i].factoryNumber;
        Cells[3,i+CurrentRow] := ENSubst150VoltTransList.list[i].commentGen;
        Cells[4,i+CurrentRow] := ENSubst150VoltTransList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSubst150VoltTrans.Row:=CurrentRow-5;
   sgENSubst150VoltTrans.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSubst150VoltTransShow.sgENSubst150VoltTransDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSubst150VoltTrans,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSubst150VoltTransShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubst150VoltTrans.RowCount-1 do
   for j:=0 to sgENSubst150VoltTrans.ColCount-1 do
     sgENSubst150VoltTrans.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubst150VoltTransShow.actViewExecute(Sender: TObject);
Var TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort;
begin
 TempENSubst150VoltTrans := HTTPRIOENSubst150VoltTrans as ENSubst150VoltTransControllerSoapPort;
   try
     ENSubst150VoltTransObj := TempENSubst150VoltTrans.getObject(StrToInt(sgENSubst150VoltTrans.Cells[0,sgENSubst150VoltTrans.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150VoltTransEdit:=TfrmENSubst150VoltTransEdit.Create(Application, dsView);
  try
    frmENSubst150VoltTransEdit.ShowModal;
  finally
    frmENSubst150VoltTransEdit.Free;
    frmENSubst150VoltTransEdit:=nil;
  end;
end;

procedure TfrmENSubst150VoltTransShow.actEditExecute(Sender: TObject);
Var TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort;
begin
 TempENSubst150VoltTrans := HTTPRIOENSubst150VoltTrans as ENSubst150VoltTransControllerSoapPort;
   try
     ENSubst150VoltTransObj := TempENSubst150VoltTrans.getObject(StrToInt(sgENSubst150VoltTrans.Cells[0,sgENSubst150VoltTrans.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150VoltTransEdit:=TfrmENSubst150VoltTransEdit.Create(Application, dsEdit);
  try
    if frmENSubst150VoltTransEdit.ShowModal= mrOk then
      begin
        //TempENSubst150VoltTrans.save(ENSubst150VoltTransObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubst150VoltTransEdit.Free;
    frmENSubst150VoltTransEdit:=nil;
  end;
end;

procedure TfrmENSubst150VoltTransShow.actDeleteExecute(Sender: TObject);
Var TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubst150VoltTrans := HTTPRIOENSubst150VoltTrans as ENSubst150VoltTransControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubst150VoltTrans.Cells[0,sgENSubst150VoltTrans.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Трансформаторы напряжения) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubst150VoltTrans.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubst150VoltTransShow.actInsertExecute(Sender: TObject);
// Var TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort; 
begin
  // TempENSubst150VoltTrans := HTTPRIOENSubst150VoltTrans as ENSubst150VoltTransControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSubst150VoltTransObj:=ENSubst150VoltTrans.Create;

   //ENSubst150VoltTransObj.dateEdit:= TXSDate.Create;


  try
    frmENSubst150VoltTransEdit:=TfrmENSubst150VoltTransEdit.Create(Application, dsInsert);
    try
      if frmENSubst150VoltTransEdit.ShowModal = mrOk then
      begin
        if ENSubst150VoltTransObj<>nil then
            //TempENSubst150VoltTrans.add(ENSubst150VoltTransObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubst150VoltTransEdit.Free;
      frmENSubst150VoltTransEdit:=nil;
    end;
  finally
    ENSubst150VoltTransObj.Free;
  end;
end;

procedure TfrmENSubst150VoltTransShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubst150VoltTransShow.actFilterExecute(Sender: TObject);
begin
{frmENSubst150VoltTransFilterEdit:=TfrmENSubst150VoltTransFilterEdit.Create(Application, dsInsert);
  try
    ENSubst150VoltTransFilterObj := ENSubst150VoltTransFilter.Create;
    SetNullIntProps(ENSubst150VoltTransFilterObj);
    SetNullXSProps(ENSubst150VoltTransFilterObj);

    if frmENSubst150VoltTransFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubst150VoltTransFilter.Create;
      FilterObject := ENSubst150VoltTransFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubst150VoltTransFilterEdit.Free;
    frmENSubst150VoltTransFilterEdit:=nil;
  end;}
end;

procedure TfrmENSubst150VoltTransShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.