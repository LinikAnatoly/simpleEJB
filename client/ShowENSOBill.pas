
unit ShowENSOBill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSOBillController, AdvObj ;


type
  TfrmENSOBillShow = class(TChildForm)  
  HTTPRIOENSOBill: THTTPRIO;
    ImageList1: TImageList;
    sgENSOBill: TAdvStringGrid;
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
procedure sgENSOBillTopLeftChanged(Sender: TObject);
procedure sgENSOBillDblClick(Sender: TObject);
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
 // ENSOBillObj: ENSOBill;
 // ENSOBillFilterObj: ENSOBillFilter;
  
  
implementation

uses Main, EditENSOBill, EditENSOBillFilter;


{$R *.dfm}

var
  //frmENSOBillShow : TfrmENSOBillShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSOBillHeaders: array [1..7] of String =
        ( 'Код'
          ,'Дата рахунку'
          ,'Всього з ПДВ, грн.'
          ,'Сума без ПДВ, грн.'
          ,'ПДВ, грн.'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENSOBillShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSOBillShow:=nil;
    inherited;
  end;


procedure TfrmENSOBillShow.FormShow(Sender: TObject);
var
  TempENSOBill: ENSOBillControllerSoapPort;
  i: Integer;
  ENSOBillList: ENSOBillShortList;
  begin
  SetGridHeaders(ENSOBillHeaders, sgENSOBill.ColumnHeaders);
  ColCount:=100;
  TempENSOBill :=  HTTPRIOENSOBill as ENSOBillControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSOBillFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOBillList := TempENSOBill.getScrollableFilteredList(ENSOBillFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSOBillList.list);

  if LastCount > -1 then
     sgENSOBill.RowCount:=LastCount+2
  else
     sgENSOBill.RowCount:=2;

   with sgENSOBill do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOBillList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOBillList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENSOBillList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENSOBillList.list[i].dateGen);
        if ENSOBillList.list[i].sumTotal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENSOBillList.list[i].sumTotal.DecimalString;
        if ENSOBillList.list[i].sumGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENSOBillList.list[i].sumGen.DecimalString;
        if ENSOBillList.list[i].sumVat = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENSOBillList.list[i].sumVat.DecimalString;
        Cells[5,i+1] := ENSOBillList.list[i].userGen;
        if ENSOBillList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENSOBillList.list[i].dateEdit);
        LastRow:=i+1;
        sgENSOBill.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSOBill.Row:=1;
end;

procedure TfrmENSOBillShow.sgENSOBillTopLeftChanged(Sender: TObject);
var
  TempENSOBill: ENSOBillControllerSoapPort;
  i,CurrentRow: Integer;
  ENSOBillList: ENSOBillShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSOBill.TopRow + sgENSOBill.VisibleRowCount) = ColCount
  then
    begin
      TempENSOBill :=  HTTPRIOENSOBill as ENSOBillControllerSoapPort;
      CurrentRow:=sgENSOBill.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSOBillFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOBillList := TempENSOBill.getScrollableFilteredList(ENSOBillFilter(FilterObject),ColCount-1, 100);



  sgENSOBill.RowCount:=sgENSOBill.RowCount+100;
  LastCount:=High(ENSOBillList.list);
  with sgENSOBill do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOBillList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSOBillList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENSOBillList.list[i].dateGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENSOBillList.list[i].dateGen);
        if ENSOBillList.list[i].sumTotal = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENSOBillList.list[i].sumTotal.DecimalString;
        if ENSOBillList.list[i].sumGen = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENSOBillList.list[i].sumGen.DecimalString;
        if ENSOBillList.list[i].sumVat = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENSOBillList.list[i].sumVat.DecimalString;
        Cells[5,i+CurrentRow] := ENSOBillList.list[i].userGen;
        if ENSOBillList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENSOBillList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSOBill.Row:=CurrentRow-5;
   sgENSOBill.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSOBillShow.sgENSOBillDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSOBill,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSOBillShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSOBill.RowCount-1 do
   for j:=0 to sgENSOBill.ColCount-1 do
     sgENSOBill.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSOBillShow.actViewExecute(Sender: TObject);
Var TempENSOBill: ENSOBillControllerSoapPort;
begin
 TempENSOBill := HTTPRIOENSOBill as ENSOBillControllerSoapPort;
   try
     ENSOBillObj := TempENSOBill.getObject(StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSOBillEdit:=TfrmENSOBillEdit.Create(Application, dsView);
  try
    frmENSOBillEdit.ShowModal;
  finally
    frmENSOBillEdit.Free;
    frmENSOBillEdit:=nil;
  end;
end;

procedure TfrmENSOBillShow.actEditExecute(Sender: TObject);
Var TempENSOBill: ENSOBillControllerSoapPort;
begin
 TempENSOBill := HTTPRIOENSOBill as ENSOBillControllerSoapPort;
   try
     ENSOBillObj := TempENSOBill.getObject(StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSOBillEdit:=TfrmENSOBillEdit.Create(Application, dsEdit);
  try
    if frmENSOBillEdit.ShowModal= mrOk then
      begin
        //TempENSOBill.save(ENSOBillObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSOBillEdit.Free;
    frmENSOBillEdit:=nil;
  end;
end;

procedure TfrmENSOBillShow.actDeleteExecute(Sender: TObject);
Var TempENSOBill: ENSOBillControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSOBill := HTTPRIOENSOBill as ENSOBillControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Рахунки по договору ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSOBill.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSOBillShow.actInsertExecute(Sender: TObject);
// Var TempENSOBill: ENSOBillControllerSoapPort; 
begin
  // TempENSOBill := HTTPRIOENSOBill as ENSOBillControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSOBillObj:=ENSOBill.Create;

   //ENSOBillObj.dateGen:= TXSDate.Create;
   //ENSOBillObj.sumTotal:= TXSDecimal.Create;
   //ENSOBillObj.sumGen:= TXSDecimal.Create;
   //ENSOBillObj.sumVat:= TXSDecimal.Create;
   //ENSOBillObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENSOBillEdit:=TfrmENSOBillEdit.Create(Application, dsInsert);
    try
      if frmENSOBillEdit.ShowModal = mrOk then
      begin
        if ENSOBillObj<>nil then
            //TempENSOBill.add(ENSOBillObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSOBillEdit.Free;
      frmENSOBillEdit:=nil;
    end;
  finally
    ENSOBillObj.Free;
  end;
end;

procedure TfrmENSOBillShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSOBillShow.actFilterExecute(Sender: TObject);
begin
{frmENSOBillFilterEdit:=TfrmENSOBillFilterEdit.Create(Application, dsInsert);
  try
    ENSOBillFilterObj := ENSOBillFilter.Create;
    SetNullIntProps(ENSOBillFilterObj);
    SetNullXSProps(ENSOBillFilterObj);

    if frmENSOBillFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSOBillFilter.Create;
      FilterObject := ENSOBillFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSOBillFilterEdit.Free;
    frmENSOBillFilterEdit:=nil;
  end;}
end;

procedure TfrmENSOBillShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.