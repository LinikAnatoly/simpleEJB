
unit ShowRQFKOrderItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQFKOrderItemController ;


type
  TfrmRQFKOrderItemShow = class(TChildForm)  
  HTTPRIORQFKOrderItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQFKOrderItem: TAdvStringGrid;
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
procedure sgRQFKOrderItemTopLeftChanged(Sender: TObject);
procedure sgRQFKOrderItemDblClick(Sender: TObject);
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
 // RQFKOrderItemObj: RQFKOrderItem;
 // RQFKOrderItemFilterObj: RQFKOrderItemFilter;
  
  
implementation

uses Main, EditRQFKOrderItem, EditRQFKOrderItemFilter;


{$R *.dfm}

var
  //frmRQFKOrderItemShow : TfrmRQFKOrderItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQFKOrderItemHeaders: array [1..22] of String =
        ( 'Код'
          ,'код из umc_dba.tstring'
          ,'код из FK'
          ,'Номенклатурний номер матеріалу'
          ,'Балансовий рахунок'
          ,'Назва матеріалу'
          ,'код ед изм. из FK'
          ,'Наименование единицы измерения'
          ,'Номер договору'
          ,'Дата договору'
          ,'код договору у фін.кол.'
          ,'PK договору у фін.кол.'
          ,'Назва материалу (Текст)'
          ,'Од. виміру материалу (Текст)'
          ,'кількість'
          ,'ціна без ПДВ'
          ,'ціна з ПДВ'
          ,'ПДВ в ціні'
          ,'Сума без ПДВ'
          ,'Сума ПДВ'
          ,'Сума з ПДВ'
          ,'користувач'
        );
   

procedure TfrmRQFKOrderItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQFKOrderItemShow:=nil;
    inherited;
  end;


procedure TfrmRQFKOrderItemShow.FormShow(Sender: TObject);
var
  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  i: Integer;
  RQFKOrderItemList: RQFKOrderItemShortList;
  begin
  SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);
  ColCount:=100;
  TempRQFKOrderItem :=  HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(RQFKOrderItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQFKOrderItemList.list);

  if LastCount > -1 then
     sgRQFKOrderItem.RowCount:=LastCount+2
  else
     sgRQFKOrderItem.RowCount:=2;

   with sgRQFKOrderItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQFKOrderItemList.list[i].finCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(RQFKOrderItemList.list[i].finCode);
        if RQFKOrderItemList.list[i].nomenclatureCode = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(RQFKOrderItemList.list[i].nomenclatureCode);
        Cells[3,i+1] := RQFKOrderItemList.list[i].nomenclatureNum;
        Cells[4,i+1] := RQFKOrderItemList.list[i].nomenclatureBalSch;
        Cells[5,i+1] := RQFKOrderItemList.list[i].nomenclatureName;
        if RQFKOrderItemList.list[i].nomenclatureUnitCode = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(RQFKOrderItemList.list[i].nomenclatureUnitCode);
        Cells[7,i+1] := RQFKOrderItemList.list[i].nomenclatureUnitName;
        Cells[8,i+1] := RQFKOrderItemList.list[i].contractNumber;
        if RQFKOrderItemList.list[i].contractDate = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(RQFKOrderItemList.list[i].contractDate);
        Cells[10,i+1] := RQFKOrderItemList.list[i].finDocCode;
        if RQFKOrderItemList.list[i].finDocID = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(RQFKOrderItemList.list[i].finDocID);
        Cells[12,i+1] := RQFKOrderItemList.list[i].materialNameTxt;
        Cells[13,i+1] := RQFKOrderItemList.list[i].measurementNameTxt;
        if RQFKOrderItemList.list[i].countGen = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := RQFKOrderItemList.list[i].countGen.DecimalString;
        if RQFKOrderItemList.list[i].priceWithoutNds = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := RQFKOrderItemList.list[i].priceWithoutNds.DecimalString;
        if RQFKOrderItemList.list[i].priceWithNds = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := RQFKOrderItemList.list[i].priceWithNds.DecimalString;
        if RQFKOrderItemList.list[i].priceNds = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := RQFKOrderItemList.list[i].priceNds.DecimalString;
        if RQFKOrderItemList.list[i].sumWithoutNds = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := RQFKOrderItemList.list[i].sumWithoutNds.DecimalString;
        if RQFKOrderItemList.list[i].sumNds = nil then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := RQFKOrderItemList.list[i].sumNds.DecimalString;
        if RQFKOrderItemList.list[i].sumGen = nil then
          Cells[20,i+1] := ''
        else
          Cells[20,i+1] := RQFKOrderItemList.list[i].sumGen.DecimalString;
        Cells[21,i+1] := RQFKOrderItemList.list[i].userGen;
        LastRow:=i+1;
        sgRQFKOrderItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQFKOrderItem.Row:=1;
