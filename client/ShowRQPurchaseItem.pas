
unit ShowRQPurchaseItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPurchaseItemController, AdvObj ;


type
  TfrmRQPurchaseItemShow = class(TChildForm)  
  HTTPRIORQPurchaseItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQPurchaseItem: TAdvStringGrid;
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
procedure sgRQPurchaseItemTopLeftChanged(Sender: TObject);
procedure sgRQPurchaseItemDblClick(Sender: TObject);
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
 // RQPurchaseItemObj: RQPurchaseItem;
 // RQPurchaseItemFilterObj: RQPurchaseItemFilter;
  
  
implementation

uses Main, EditRQPurchaseItem, EditRQPurchaseItemFilter;


{$R *.dfm}

var
  //frmRQPurchaseItemShow : TfrmRQPurchaseItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPurchaseItemHeaders: array [1..18] of String =
        ( 'Код'
          ,'Предмет закупівлі назва матеріалу'
          ,'Код ДК 2010'
          ,'Код ДК 2015'
          ,'кількість з планів'
          ,'кількість по договору'
          ,'Назва матеріалу на момент формування'
          ,'Од. виміру матеріалу на момент формування'
          ,'ціна без НДС'
          ,'ціна з НДС'
          ,'Сума'
          ,'Сума з ПДВ '
          ,'ціна без НДС по договору '
          ,'ціна з НДС по договору'
          ,'Сума по договору'
          ,'Сума з ПДВ '
          ,'Примітка'
          ,'пользователь внесший изменение'
        );
   

procedure TfrmRQPurchaseItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPurchaseItemShow:=nil;
    inherited;
  end;


procedure TfrmRQPurchaseItemShow.FormShow(Sender: TObject);
var
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  i: Integer;
  RQPurchaseItemList: RQPurchaseItemShortList;
  begin
  SetGridHeaders(RQPurchaseItemHeaders, sgRQPurchaseItem.ColumnHeaders);
  ColCount:=100;
  TempRQPurchaseItem :=  HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPurchaseItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPurchaseItemList := TempRQPurchaseItem.getScrollableFilteredList(RQPurchaseItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPurchaseItemList.list);

  if LastCount > -1 then
     sgRQPurchaseItem.RowCount:=LastCount+2
  else
     sgRQPurchaseItem.RowCount:=2;

   with sgRQPurchaseItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPurchaseItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[2,i+1] := RQPurchaseItemList.list[i].identid2010;
        Cells[3,i+1] := RQPurchaseItemList.list[i].identid2015;
        if RQPurchaseItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQPurchaseItemList.list[i].countGen.DecimalString;

        Cells[6,i+1] := RQPurchaseItemList.list[i].materialNameGen;
        Cells[7,i+1] := RQPurchaseItemList.list[i].measurementNameGen;
        if RQPurchaseItemList.list[i].priceGenWithoutNds = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := RQPurchaseItemList.list[i].priceGenWithoutNds.DecimalString;
        if RQPurchaseItemList.list[i].priceGenWithNds = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQPurchaseItemList.list[i].priceGenWithNds.DecimalString;
        if RQPurchaseItemList.list[i].sumGenWithoutNds = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := RQPurchaseItemList.list[i].sumGenWithoutNds.DecimalString;
        if RQPurchaseItemList.list[i].sumGenWithNds = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := RQPurchaseItemList.list[i].sumGenWithNds.DecimalString;

        Cells[16,i+1] := RQPurchaseItemList.list[i].commentGen;
        Cells[17,i+1] := RQPurchaseItemList.list[i].userGen;
        LastRow:=i+1;
        sgRQPurchaseItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPurchaseItem.Row:=1;
end;

