
unit ShowRQTransportInvoice; 

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQTransportInvoiceController, StdCtrls, ExtCtrls, AdvObj ;


type
  TfrmRQTransportInvoiceShow = class(TChildForm)  
  HTTPRIORQTransportInvoice: THTTPRIO;
    ImageList1: TImageList;
    sgRQTransportInvoice: TAdvStringGrid;
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
    pnlRQTransportInvoiceItem: TPanel;
    spl1: TSplitter;
    grpRQTransportInvoiceItem: TGroupBox;
    sgRQTransportInvoiceItem: TAdvStringGrid;
    HTTPRIORQTransportInvoiceItem: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQTransportInvoiceTopLeftChanged(Sender: TObject);
procedure sgRQTransportInvoiceDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure sgRQTransportInvoiceClick(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   procedure UpdateItemGrid();
 end;

var
 frmRQTransportInvoiceShow : TfrmRQTransportInvoiceShow;
 // RQTransportInvoiceObj: RQTransportInvoice;
 // RQTransportInvoiceFilterObj: RQTransportInvoiceFilter;
  
  
implementation

uses Main, EditRQTransportInvoice, EditRQTransportInvoiceFilter, RQTransportInvoiceItemController;


{$R *.dfm}

var
  //frmRQTransportInvoiceShow : TfrmRQTransportInvoiceShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQTransportInvoiceHeaders: array [1..8] of String =
        ( 'Код'
          ,'Номер'
          ,'Номер проекту'
          ,'Дата накладної'
          ,'загальна вага, кг'
          ,'статус'
          ,'користувач'
          ,'дата зміни'
        );
  RQTransportInvoiceItemHeaders: array [1..7] of String =
        ( 'Код'
          ,'Назва материалу'
          ,'Од. виміру материалу'
          ,'кількість'
          ,'Вага, кг'
          ,'Примітка'
          ,'користувач який вніс зміни'
        );
   

procedure TfrmRQTransportInvoiceShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQTransportInvoiceShow:=nil;
    inherited;
  end;


procedure TfrmRQTransportInvoiceShow.FormShow(Sender: TObject);
var
  TempRQTransportInvoice: RQTransportInvoiceControllerSoapPort;
  i: Integer;
  RQTransportInvoiceList: RQTransportInvoiceShortList;
  begin
  SetGridHeaders(RQTransportInvoiceHeaders, sgRQTransportInvoice.ColumnHeaders);
  ColCount:=100;
  TempRQTransportInvoice :=  HTTPRIORQTransportInvoice as RQTransportInvoiceControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQTransportInvoiceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQTransportInvoiceList := TempRQTransportInvoice.getScrollableFilteredList(RQTransportInvoiceFilter(FilterObject),0,ColCount);

  LastCount:=High(RQTransportInvoiceList.list);

  if LastCount > -1 then
     sgRQTransportInvoice.RowCount:=LastCount+2
  else
     sgRQTransportInvoice.RowCount:=2;

   with sgRQTransportInvoice do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQTransportInvoiceList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQTransportInvoiceList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := RQTransportInvoiceList.list[i].numberDoc;
        Cells[2,i+1] := RQTransportInvoiceList.list[i].numberProject;

        if RQTransportInvoiceList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(RQTransportInvoiceList.list[i].dateGen);

        if RQTransportInvoiceList.list[i].totalWeight = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQTransportInvoiceList.list[i].totalWeight.DecimalString;

        Cells[5,i+1] := RQTransportInvoiceList.list[i].statusRefName;
        Cells[6,i+1] := RQTransportInvoiceList.list[i].userGen;

        if RQTransportInvoiceList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(RQTransportInvoiceList.list[i].dateEdit);

        LastRow:=i+1;
        sgRQTransportInvoice.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQTransportInvoice.Row:=1;
   UpdateItemGrid();
end;

procedure TfrmRQTransportInvoiceShow.sgRQTransportInvoiceTopLeftChanged(Sender: TObject);
var
  TempRQTransportInvoice: RQTransportInvoiceControllerSoapPort;
  i,CurrentRow: Integer;
  RQTransportInvoiceList: RQTransportInvoiceShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQTransportInvoice.TopRow + sgRQTransportInvoice.VisibleRowCount) = ColCount
  then
    begin
      TempRQTransportInvoice :=  HTTPRIORQTransportInvoice as RQTransportInvoiceControllerSoapPort;
      CurrentRow:=sgRQTransportInvoice.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQTransportInvoiceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQTransportInvoiceList := TempRQTransportInvoice.getScrollableFilteredList(RQTransportInvoiceFilter(FilterObject),ColCount-1, 100);



  sgRQTransportInvoice.RowCount:=sgRQTransportInvoice.RowCount+100;
  LastCount:=High(RQTransportInvoiceList.list);
  with sgRQTransportInvoice do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQTransportInvoiceList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQTransportInvoiceList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := RQTransportInvoiceList.list[i].numberDoc;
        Cells[2,i+CurrentRow] := RQTransportInvoiceList.list[i].numberProject;

        if RQTransportInvoiceList.list[i].dateGen = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(RQTransportInvoiceList.list[i].dateGen);

        if RQTransportInvoiceList.list[i].totalWeight = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := RQTransportInvoiceList.list[i].totalWeight.DecimalString;

        Cells[5,i+CurrentRow] := RQTransportInvoiceList.list[i].statusRefName;
        Cells[6,i+CurrentRow] := RQTransportInvoiceList.list[i].userGen;

        if RQTransportInvoiceList.list[i].dateEdit = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDateTimeWithDate2String(RQTransportInvoiceList.list[i].dateEdit);

        LastRow:=i+CurrentRow;

      end;
   ColCount:=ColCount+100;
   sgRQTransportInvoice.Row:=CurrentRow-5;
   sgRQTransportInvoice.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQTransportInvoiceShow.sgRQTransportInvoiceDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQTransportInvoice,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQTransportInvoiceShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQTransportInvoice.RowCount-1 do
   for j:=0 to sgRQTransportInvoice.ColCount-1 do
     sgRQTransportInvoice.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQTransportInvoiceShow.actViewExecute(Sender: TObject);
