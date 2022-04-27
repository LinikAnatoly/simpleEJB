
unit ShowENTransportRealFuelRemains;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransportRealFuelRemainsController ;


type
  TfrmENTransportRealFuelRemainsShow = class(TChildForm)  
  HTTPRIOENTransportRealFuelRemains: THTTPRIO;
    ImageList1: TImageList;
    sgENTransportRealFuelRemains: TAdvStringGrid;
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
procedure sgENTransportRealFuelRemainsTopLeftChanged(Sender: TObject);
procedure sgENTransportRealFuelRemainsDblClick(Sender: TObject);
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
 // ENTransportRealFuelRemainsObj: ENTransportRealFuelRemains;
 // ENTransportRealFuelRemainsFilterObj: ENTransportRealFuelRemainsFilter;
  
  
implementation

uses Main, EditENTransportRealFuelRemains, EditENTransportRealFuelRemainsFilter;


{$R *.dfm}

var
  //frmENTransportRealFuelRemainsShow : TfrmENTransportRealFuelRemainsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransportRealFuelRemainsHeaders: array [1..15] of String =
        ( 'Код'
          ,'Дата початку періоду'
          ,'Дата закінчення періоду'
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
   

procedure TfrmENTransportRealFuelRemainsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransportRealFuelRemainsShow:=nil;
    inherited;
  end;


procedure TfrmENTransportRealFuelRemainsShow.FormShow(Sender: TObject);
var
  TempENTransportRealFuelRemains: ENTransportRealFuelRemainsControllerSoapPort;
  i: Integer;
  ENTransportRealFuelRemainsList: ENTransportRealFuelRemainsShortList;
  begin
  SetGridHeaders(ENTransportRealFuelRemainsHeaders, sgENTransportRealFuelRemains.ColumnHeaders);
  ColCount:=100;
  TempENTransportRealFuelRemains :=  HTTPRIOENTransportRealFuelRemains as ENTransportRealFuelRemainsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportRealFuelRemainsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportRealFuelRemainsList := TempENTransportRealFuelRemains.getScrollableFilteredList(ENTransportRealFuelRemainsFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransportRealFuelRemainsList.list);

  if LastCount > -1 then
     sgENTransportRealFuelRemains.RowCount:=LastCount+2
  else
     sgENTransportRealFuelRemains.RowCount:=2;

   with sgENTransportRealFuelRemains do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportRealFuelRemainsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportRealFuelRemainsList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENTransportRealFuelRemainsList.list[i].dateStart = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENTransportRealFuelRemainsList.list[i].dateStart);
        if ENTransportRealFuelRemainsList.list[i].dateFinal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENTransportRealFuelRemainsList.list[i].dateFinal);
        if ENTransportRealFuelRemainsList.list[i].countGenStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENTransportRealFuelRemainsList.list[i].countGenStart.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].priceGenStart = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportRealFuelRemainsList.list[i].priceGenStart.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].sumGenStart = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTransportRealFuelRemainsList.list[i].sumGenStart.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].countGenIn = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENTransportRealFuelRemainsList.list[i].countGenIn.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].priceGenIn = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENTransportRealFuelRemainsList.list[i].priceGenIn.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].sumGenIn = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENTransportRealFuelRemainsList.list[i].sumGenIn.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].countGenOut = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENTransportRealFuelRemainsList.list[i].countGenOut.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].priceGenOut = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENTransportRealFuelRemainsList.list[i].priceGenOut.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].sumGenOut = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := ENTransportRealFuelRemainsList.list[i].sumGenOut.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].countGenFinal = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := ENTransportRealFuelRemainsList.list[i].countGenFinal.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].priceGenFinal = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := ENTransportRealFuelRemainsList.list[i].priceGenFinal.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].sumGenFinal = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := ENTransportRealFuelRemainsList.list[i].sumGenFinal.DecimalString;
        LastRow:=i+1;
        sgENTransportRealFuelRemains.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransportRealFuelRemains.Row:=1;
end;

