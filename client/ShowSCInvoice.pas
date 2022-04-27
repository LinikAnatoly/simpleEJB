
unit ShowSCInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  SCInvoiceController, AdvObj ;


type
  TfrmSCInvoiceShow = class(TChildForm)  
  HTTPRIOSCInvoice: THTTPRIO;
    ImageList1: TImageList;
    sgSCInvoice: TAdvStringGrid;
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
procedure sgSCInvoiceTopLeftChanged(Sender: TObject);
procedure sgSCInvoiceDblClick(Sender: TObject);
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
 frmSCInvoiceShow : TfrmSCInvoiceShow;
 // SCInvoiceObj: SCInvoice;
 // SCInvoiceFilterObj: SCInvoiceFilter;
  
  
implementation

uses Main, EditSCInvoice, EditSCInvoiceFilter;


{$R *.dfm}

var
  //frmSCInvoiceShow : TfrmSCInvoiceShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  SCInvoiceHeaders: array [1..19] of String =
        ( 'Код'
          ,'счет'
          ,'код МВО'
          ,'код Підрозділу'
          ,'код істочника'
          ,'код затрат'
          ,'тип лічільника'
          ,'Примітка'
          ,'номер приб. накладної'
          ,'Дата приб. накладної'
          ,'номер Податкової накладної'
          ,'Бух. дата приходу'
          ,'код постачальника'
          ,'код договору'
          ,'вартість з ПДВ'
          ,'ПДВ'
          ,'Бух. вартість'
          ,'кількість'
          ,'код з SC'
        );
   

procedure TfrmSCInvoiceShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmSCInvoiceShow:=nil;
    inherited;
  end;


procedure TfrmSCInvoiceShow.FormShow(Sender: TObject);
var
  TempSCInvoice: SCInvoiceControllerSoapPort;
  i: Integer;
  SCInvoiceList: SCInvoiceShortList;
  begin
  SetGridHeaders(SCInvoiceHeaders, sgSCInvoice.ColumnHeaders);
  ColCount:=100;
  TempSCInvoice :=  HTTPRIOSCInvoice as SCInvoiceControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := SCInvoiceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCInvoiceList := TempSCInvoice.getScrollableFilteredList(SCInvoiceFilter(FilterObject),0,ColCount);


  LastCount:=High(SCInvoiceList.list);

  if LastCount > -1 then
     sgSCInvoice.RowCount:=LastCount+2
  else
     sgSCInvoice.RowCount:=2;

   with sgSCInvoice do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCInvoiceList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCInvoiceList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := SCInvoiceList.list[i].subAccountCode;
        Cells[2,i+1] := SCInvoiceList.list[i].molCode;
        Cells[3,i+1] := SCInvoiceList.list[i].podrCode;
        Cells[4,i+1] := SCInvoiceList.list[i].sourceCode;
        Cells[5,i+1] := SCInvoiceList.list[i].costCode;
        Cells[6,i+1] := SCInvoiceList.list[i].counterType;
        Cells[7,i+1] := SCInvoiceList.list[i].characters;
        Cells[8,i+1] := SCInvoiceList.list[i].numberDoc;
        if SCInvoiceList.list[i].dateDoc = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(SCInvoiceList.list[i].dateDoc);
        Cells[10,i+1] := SCInvoiceList.list[i].numberTax;
        if SCInvoiceList.list[i].dateBuh = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := XSDate2String(SCInvoiceList.list[i].dateBuh);
        Cells[12,i+1] := SCInvoiceList.list[i].supplierCode;
        Cells[13,i+1] := SCInvoiceList.list[i].contractCode;
        if SCInvoiceList.list[i].sumWithNds = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := SCInvoiceList.list[i].sumWithNds.DecimalString;
        if SCInvoiceList.list[i].sumNds = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := SCInvoiceList.list[i].sumNds.DecimalString;
        if SCInvoiceList.list[i].sumGen = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := SCInvoiceList.list[i].sumGen.DecimalString;
        if SCInvoiceList.list[i].countGen = Low(Integer) then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := IntToStr(SCInvoiceList.list[i].countGen);
        if SCInvoiceList.list[i].scCode = Low(Integer) then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := IntToStr(SCInvoiceList.list[i].scCode);
        LastRow:=i+1;
        sgSCInvoice.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgSCInvoice.Row:=1;
