
unit ShowRQInvoiceItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQInvoiceItemController ;


type
  TfrmRQInvoiceItemShow = class(TChildForm)  
  HTTPRIORQInvoiceItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQInvoiceItem: TAdvStringGrid;
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
procedure sgRQInvoiceItemTopLeftChanged(Sender: TObject);
procedure sgRQInvoiceItemDblClick(Sender: TObject);
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
 // RQInvoiceItemObj: RQInvoiceItem;
 // RQInvoiceItemFilterObj: RQInvoiceItemFilter;
  
  
implementation

uses Main, EditRQInvoiceItem, EditRQInvoiceItemFilter;


{$R *.dfm}

var
  //frmRQInvoiceItemShow : TfrmRQInvoiceItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQInvoiceItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'первоначальна кількість'
          ,'Назва материалу (Текст)'
          ,'Од. виміру материалу (Текст)'
          ,'кількість'
          ,'ціна без НДС'
          ,'НДС'
          ,'Сума'
          ,'Сума Ндс'
          ,'Сума'
          ,'Примітка'
          ,'пользователь внесший изменение'
        );
   

procedure TfrmRQInvoiceItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQInvoiceItemShow:=nil;
    inherited;
  end;


procedure TfrmRQInvoiceItemShow.FormShow(Sender: TObject);
var
  TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
  i: Integer;
  RQInvoiceItemList: RQInvoiceItemShortList;
  begin
  SetGridHeaders(RQInvoiceItemHeaders, sgRQInvoiceItem.ColumnHeaders);
  ColCount:=100;
  TempRQInvoiceItem :=  HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQInvoiceItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQInvoiceItemList := TempRQInvoiceItem.getScrollableFilteredList(RQInvoiceItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQInvoiceItemList.list);

  if LastCount > -1 then
     sgRQInvoiceItem.RowCount:=LastCount+2
  else
     sgRQInvoiceItem.RowCount:=2;

   with sgRQInvoiceItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQInvoiceItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQInvoiceItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQInvoiceItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQInvoiceItemList.list[i].countGen.DecimalString;
        Cells[2,i+1] := RQInvoiceItemList.list[i].materialNameTxt;
        Cells[3,i+1] := RQInvoiceItemList.list[i].measurementNameTxt;
        if RQInvoiceItemList.list[i].countFact = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQInvoiceItemList.list[i].countFact.DecimalString;
        if RQInvoiceItemList.list[i].priceWithoutNds = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := RQInvoiceItemList.list[i].priceWithoutNds.DecimalString;
        if RQInvoiceItemList.list[i].nds = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := RQInvoiceItemList.list[i].nds.DecimalString;
        if RQInvoiceItemList.list[i].sumWithoutNds = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQInvoiceItemList.list[i].sumWithoutNds.DecimalString;
        if RQInvoiceItemList.list[i].sumNds = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := RQInvoiceItemList.list[i].sumNds.DecimalString;
        if RQInvoiceItemList.list[i].sumGen = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQInvoiceItemList.list[i].sumGen.DecimalString;
        Cells[10,i+1] := RQInvoiceItemList.list[i].commentGen;
        Cells[11,i+1] := RQInvoiceItemList.list[i].userGen;
        LastRow:=i+1;
        sgRQInvoiceItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQInvoiceItem.Row:=1;
end;

procedure TfrmRQInvoiceItemShow.sgRQInvoiceItemTopLeftChanged(Sender: TObject);
var
  TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQInvoiceItemList: RQInvoiceItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQInvoiceItem.TopRow + sgRQInvoiceItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQInvoiceItem :=  HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;
      CurrentRow:=sgRQInvoiceItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQInvoiceItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQInvoiceItemList := TempRQInvoiceItem.getScrollableFilteredList(RQInvoiceItemFilter(FilterObject),ColCount-1, 100);



  sgRQInvoiceItem.RowCount:=sgRQInvoiceItem.RowCount+100;
  LastCount:=High(RQInvoiceItemList.list);
  with sgRQInvoiceItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQInvoiceItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQInvoiceItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQInvoiceItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQInvoiceItemList.list[i].countGen.DecimalString;
        Cells[2,i+CurrentRow] := RQInvoiceItemList.list[i].materialNameTxt;
        Cells[3,i+CurrentRow] := RQInvoiceItemList.list[i].measurementNameTxt;
        if RQInvoiceItemList.list[i].countFact = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := RQInvoiceItemList.list[i].countFact.DecimalString;
        if RQInvoiceItemList.list[i].priceWithoutNds = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := RQInvoiceItemList.list[i].priceWithoutNds.DecimalString;
        if RQInvoiceItemList.list[i].nds = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := RQInvoiceItemList.list[i].nds.DecimalString;
        if RQInvoiceItemList.list[i].sumWithoutNds = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := RQInvoiceItemList.list[i].sumWithoutNds.DecimalString;
        if RQInvoiceItemList.list[i].sumNds = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := RQInvoiceItemList.list[i].sumNds.DecimalString;
        if RQInvoiceItemList.list[i].sumGen = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := RQInvoiceItemList.list[i].sumGen.DecimalString;
        Cells[10,i+CurrentRow] := RQInvoiceItemList.list[i].commentGen;
        Cells[11,i+CurrentRow] := RQInvoiceItemList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQInvoiceItem.Row:=CurrentRow-5;
   sgRQInvoiceItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQInvoiceItemShow.sgRQInvoiceItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQInvoiceItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQInvoiceItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQInvoiceItem.RowCount-1 do
   for j:=0 to sgRQInvoiceItem.ColCount-1 do
     sgRQInvoiceItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQInvoiceItemShow.actViewExecute(Sender: TObject);
