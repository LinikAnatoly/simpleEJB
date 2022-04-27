
unit ShowRQBillItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQBillItemController, AdvObj ;


type
  TfrmRQBillItemShow = class(TChildForm)  
  HTTPRIORQBillItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQBillItem: TAdvStringGrid;
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
    HTTPRIORQPayDocItem2BillItem: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQBillItemTopLeftChanged(Sender: TObject);
procedure sgRQBillItemDblClick(Sender: TObject);
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
 // RQBillItemObj: RQBillItem;
 // RQBillItemFilterObj: RQBillItemFilter;
  
  
implementation

uses Main, EditRQBillItem, EditRQBillItemFilter, RQPayDocItemController,
  RQPayDocItem2BillItemController;


{$R *.dfm}

var
  //frmRQBillItemShow : TfrmRQBillItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQBillItemHeaders: array [1..13] of String =
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
          ,'Сума оплачена'
          ,'Примітка'
          ,'пользователь внесший изменение'
        );
   

procedure TfrmRQBillItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQBillItemShow:=nil;
    inherited;
  end;


procedure TfrmRQBillItemShow.FormShow(Sender: TObject);
var
  TempRQBillItem: RQBillItemControllerSoapPort;
  TempRQPayDocItem2BillItem: RQPayDocItem2BillItemControllerSoapPort;
  i,j: Integer;
  RQBillItemList: RQBillItemShortList;
  f: RQPayDocItem2BillItemFilter;
   RQPayDocItemList: RQPayDocItem2BillItemShortList;
   payDocItemSum: Double;
  begin
  SetGridHeaders(RQBillItemHeaders, sgRQBillItem.ColumnHeaders);
  ColCount:=100;
  TempRQBillItem :=  HTTPRIORQBillItem as RQBillItemControllerSoapPort;
  TempRQPayDocItem2BillItem :=  HTTPRIORQPayDocItem2BillItem as RQPayDocItem2BillItemControllerSoapPort;
  if FilterObject = nil then
  begin
     FilterObject := RQBillItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQBillItemList := TempRQBillItem.getScrollableFilteredList(RQBillItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQBillItemList.list);

  if LastCount > -1 then
     sgRQBillItem.RowCount:=LastCount+2
  else
     sgRQBillItem.RowCount:=2;

   with sgRQBillItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQBillItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQBillItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQBillItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQBillItemList.list[i].countGen.DecimalString;
        Cells[2,i+1] := RQBillItemList.list[i].materialName;
        Cells[3,i+1] := RQBillItemList.list[i].measurementName;
        if RQBillItemList.list[i].countFact = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQBillItemList.list[i].countFact.DecimalString;
        if RQBillItemList.list[i].priceWithoutNds = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := RQBillItemList.list[i].priceWithoutNds.DecimalString;
        if RQBillItemList.list[i].nds = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := RQBillItemList.list[i].nds.DecimalString;
        if RQBillItemList.list[i].sumWithoutNds = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQBillItemList.list[i].sumWithoutNds.DecimalString;
        if RQBillItemList.list[i].sumNds = nil then
          Cells[8,i+1] := ''
        else
         begin
          Cells[8,i+1] := RQBillItemList.list[i].sumNds.DecimalString;

         end;
        if RQBillItemList.list[i].sumGen = nil then
          Cells[9,i+1] := ''
        else
         begin
          Cells[9,i+1] := RQBillItemList.list[i].sumGen.DecimalString;

            f := RQPayDocItem2BillItemFilter.Create;
            SetNullIntProps(f);
            SetNullXSProps(f);

            try
            payDocItemSum:=0;
             f.billitem := RQBillItem.Create;
             f.billitem.code := RQBillItemList.list[i].code;
             RQPayDocItemList := TempRQPayDocItem2BillItem.getScrollableFilteredList(f,0,-1);
               for j:=0 to High(RQPayDocItemList.list) do
                begin
                 payDocItemSum:= payDocItemSum+ StrToFloat(RQPayDocItemList.list[j].summaGen.DecimalString);
                end;
                Cells[10,i+1] :=FloatToStr(payDocItemSum);
             //   Alignments[10,i + 1] := taLeftJustify;
                Colors[10,i + 1] := $0080FF80;
           except
            on EConvertError do
             begin
              Application.MessageBox(PChar('Ошибка кода счета !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Exit;
            end;
          end;

         end;
        Cells[11,i+1] := RQBillItemList.list[i].commentGen;
        Cells[12,i+1] := RQBillItemList.list[i].userGen;
        LastRow:=i+1;
        sgRQBillItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQBillItem.Row:=1;
end;

procedure TfrmRQBillItemShow.sgRQBillItemTopLeftChanged(Sender: TObject);
var
 TempRQPayDocItem2BillItem: RQPayDocItem2BillItemControllerSoapPort;
  TempRQBillItem: RQBillItemControllerSoapPort;
  i,j,CurrentRow: Integer;
  RQBillItemList: RQBillItemShortList;
  f: RQPayDocItem2BillItemFilter;
   RQPayDocItemList: RQPayDocItem2BillItemShortList;
   payDocItemSum: Double;
  begin

  if LastCount < 99 then Exit;
  TempRQPayDocItem2BillItem :=  HTTPRIORQPayDocItem2BillItem as RQPayDocItem2BillItemControllerSoapPort;
  if (sgRQBillItem.TopRow + sgRQBillItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQBillItem :=  HTTPRIORQBillItem as RQBillItemControllerSoapPort;
      CurrentRow:=sgRQBillItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQBillItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQBillItemList := TempRQBillItem.getScrollableFilteredList(RQBillItemFilter(FilterObject),ColCount-1, 100);



  sgRQBillItem.RowCount:=sgRQBillItem.RowCount+100;
  LastCount:=High(RQBillItemList.list);
  with sgRQBillItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQBillItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQBillItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQBillItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQBillItemList.list[i].countGen.DecimalString;
        Cells[2,i+CurrentRow] := RQBillItemList.list[i].materialNameTxt;
        Cells[3,i+CurrentRow] := RQBillItemList.list[i].measurementNameTxt;
        if RQBillItemList.list[i].countFact = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := RQBillItemList.list[i].countFact.DecimalString;
        if RQBillItemList.list[i].priceWithoutNds = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := RQBillItemList.list[i].priceWithoutNds.DecimalString;
        if RQBillItemList.list[i].nds = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := RQBillItemList.list[i].nds.DecimalString;
        if RQBillItemList.list[i].sumWithoutNds = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := RQBillItemList.list[i].sumWithoutNds.DecimalString;
        if RQBillItemList.list[i].sumNds = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := RQBillItemList.list[i].sumNds.DecimalString;
        if RQBillItemList.list[i].sumGen = nil then
          Cells[9,i+CurrentRow] := ''
        else
         begin
          Cells[9,i+1] := RQBillItemList.list[i].sumGen.DecimalString;

            f := RQPayDocItem2BillItemFilter.Create;
            SetNullIntProps(f);
            SetNullXSProps(f);

            try
             f.billitem := RQBillItem.Create;
             f.billitem.code := RQBillItemList.list[i].code;
             RQPayDocItemList := TempRQPayDocItem2BillItem.getScrollableFilteredList(f,0,-1);
               for j:=0 to High(RQPayDocItemList.list) do
                begin
                 payDocItemSum:= payDocItemSum+ StrToFloat(RQPayDocItemList.list[j].summaGen.DecimalString);
                end;
                Cells[10,i+1] :=FloatToStr(payDocItemSum);
                Colors[10,i + 1] := $0080FF80;
           except
            on EConvertError do
             begin
              Application.MessageBox(PChar('Ошибка кода счета !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Exit;
            end;
          end;

         end;
        Cells[11,i+CurrentRow] := RQBillItemList.list[i].commentGen;
        Cells[12,i+CurrentRow] := RQBillItemList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQBillItem.Row:=CurrentRow-5;
   sgRQBillItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQBillItemShow.sgRQBillItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQBillItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQBillItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQBillItem.RowCount-1 do
   for j:=0 to sgRQBillItem.ColCount-1 do
     sgRQBillItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQBillItemShow.actViewExecute(Sender: TObject);
Var TempRQBillItem: RQBillItemControllerSoapPort;
begin
 TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
   try
     RQBillItemObj := TempRQBillItem.getObject(StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQBillItemEdit:=TfrmRQBillItemEdit.Create(Application, dsView);
  try
    frmRQBillItemEdit.ShowModal;
  finally
    frmRQBillItemEdit.Free;
    frmRQBillItemEdit:=nil;
  end;
end;

procedure TfrmRQBillItemShow.actEditExecute(Sender: TObject);
Var TempRQBillItem: RQBillItemControllerSoapPort;
begin
 TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
   try
     RQBillItemObj := TempRQBillItem.getObject(StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQBillItemEdit:=TfrmRQBillItemEdit.Create(Application, dsEdit);
  try
    if frmRQBillItemEdit.ShowModal= mrOk then
      begin
        //TempRQBillItem.save(RQBillItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQBillItemEdit.Free;
    frmRQBillItemEdit:=nil;
  end;
end;

procedure TfrmRQBillItemShow.actDeleteExecute(Sender: TObject);
Var TempRQBillItem: RQBillItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Пункти рахунку) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQBillItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQBillItemShow.actInsertExecute(Sender: TObject);
Var TempRQBillItem: RQBillItemControllerSoapPort;
begin
  TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
  RQBillItemObj:=RQBillItem.Create;

   RQBillItemObj.countGen:= TXSDecimal.Create;
   RQBillItemObj.countFact:= TXSDecimal.Create;
   RQBillItemObj.priceWithoutNds:= TXSDecimal.Create;
   RQBillItemObj.nds:= TXSDecimal.Create;
   RQBillItemObj.sumWithoutNds:= TXSDecimal.Create;
   RQBillItemObj.sumNds:= TXSDecimal.Create;
   RQBillItemObj.sumGen:= TXSDecimal.Create;
   RQBillItemObj.dateEdit:= TXSDate.Create;


  try
    frmRQBillItemEdit:=TfrmRQBillItemEdit.Create(Application, dsInsert);
    try
      if frmRQBillItemEdit.ShowModal = mrOk then
      begin
        if RQBillItemObj<>nil then
            //TempRQBillItem.add(RQBillItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQBillItemEdit.Free;
      frmRQBillItemEdit:=nil;
    end;
  finally
    RQBillItemObj.Free;
  end;
end;

procedure TfrmRQBillItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQBillItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQBillItemFilterEdit:=TfrmRQBillItemFilterEdit.Create(Application, dsEdit);
  try
    RQBillItemFilterObj := RQBillItemFilter.Create;
    SetNullIntProps(RQBillItemFilterObj);
    SetNullXSProps(RQBillItemFilterObj);

    if frmRQBillItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQBillItemFilter.Create;
      FilterObject := RQBillItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQBillItemFilterEdit.Free;
    frmRQBillItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQBillItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.