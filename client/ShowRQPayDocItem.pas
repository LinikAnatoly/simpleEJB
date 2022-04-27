
unit ShowRQPayDocItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit,
  InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2, ENConsts,
  RQPayDocItemController, ExtCtrls, StdCtrls, AdvObj;


type
  TfrmRQPayDocItemShow = class(TChildForm)  
  HTTPRIORQPayDocItem: THTTPRIO;
    ImageList1: TImageList;
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
    Panel1: TPanel;
    sgRQPayDocItem: TAdvStringGrid;
    Panel2: TPanel;
    ControlBar1: TControlBar;
    HTTPRIORQBillItem: THTTPRIO;
    sgRQBillItem: TAdvStringGrid;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    HTTPRIORQPayDoc: THTTPRIO;
    Label1: TLabel;
    HTTPRIORQBill: THTTPRIO;
    HTTPRIOAGSpecification: THTTPRIO;
    HTTPRIOAGSpecificationItem: THTTPRIO;
    HTTPRIORQBill2Item2AgItem: THTTPRIO;
    HTTPRIORQPayDocItem2BillItem: THTTPRIO;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQPayDocItemTopLeftChanged(Sender: TObject);
procedure sgRQPayDocItemDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure sgRQPayDocItemClick(Sender: TObject);
    procedure sgRQBillItemTopLeftChanged(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
     SummaPayDoc: Double;
     SummaGen: Double;
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // RQPayDocItemObj: RQPayDocItem;
 // RQPayDocItemFilterObj: RQPayDocItemFilter;
  
  
implementation

uses Main, EditRQPayDocItem, EditRQPayDocItemFilter,
  RQPayDocController, RQBillItemController, RQBillController,
  AGSpecificationController, AGSpecificationItemController,
  RQBill2Item2AgItemController, RQBillItem2ENEstimateItemController,
  RQPayDocItem2BillItemController, ShowRQPayDoc;


{$R *.dfm}

var
  //frmRQPayDocItemShow : TfrmRQPayDocItemShow;


  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPayDocItemHeaders: array [1..6] of String =
        ( 'Код'
          ,'Сума платежу'
          ,'Назва материалу '
          ,'Од. виміру материалу '
          ,'кількість'
          ,'Код2'
        );
   RQBillItemHeaders: array [1..12] of String =
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

procedure TfrmRQPayDocItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPayDocItemShow:=nil;
    inherited;
  end;


procedure TfrmRQPayDocItemShow.FormShow(Sender: TObject);
var
  TempRQPayDocItem: RQPayDocItemControllerSoapPort;
  i, h : Integer;
  RQPayDocItemList: RQPayDocItemShortList;
  j: Double;
begin

  if FilterObject = nil then
  begin
     FilterObject := RQPayDocItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SummaGen:=0;
  SetGridHeaders(RQPayDocItemHeaders, sgRQPayDocItem.ColumnHeaders);

  ClearGrid(sgRQPayDocItem);

  ColCount:=100;
  TempRQPayDocItem := HTTPRIORQPayDocItem as RQPayDocItemControllerSoapPort;

  RQPayDocItemList := TempRQPayDocItem.getScrollableFilteredList(RQPayDocItemFilter(FilterObject), 0 ,ColCount);

  LastCount:=High(RQPayDocItemList.list);

  if LastCount > -1 then
     sgRQPayDocItem.RowCount:=LastCount+2
  else
     sgRQPayDocItem.RowCount:=2;

   with sgRQPayDocItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPayDocItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPayDocItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQPayDocItemList.list[i].summaGen = nil then
          Cells[1,i+1] := ''
        else
         begin
          Cells[1,i+1] := RQPayDocItemList.list[i].summaFact.DecimalString;
          SummaGen:=SummaGen+ StrToFloat(RQPayDocItemList.list[i].summaFact.DecimalString);

         end;
         Cells[2,i+1] := RQPayDocItemList.list[i].materialName;
        Cells[3,i+1] := RQPayDocItemList.list[i].measurementName;
        if RQPayDocItemList.list[i].countFact = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQPayDocItemList.list[i].countFact.DecimalString;
           if RQPayDocItemList.list[i].code1 <> Low(Integer) then
        Cells[5,i+1] := IntToStr(RQPayDocItemList.list[i].code1)
        else
        Cells[5,i+1] := '';
        LastRow:=i+1;
        sgRQPayDocItem.RowCount:=LastRow+1;
        h := i + 1;
      end;

      try
        SummaPayDoc := StrToFloat(frmRQPayDocShow.sgRQPayDoc.Cells[1,frmRQPayDocShow.sgRQPayDoc.Row]);
      except
        SummaPayDoc:=0;
      end;

      if LastCount > -1 then
      begin
         if SummaPayDoc > 0 then begin
         LastRow:=h+1;
          sgRQPayDocItem.RowCount:=LastRow+1;
         end;
         sgRQPayDocItem.Cells[0,h+1] := ' Итого по позициям: ';
         try
          sgRQPayDocItem.Cells[1,h+1] := FloatToStr(SummaGen);
         except
         end;
          sgRQPayDocItem.RowCount:=sgRQPayDocItem.RowCount+1;
         sgRQPayDocItem.Cells[0,h+2] := ' Итого всего: ';
         try
          sgRQPayDocItem.Cells[1,h+2] := FloatToStr(SummaPayDoc);
         except
         end;
      end else
      begin
        sgRQPayDocItem.RowCount := 3;
        sgRQPayDocItem.Cells[0,1] := ' Итого по позициям: ';
        sgRQPayDocItem.Cells[1,1] := FloatToStr(SummaGen);
        sgRQPayDocItem.Cells[0,2] := ' Итого всего: ';
        sgRQPayDocItem.Cells[1,2] := FloatToStr(SummaPayDoc);
      end;


   ColCount:=ColCount+1;
   sgRQPayDocItem.Row:=1;
   sgRQPayDocItemClick(Sender);
end;

procedure TfrmRQPayDocItemShow.sgRQPayDocItemTopLeftChanged(Sender: TObject);
var
  TempRQPayDocItem: RQPayDocItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQPayDocItemList: RQPayDocItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPayDocItem.TopRow + sgRQPayDocItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQPayDocItem :=  HTTPRIORQPayDocItem as RQPayDocItemControllerSoapPort;
      CurrentRow:=sgRQPayDocItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPayDocItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPayDocItemList := TempRQPayDocItem.getScrollableFilteredList(RQPayDocItemFilter(FilterObject),ColCount-1, 100);

  sgRQPayDocItem.RowCount:=sgRQPayDocItem.RowCount+100;
  LastCount:=High(RQPayDocItemList.list);
  with sgRQPayDocItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPayDocItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPayDocItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQPayDocItemList.list[i].summaGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQPayDocItemList.list[i].summaGen.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPayDocItem.Row:=CurrentRow-5;
   sgRQPayDocItem.RowCount:=LastRow+1;
  end;


end;

procedure TfrmRQPayDocItemShow.sgRQPayDocItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPayDocItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPayDocItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 //for i:=1 to sgRQPayDocItem.RowCount-1 do
 //  for j:=0 to sgRQPayDocItem.ColCount-1 do
     sgRQPayDocItem.Clear;
   FormShow(Sender);
end;

procedure TfrmRQPayDocItemShow.actViewExecute(Sender: TObject);
Var TempRQPayDocItem: RQPayDocItemControllerSoapPort;
TempRQPayDoc: RQPayDocControllerSoapPort;
TempRQBillItem: RQBillItemControllerSoapPort;
TempRQBill: RQBillControllerSoapPort;
//RQBillObj1 : RQBill;
TempAGSpecificationItem: AGSpecificationItemControllerSoapPort;
TempAGSpecification: AGSpecificationControllerSoapPort;
TempAGSpecificationRef:  AGSpecificationRef;
TempRQBill2Item2AgItem: RQBill2Item2AgItemControllerSoapPort;
f:  RQBill2Item2AgItemFilter;
RQBill2Item2AgItemList  : RQBill2Item2AgItemShortList;

//c: TKMaterialsControllerSoapPort;
begin
TempRQPayDocItem := HTTPRIORQPayDocItem as RQPayDocItemControllerSoapPort;
  TempRQPayDoc := HTTPRIORQPayDoc as RQPayDocControllerSoapPort;
  TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
  TempAGSpecificationItem := HTTPRIOAGSpecificationItem as AGSpecificationItemControllerSoapPort;
  TempAGSpecification := HTTPRIOAGSpecification as AGSpecificationControllerSoapPort;
  TempRQBill2Item2AgItem := HTTPRIORQBill2Item2AgItem as RQBill2Item2AgItemControllerSoapPort;

  RQPayDocItemObj:=RQPayDocItem.Create;
  RQPayDocItemObj.payDocRef:= RQPayDocRef.Create();
  RQPayDocItemObj.payDocRef.code:= StrToInt(frmRQPayDocShow.sgRQPayDoc.Cells[0,frmRQPayDocShow.sgRQPayDoc.Row]);

  frmRQPayDocItemEdit:=TfrmRQPayDocItemEdit.Create(Application, dsView);
  try
    try

    frmRQPayDocItemEdit.edtPayDoc.Text:= TempRQPayDoc.getObject(RQPayDocItemObj.payDocRef.code).numberGen;
    frmRQPayDocItemEdit.edtBillItem.Text:=sgRQBillItem.Cells[0,sgRQBillItem.Row];
    frmRQPayDocItemEdit.edtRQBill.Text :=
    IntToStr(TempRQBillItem.getObject(StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row])).billRef.code);
    //TempRQBillItem.getObject(
    frmRQPayDocItemEdit.edtKolvo.Text :=  TempRQBillItem.getObject(StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row])).countFact.DecimalString;
     RQPayDocItemObj := TempRQPayDocItem.getObject(StrToInt(sgRQPayDocItem.Cells[0,sgRQPayDocItem.Row]));
     //Поиск спецификаций
      f := RQBill2Item2AgItemFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.billItem2EnEsItm := RQBillItem2ENEstimateItem.Create;
   f.billItem2EnEsItm.billItem := RQBillItem.Create;
  try
  // Находим привязку счетов и оплат (вытягиваем список - по идее там 1 запись)
    f.billItem2EnEsItm.billItem.code := StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row]);
      RQBill2Item2AgItemList := TempRQBill2Item2AgItem.getScrollableFilteredList(f,0, -1);
     if  RQBill2Item2AgItemList.totalCount > 0 then begin
      // Вытягиваем код итема спецификации
      frmRQPayDocItemEdit.edtSpecificationItem.Text:=IntToStr(RQBill2Item2AgItemList.list[0].agItemCode);
      TempAGSpecificationRef:= AGSpecificationRef.Create;
      TempAGSpecificationRef:=TempAGSpecificationItem.getObject(RQBill2Item2AgItemList.list[0].agItemCode).specificationRef;
      // Вытягиваем название спецификации
       frmRQPayDocItemEdit.edtSpecification.Text:= TempAGSpecification.getObject(TempAGSpecificationRef.code).name;
     end;
    //  RQBill2Item2AgItemList.list[0].agItemCode;
   except
      on EConvertError do
       begin
         Application.MessageBox(PChar('Ошибка кода позиции счета !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
         Exit;
       end;
   end;
   except
   on EConvertError do Exit;
  end;
    if frmRQPayDocItemEdit.ShowModal= mrOk then
      begin
        //TempRQPayDocItem.save(RQPayDocItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPayDocItemEdit.Free;
    frmRQPayDocItemEdit:=nil;
  end;
end;

procedure TfrmRQPayDocItemShow.actEditExecute(Sender: TObject);
Var TempRQPayDocItem: RQPayDocItemControllerSoapPort;
TempRQPayDoc: RQPayDocControllerSoapPort;
TempRQBillItem: RQBillItemControllerSoapPort;
TempRQPayDocItem2BillItem: RQPayDocItem2BillItemControllerSoapPort;
TempRQBill: RQBillControllerSoapPort;
//RQBillObj1 : RQBill;
TempAGSpecificationItem: AGSpecificationItemControllerSoapPort;
TempAGSpecification: AGSpecificationControllerSoapPort;
TempAGSpecificationRef:  AGSpecificationRef;
TempRQBill2Item2AgItem: RQBill2Item2AgItemControllerSoapPort;

f:  RQBill2Item2AgItemFilter;
fpaydoc2billitem: RQPayDocItem2BillItemFilter;
RQBill2Item2AgItemList  : RQBill2Item2AgItemShortList;
RQPayDocItem2BillItemList :RQPayDocItem2BillItemShortList ;

//c: TKMaterialsControllerSoapPort;
begin
 TempRQPayDocItem := HTTPRIORQPayDocItem as RQPayDocItemControllerSoapPort;
  TempRQPayDoc := HTTPRIORQPayDoc as RQPayDocControllerSoapPort;
  TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
  TempAGSpecificationItem := HTTPRIOAGSpecificationItem as AGSpecificationItemControllerSoapPort;
  TempAGSpecification := HTTPRIOAGSpecification as AGSpecificationControllerSoapPort;
  TempRQBill2Item2AgItem := HTTPRIORQBill2Item2AgItem as RQBill2Item2AgItemControllerSoapPort;

  RQPayDocItemObj:=RQPayDocItem.Create;
  RQPayDocItemObj.payDocRef:= RQPayDocRef.Create();
  RQPayDocItemObj.payDocRef.code:= StrToInt(frmRQPayDocShow.sgRQPayDoc.Cells[0,frmRQPayDocShow.sgRQPayDoc.Row]);

  frmRQPayDocItemEdit:=TfrmRQPayDocItemEdit.Create(Application, dsEdit);
  try
    try

    frmRQPayDocItemEdit.edtPayDoc.Text:= TempRQPayDoc.getObject(RQPayDocItemObj.payDocRef.code).numberGen;
    frmRQPayDocItemEdit.edtBillItem.Text:=sgRQBillItem.Cells[0,sgRQBillItem.Row];
    frmRQPayDocItemEdit.edtRQBill.Text :=
    IntToStr(TempRQBillItem.getObject(StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row])).billRef.code);
    //TempRQBillItem.getObject(
    frmRQPayDocItemEdit.edtKolvo.Text :=  TempRQBillItem.getObject(StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row])).countFact.DecimalString;
     RQPayDocItemObj := TempRQPayDocItem.getObject(StrToInt(sgRQPayDocItem.Cells[0,sgRQPayDocItem.Row]));
     //Поиск спецификаций
      f := RQBill2Item2AgItemFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.billItem2EnEsItm := RQBillItem2ENEstimateItem.Create;
   f.billItem2EnEsItm.billItem := RQBillItem.Create;
  try
  // Находим привязку счетов и оплат (вытягиваем список - по идее там 1 запись)
    f.billItem2EnEsItm.billItem.code := StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row]);
      RQBill2Item2AgItemList := TempRQBill2Item2AgItem.getScrollableFilteredList(f,0, -1);
     if  RQBill2Item2AgItemList.totalCount > 0 then begin
      // Вытягиваем код итема спецификации
      frmRQPayDocItemEdit.edtSpecificationItem.Text:=IntToStr(RQBill2Item2AgItemList.list[0].agItemCode);
      TempAGSpecificationRef:= AGSpecificationRef.Create;
      TempAGSpecificationRef:=TempAGSpecificationItem.getObject(RQBill2Item2AgItemList.list[0].agItemCode).specificationRef;
      // Вытягиваем название спецификации
       frmRQPayDocItemEdit.edtSpecification.Text:= TempAGSpecification.getObject(TempAGSpecificationRef.code).name;
     end;
    //  RQBill2Item2AgItemList.list[0].agItemCode;
   except
      on EConvertError do
       begin
         Application.MessageBox(PChar('Ошибка кода позиции счета !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
         Exit;
       end;
   end;
   except
   on EConvertError do Exit;
  end;
    if frmRQPayDocItemEdit.ShowModal= mrOk then
      begin
        //TempRQPayDocItem.save(RQPayDocItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPayDocItemEdit.Free;
    frmRQPayDocItemEdit:=nil;
  end;
end;

procedure TfrmRQPayDocItemShow.actDeleteExecute(Sender: TObject);
Var TempRQPayDocItem: RQPayDocItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPayDocItem := HTTPRIORQPayDocItem as RQPayDocItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPayDocItem.Cells[0,sgRQPayDocItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Оплата деталі) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPayDocItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPayDocItemShow.actInsertExecute(Sender: TObject);
Var TempRQPayDocItem: RQPayDocItemControllerSoapPort;
TempRQPayDoc: RQPayDocControllerSoapPort;
begin
  TempRQPayDocItem := HTTPRIORQPayDocItem as RQPayDocItemControllerSoapPort;
  TempRQPayDoc := HTTPRIORQPayDoc as RQPayDocControllerSoapPort;
  RQPayDocItemObj:=RQPayDocItem.Create;
  RQPayDocItemObj.payDocRef:= RQPayDocRef.Create();
  RQPayDocItemObj.payDocRef.code:= StrToInt(frmRQPayDocShow.sgRQPayDoc.Cells[0,frmRQPayDocShow.sgRQPayDoc.Row]);
  RQPayDocItemObj.summaGen:= TXSDecimal.Create;

  try
    frmRQPayDocItemEdit:=TfrmRQPayDocItemEdit.Create(Application, dsInsert);
    frmRQPayDocItemEdit.edtPayDoc.Text:= TempRQPayDoc.getObject(RQPayDocItemObj.payDocRef.code).numberGen;
    try
      if frmRQPayDocItemEdit.ShowModal = mrOk then
      begin
        if RQPayDocItemObj<>nil then
            //TempRQPayDocItem.add(RQPayDocItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPayDocItemEdit.Free;
      frmRQPayDocItemEdit:=nil;
    end;
  finally
    RQPayDocItemObj.Free;
  end;
end;


procedure TfrmRQPayDocItemShow.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPayDocItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQPayDocItemFilterEdit:=TfrmRQPayDocItemFilterEdit.Create(Application, dsEdit);
  try
    RQPayDocItemFilterObj := RQPayDocItemFilter.Create;
    SetNullIntProps(RQPayDocItemFilterObj);
    SetNullXSProps(RQPayDocItemFilterObj);

    if frmRQPayDocItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPayDocItemFilter.Create;
      FilterObject := RQPayDocItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPayDocItemFilterEdit.Free;
    frmRQPayDocItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPayDocItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmRQPayDocItemShow.sgRQPayDocItemClick(Sender: TObject);
var
  TempRQBillItem: RQBillItemControllerSoapPort;
  TempRQPayDocItem: RQPayDocItemControllerSoapPort;
  TempRQPayDocItem2BillItem: RQPayDocItem2BillItemControllerSoapPort;
  i,code1, j: Integer;
  RQBillItemList: RQBillItemShortList;
  f1:  RQBillItemFilter;
  f2:  RQPayDocItem2BillItemFilter;
  f3: RQPayDocItem2BillItem;

begin

  ClearGrid(sgRQBillItem);
  SetGridHeaders(RQBillItemHeaders, sgRQBillItem.ColumnHeaders);

  ColCount:=100;

  TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
  TempRQPayDocItem := HTTPRIORQPayDocItem as RQPayDocItemControllerSoapPort;
  TempRQPayDocItem2BillItem:= HTTPRIORQPayDocItem2BillItem as RQPayDocItem2BillItemControllerSoapPort;
    f1:= RQBillItemFilter.Create;
     SetNullIntProps(f1);
     SetNullXSProps(f1);
  try
     f3:= TempRQPayDocItem2BillItem.getObject( StrToInt(sgRQPayDocItem.Cells[5,sgRQPayDocItem.Row]));
     f1.code:= f3.billitem.code;
  except
        on EConvertError do Exit;
  end;
  //if f1 = nil then
 // begin
 {    f1:= RQBillItemFilter.Create;
     SetNullIntProps(f1);
     SetNullXSProps(f1);
 // end;
//  f.billItemRef := RQBillItemRef.Create();
 try
  f1.code:= TempRQPayDocItem.getObject( StrToInt(sgRQPayDocItem.Cells[0,sgRQPayDocItem.Row])).billItem.code;
  //StrToInt(sgRQPayDocItem.Cells[0,sgRQPayDocItem.Row]);
 except
        on EConvertError do Exit;
 end;      }
  RQBillItemList := TempRQBillItem.getScrollableFilteredList(f1,0,ColCount);


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
          Cells[8,i+1] := RQBillItemList.list[i].sumNds.DecimalString;
        if RQBillItemList.list[i].sumGen = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQBillItemList.list[i].sumGen.DecimalString;
        Cells[10,i+1] := RQBillItemList.list[i].commentGen;
        Cells[11,i+1] := RQBillItemList.list[i].userGen;
        LastRow:=i+1;
        sgRQBillItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQBillItem.Row:=1;
end;

procedure TfrmRQPayDocItemShow.sgRQBillItemTopLeftChanged(Sender: TObject);
var
  TempRQBillItem: RQBillItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQBillItemList: RQBillItemShortList;
  begin
  if LastCount < 99 then Exit;
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
          Cells[9,i+CurrentRow] := RQBillItemList.list[i].sumGen.DecimalString;
        Cells[10,i+CurrentRow] := RQBillItemList.list[i].commentGen;
        Cells[11,i+CurrentRow] := RQBillItemList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQBillItem.Row:=CurrentRow-5;
   sgRQBillItem.RowCount:=LastRow+1;
  end;
end;


end.