Var TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
begin
 TempRQInvoiceItem := HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;
   try
     RQInvoiceItemObj := TempRQInvoiceItem.getObject(StrToInt(sgRQInvoiceItem.Cells[0,sgRQInvoiceItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQInvoiceItemEdit:=TfrmRQInvoiceItemEdit.Create(Application, dsView);
  try
    frmRQInvoiceItemEdit.ShowModal;
  finally
    frmRQInvoiceItemEdit.Free;
    frmRQInvoiceItemEdit:=nil;
  end;
end;

procedure TfrmRQInvoiceItemShow.actEditExecute(Sender: TObject);
Var TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
begin
 TempRQInvoiceItem := HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;
   try
     RQInvoiceItemObj := TempRQInvoiceItem.getObject(StrToInt(sgRQInvoiceItem.Cells[0,sgRQInvoiceItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQInvoiceItemEdit:=TfrmRQInvoiceItemEdit.Create(Application, dsEdit);
  try
    if frmRQInvoiceItemEdit.ShowModal= mrOk then
      begin
        //TempRQInvoiceItem.save(RQInvoiceItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQInvoiceItemEdit.Free;
    frmRQInvoiceItemEdit:=nil;
  end;
end;

procedure TfrmRQInvoiceItemShow.actDeleteExecute(Sender: TObject);
Var TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQInvoiceItem := HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQInvoiceItem.Cells[0,sgRQInvoiceItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Пункти накладної) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQInvoiceItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQInvoiceItemShow.actInsertExecute(Sender: TObject);
Var TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
begin
  TempRQInvoiceItem := HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;
  RQInvoiceItemObj:=RQInvoiceItem.Create;

   RQInvoiceItemObj.countGen:= TXSDecimal.Create;
   RQInvoiceItemObj.countFact:= TXSDecimal.Create;
   RQInvoiceItemObj.priceWithoutNds:= TXSDecimal.Create;
   RQInvoiceItemObj.nds:= TXSDecimal.Create;
   RQInvoiceItemObj.sumWithoutNds:= TXSDecimal.Create;
   RQInvoiceItemObj.sumNds:= TXSDecimal.Create;
   RQInvoiceItemObj.sumGen:= TXSDecimal.Create;
   RQInvoiceItemObj.dateEdit:= TXSDate.Create;


  try
    frmRQInvoiceItemEdit:=TfrmRQInvoiceItemEdit.Create(Application, dsInsert);
    try
      if frmRQInvoiceItemEdit.ShowModal = mrOk then
      begin
        if RQInvoiceItemObj<>nil then
            //TempRQInvoiceItem.add(RQInvoiceItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQInvoiceItemEdit.Free;
      frmRQInvoiceItemEdit:=nil;
    end;
  finally
    RQInvoiceItemObj.Free;
  end;
end;

procedure TfrmRQInvoiceItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQInvoiceItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQInvoiceItemFilterEdit:=TfrmRQInvoiceItemFilterEdit.Create(Application, dsEdit);
  try
    RQInvoiceItemFilterObj := RQInvoiceItemFilter.Create;
    SetNullIntProps(RQInvoiceItemFilterObj);
    SetNullXSProps(RQInvoiceItemFilterObj);

    if frmRQInvoiceItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQInvoiceItemFilter.Create;
      FilterObject := RQInvoiceItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQInvoiceItemFilterEdit.Free;
    frmRQInvoiceItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQInvoiceItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.