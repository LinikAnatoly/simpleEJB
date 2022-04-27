
unit ShowENSubst150CurrentTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubst150CurrentTransController ;


type
  TfrmENSubst150CurrentTransShow = class(TChildForm)  
  HTTPRIOENSubst150CurrentTrans: THTTPRIO;
    ImageList1: TImageList;
    sgENSubst150CurrentTrans: TAdvStringGrid;
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
procedure sgENSubst150CurrentTransTopLeftChanged(Sender: TObject);
procedure sgENSubst150CurrentTransDblClick(Sender: TObject);
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
 // ENSubst150CurrentTransObj: ENSubst150CurrentTrans;
 // ENSubst150CurrentTransFilterObj: ENSubst150CurrentTransFilter;
  
  
implementation

uses Main, EditENSubst150CurrentTrans, EditENSubst150CurrentTransFilter;


{$R *.dfm}

var
  //frmENSubst150CurrentTransShow : TfrmENSubst150CurrentTransShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubst150CurrentTransHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Номинальный ток, А'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );
   

procedure TfrmENSubst150CurrentTransShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSubst150CurrentTransShow:=nil;
    inherited;
  end;


procedure TfrmENSubst150CurrentTransShow.FormShow(Sender: TObject);
var
  TempENSubst150CurrentTrans: ENSubst150CurrentTransControllerSoapPort;
  i: Integer;
  ENSubst150CurrentTransList: ENSubst150CurrentTransShortList;
  begin
  SetGridHeaders(ENSubst150CurrentTransHeaders, sgENSubst150CurrentTrans.ColumnHeaders);
  ColCount:=100;
  TempENSubst150CurrentTrans :=  HTTPRIOENSubst150CurrentTrans as ENSubst150CurrentTransControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150CurrentTransFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150CurrentTransList := TempENSubst150CurrentTrans.getScrollableFilteredList(ENSubst150CurrentTransFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSubst150CurrentTransList.list);

  if LastCount > -1 then
     sgENSubst150CurrentTrans.RowCount:=LastCount+2
  else
     sgENSubst150CurrentTrans.RowCount:=2;

   with sgENSubst150CurrentTrans do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150CurrentTransList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150CurrentTransList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150CurrentTransList.list[i].name;
        Cells[2,i+1] := ENSubst150CurrentTransList.list[i].factoryNumber;
        if ENSubst150CurrentTransList.list[i].currentNominal = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENSubst150CurrentTransList.list[i].currentNominal.DecimalString;
        Cells[4,i+1] := ENSubst150CurrentTransList.list[i].commentGen;
        Cells[5,i+1] := ENSubst150CurrentTransList.list[i].userGen;
        LastRow:=i+1;
        sgENSubst150CurrentTrans.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSubst150CurrentTrans.Row:=1;
end;

procedure TfrmENSubst150CurrentTransShow.sgENSubst150CurrentTransTopLeftChanged(Sender: TObject);
var
  TempENSubst150CurrentTrans: ENSubst150CurrentTransControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubst150CurrentTransList: ENSubst150CurrentTransShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSubst150CurrentTrans.TopRow + sgENSubst150CurrentTrans.VisibleRowCount) = ColCount
  then
    begin
      TempENSubst150CurrentTrans :=  HTTPRIOENSubst150CurrentTrans as ENSubst150CurrentTransControllerSoapPort;
      CurrentRow:=sgENSubst150CurrentTrans.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150CurrentTransFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150CurrentTransList := TempENSubst150CurrentTrans.getScrollableFilteredList(ENSubst150CurrentTransFilter(FilterObject),ColCount-1, 100);



  sgENSubst150CurrentTrans.RowCount:=sgENSubst150CurrentTrans.RowCount+100;
  LastCount:=High(ENSubst150CurrentTransList.list);
  with sgENSubst150CurrentTrans do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150CurrentTransList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubst150CurrentTransList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubst150CurrentTransList.list[i].name;
        Cells[2,i+CurrentRow] := ENSubst150CurrentTransList.list[i].factoryNumber;
        if ENSubst150CurrentTransList.list[i].currentNominal = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENSubst150CurrentTransList.list[i].currentNominal.DecimalString;
        Cells[4,i+CurrentRow] := ENSubst150CurrentTransList.list[i].commentGen;
        Cells[5,i+CurrentRow] := ENSubst150CurrentTransList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSubst150CurrentTrans.Row:=CurrentRow-5;
   sgENSubst150CurrentTrans.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSubst150CurrentTransShow.sgENSubst150CurrentTransDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSubst150CurrentTrans,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSubst150CurrentTransShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubst150CurrentTrans.RowCount-1 do
   for j:=0 to sgENSubst150CurrentTrans.ColCount-1 do
     sgENSubst150CurrentTrans.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubst150CurrentTransShow.actViewExecute(Sender: TObject);
