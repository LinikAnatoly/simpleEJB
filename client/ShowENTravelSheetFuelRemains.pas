
unit ShowENTravelSheetFuelRemains;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTravelSheetFuelRemainsController, AdvObj ;


type
  TfrmENTravelSheetFuelRemainsShow = class(TChildForm)  
  HTTPRIOENTravelSheetFuelRemains: THTTPRIO;
    ImageList1: TImageList;
    sgENTravelSheetFuelRemains: TAdvStringGrid;
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
procedure sgENTravelSheetFuelRemainsTopLeftChanged(Sender: TObject);
procedure sgENTravelSheetFuelRemainsDblClick(Sender: TObject);
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
 // ENTravelSheetFuelRemainsObj: ENTravelSheetFuelRemains;
 // ENTravelSheetFuelRemainsFilterObj: ENTravelSheetFuelRemainsFilter;
  
  
implementation

uses Main, EditENTravelSheetFuelRemains, EditENTravelSheetFuelRemainsFilter;


{$R *.dfm}

var
  //frmENTravelSheetFuelRemainsShow : TfrmENTravelSheetFuelRemainsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTravelSheetFuelRemainsHeaders: array [1..14] of String =
        ( 'Код'
          ,'Дата'
          ,'кількість на початок'
          ,'ціна на початок'
          ,'вартість на початок'
          ,'кількість виданого'
          ,'ціна виданого'
          ,'вартість виданого'
          ,'кількість списаного'
          ,'ціна списаного'
          ,'вартість списаного'
          ,'кількість на кінець'
          ,'ціна на кінець'
          ,'вартість на кінець'
        );
   

procedure TfrmENTravelSheetFuelRemainsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTravelSheetFuelRemainsShow:=nil;
    inherited;
  end;


procedure TfrmENTravelSheetFuelRemainsShow.FormShow(Sender: TObject);
var
  TempENTravelSheetFuelRemains: ENTravelSheetFuelRemainsControllerSoapPort;
  i: Integer;
  ENTravelSheetFuelRemainsList: ENTravelSheetFuelRemainsShortList;
  begin
  SetGridHeaders(ENTravelSheetFuelRemainsHeaders, sgENTravelSheetFuelRemains.ColumnHeaders);
  ColCount:=100;
  TempENTravelSheetFuelRemains :=  HTTPRIOENTravelSheetFuelRemains as ENTravelSheetFuelRemainsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetFuelRemainsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetFuelRemainsList := TempENTravelSheetFuelRemains.getScrollableFilteredList(ENTravelSheetFuelRemainsFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTravelSheetFuelRemainsList.list);

  if LastCount > -1 then
     sgENTravelSheetFuelRemains.RowCount:=LastCount+2
  else
     sgENTravelSheetFuelRemains.RowCount:=2;

   with sgENTravelSheetFuelRemains do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetFuelRemainsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetFuelRemainsList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENTravelSheetFuelRemainsList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENTravelSheetFuelRemainsList.list[i].dateGen);
        if ENTravelSheetFuelRemainsList.list[i].countGenStart = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENTravelSheetFuelRemainsList.list[i].countGenStart.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].priceGenStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENTravelSheetFuelRemainsList.list[i].priceGenStart.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].sumGenStart = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTravelSheetFuelRemainsList.list[i].sumGenStart.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].countGenIn = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTravelSheetFuelRemainsList.list[i].countGenIn.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].priceGenIn = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENTravelSheetFuelRemainsList.list[i].priceGenIn.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].sumGenIn = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENTravelSheetFuelRemainsList.list[i].sumGenIn.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].countGenOut = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENTravelSheetFuelRemainsList.list[i].countGenOut.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].priceGenOut = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENTravelSheetFuelRemainsList.list[i].priceGenOut.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].sumGenOut = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENTravelSheetFuelRemainsList.list[i].sumGenOut.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].countGenFinal = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := ENTravelSheetFuelRemainsList.list[i].countGenFinal.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].priceGenFinal = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := ENTravelSheetFuelRemainsList.list[i].priceGenFinal.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].sumGenFinal = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := ENTravelSheetFuelRemainsList.list[i].sumGenFinal.DecimalString;
        LastRow:=i+1;
        sgENTravelSheetFuelRemains.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTravelSheetFuelRemains.Row:=1;
end;

