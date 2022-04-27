
unit ShowENAccumulators;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAccumulatorsController, AdvObj ;


type
  TfrmENAccumulatorsShow = class(TChildForm)  
  HTTPRIOENAccumulators: THTTPRIO;
    ImageList1: TImageList;
    sgENAccumulators: TAdvStringGrid;
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
procedure sgENAccumulatorsTopLeftChanged(Sender: TObject);
procedure sgENAccumulatorsDblClick(Sender: TObject);
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
 frmENAccumulatorsShow : TfrmENAccumulatorsShow;
 // ENAccumulatorsObj: ENAccumulators;
 // ENAccumulatorsFilterObj: ENAccumulatorsFilter;
  
  
implementation

uses Main, EditENAccumulators, EditENAccumulatorsFilter;


{$R *.dfm}

var
  //frmENAccumulatorsShow : TfrmENAccumulatorsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAccumulatorsHeaders: array [1..11] of String =
        ( 'Код'
          ,'наименование агрегата'
          ,'марка или тип'
          ,'завод-изготовитель'
          ,'гаражный №'
          ,'год выпуска'
          ,'заводской №'
          ,'дата поступления в автохозяйство'
          ,'отработано м/час до поступления в автохозяйство'
          ,'отработано с начала эксплуатации'
          ,'ресурс м/час'
        );
   

procedure TfrmENAccumulatorsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAccumulatorsShow:=nil;
    inherited;
  end;


procedure TfrmENAccumulatorsShow.FormShow(Sender: TObject);
var
  TempENAccumulators: ENAccumulatorsControllerSoapPort;
  i: Integer;
  ENAccumulatorsList: ENAccumulatorsShortList;
  begin
  SetGridHeaders(ENAccumulatorsHeaders, sgENAccumulators.ColumnHeaders);
  ColCount:=100;
  TempENAccumulators :=  HTTPRIOENAccumulators as ENAccumulatorsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAccumulatorsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAccumulatorsList := TempENAccumulators.getScrollableFilteredList(ENAccumulatorsFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAccumulatorsList.list);

  if LastCount > -1 then
     sgENAccumulators.RowCount:=LastCount+2
  else
     sgENAccumulators.RowCount:=2;

   with sgENAccumulators do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAccumulatorsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAccumulatorsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENAccumulatorsList.list[i].name;
        Cells[2,i+1] := ENAccumulatorsList.list[i].typeName;
        Cells[3,i+1] := ENAccumulatorsList.list[i].factory;
        Cells[4,i+1] := ENAccumulatorsList.list[i].garageNumber;
        Cells[5,i+1] := ENAccumulatorsList.list[i].yearProduction;
        Cells[6,i+1] := ENAccumulatorsList.list[i].serialNumber;
        if ENAccumulatorsList.list[i].receiptDate = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENAccumulatorsList.list[i].receiptDate);
        if ENAccumulatorsList.list[i].mileage = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENAccumulatorsList.list[i].mileage.DecimalString;
        if ENAccumulatorsList.list[i].mileageAll = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENAccumulatorsList.list[i].mileageAll.DecimalString;
        if ENAccumulatorsList.list[i].potencial = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENAccumulatorsList.list[i].potencial.DecimalString;
        LastRow:=i+1;
        sgENAccumulators.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAccumulators.Row:=1;
end;

procedure TfrmENAccumulatorsShow.sgENAccumulatorsTopLeftChanged(Sender: TObject);
var
  TempENAccumulators: ENAccumulatorsControllerSoapPort;
  i,CurrentRow: Integer;
  ENAccumulatorsList: ENAccumulatorsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAccumulators.TopRow + sgENAccumulators.VisibleRowCount) = ColCount
  then
    begin
      TempENAccumulators :=  HTTPRIOENAccumulators as ENAccumulatorsControllerSoapPort;
      CurrentRow:=sgENAccumulators.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAccumulatorsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAccumulatorsList := TempENAccumulators.getScrollableFilteredList(ENAccumulatorsFilter(FilterObject),ColCount-1, 100);



  sgENAccumulators.RowCount:=sgENAccumulators.RowCount+100;
  LastCount:=High(ENAccumulatorsList.list);
  with sgENAccumulators do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAccumulatorsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAccumulatorsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENAccumulatorsList.list[i].name;
        Cells[2,i+CurrentRow] := ENAccumulatorsList.list[i].typeName;
        Cells[3,i+CurrentRow] := ENAccumulatorsList.list[i].factory;
        Cells[4,i+CurrentRow] := ENAccumulatorsList.list[i].garageNumber;
        Cells[5,i+CurrentRow] := ENAccumulatorsList.list[i].yearProduction;
        Cells[6,i+CurrentRow] := ENAccumulatorsList.list[i].serialNumber;
        if ENAccumulatorsList.list[i].receiptDate = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDate2String(ENAccumulatorsList.list[i].receiptDate);
        if ENAccumulatorsList.list[i].mileage = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENAccumulatorsList.list[i].mileage.DecimalString;
        if ENAccumulatorsList.list[i].mileageAll = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENAccumulatorsList.list[i].mileageAll.DecimalString;
        if ENAccumulatorsList.list[i].potencial = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := ENAccumulatorsList.list[i].potencial.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAccumulators.Row:=CurrentRow-5;
   sgENAccumulators.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAccumulatorsShow.sgENAccumulatorsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAccumulators,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAccumulatorsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAccumulators.RowCount-1 do
   for j:=0 to sgENAccumulators.ColCount-1 do
     sgENAccumulators.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAccumulatorsShow.actViewExecute(Sender: TObject);