Var TempENSubst150CurrentTrans: ENSubst150CurrentTransControllerSoapPort;
begin
 TempENSubst150CurrentTrans := HTTPRIOENSubst150CurrentTrans as ENSubst150CurrentTransControllerSoapPort;
   try
     ENSubst150CurrentTransObj := TempENSubst150CurrentTrans.getObject(StrToInt(sgENSubst150CurrentTrans.Cells[0,sgENSubst150CurrentTrans.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150CurrentTransEdit:=TfrmENSubst150CurrentTransEdit.Create(Application, dsView);
  try
    frmENSubst150CurrentTransEdit.ShowModal;
  finally
    frmENSubst150CurrentTransEdit.Free;
    frmENSubst150CurrentTransEdit:=nil;
  end;
end;

procedure TfrmENSubst150CurrentTransShow.actEditExecute(Sender: TObject);
Var TempENSubst150CurrentTrans: ENSubst150CurrentTransControllerSoapPort;
begin
 TempENSubst150CurrentTrans := HTTPRIOENSubst150CurrentTrans as ENSubst150CurrentTransControllerSoapPort;
   try
     ENSubst150CurrentTransObj := TempENSubst150CurrentTrans.getObject(StrToInt(sgENSubst150CurrentTrans.Cells[0,sgENSubst150CurrentTrans.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150CurrentTransEdit:=TfrmENSubst150CurrentTransEdit.Create(Application, dsEdit);
  try
    if frmENSubst150CurrentTransEdit.ShowModal= mrOk then
      begin
        //TempENSubst150CurrentTrans.save(ENSubst150CurrentTransObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubst150CurrentTransEdit.Free;
    frmENSubst150CurrentTransEdit:=nil;
  end;
end;

procedure TfrmENSubst150CurrentTransShow.actDeleteExecute(Sender: TObject);
Var TempENSubst150CurrentTrans: ENSubst150CurrentTransControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubst150CurrentTrans := HTTPRIOENSubst150CurrentTrans as ENSubst150CurrentTransControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubst150CurrentTrans.Cells[0,sgENSubst150CurrentTrans.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Трансформатор тока) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubst150CurrentTrans.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubst150CurrentTransShow.actInsertExecute(Sender: TObject);
// Var TempENSubst150CurrentTrans: ENSubst150CurrentTransControllerSoapPort; 
begin
  // TempENSubst150CurrentTrans := HTTPRIOENSubst150CurrentTrans as ENSubst150CurrentTransControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSubst150CurrentTransObj:=ENSubst150CurrentTrans.Create;

   //ENSubst150CurrentTransObj.currentNominal:= TXSDecimal.Create;
   //ENSubst150CurrentTransObj.dateEdit:= TXSDate.Create;


  try
    frmENSubst150CurrentTransEdit:=TfrmENSubst150CurrentTransEdit.Create(Application, dsInsert);
    try
      if frmENSubst150CurrentTransEdit.ShowModal = mrOk then
      begin
        if ENSubst150CurrentTransObj<>nil then
            //TempENSubst150CurrentTrans.add(ENSubst150CurrentTransObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubst150CurrentTransEdit.Free;
      frmENSubst150CurrentTransEdit:=nil;
    end;
  finally
    ENSubst150CurrentTransObj.Free;
  end;
end;

procedure TfrmENSubst150CurrentTransShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubst150CurrentTransShow.actFilterExecute(Sender: TObject);
begin
{frmENSubst150CurrentTransFilterEdit:=TfrmENSubst150CurrentTransFilterEdit.Create(Application, dsInsert);
  try
    ENSubst150CurrentTransFilterObj := ENSubst150CurrentTransFilter.Create;
    SetNullIntProps(ENSubst150CurrentTransFilterObj);
    SetNullXSProps(ENSubst150CurrentTransFilterObj);

    if frmENSubst150CurrentTransFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubst150CurrentTransFilter.Create;
      FilterObject := ENSubst150CurrentTransFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubst150CurrentTransFilterEdit.Free;
    frmENSubst150CurrentTransFilterEdit:=nil;
  end;}
end;

procedure TfrmENSubst150CurrentTransShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.