end;

procedure TfrmRQFKOrderItemShow.sgRQFKOrderItemTopLeftChanged(Sender: TObject);
var
  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQFKOrderItemList: RQFKOrderItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQFKOrderItem.TopRow + sgRQFKOrderItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQFKOrderItem :=  HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
      CurrentRow:=sgRQFKOrderItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(RQFKOrderItemFilter(FilterObject),ColCount-1, 100);



  sgRQFKOrderItem.RowCount:=sgRQFKOrderItem.RowCount+100;
  LastCount:=High(RQFKOrderItemList.list);
  with sgRQFKOrderItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQFKOrderItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQFKOrderItemList.list[i].finCode = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(RQFKOrderItemList.list[i].finCode);
        if RQFKOrderItemList.list[i].nomenclatureCode = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(RQFKOrderItemList.list[i].nomenclatureCode);
        Cells[3,i+CurrentRow] := RQFKOrderItemList.list[i].nomenclatureNum;
        Cells[4,i+CurrentRow] := RQFKOrderItemList.list[i].nomenclatureBalSch;
        Cells[5,i+CurrentRow] := RQFKOrderItemList.list[i].nomenclatureName;
        if RQFKOrderItemList.list[i].nomenclatureUnitCode = Low(Integer) then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := IntToStr(RQFKOrderItemList.list[i].nomenclatureUnitCode);
        Cells[7,i+CurrentRow] := RQFKOrderItemList.list[i].nomenclatureUnitName;
        Cells[8,i+CurrentRow] := RQFKOrderItemList.list[i].contractNumber;
        if RQFKOrderItemList.list[i].contractDate = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDate2String(RQFKOrderItemList.list[i].contractDate);
        Cells[10,i+CurrentRow] := RQFKOrderItemList.list[i].finDocCode;
        if RQFKOrderItemList.list[i].finDocID = Low(Integer) then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := IntToStr(RQFKOrderItemList.list[i].finDocID);
        Cells[12,i+CurrentRow] := RQFKOrderItemList.list[i].materialNameTxt;
        Cells[13,i+CurrentRow] := RQFKOrderItemList.list[i].measurementNameTxt;
        if RQFKOrderItemList.list[i].countGen = nil then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := RQFKOrderItemList.list[i].countGen.DecimalString;
        if RQFKOrderItemList.list[i].priceWithoutNds = nil then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := RQFKOrderItemList.list[i].priceWithoutNds.DecimalString;
        if RQFKOrderItemList.list[i].priceWithNds = nil then
          Cells[16,i+CurrentRow] := ''
        else
          Cells[16,i+CurrentRow] := RQFKOrderItemList.list[i].priceWithNds.DecimalString;
        if RQFKOrderItemList.list[i].priceNds = nil then
          Cells[17,i+CurrentRow] := ''
        else
          Cells[17,i+CurrentRow] := RQFKOrderItemList.list[i].priceNds.DecimalString;
        if RQFKOrderItemList.list[i].sumWithoutNds = nil then
          Cells[18,i+CurrentRow] := ''
        else
          Cells[18,i+CurrentRow] := RQFKOrderItemList.list[i].sumWithoutNds.DecimalString;
        if RQFKOrderItemList.list[i].sumNds = nil then
          Cells[19,i+CurrentRow] := ''
        else
          Cells[19,i+CurrentRow] := RQFKOrderItemList.list[i].sumNds.DecimalString;
        if RQFKOrderItemList.list[i].sumGen = nil then
          Cells[20,i+CurrentRow] := ''
        else
          Cells[20,i+CurrentRow] := RQFKOrderItemList.list[i].sumGen.DecimalString;
        Cells[21,i+CurrentRow] := RQFKOrderItemList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQFKOrderItem.Row:=CurrentRow-5;
   sgRQFKOrderItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQFKOrderItemShow.sgRQFKOrderItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQFKOrderItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQFKOrderItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQFKOrderItem.RowCount-1 do
   for j:=0 to sgRQFKOrderItem.ColCount-1 do
     sgRQFKOrderItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQFKOrderItemShow.actViewExecute(Sender: TObject);
