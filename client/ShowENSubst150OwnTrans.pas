
unit ShowENSubst150OwnTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubst150OwnTransController ;


type
  TfrmENSubst150OwnTransShow = class(TChildForm)  
  HTTPRIOENSubst150OwnTrans: THTTPRIO;
    ImageList1: TImageList;
    sgENSubst150OwnTrans: TAdvStringGrid;
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
procedure sgENSubst150OwnTransTopLeftChanged(Sender: TObject);
procedure sgENSubst150OwnTransDblClick(Sender: TObject);
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
 // ENSubst150OwnTransObj: ENSubst150OwnTrans;
 // ENSubst150OwnTransFilterObj: ENSubst150OwnTransFilter;
  
  
implementation

uses Main, EditENSubst150OwnTrans, EditENSubst150OwnTransFilter;


{$R *.dfm}

var
  //frmENSubst150OwnTransShow : TfrmENSubst150OwnTransShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubst150OwnTransHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Мощность, кВА'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );
   

procedure TfrmENSubst150OwnTransShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSubst150OwnTransShow:=nil;
    inherited;
  end;


procedure TfrmENSubst150OwnTransShow.FormShow(Sender: TObject);
var
  TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort;
  i: Integer;
  ENSubst150OwnTransList: ENSubst150OwnTransShortList;
  begin
  SetGridHeaders(ENSubst150OwnTransHeaders, sgENSubst150OwnTrans.ColumnHeaders);
  ColCount:=100;
  TempENSubst150OwnTrans :=  HTTPRIOENSubst150OwnTrans as ENSubst150OwnTransControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150OwnTransFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150OwnTransList := TempENSubst150OwnTrans.getScrollableFilteredList(ENSubst150OwnTransFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSubst150OwnTransList.list);

  if LastCount > -1 then
     sgENSubst150OwnTrans.RowCount:=LastCount+2
  else
     sgENSubst150OwnTrans.RowCount:=2;

   with sgENSubst150OwnTrans do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150OwnTransList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150OwnTransList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150OwnTransList.list[i].name;
        Cells[2,i+1] := ENSubst150OwnTransList.list[i].factoryNumber;
        if ENSubst150OwnTransList.list[i].power = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENSubst150OwnTransList.list[i].power.DecimalString;
        Cells[4,i+1] := ENSubst150OwnTransList.list[i].commentGen;
        Cells[5,i+1] := ENSubst150OwnTransList.list[i].userGen;
        LastRow:=i+1;
        sgENSubst150OwnTrans.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSubst150OwnTrans.Row:=1;
end;

procedure TfrmENSubst150OwnTransShow.sgENSubst150OwnTransTopLeftChanged(Sender: TObject);
var
  TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubst150OwnTransList: ENSubst150OwnTransShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSubst150OwnTrans.TopRow + sgENSubst150OwnTrans.VisibleRowCount) = ColCount
  then
    begin
      TempENSubst150OwnTrans :=  HTTPRIOENSubst150OwnTrans as ENSubst150OwnTransControllerSoapPort;
      CurrentRow:=sgENSubst150OwnTrans.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150OwnTransFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150OwnTransList := TempENSubst150OwnTrans.getScrollableFilteredList(ENSubst150OwnTransFilter(FilterObject),ColCount-1, 100);



  sgENSubst150OwnTrans.RowCount:=sgENSubst150OwnTrans.RowCount+100;
  LastCount:=High(ENSubst150OwnTransList.list);
  with sgENSubst150OwnTrans do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150OwnTransList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubst150OwnTransList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubst150OwnTransList.list[i].name;
        Cells[2,i+CurrentRow] := ENSubst150OwnTransList.list[i].factoryNumber;
        if ENSubst150OwnTransList.list[i].power = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENSubst150OwnTransList.list[i].power.DecimalString;
        Cells[4,i+CurrentRow] := ENSubst150OwnTransList.list[i].commentGen;
        Cells[5,i+CurrentRow] := ENSubst150OwnTransList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSubst150OwnTrans.Row:=CurrentRow-5;
   sgENSubst150OwnTrans.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSubst150OwnTransShow.sgENSubst150OwnTransDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSubst150OwnTrans,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSubst150OwnTransShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubst150OwnTrans.RowCount-1 do
   for j:=0 to sgENSubst150OwnTrans.ColCount-1 do
     sgENSubst150OwnTrans.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubst150OwnTransShow.actViewExecute(Sender: TObject);