end;

procedure TfrmSCInvoiceShow.sgSCInvoiceTopLeftChanged(Sender: TObject);
var
  TempSCInvoice: SCInvoiceControllerSoapPort;
  i,CurrentRow: Integer;
  SCInvoiceList: SCInvoiceShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgSCInvoice.TopRow + sgSCInvoice.VisibleRowCount) = ColCount
  then
    begin
      TempSCInvoice :=  HTTPRIOSCInvoice as SCInvoiceControllerSoapPort;
      CurrentRow:=sgSCInvoice.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := SCInvoiceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCInvoiceList := TempSCInvoice.getScrollableFilteredList(SCInvoiceFilter(FilterObject),ColCount-1, 100);



  sgSCInvoice.RowCount:=sgSCInvoice.RowCount+100;
  LastCount:=High(SCInvoiceList.list);
  with sgSCInvoice do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCInvoiceList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(SCInvoiceList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := SCInvoiceList.list[i].subAccountCode;
        Cells[2,i+CurrentRow] := SCInvoiceList.list[i].molCode;
        Cells[3,i+CurrentRow] := SCInvoiceList.list[i].podrCode;
        Cells[4,i+CurrentRow] := SCInvoiceList.list[i].sourceCode;
        Cells[5,i+CurrentRow] := SCInvoiceList.list[i].costCode;
        Cells[6,i+CurrentRow] := SCInvoiceList.list[i].counterType;
        Cells[7,i+CurrentRow] := SCInvoiceList.list[i].characters;
        Cells[8,i+CurrentRow] := SCInvoiceList.list[i].numberDoc;
        if SCInvoiceList.list[i].dateDoc = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDate2String(SCInvoiceList.list[i].dateDoc);
        Cells[10,i+CurrentRow] := SCInvoiceList.list[i].numberTax;
        if SCInvoiceList.list[i].dateBuh = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := XSDate2String(SCInvoiceList.list[i].dateBuh);
        Cells[12,i+CurrentRow] := SCInvoiceList.list[i].supplierCode;
        Cells[13,i+CurrentRow] := SCInvoiceList.list[i].contractCode;
        if SCInvoiceList.list[i].sumWithNds = nil then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := SCInvoiceList.list[i].sumWithNds.DecimalString;
        if SCInvoiceList.list[i].sumNds = nil then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := SCInvoiceList.list[i].sumNds.DecimalString;
        if SCInvoiceList.list[i].sumGen = nil then
          Cells[16,i+CurrentRow] := ''
        else
          Cells[16,i+CurrentRow] := SCInvoiceList.list[i].sumGen.DecimalString;
        if SCInvoiceList.list[i].countGen = Low(Integer) then
          Cells[17,i+CurrentRow] := ''
        else
          Cells[17,i+CurrentRow] := IntToStr(SCInvoiceList.list[i].countGen);
        if SCInvoiceList.list[i].scCode = Low(Integer) then
          Cells[18,i+CurrentRow] := ''
        else
          Cells[18,i+CurrentRow] := IntToStr(SCInvoiceList.list[i].scCode);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgSCInvoice.Row:=CurrentRow-5;
   sgSCInvoice.RowCount:=LastRow+1;
  end;
end;

procedure TfrmSCInvoiceShow.sgSCInvoiceDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgSCInvoice,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmSCInvoiceShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgSCInvoice.RowCount-1 do
   for j:=0 to sgSCInvoice.ColCount-1 do
     sgSCInvoice.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmSCInvoiceShow.actViewExecute(Sender: TObject);
Var TempSCInvoice: SCInvoiceControllerSoapPort;
begin
 TempSCInvoice := HTTPRIOSCInvoice as SCInvoiceControllerSoapPort;
   try
     SCInvoiceObj := TempSCInvoice.getObject(StrToInt(sgSCInvoice.Cells[0,sgSCInvoice.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCInvoiceEdit:=TfrmSCInvoiceEdit.Create(Application, dsView);
  try
    frmSCInvoiceEdit.ShowModal;
  finally
    frmSCInvoiceEdit.Free;
    frmSCInvoiceEdit:=nil;
  end;
end;

procedure TfrmSCInvoiceShow.actEditExecute(Sender: TObject);
Var TempSCInvoice: SCInvoiceControllerSoapPort;
begin
 TempSCInvoice := HTTPRIOSCInvoice as SCInvoiceControllerSoapPort;
   try
     SCInvoiceObj := TempSCInvoice.getObject(StrToInt(sgSCInvoice.Cells[0,sgSCInvoice.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCInvoiceEdit:=TfrmSCInvoiceEdit.Create(Application, dsEdit);
  try
    if frmSCInvoiceEdit.ShowModal= mrOk then
      begin
        //TempSCInvoice.save(SCInvoiceObj);
        UpdateGrid(Sender);
      end;
  finally
    frmSCInvoiceEdit.Free;
    frmSCInvoiceEdit:=nil;
  end;
end;

procedure TfrmSCInvoiceShow.actDeleteExecute(Sender: TObject);
Var TempSCInvoice: SCInvoiceControllerSoapPort;
  ObjCode: Integer;
begin
 TempSCInvoice := HTTPRIOSCInvoice as SCInvoiceControllerSoapPort;
   try
     ObjCode := StrToInt(sgSCInvoice.Cells[0,sgSCInvoice.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Накладна для ScanCounters) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempSCInvoice.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmSCInvoiceShow.actInsertExecute(Sender: TObject);
Var TempSCInvoice: SCInvoiceControllerSoapPort;
begin
  TempSCInvoice := HTTPRIOSCInvoice as SCInvoiceControllerSoapPort;
  SCInvoiceObj:=SCInvoice.Create;

   //SCInvoiceObj.dateDoc:= TXSDate.Create;
   //SCInvoiceObj.dateBuh:= TXSDate.Create;
   //SCInvoiceObj.sumWithNds:= TXSDecimal.Create;
   //SCInvoiceObj.sumNds:= TXSDecimal.Create;
   //SCInvoiceObj.sumGen:= TXSDecimal.Create;


  try
    frmSCInvoiceEdit:=TfrmSCInvoiceEdit.Create(Application, dsInsert);
    try
      if frmSCInvoiceEdit.ShowModal = mrOk then
      begin
        if SCInvoiceObj<>nil then
            //TempSCInvoice.add(SCInvoiceObj);
            UpdateGrid(Sender);
      end;
    finally
      frmSCInvoiceEdit.Free;
      frmSCInvoiceEdit:=nil;
    end;
  finally
    SCInvoiceObj.Free;
  end;
end;

procedure TfrmSCInvoiceShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmSCInvoiceShow.actFilterExecute(Sender: TObject);
begin
{frmSCInvoiceFilterEdit:=TfrmSCInvoiceFilterEdit.Create(Application, dsInsert);
  try
    SCInvoiceFilterObj := SCInvoiceFilter.Create;
    SetNullIntProps(SCInvoiceFilterObj);
    SetNullXSProps(SCInvoiceFilterObj);

    if frmSCInvoiceFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := SCInvoiceFilter.Create;
      FilterObject := SCInvoiceFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmSCInvoiceFilterEdit.Free;
    frmSCInvoiceFilterEdit:=nil;
  end;}
end;

procedure TfrmSCInvoiceShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.