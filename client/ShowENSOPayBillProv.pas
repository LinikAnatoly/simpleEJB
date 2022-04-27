
unit ShowENSOPayBillProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSOPayBillProvController, AdvObj ;


type
  TfrmENSOPayBillProvShow = class(TChildForm)  
  HTTPRIOENSOPayBillProv: THTTPRIO;
    ImageList1: TImageList;
    sgENSOPayBillProv: TAdvStringGrid;
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
procedure sgENSOPayBillProvTopLeftChanged(Sender: TObject);
procedure sgENSOPayBillProvDblClick(Sender: TObject);
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
 // ENSOPayBillProvObj: ENSOPayBillProv;
 // ENSOPayBillProvFilterObj: ENSOPayBillProvFilter;
  
  
implementation

uses Main, EditENSOPayBillProv, EditENSOPayBillProvFilter;


{$R *.dfm}

var
  //frmENSOPayBillProvShow : TfrmENSOPayBillProvShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSOPayBillProvHeaders: array [1..3] of String =
        ( 'Код'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENSOPayBillProvShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSOPayBillProvShow:=nil;
    inherited;
  end;


procedure TfrmENSOPayBillProvShow.FormShow(Sender: TObject);
var
  TempENSOPayBillProv: ENSOPayBillProvControllerSoapPort;
  i: Integer;
  ENSOPayBillProvList: ENSOPayBillProvShortList;
  begin
  SetGridHeaders(ENSOPayBillProvHeaders, sgENSOPayBillProv.ColumnHeaders);
  ColCount:=100;
  TempENSOPayBillProv :=  HTTPRIOENSOPayBillProv as ENSOPayBillProvControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSOPayBillProvFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOPayBillProvList := TempENSOPayBillProv.getScrollableFilteredList(ENSOPayBillProvFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSOPayBillProvList.list);

  if LastCount > -1 then
     sgENSOPayBillProv.RowCount:=LastCount+2
  else
     sgENSOPayBillProv.RowCount:=2;

   with sgENSOPayBillProv do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOPayBillProvList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOPayBillProvList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSOPayBillProvList.list[i].userGen;
        if ENSOPayBillProvList.list[i].dateEdit = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENSOPayBillProvList.list[i].dateEdit);
        LastRow:=i+1;
        sgENSOPayBillProv.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSOPayBillProv.Row:=1;
end;

procedure TfrmENSOPayBillProvShow.sgENSOPayBillProvTopLeftChanged(Sender: TObject);
var
  TempENSOPayBillProv: ENSOPayBillProvControllerSoapPort;
  i,CurrentRow: Integer;
  ENSOPayBillProvList: ENSOPayBillProvShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSOPayBillProv.TopRow + sgENSOPayBillProv.VisibleRowCount) = ColCount
  then
    begin
      TempENSOPayBillProv :=  HTTPRIOENSOPayBillProv as ENSOPayBillProvControllerSoapPort;
      CurrentRow:=sgENSOPayBillProv.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSOPayBillProvFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOPayBillProvList := TempENSOPayBillProv.getScrollableFilteredList(ENSOPayBillProvFilter(FilterObject),ColCount-1, 100);



  sgENSOPayBillProv.RowCount:=sgENSOPayBillProv.RowCount+100;
  LastCount:=High(ENSOPayBillProvList.list);
  with sgENSOPayBillProv do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOPayBillProvList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSOPayBillProvList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSOPayBillProvList.list[i].userGen;
        if ENSOPayBillProvList.list[i].dateEdit = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENSOPayBillProvList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSOPayBillProv.Row:=CurrentRow-5;
   sgENSOPayBillProv.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSOPayBillProvShow.sgENSOPayBillProvDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSOPayBillProv,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSOPayBillProvShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSOPayBillProv.RowCount-1 do
   for j:=0 to sgENSOPayBillProv.ColCount-1 do
     sgENSOPayBillProv.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSOPayBillProvShow.actViewExecute(Sender: TObject);
Var TempENSOPayBillProv: ENSOPayBillProvControllerSoapPort;
begin
 TempENSOPayBillProv := HTTPRIOENSOPayBillProv as ENSOPayBillProvControllerSoapPort;
   try
     ENSOPayBillProvObj := TempENSOPayBillProv.getObject(StrToInt(sgENSOPayBillProv.Cells[0,sgENSOPayBillProv.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSOPayBillProvEdit:=TfrmENSOPayBillProvEdit.Create(Application, dsView);
  try
    frmENSOPayBillProvEdit.ShowModal;
  finally
    frmENSOPayBillProvEdit.Free;
    frmENSOPayBillProvEdit:=nil;
  end;
end;

procedure TfrmENSOPayBillProvShow.actEditExecute(Sender: TObject);
Var TempENSOPayBillProv: ENSOPayBillProvControllerSoapPort;
begin
 TempENSOPayBillProv := HTTPRIOENSOPayBillProv as ENSOPayBillProvControllerSoapPort;
   try
     ENSOPayBillProvObj := TempENSOPayBillProv.getObject(StrToInt(sgENSOPayBillProv.Cells[0,sgENSOPayBillProv.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSOPayBillProvEdit:=TfrmENSOPayBillProvEdit.Create(Application, dsEdit);
  try
    if frmENSOPayBillProvEdit.ShowModal= mrOk then
      begin
        //TempENSOPayBillProv.save(ENSOPayBillProvObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSOPayBillProvEdit.Free;
    frmENSOPayBillProvEdit:=nil;
  end;
end;

procedure TfrmENSOPayBillProvShow.actDeleteExecute(Sender: TObject);
Var TempENSOPayBillProv: ENSOPayBillProvControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSOPayBillProv := HTTPRIOENSOPayBillProv as ENSOPayBillProvControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSOPayBillProv.Cells[0,sgENSOPayBillProv.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв`язок рахунків, оплат та проводок послуг на сторону) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSOPayBillProv.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSOPayBillProvShow.actInsertExecute(Sender: TObject);
// Var TempENSOPayBillProv: ENSOPayBillProvControllerSoapPort; 
begin
  // TempENSOPayBillProv := HTTPRIOENSOPayBillProv as ENSOPayBillProvControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSOPayBillProvObj:=ENSOPayBillProv.Create;

   //ENSOPayBillProvObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENSOPayBillProvEdit:=TfrmENSOPayBillProvEdit.Create(Application, dsInsert);
    try
      if frmENSOPayBillProvEdit.ShowModal = mrOk then
      begin
        if ENSOPayBillProvObj<>nil then
            //TempENSOPayBillProv.add(ENSOPayBillProvObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSOPayBillProvEdit.Free;
      frmENSOPayBillProvEdit:=nil;
    end;
  finally
    ENSOPayBillProvObj.Free;
  end;
end;

procedure TfrmENSOPayBillProvShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSOPayBillProvShow.actFilterExecute(Sender: TObject);
begin
{frmENSOPayBillProvFilterEdit:=TfrmENSOPayBillProvFilterEdit.Create(Application, dsInsert);
  try
    ENSOPayBillProvFilterObj := ENSOPayBillProvFilter.Create;
    SetNullIntProps(ENSOPayBillProvFilterObj);
    SetNullXSProps(ENSOPayBillProvFilterObj);

    if frmENSOPayBillProvFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSOPayBillProvFilter.Create;
      FilterObject := ENSOPayBillProvFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSOPayBillProvFilterEdit.Free;
    frmENSOPayBillProvFilterEdit:=nil;
  end;}
end;

procedure TfrmENSOPayBillProvShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.