Var TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort;
begin
 TempENSubst150OwnTrans := HTTPRIOENSubst150OwnTrans as ENSubst150OwnTransControllerSoapPort;
   try
     ENSubst150OwnTransObj := TempENSubst150OwnTrans.getObject(StrToInt(sgENSubst150OwnTrans.Cells[0,sgENSubst150OwnTrans.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150OwnTransEdit:=TfrmENSubst150OwnTransEdit.Create(Application, dsView);
  try
    frmENSubst150OwnTransEdit.ShowModal;
  finally
    frmENSubst150OwnTransEdit.Free;
    frmENSubst150OwnTransEdit:=nil;
  end;
end;

procedure TfrmENSubst150OwnTransShow.actEditExecute(Sender: TObject);
Var TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort;
begin
 TempENSubst150OwnTrans := HTTPRIOENSubst150OwnTrans as ENSubst150OwnTransControllerSoapPort;
   try
     ENSubst150OwnTransObj := TempENSubst150OwnTrans.getObject(StrToInt(sgENSubst150OwnTrans.Cells[0,sgENSubst150OwnTrans.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150OwnTransEdit:=TfrmENSubst150OwnTransEdit.Create(Application, dsEdit);
  try
    if frmENSubst150OwnTransEdit.ShowModal= mrOk then
      begin
        //TempENSubst150OwnTrans.save(ENSubst150OwnTransObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubst150OwnTransEdit.Free;
    frmENSubst150OwnTransEdit:=nil;
  end;
end;

procedure TfrmENSubst150OwnTransShow.actDeleteExecute(Sender: TObject);
Var TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubst150OwnTrans := HTTPRIOENSubst150OwnTrans as ENSubst150OwnTransControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubst150OwnTrans.Cells[0,sgENSubst150OwnTrans.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Трансформаторы собств. нужд) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubst150OwnTrans.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubst150OwnTransShow.actInsertExecute(Sender: TObject);
// Var TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort; 
begin
  // TempENSubst150OwnTrans := HTTPRIOENSubst150OwnTrans as ENSubst150OwnTransControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSubst150OwnTransObj:=ENSubst150OwnTrans.Create;

   //ENSubst150OwnTransObj.power:= TXSDecimal.Create;
   //ENSubst150OwnTransObj.dateEdit:= TXSDate.Create;


  try
    frmENSubst150OwnTransEdit:=TfrmENSubst150OwnTransEdit.Create(Application, dsInsert);
    try
      if frmENSubst150OwnTransEdit.ShowModal = mrOk then
      begin
        if ENSubst150OwnTransObj<>nil then
            //TempENSubst150OwnTrans.add(ENSubst150OwnTransObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubst150OwnTransEdit.Free;
      frmENSubst150OwnTransEdit:=nil;
    end;
  finally
    ENSubst150OwnTransObj.Free;
  end;
end;

procedure TfrmENSubst150OwnTransShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubst150OwnTransShow.actFilterExecute(Sender: TObject);
begin
{frmENSubst150OwnTransFilterEdit:=TfrmENSubst150OwnTransFilterEdit.Create(Application, dsInsert);
  try
    ENSubst150OwnTransFilterObj := ENSubst150OwnTransFilter.Create;
    SetNullIntProps(ENSubst150OwnTransFilterObj);
    SetNullXSProps(ENSubst150OwnTransFilterObj);

    if frmENSubst150OwnTransFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubst150OwnTransFilter.Create;
      FilterObject := ENSubst150OwnTransFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubst150OwnTransFilterEdit.Free;
    frmENSubst150OwnTransFilterEdit:=nil;
  end;}
end;

procedure TfrmENSubst150OwnTransShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.