var TempENAccumulators: ENAccumulatorsControllerSoapPort;
    ObjCode : Integer;
begin
 TempENAccumulators := HTTPRIOENAccumulators as ENAccumulatorsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAccumulators.Cells[0,sgENAccumulators.Row]);
   except
   on EConvertError do Exit;
  end;
  frmENAccumulatorsEdit:=TfrmENAccumulatorsEdit.Create(Application, dsView);
  try
    frmENAccumulatorsEdit.ENAccumulatorsObj := TempENAccumulators.getObject(ObjCode);
    frmENAccumulatorsEdit.ShowModal;
  finally
    frmENAccumulatorsEdit.Free;
    frmENAccumulatorsEdit:=nil;
  end;
end;


procedure TfrmENAccumulatorsShow.actEditExecute(Sender: TObject);
var TempENAccumulators: ENAccumulatorsControllerSoapPort;
    ObjCode : Integer;
begin
 TempENAccumulators := HTTPRIOENAccumulators as ENAccumulatorsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAccumulators.Cells[0,sgENAccumulators.Row]);
   except
   on EConvertError do Exit;
  end;
  frmENAccumulatorsEdit:=TfrmENAccumulatorsEdit.Create(Application, dsEdit);
  try
    frmENAccumulatorsEdit.ENAccumulatorsObj := TempENAccumulators.getObject(ObjCode);
    if frmENAccumulatorsEdit.ShowModal= mrOk then
      begin
        //TempENAccumulators.save(ENAccumulatorsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAccumulatorsEdit.Free;
    frmENAccumulatorsEdit:=nil;
  end;
end;

procedure TfrmENAccumulatorsShow.actDeleteExecute(Sender: TObject);
Var TempENAccumulators: ENAccumulatorsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAccumulators := HTTPRIOENAccumulators as ENAccumulatorsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAccumulators.Cells[0,sgENAccumulators.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Аккумуляторы) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAccumulators.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAccumulatorsShow.actInsertExecute(Sender: TObject);
Var TempENAccumulators: ENAccumulatorsControllerSoapPort;
begin
  TempENAccumulators := HTTPRIOENAccumulators as ENAccumulatorsControllerSoapPort;

   //ENAccumulatorsObj.receiptDate:= TXSDate.Create;
   //ENAccumulatorsObj.mileage:= TXSDecimal.Create;
   //ENAccumulatorsObj.mileageAll:= TXSDecimal.Create;
   //ENAccumulatorsObj.potencial:= TXSDecimal.Create;

  try
    frmENAccumulatorsEdit := TfrmENAccumulatorsEdit.Create(Application, dsInsert);
    frmENAccumulatorsEdit.ENAccumulatorsObj := ENAccumulators.Create;  

    try
      if frmENAccumulatorsEdit.ShowModal = mrOk then
      begin
        if frmENAccumulatorsEdit.ENAccumulatorsObj <> nil then
            //TempENAccumulators.add(ENAccumulatorsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAccumulatorsEdit.Free;
      frmENAccumulatorsEdit:=nil;
    end;
  finally
    //ENAccumulatorsObj.Free;
  end;
end;

procedure TfrmENAccumulatorsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAccumulatorsShow.actFilterExecute(Sender: TObject);
begin
frmENAccumulatorsFilterEdit:=TfrmENAccumulatorsFilterEdit.Create(Application, dsInsert);
  try
    ENAccumulatorsFilterObj := ENAccumulatorsFilter.Create;
    SetNullIntProps(ENAccumulatorsFilterObj);
    SetNullXSProps(ENAccumulatorsFilterObj);

    if frmENAccumulatorsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAccumulatorsFilter.Create;
      FilterObject := ENAccumulatorsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAccumulatorsFilterEdit.Free;
    frmENAccumulatorsFilterEdit:=nil;
  end;
end;

procedure TfrmENAccumulatorsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.