procedure TfrmENTravelSheetFuelRemainsShow.sgENTravelSheetFuelRemainsTopLeftChanged(Sender: TObject);
var
  TempENTravelSheetFuelRemains: ENTravelSheetFuelRemainsControllerSoapPort;
  i,CurrentRow: Integer;
  ENTravelSheetFuelRemainsList: ENTravelSheetFuelRemainsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTravelSheetFuelRemains.TopRow + sgENTravelSheetFuelRemains.VisibleRowCount) = ColCount
  then
    begin
      TempENTravelSheetFuelRemains :=  HTTPRIOENTravelSheetFuelRemains as ENTravelSheetFuelRemainsControllerSoapPort;
      CurrentRow:=sgENTravelSheetFuelRemains.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetFuelRemainsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetFuelRemainsList := TempENTravelSheetFuelRemains.getScrollableFilteredList(ENTravelSheetFuelRemainsFilter(FilterObject),ColCount-1, 100);



  sgENTravelSheetFuelRemains.RowCount:=sgENTravelSheetFuelRemains.RowCount+100;
  LastCount:=High(ENTravelSheetFuelRemainsList.list);
  with sgENTravelSheetFuelRemains do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetFuelRemainsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTravelSheetFuelRemainsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENTravelSheetFuelRemainsList.list[i].dateGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENTravelSheetFuelRemainsList.list[i].dateGen);
        if ENTravelSheetFuelRemainsList.list[i].countGenStart = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENTravelSheetFuelRemainsList.list[i].countGenStart.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].priceGenStart = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENTravelSheetFuelRemainsList.list[i].priceGenStart.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].sumGenStart = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENTravelSheetFuelRemainsList.list[i].sumGenStart.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].countGenIn = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENTravelSheetFuelRemainsList.list[i].countGenIn.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].priceGenIn = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENTravelSheetFuelRemainsList.list[i].priceGenIn.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].sumGenIn = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENTravelSheetFuelRemainsList.list[i].sumGenIn.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].countGenOut = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENTravelSheetFuelRemainsList.list[i].countGenOut.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].priceGenOut = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENTravelSheetFuelRemainsList.list[i].priceGenOut.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].sumGenOut = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := ENTravelSheetFuelRemainsList.list[i].sumGenOut.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].countGenFinal = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := ENTravelSheetFuelRemainsList.list[i].countGenFinal.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].priceGenFinal = nil then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := ENTravelSheetFuelRemainsList.list[i].priceGenFinal.DecimalString;
        if ENTravelSheetFuelRemainsList.list[i].sumGenFinal = nil then
          Cells[13,i+CurrentRow] := ''
        else
          Cells[13,i+CurrentRow] := ENTravelSheetFuelRemainsList.list[i].sumGenFinal.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTravelSheetFuelRemains.Row:=CurrentRow-5;
   sgENTravelSheetFuelRemains.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTravelSheetFuelRemainsShow.sgENTravelSheetFuelRemainsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTravelSheetFuelRemains,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTravelSheetFuelRemainsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTravelSheetFuelRemains.RowCount-1 do
   for j:=0 to sgENTravelSheetFuelRemains.ColCount-1 do
     sgENTravelSheetFuelRemains.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTravelSheetFuelRemainsShow.actViewExecute(Sender: TObject);
