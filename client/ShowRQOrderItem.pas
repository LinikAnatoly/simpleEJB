
unit ShowRQOrderItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrderItemController, AdvObj ;


type
  TfrmRQOrderItemShow = class(TChildForm)  
  HTTPRIORQOrderItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrderItem: TAdvStringGrid;
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
procedure sgRQOrderItemTopLeftChanged(Sender: TObject);
procedure sgRQOrderItemDblClick(Sender: TObject);
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

var
 frmRQOrderItemShow : TfrmRQOrderItemShow;
 // RQOrderItemObj: RQOrderItem;
 // RQOrderItemFilterObj: RQOrderItemFilter;
  
  
implementation

uses Main, EditRQOrderItem, EditRQOrderItemFilter;


{$R *.dfm}

var
  //frmRQOrderItemShow : TfrmRQOrderItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrderItemHeaders: array [1..12] of String =
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
   

procedure TfrmRQOrderItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrderItemShow:=nil;
    inherited;
  end;


procedure TfrmRQOrderItemShow.FormShow(Sender: TObject);
var
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  i: Integer;
  RQOrderItemList: RQOrderItemShortList;
  begin
  SetGridHeaders(RQOrderItemHeaders, sgRQOrderItem.ColumnHeaders);
  ColCount:=100;
  TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderItemList := TempRQOrderItem.getScrollableFilteredList(RQOrderItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrderItemList.list);

  if LastCount > -1 then
     sgRQOrderItem.RowCount:=LastCount+2
  else
     sgRQOrderItem.RowCount:=2;

   with sgRQOrderItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrderItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQOrderItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQOrderItemList.list[i].countGen.DecimalString;
        Cells[2,i+1] := RQOrderItemList.list[i].materialNameTxt;
        Cells[3,i+1] := RQOrderItemList.list[i].measurementNameTxt;
        if RQOrderItemList.list[i].countFact = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQOrderItemList.list[i].countFact.DecimalString;
        if RQOrderItemList.list[i].priceWithoutNds = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := RQOrderItemList.list[i].priceWithoutNds.DecimalString;
        if RQOrderItemList.list[i].nds = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := RQOrderItemList.list[i].nds.DecimalString;
        if RQOrderItemList.list[i].sumWithoutNds = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQOrderItemList.list[i].sumWithoutNds.DecimalString;
        if RQOrderItemList.list[i].sumNds = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := RQOrderItemList.list[i].sumNds.DecimalString;
        if RQOrderItemList.list[i].sumGen = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQOrderItemList.list[i].sumGen.DecimalString;
        Cells[10,i+1] := RQOrderItemList.list[i].commentGen;
        Cells[11,i+1] := RQOrderItemList.list[i].userGen;
        LastRow:=i+1;
        sgRQOrderItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrderItem.Row:=1;
end;

procedure TfrmRQOrderItemShow.sgRQOrderItemTopLeftChanged(Sender: TObject);
var
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrderItemList: RQOrderItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrderItem.TopRow + sgRQOrderItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
      CurrentRow:=sgRQOrderItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderItemList := TempRQOrderItem.getScrollableFilteredList(RQOrderItemFilter(FilterObject),ColCount-1, 100);



  sgRQOrderItem.RowCount:=sgRQOrderItem.RowCount+100;
  LastCount:=High(RQOrderItemList.list);
  with sgRQOrderItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrderItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQOrderItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQOrderItemList.list[i].countGen.DecimalString;
        Cells[2,i+CurrentRow] := RQOrderItemList.list[i].materialNameTxt;
        Cells[3,i+CurrentRow] := RQOrderItemList.list[i].measurementNameTxt;
        if RQOrderItemList.list[i].countFact = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := RQOrderItemList.list[i].countFact.DecimalString;
        if RQOrderItemList.list[i].priceWithoutNds = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := RQOrderItemList.list[i].priceWithoutNds.DecimalString;
        if RQOrderItemList.list[i].nds = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := RQOrderItemList.list[i].nds.DecimalString;
        if RQOrderItemList.list[i].sumWithoutNds = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := RQOrderItemList.list[i].sumWithoutNds.DecimalString;
        if RQOrderItemList.list[i].sumNds = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := RQOrderItemList.list[i].sumNds.DecimalString;
        if RQOrderItemList.list[i].sumGen = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := RQOrderItemList.list[i].sumGen.DecimalString;
        Cells[10,i+CurrentRow] := RQOrderItemList.list[i].commentGen;
        Cells[11,i+CurrentRow] := RQOrderItemList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrderItem.Row:=CurrentRow-5;
   sgRQOrderItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrderItemShow.sgRQOrderItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrderItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrderItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrderItem.RowCount-1 do
   for j:=0 to sgRQOrderItem.ColCount-1 do
     sgRQOrderItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrderItemShow.actViewExecute(Sender: TObject);