procedure TfrmENTransportRealFuelRemainsShow.sgENTransportRealFuelRemainsTopLeftChanged(Sender: TObject);
var
  TempENTransportRealFuelRemains: ENTransportRealFuelRemainsControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransportRealFuelRemainsList: ENTransportRealFuelRemainsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransportRealFuelRemains.TopRow + sgENTransportRealFuelRemains.VisibleRowCount) = ColCount
  then
    begin
      TempENTransportRealFuelRemains :=  HTTPRIOENTransportRealFuelRemains as ENTransportRealFuelRemainsControllerSoapPort;
      CurrentRow:=sgENTransportRealFuelRemains.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportRealFuelRemainsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportRealFuelRemainsList := TempENTransportRealFuelRemains.getScrollableFilteredList(ENTransportRealFuelRemainsFilter(FilterObject),ColCount-1, 100);



  sgENTransportRealFuelRemains.RowCount:=sgENTransportRealFuelRemains.RowCount+100;
  LastCount:=High(ENTransportRealFuelRemainsList.list);
  with sgENTransportRealFuelRemains do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportRealFuelRemainsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportRealFuelRemainsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENTransportRealFuelRemainsList.list[i].dateStart = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENTransportRealFuelRemainsList.list[i].dateStart);
        if ENTransportRealFuelRemainsList.list[i].dateFinal = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENTransportRealFuelRemainsList.list[i].dateFinal);
        if ENTransportRealFuelRemainsList.list[i].countGenStart = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENTransportRealFuelRemainsList.list[i].countGenStart.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].priceGenStart = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENTransportRealFuelRemainsList.list[i].priceGenStart.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].sumGenStart = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENTransportRealFuelRemainsList.list[i].sumGenStart.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].countGenIn = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENTransportRealFuelRemainsList.list[i].countGenIn.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].priceGenIn = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENTransportRealFuelRemainsList.list[i].priceGenIn.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].sumGenIn = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENTransportRealFuelRemainsList.list[i].sumGenIn.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].countGenOut = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENTransportRealFuelRemainsList.list[i].countGenOut.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].priceGenOut = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := ENTransportRealFuelRemainsList.list[i].priceGenOut.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].sumGenOut = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := ENTransportRealFuelRemainsList.list[i].sumGenOut.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].countGenFinal = nil then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := ENTransportRealFuelRemainsList.list[i].countGenFinal.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].priceGenFinal = nil then
          Cells[13,i+CurrentRow] := ''
        else
          Cells[13,i+CurrentRow] := ENTransportRealFuelRemainsList.list[i].priceGenFinal.DecimalString;
        if ENTransportRealFuelRemainsList.list[i].sumGenFinal = nil then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := ENTransportRealFuelRemainsList.list[i].sumGenFinal.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransportRealFuelRemains.Row:=CurrentRow-5;
   sgENTransportRealFuelRemains.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransportRealFuelRemainsShow.sgENTransportRealFuelRemainsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransportRealFuelRemains,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransportRealFuelRemainsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransportRealFuelRemains.RowCount-1 do
   for j:=0 to sgENTransportRealFuelRemains.ColCount-1 do
     sgENTransportRealFuelRemains.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransportRealFuelRemainsShow.actViewExecute(Sender: TObject);