Var TempENTravelSheetFuelRemains: ENTravelSheetFuelRemainsControllerSoapPort;
begin
 TempENTravelSheetFuelRemains := HTTPRIOENTravelSheetFuelRemains as ENTravelSheetFuelRemainsControllerSoapPort;
   try
     ENTravelSheetFuelRemainsObj := TempENTravelSheetFuelRemains.getObject(StrToInt(sgENTravelSheetFuelRemains.Cells[0,sgENTravelSheetFuelRemains.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetFuelRemainsEdit:=TfrmENTravelSheetFuelRemainsEdit.Create(Application, dsView);
  try
    frmENTravelSheetFuelRemainsEdit.ShowModal;
  finally
    frmENTravelSheetFuelRemainsEdit.Free;
    frmENTravelSheetFuelRemainsEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetFuelRemainsShow.actEditExecute(Sender: TObject);
Var TempENTravelSheetFuelRemains: ENTravelSheetFuelRemainsControllerSoapPort;
begin
 TempENTravelSheetFuelRemains := HTTPRIOENTravelSheetFuelRemains as ENTravelSheetFuelRemainsControllerSoapPort;
   try
     ENTravelSheetFuelRemainsObj := TempENTravelSheetFuelRemains.getObject(StrToInt(sgENTravelSheetFuelRemains.Cells[0,sgENTravelSheetFuelRemains.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetFuelRemainsEdit:=TfrmENTravelSheetFuelRemainsEdit.Create(Application, dsEdit);
  try
    if frmENTravelSheetFuelRemainsEdit.ShowModal= mrOk then
      begin
        //TempENTravelSheetFuelRemains.save(ENTravelSheetFuelRemainsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTravelSheetFuelRemainsEdit.Free;
    frmENTravelSheetFuelRemainsEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetFuelRemainsShow.actDeleteExecute(Sender: TObject);
Var TempENTravelSheetFuelRemains: ENTravelSheetFuelRemainsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTravelSheetFuelRemains := HTTPRIOENTravelSheetFuelRemains as ENTravelSheetFuelRemainsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravelSheetFuelRemains.Cells[0,sgENTravelSheetFuelRemains.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Оборот ПММ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelSheetFuelRemains.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTravelSheetFuelRemainsShow.actInsertExecute(Sender: TObject);
Var TempENTravelSheetFuelRemains: ENTravelSheetFuelRemainsControllerSoapPort;
begin
  TempENTravelSheetFuelRemains := HTTPRIOENTravelSheetFuelRemains as ENTravelSheetFuelRemainsControllerSoapPort;
  ENTravelSheetFuelRemainsObj:=ENTravelSheetFuelRemains.Create;

   //ENTravelSheetFuelRemainsObj.dateGen:= TXSDate.Create;
   //ENTravelSheetFuelRemainsObj.countGenStart:= TXSDecimal.Create;
   //ENTravelSheetFuelRemainsObj.priceGenStart:= TXSDecimal.Create;
   //ENTravelSheetFuelRemainsObj.sumGenStart:= TXSDecimal.Create;
   //ENTravelSheetFuelRemainsObj.countGenIn:= TXSDecimal.Create;
   //ENTravelSheetFuelRemainsObj.priceGenIn:= TXSDecimal.Create;
   //ENTravelSheetFuelRemainsObj.sumGenIn:= TXSDecimal.Create;
   //ENTravelSheetFuelRemainsObj.countGenOut:= TXSDecimal.Create;
   //ENTravelSheetFuelRemainsObj.priceGenOut:= TXSDecimal.Create;
   //ENTravelSheetFuelRemainsObj.sumGenOut:= TXSDecimal.Create;
   //ENTravelSheetFuelRemainsObj.countGenFinal:= TXSDecimal.Create;
   //ENTravelSheetFuelRemainsObj.priceGenFinal:= TXSDecimal.Create;
   //ENTravelSheetFuelRemainsObj.sumGenFinal:= TXSDecimal.Create;


  try
    frmENTravelSheetFuelRemainsEdit:=TfrmENTravelSheetFuelRemainsEdit.Create(Application, dsInsert);
    try
      if frmENTravelSheetFuelRemainsEdit.ShowModal = mrOk then
      begin
        if ENTravelSheetFuelRemainsObj<>nil then
            //TempENTravelSheetFuelRemains.add(ENTravelSheetFuelRemainsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTravelSheetFuelRemainsEdit.Free;
      frmENTravelSheetFuelRemainsEdit:=nil;
    end;
  finally
    ENTravelSheetFuelRemainsObj.Free;
  end;
end;

procedure TfrmENTravelSheetFuelRemainsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTravelSheetFuelRemainsShow.actFilterExecute(Sender: TObject);
begin
{frmENTravelSheetFuelRemainsFilterEdit:=TfrmENTravelSheetFuelRemainsFilterEdit.Create(Application, dsInsert);
  try
    ENTravelSheetFuelRemainsFilterObj := ENTravelSheetFuelRemainsFilter.Create;
    SetNullIntProps(ENTravelSheetFuelRemainsFilterObj);
    SetNullXSProps(ENTravelSheetFuelRemainsFilterObj);

    if frmENTravelSheetFuelRemainsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTravelSheetFuelRemainsFilter.Create;
      FilterObject := ENTravelSheetFuelRemainsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTravelSheetFuelRemainsFilterEdit.Free;
    frmENTravelSheetFuelRemainsFilterEdit:=nil;
  end;}
end;

procedure TfrmENTravelSheetFuelRemainsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.