Var TempRQOrderItem: RQOrderItemControllerSoapPort;
begin
 TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
   try
     RQOrderItemObj := TempRQOrderItem.getObject(StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderItemEdit:=TfrmRQOrderItemEdit.Create(Application, dsView);
  try
    frmRQOrderItemEdit.ShowModal;
  finally
    frmRQOrderItemEdit.Free;
    frmRQOrderItemEdit:=nil;
  end;
end;

procedure TfrmRQOrderItemShow.actEditExecute(Sender: TObject);
Var TempRQOrderItem: RQOrderItemControllerSoapPort;
begin
 TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
   try
     RQOrderItemObj := TempRQOrderItem.getObject(StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderItemEdit:=TfrmRQOrderItemEdit.Create(Application, dsEdit);
  try
    if frmRQOrderItemEdit.ShowModal= mrOk then
      begin
        //TempRQOrderItem.save(RQOrderItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrderItemEdit.Free;
    frmRQOrderItemEdit:=nil;
  end;
end;

procedure TfrmRQOrderItemShow.actDeleteExecute(Sender: TObject);
Var TempRQOrderItem: RQOrderItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Пункти заявки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrderItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrderItemShow.actInsertExecute(Sender: TObject);
Var TempRQOrderItem: RQOrderItemControllerSoapPort;
begin
  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
  RQOrderItemObj:=RQOrderItem.Create;

   RQOrderItemObj.countGen:= TXSDecimal.Create;
   RQOrderItemObj.countFact:= TXSDecimal.Create;
   RQOrderItemObj.priceWithoutNds:= TXSDecimal.Create;
   RQOrderItemObj.nds:= TXSDecimal.Create;
   RQOrderItemObj.sumWithoutNds:= TXSDecimal.Create;
   RQOrderItemObj.sumNds:= TXSDecimal.Create;
   RQOrderItemObj.sumGen:= TXSDecimal.Create;
   RQOrderItemObj.dateEdit:= TXSDate.Create;


  try
    frmRQOrderItemEdit:=TfrmRQOrderItemEdit.Create(Application, dsInsert);
    try
      if frmRQOrderItemEdit.ShowModal = mrOk then
      begin
        if RQOrderItemObj<>nil then
            //TempRQOrderItem.add(RQOrderItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrderItemEdit.Free;
      frmRQOrderItemEdit:=nil;
    end;
  finally
    RQOrderItemObj.Free;
  end;
end;

procedure TfrmRQOrderItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrderItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQOrderItemFilterEdit:=TfrmRQOrderItemFilterEdit.Create(Application, dsEdit);
  try
    RQOrderItemFilterObj := RQOrderItemFilter.Create;
    SetNullIntProps(RQOrderItemFilterObj);
    SetNullXSProps(RQOrderItemFilterObj);

    if frmRQOrderItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrderItemFilter.Create;
      FilterObject := RQOrderItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrderItemFilterEdit.Free;
    frmRQOrderItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQOrderItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.