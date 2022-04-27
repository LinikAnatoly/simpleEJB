
unit ShowENPayment2SO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPayment2SOController;


type
  TfrmENPayment2SOShow = class(TChildForm)  
  HTTPRIOENPayment2SO: THTTPRIO;
    ImageList1: TImageList;
    sgENPayment2SO: TAdvStringGrid;
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
procedure sgENPayment2SOTopLeftChanged(Sender: TObject);
procedure sgENPayment2SODblClick(Sender: TObject);
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

var frmENPayment2SOShow: TfrmENPayment2SOShow;
 // ENPayment2SOObj: ENPayment2SO;
 // ENPayment2SOFilterObj: ENPayment2SOFilter;

implementation

uses Main, EditENPayment2SO, EditENPayment2SOFilter;

{$R *.dfm}

var ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPayment2SOHeaders: array [1..5] of String =
        ( 'Код'
          ,'Дата оплати'
          ,'Всього з ПДВ, грн.'
          ,'Сума без ПДВ, грн.'
          ,'ПДВ, грн.'
        );
   

procedure TfrmENPayment2SOShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPayment2SOShow:=nil;
    inherited;
  end;


procedure TfrmENPayment2SOShow.FormShow(Sender: TObject);
var
  TempENPayment2SO: ENPayment2SOControllerSoapPort;
  i: Integer;
  ENPayment2SOList: ENPayment2SOShortList;
  begin
  SetGridHeaders(ENPayment2SOHeaders, sgENPayment2SO.ColumnHeaders);
  ColCount:=100;
  TempENPayment2SO :=  HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPayment2SOFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPayment2SOList := TempENPayment2SO.getScrollableFilteredList(ENPayment2SOFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPayment2SOList.list);

  if LastCount > -1 then
     sgENPayment2SO.RowCount:=LastCount+2
  else
     sgENPayment2SO.RowCount:=2;

   with sgENPayment2SO do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPayment2SOList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPayment2SOList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENPayment2SOList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENPayment2SOList.list[i].dateGen);
        if ENPayment2SOList.list[i].sumTotal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENPayment2SOList.list[i].sumTotal.DecimalString;
        if ENPayment2SOList.list[i].sumGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENPayment2SOList.list[i].sumGen.DecimalString;
        if ENPayment2SOList.list[i].sumVat = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENPayment2SOList.list[i].sumVat.DecimalString;
        LastRow:=i+1;
        sgENPayment2SO.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPayment2SO.Row:=1;
end;

procedure TfrmENPayment2SOShow.sgENPayment2SOTopLeftChanged(Sender: TObject);
var
  TempENPayment2SO: ENPayment2SOControllerSoapPort;
  i,CurrentRow: Integer;
  ENPayment2SOList: ENPayment2SOShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPayment2SO.TopRow + sgENPayment2SO.VisibleRowCount) = ColCount
  then
    begin
      TempENPayment2SO :=  HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;
      CurrentRow:=sgENPayment2SO.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPayment2SOFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPayment2SOList := TempENPayment2SO.getScrollableFilteredList(ENPayment2SOFilter(FilterObject),ColCount-1, 100);



  sgENPayment2SO.RowCount:=sgENPayment2SO.RowCount+100;
  LastCount:=High(ENPayment2SOList.list);
  with sgENPayment2SO do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPayment2SOList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPayment2SOList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENPayment2SOList.list[i].dateGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENPayment2SOList.list[i].dateGen);
        if ENPayment2SOList.list[i].sumTotal = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENPayment2SOList.list[i].sumTotal.DecimalString;
        if ENPayment2SOList.list[i].sumGen = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENPayment2SOList.list[i].sumGen.DecimalString;
        if ENPayment2SOList.list[i].sumVat = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENPayment2SOList.list[i].sumVat.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPayment2SO.Row:=CurrentRow-5;
   sgENPayment2SO.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPayment2SOShow.sgENPayment2SODblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPayment2SO,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPayment2SOShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPayment2SO.RowCount-1 do
   for j:=0 to sgENPayment2SO.ColCount-1 do
     sgENPayment2SO.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPayment2SOShow.actViewExecute(Sender: TObject);
Var TempENPayment2SO: ENPayment2SOControllerSoapPort;
begin
 TempENPayment2SO := HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;
   try
     ENPayment2SOObj := TempENPayment2SO.getObject(StrToInt(sgENPayment2SO.Cells[0,sgENPayment2SO.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPayment2SOEdit:=TfrmENPayment2SOEdit.Create(Application, dsView);
  try
    frmENPayment2SOEdit.ShowModal;
  finally
    frmENPayment2SOEdit.Free;
    frmENPayment2SOEdit:=nil;
  end;
end;

procedure TfrmENPayment2SOShow.actEditExecute(Sender: TObject);
Var TempENPayment2SO: ENPayment2SOControllerSoapPort;
begin
 TempENPayment2SO := HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;
   try
     ENPayment2SOObj := TempENPayment2SO.getObject(StrToInt(sgENPayment2SO.Cells[0,sgENPayment2SO.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPayment2SOEdit:=TfrmENPayment2SOEdit.Create(Application, dsEdit);
  try
    if frmENPayment2SOEdit.ShowModal= mrOk then
      begin
        //TempENPayment2SO.save(ENPayment2SOObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPayment2SOEdit.Free;
    frmENPayment2SOEdit:=nil;
  end;
end;

procedure TfrmENPayment2SOShow.actDeleteExecute(Sender: TObject);
Var TempENPayment2SO: ENPayment2SOControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPayment2SO := HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPayment2SO.Cells[0,sgENPayment2SO.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Оплати по договору ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPayment2SO.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPayment2SOShow.actInsertExecute(Sender: TObject);
// Var TempENPayment2SO: ENPayment2SOControllerSoapPort; 
begin
  // TempENPayment2SO := HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPayment2SOObj:=ENPayment2SO.Create;

   //ENPayment2SOObj.dateGen:= TXSDate.Create;
   //ENPayment2SOObj.sumTotal:= TXSDecimal.Create;
   //ENPayment2SOObj.sumGen:= TXSDecimal.Create;
   //ENPayment2SOObj.sumVat:= TXSDecimal.Create;


  try
    frmENPayment2SOEdit:=TfrmENPayment2SOEdit.Create(Application, dsInsert);
    try
      if frmENPayment2SOEdit.ShowModal = mrOk then
      begin
        if ENPayment2SOObj<>nil then
            //TempENPayment2SO.add(ENPayment2SOObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPayment2SOEdit.Free;
      frmENPayment2SOEdit:=nil;
    end;
  finally
    ENPayment2SOObj.Free;
  end;
end;

procedure TfrmENPayment2SOShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPayment2SOShow.actFilterExecute(Sender: TObject);
begin
{frmENPayment2SOFilterEdit:=TfrmENPayment2SOFilterEdit.Create(Application, dsInsert);
  try
    ENPayment2SOFilterObj := ENPayment2SOFilter.Create;
    SetNullIntProps(ENPayment2SOFilterObj);
    SetNullXSProps(ENPayment2SOFilterObj);

    if frmENPayment2SOFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPayment2SOFilter.Create;
      FilterObject := ENPayment2SOFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPayment2SOFilterEdit.Free;
    frmENPayment2SOFilterEdit:=nil;
  end;}
end;

procedure TfrmENPayment2SOShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.