Var TempRQTransportInvoice: RQTransportInvoiceControllerSoapPort;
begin
 TempRQTransportInvoice := HTTPRIORQTransportInvoice as RQTransportInvoiceControllerSoapPort;
   try
     RQTransportInvoiceObj := TempRQTransportInvoice.getObject(StrToInt(sgRQTransportInvoice.Cells[0,sgRQTransportInvoice.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQTransportInvoiceEdit:=TfrmRQTransportInvoiceEdit.Create(Application, dsView);
  try
    frmRQTransportInvoiceEdit.ShowModal;
  finally
    frmRQTransportInvoiceEdit.Free;
    frmRQTransportInvoiceEdit:=nil;
  end;
end;

procedure TfrmRQTransportInvoiceShow.actEditExecute(Sender: TObject);
Var TempRQTransportInvoice: RQTransportInvoiceControllerSoapPort;
begin
 TempRQTransportInvoice := HTTPRIORQTransportInvoice as RQTransportInvoiceControllerSoapPort;
   try
     RQTransportInvoiceObj := TempRQTransportInvoice.getObject(StrToInt(sgRQTransportInvoice.Cells[0,sgRQTransportInvoice.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQTransportInvoiceEdit:=TfrmRQTransportInvoiceEdit.Create(Application, dsEdit);
  try
    if frmRQTransportInvoiceEdit.ShowModal= mrOk then
      begin
        //TempRQTransportInvoice.save(RQTransportInvoiceObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQTransportInvoiceEdit.Free;
    frmRQTransportInvoiceEdit:=nil;
  end;
end;

procedure TfrmRQTransportInvoiceShow.actDeleteExecute(Sender: TObject);
Var TempRQTransportInvoice: RQTransportInvoiceControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQTransportInvoice := HTTPRIORQTransportInvoice as RQTransportInvoiceControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQTransportInvoice.Cells[0,sgRQTransportInvoice.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Товаро-транспортна накладна) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQTransportInvoice.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQTransportInvoiceShow.actInsertExecute(Sender: TObject);
// Var TempRQTransportInvoice: RQTransportInvoiceControllerSoapPort; 
begin
  // TempRQTransportInvoice := HTTPRIORQTransportInvoice as RQTransportInvoiceControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQTransportInvoiceObj:=RQTransportInvoice.Create;

   //RQTransportInvoiceObj.dateGen:= TXSDate.Create;
   //RQTransportInvoiceObj.dateEdit:= TXSDateTime.Create;


  try
    frmRQTransportInvoiceEdit:=TfrmRQTransportInvoiceEdit.Create(Application, dsInsert);
    try
      if frmRQTransportInvoiceEdit.ShowModal = mrOk then
      begin
        if RQTransportInvoiceObj<>nil then
            //TempRQTransportInvoice.add(RQTransportInvoiceObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQTransportInvoiceEdit.Free;
      frmRQTransportInvoiceEdit:=nil;
    end;
  finally
    RQTransportInvoiceObj.Free;
  end;
end;

procedure TfrmRQTransportInvoiceShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQTransportInvoiceShow.actFilterExecute(Sender: TObject);
begin
frmRQTransportInvoiceFilterEdit:=TfrmRQTransportInvoiceFilterEdit.Create(Application, dsInsert);
  try
    RQTransportInvoiceFilterObj := RQTransportInvoiceFilter.Create;
    SetNullIntProps(RQTransportInvoiceFilterObj);
    SetNullXSProps(RQTransportInvoiceFilterObj);

    if frmRQTransportInvoiceFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQTransportInvoiceFilter.Create;
      FilterObject := RQTransportInvoiceFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQTransportInvoiceFilterEdit.Free;
    frmRQTransportInvoiceFilterEdit:=nil;
  end;
end;

procedure TfrmRQTransportInvoiceShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

 procedure TfrmRQTransportInvoiceShow.UpdateItemGrid();
 var
  TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort;
  i, invoiceCode, invoiceItemLastCount: Integer;
  RQTransportInvoiceItemList: RQTransportInvoiceItemShortList;
  invoiceItemFilter : RQTransportInvoiceItemFilter;

  begin
   try
     invoiceCode := StrToInt(sgRQTransportInvoice.Cells[0,sgRQTransportInvoice.Row]);
   except
   on EConvertError do Exit;
  end;
  sgRQTransportInvoiceItem.Clear;
  SetGridHeaders(RQTransportInvoiceItemHeaders, sgRQTransportInvoiceItem.ColumnHeaders);
  TempRQTransportInvoiceItem :=  HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;

     invoiceItemFilter := RQTransportInvoiceItemFilter.Create;
     SetNullIntProps(invoiceItemFilter);
     SetNullXSProps(invoiceItemFilter);
     invoiceItemFilter.transportInvoiceRef := RQTransportInvoiceRef.Create;
     invoiceItemFilter.transportInvoiceRef.code := invoiceCode;

  RQTransportInvoiceItemList := TempRQTransportInvoiceItem.getScrollableFilteredList(invoiceItemFilter,0,-1);

  invoiceItemLastCount:=High(RQTransportInvoiceItemList.list);

  if invoiceItemLastCount > -1 then
     sgRQTransportInvoiceItem.RowCount:=invoiceItemLastCount+2
  else
     sgRQTransportInvoiceItem.RowCount:=2;

   with sgRQTransportInvoiceItem do
    for i:=0 to invoiceItemLastCount do
      begin
        // Application.ProcessMessages;
        if RQTransportInvoiceItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQTransportInvoiceItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQTransportInvoiceItemList.list[i].materialName;
        Cells[2,i+1] := RQTransportInvoiceItemList.list[i].measurementName;
        if RQTransportInvoiceItemList.list[i].countFact = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := RQTransportInvoiceItemList.list[i].countFact.DecimalString;
        if RQTransportInvoiceItemList.list[i].weight = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQTransportInvoiceItemList.list[i].weight.DecimalString;
        Cells[5,i+1] := RQTransportInvoiceItemList.list[i].commentGen;
        Cells[6,i+1] := RQTransportInvoiceItemList.list[i].userGen;
        sgRQTransportInvoiceItem.RowCount:=i+2;
      end;
   sgRQTransportInvoiceItem.Row:=1;
end;

procedure TfrmRQTransportInvoiceShow.sgRQTransportInvoiceClick(
  Sender: TObject);
begin
  inherited;
  UpdateItemGrid();
end;

end.