procedure TfrmRQPurchaseItemShow.sgRQPurchaseItemTopLeftChanged(Sender: TObject);
var
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQPurchaseItemList: RQPurchaseItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPurchaseItem.TopRow + sgRQPurchaseItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQPurchaseItem :=  HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
      CurrentRow:=sgRQPurchaseItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPurchaseItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPurchaseItemList := TempRQPurchaseItem.getScrollableFilteredList(RQPurchaseItemFilter(FilterObject),ColCount-1, 100);



  sgRQPurchaseItem.RowCount:=sgRQPurchaseItem.RowCount+100;
  LastCount:=High(RQPurchaseItemList.list);
  with sgRQPurchaseItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPurchaseItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[2,i+CurrentRow] := RQPurchaseItemList.list[i].identid2010;
        Cells[3,i+CurrentRow] := RQPurchaseItemList.list[i].identid2015;
        if RQPurchaseItemList.list[i].countGen = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := RQPurchaseItemList.list[i].countGen.DecimalString;

        Cells[6,i+CurrentRow] := RQPurchaseItemList.list[i].materialNameGen;
        Cells[7,i+CurrentRow] := RQPurchaseItemList.list[i].measurementNameGen;
        if RQPurchaseItemList.list[i].priceGenWithoutNds = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := RQPurchaseItemList.list[i].priceGenWithoutNds.DecimalString;
        if RQPurchaseItemList.list[i].priceGenWithNds = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := RQPurchaseItemList.list[i].priceGenWithNds.DecimalString;
        if RQPurchaseItemList.list[i].sumGenWithoutNds = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := RQPurchaseItemList.list[i].sumGenWithoutNds.DecimalString;
        if RQPurchaseItemList.list[i].sumGenWithNds = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := RQPurchaseItemList.list[i].sumGenWithNds.DecimalString;

        Cells[16,i+CurrentRow] := RQPurchaseItemList.list[i].commentGen;
        Cells[17,i+CurrentRow] := RQPurchaseItemList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPurchaseItem.Row:=CurrentRow-5;
   sgRQPurchaseItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPurchaseItemShow.sgRQPurchaseItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPurchaseItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPurchaseItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPurchaseItem.RowCount-1 do
   for j:=0 to sgRQPurchaseItem.ColCount-1 do
     sgRQPurchaseItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPurchaseItemShow.actViewExecute(Sender: TObject);
Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj := TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItem.Cells[0,sgRQPurchaseItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItemEdit:=TfrmRQPurchaseItemEdit.Create(Application, dsView);
  try
    frmRQPurchaseItemEdit.ShowModal;
  finally
    frmRQPurchaseItemEdit.Free;
    frmRQPurchaseItemEdit:=nil;
  end;
end;

procedure TfrmRQPurchaseItemShow.actEditExecute(Sender: TObject);
Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj := TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItem.Cells[0,sgRQPurchaseItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItemEdit:=TfrmRQPurchaseItemEdit.Create(Application, dsEdit);
  try
    if frmRQPurchaseItemEdit.ShowModal= mrOk then
      begin
        //TempRQPurchaseItem.save(RQPurchaseItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPurchaseItemEdit.Free;
    frmRQPurchaseItemEdit:=nil;
  end;
end;

procedure TfrmRQPurchaseItemShow.actDeleteExecute(Sender: TObject);
Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPurchaseItem.Cells[0,sgRQPurchaseItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (План закупок, строки детально по матеріалам) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPurchaseItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPurchaseItemShow.actInsertExecute(Sender: TObject);
// Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort; 
begin
  // TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPurchaseItemObj:=RQPurchaseItem.Create;

   //RQPurchaseItemObj.countGen:= TXSDecimal.Create;
   //RQPurchaseItemObj.countFact:= TXSDecimal.Create;
   //RQPurchaseItemObj.priceGenWithoutNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.priceGenWithNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.sumGenWithoutNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.sumGenWithNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.priceFactWithoutNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.priceFactWithNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.sumFactWithoutNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.sumFactWithNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.dateEdit:= TXSDate.Create;


  try
    frmRQPurchaseItemEdit:=TfrmRQPurchaseItemEdit.Create(Application, dsInsert);
    try
      if frmRQPurchaseItemEdit.ShowModal = mrOk then
      begin
        if RQPurchaseItemObj<>nil then
            //TempRQPurchaseItem.add(RQPurchaseItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPurchaseItemEdit.Free;
      frmRQPurchaseItemEdit:=nil;
    end;
  finally
    RQPurchaseItemObj.Free;
  end;
end;

procedure TfrmRQPurchaseItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPurchaseItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQPurchaseItemFilterEdit:=TfrmRQPurchaseItemFilterEdit.Create(Application, dsInsert);
  try
    RQPurchaseItemFilterObj := RQPurchaseItemFilter.Create;
    SetNullIntProps(RQPurchaseItemFilterObj);
    SetNullXSProps(RQPurchaseItemFilterObj);

    if frmRQPurchaseItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPurchaseItemFilter.Create;
      FilterObject := RQPurchaseItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPurchaseItemFilterEdit.Free;
    frmRQPurchaseItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPurchaseItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.