Var TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
begin
 TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
   try
     RQFKOrderItemObj := TempRQFKOrderItem.getObject(StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderItemEdit:=TfrmRQFKOrderItemEdit.Create(Application, dsView);
  try
    frmRQFKOrderItemEdit.ShowModal;
  finally
    frmRQFKOrderItemEdit.Free;
    frmRQFKOrderItemEdit:=nil;
  end;
end;

procedure TfrmRQFKOrderItemShow.actEditExecute(Sender: TObject);
Var TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
begin
 TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
   try
     RQFKOrderItemObj := TempRQFKOrderItem.getObject(StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderItemEdit:=TfrmRQFKOrderItemEdit.Create(Application, dsEdit);
  try
    if frmRQFKOrderItemEdit.ShowModal= mrOk then
      begin
        //TempRQFKOrderItem.save(RQFKOrderItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQFKOrderItemEdit.Free;
    frmRQFKOrderItemEdit:=nil;
  end;
end;

procedure TfrmRQFKOrderItemShow.actDeleteExecute(Sender: TObject);
Var TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки ордеру) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQFKOrderItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQFKOrderItemShow.actInsertExecute(Sender: TObject);
Var TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
begin
  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
  RQFKOrderItemObj:=RQFKOrderItem.Create;

   RQFKOrderItemObj.contractDate:= TXSDate.Create;
   RQFKOrderItemObj.countGen:= TXSDecimal.Create;
   RQFKOrderItemObj.priceWithoutNds:= TXSDecimal.Create;
   RQFKOrderItemObj.priceWithNds:= TXSDecimal.Create;
   RQFKOrderItemObj.priceNds:= TXSDecimal.Create;
   RQFKOrderItemObj.sumWithoutNds:= TXSDecimal.Create;
   RQFKOrderItemObj.sumNds:= TXSDecimal.Create;
   RQFKOrderItemObj.sumGen:= TXSDecimal.Create;
   RQFKOrderItemObj.dateEdit:= TXSDate.Create;


  try
    frmRQFKOrderItemEdit:=TfrmRQFKOrderItemEdit.Create(Application, dsInsert);
    try
      if frmRQFKOrderItemEdit.ShowModal = mrOk then
      begin
        if RQFKOrderItemObj<>nil then
            //TempRQFKOrderItem.add(RQFKOrderItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQFKOrderItemEdit.Free;
      frmRQFKOrderItemEdit:=nil;
    end;
  finally
    RQFKOrderItemObj.Free;
  end;
end;

procedure TfrmRQFKOrderItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQFKOrderItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQFKOrderItemFilterEdit:=TfrmRQFKOrderItemFilterEdit.Create(Application, dsEdit);
  try
    RQFKOrderItemFilterObj := RQFKOrderItemFilter.Create;
    SetNullIntProps(RQFKOrderItemFilterObj);
    SetNullXSProps(RQFKOrderItemFilterObj);

    if frmRQFKOrderItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQFKOrderItemFilter.Create;
      FilterObject := RQFKOrderItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQFKOrderItemFilterEdit.Free;
    frmRQFKOrderItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQFKOrderItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.