Var TempENTransportRealFuelRemains: ENTransportRealFuelRemainsControllerSoapPort;
begin
 TempENTransportRealFuelRemains := HTTPRIOENTransportRealFuelRemains as ENTransportRealFuelRemainsControllerSoapPort;
   try
     ENTransportRealFuelRemainsObj := TempENTransportRealFuelRemains.getObject(StrToInt(sgENTransportRealFuelRemains.Cells[0,sgENTransportRealFuelRemains.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportRealFuelRemainsEdit:=TfrmENTransportRealFuelRemainsEdit.Create(Application, dsView);
  try
    frmENTransportRealFuelRemainsEdit.ShowModal;
  finally
    frmENTransportRealFuelRemainsEdit.Free;
    frmENTransportRealFuelRemainsEdit:=nil;
  end;
end;

procedure TfrmENTransportRealFuelRemainsShow.actEditExecute(Sender: TObject);
Var TempENTransportRealFuelRemains: ENTransportRealFuelRemainsControllerSoapPort;
begin
 TempENTransportRealFuelRemains := HTTPRIOENTransportRealFuelRemains as ENTransportRealFuelRemainsControllerSoapPort;
   try
     ENTransportRealFuelRemainsObj := TempENTransportRealFuelRemains.getObject(StrToInt(sgENTransportRealFuelRemains.Cells[0,sgENTransportRealFuelRemains.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportRealFuelRemainsEdit:=TfrmENTransportRealFuelRemainsEdit.Create(Application, dsEdit);
  try
    if frmENTransportRealFuelRemainsEdit.ShowModal= mrOk then
      begin
        //TempENTransportRealFuelRemains.save(ENTransportRealFuelRemainsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransportRealFuelRemainsEdit.Free;
    frmENTransportRealFuelRemainsEdit:=nil;
  end;
end;

procedure TfrmENTransportRealFuelRemainsShow.actDeleteExecute(Sender: TObject);
Var TempENTransportRealFuelRemains: ENTransportRealFuelRemainsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportRealFuelRemains := HTTPRIOENTransportRealFuelRemains as ENTransportRealFuelRemainsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportRealFuelRemains.Cells[0,sgENTransportRealFuelRemains.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Оборот ПММ за період) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportRealFuelRemains.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransportRealFuelRemainsShow.actInsertExecute(Sender: TObject);
Var TempENTransportRealFuelRemains: ENTransportRealFuelRemainsControllerSoapPort;
begin
  TempENTransportRealFuelRemains := HTTPRIOENTransportRealFuelRemains as ENTransportRealFuelRemainsControllerSoapPort;
  ENTransportRealFuelRemainsObj:=ENTransportRealFuelRemains.Create;

   //ENTransportRealFuelRemainsObj.dateStart:= TXSDate.Create;
   //ENTransportRealFuelRemainsObj.dateFinal:= TXSDate.Create;
   //ENTransportRealFuelRemainsObj.countGenStart:= TXSDecimal.Create;
   //ENTransportRealFuelRemainsObj.priceGenStart:= TXSDecimal.Create;
   //ENTransportRealFuelRemainsObj.sumGenStart:= TXSDecimal.Create;
   //ENTransportRealFuelRemainsObj.countGenIn:= TXSDecimal.Create;
   //ENTransportRealFuelRemainsObj.priceGenIn:= TXSDecimal.Create;
   //ENTransportRealFuelRemainsObj.sumGenIn:= TXSDecimal.Create;
   //ENTransportRealFuelRemainsObj.countGenOut:= TXSDecimal.Create;
   //ENTransportRealFuelRemainsObj.priceGenOut:= TXSDecimal.Create;
   //ENTransportRealFuelRemainsObj.sumGenOut:= TXSDecimal.Create;
   //ENTransportRealFuelRemainsObj.countGenFinal:= TXSDecimal.Create;
   //ENTransportRealFuelRemainsObj.priceGenFinal:= TXSDecimal.Create;
   //ENTransportRealFuelRemainsObj.sumGenFinal:= TXSDecimal.Create;


  try
    frmENTransportRealFuelRemainsEdit:=TfrmENTransportRealFuelRemainsEdit.Create(Application, dsInsert);
    try
      if frmENTransportRealFuelRemainsEdit.ShowModal = mrOk then
      begin
        if ENTransportRealFuelRemainsObj<>nil then
            //TempENTransportRealFuelRemains.add(ENTransportRealFuelRemainsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportRealFuelRemainsEdit.Free;
      frmENTransportRealFuelRemainsEdit:=nil;
    end;
  finally
    ENTransportRealFuelRemainsObj.Free;
  end;
end;

procedure TfrmENTransportRealFuelRemainsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransportRealFuelRemainsShow.actFilterExecute(Sender: TObject);
begin
{frmENTransportRealFuelRemainsFilterEdit:=TfrmENTransportRealFuelRemainsFilterEdit.Create(Application, dsInsert);
  try
    ENTransportRealFuelRemainsFilterObj := ENTransportRealFuelRemainsFilter.Create;
    SetNullIntProps(ENTransportRealFuelRemainsFilterObj);
    SetNullXSProps(ENTransportRealFuelRemainsFilterObj);

    if frmENTransportRealFuelRemainsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTransportRealFuelRemainsFilter.Create;
      FilterObject := ENTransportRealFuelRemainsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransportRealFuelRemainsFilterEdit.Free;
    frmENTransportRealFuelRemainsFilterEdit:=nil;
  end;}
end;

procedure TfrmENTransportRealFuelRemainsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.