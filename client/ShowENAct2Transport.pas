
unit ShowENAct2Transport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAct2TransportController ;


type
  TfrmENAct2TransportShow = class(TChildForm)  
  HTTPRIOENAct2Transport: THTTPRIO;
    ImageList1: TImageList;
    sgENAct2Transport: TAdvStringGrid;
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
procedure sgENAct2TransportTopLeftChanged(Sender: TObject);
procedure sgENAct2TransportDblClick(Sender: TObject);
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
 // ENAct2TransportObj: ENAct2Transport;
 // ENAct2TransportFilterObj: ENAct2TransportFilter;
  
  
implementation

uses Main, EditENAct2Transport, EditENAct2TransportFilter;


{$R *.dfm}

var
  //frmENAct2TransportShow : TfrmENAct2TransportShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAct2TransportHeaders: array [1..8] of String =
        ( 'Код'
          ,'инв №'
          ,'название'
          ,'расход ГСМ'
          ,'амортизация в мес'
          ,'амортизация в час'
          ,'часов отработано фактически'
          ,'витрати , грн'
        );
   

procedure TfrmENAct2TransportShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAct2TransportShow:=nil;
    inherited;
  end;


procedure TfrmENAct2TransportShow.FormShow(Sender: TObject);
var
  TempENAct2Transport: ENAct2TransportControllerSoapPort;
  i: Integer;
  ENAct2TransportList: ENAct2TransportShortList;
  begin
  SetGridHeaders(ENAct2TransportHeaders, sgENAct2Transport.ColumnHeaders);
  ColCount:=100;
  TempENAct2Transport :=  HTTPRIOENAct2Transport as ENAct2TransportControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAct2TransportFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAct2TransportList := TempENAct2Transport.getScrollableFilteredList(ENAct2TransportFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAct2TransportList.list);

  if LastCount > -1 then
     sgENAct2Transport.RowCount:=LastCount+2
  else
     sgENAct2Transport.RowCount:=2;

   with sgENAct2Transport do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAct2TransportList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAct2TransportList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENAct2TransportList.list[i].invNumber;
        Cells[2,i+1] := ENAct2TransportList.list[i].name;
        if ENAct2TransportList.list[i].expense = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENAct2TransportList.list[i].expense.DecimalString;
        if ENAct2TransportList.list[i].depreciationMonth = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENAct2TransportList.list[i].depreciationMonth.DecimalString;
        if ENAct2TransportList.list[i].depreciationHours = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENAct2TransportList.list[i].depreciationHours.DecimalString;
        if ENAct2TransportList.list[i].timeWork = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENAct2TransportList.list[i].timeWork.DecimalString;
        if ENAct2TransportList.list[i].paysWork = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENAct2TransportList.list[i].paysWork.DecimalString;
        LastRow:=i+1;
        sgENAct2Transport.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAct2Transport.Row:=1;
end;

procedure TfrmENAct2TransportShow.sgENAct2TransportTopLeftChanged(Sender: TObject);
var
  TempENAct2Transport: ENAct2TransportControllerSoapPort;
  i,CurrentRow: Integer;
  ENAct2TransportList: ENAct2TransportShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAct2Transport.TopRow + sgENAct2Transport.VisibleRowCount) = ColCount
  then
    begin
      TempENAct2Transport :=  HTTPRIOENAct2Transport as ENAct2TransportControllerSoapPort;
      CurrentRow:=sgENAct2Transport.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAct2TransportFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAct2TransportList := TempENAct2Transport.getScrollableFilteredList(ENAct2TransportFilter(FilterObject),ColCount-1, 100);



  sgENAct2Transport.RowCount:=sgENAct2Transport.RowCount+100;
  LastCount:=High(ENAct2TransportList.list);
  with sgENAct2Transport do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAct2TransportList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAct2TransportList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENAct2TransportList.list[i].invNumber;
        Cells[2,i+CurrentRow] := ENAct2TransportList.list[i].name;
        if ENAct2TransportList.list[i].expense = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENAct2TransportList.list[i].expense.DecimalString;
        if ENAct2TransportList.list[i].depreciationMonth = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENAct2TransportList.list[i].depreciationMonth.DecimalString;
        if ENAct2TransportList.list[i].depreciationHours = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENAct2TransportList.list[i].depreciationHours.DecimalString;
        if ENAct2TransportList.list[i].timeWork = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENAct2TransportList.list[i].timeWork.DecimalString;
        if ENAct2TransportList.list[i].paysWork = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENAct2TransportList.list[i].paysWork.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAct2Transport.Row:=CurrentRow-5;
   sgENAct2Transport.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAct2TransportShow.sgENAct2TransportDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAct2Transport,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAct2TransportShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAct2Transport.RowCount-1 do
   for j:=0 to sgENAct2Transport.ColCount-1 do
     sgENAct2Transport.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAct2TransportShow.actViewExecute(Sender: TObject);
Var TempENAct2Transport: ENAct2TransportControllerSoapPort;
begin
 TempENAct2Transport := HTTPRIOENAct2Transport as ENAct2TransportControllerSoapPort;
   try
     ENAct2TransportObj := TempENAct2Transport.getObject(StrToInt(sgENAct2Transport.Cells[0,sgENAct2Transport.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAct2TransportEdit:=TfrmENAct2TransportEdit.Create(Application, dsView);
  try
    frmENAct2TransportEdit.ShowModal;
  finally
    frmENAct2TransportEdit.Free;
    frmENAct2TransportEdit:=nil;
  end;
end;

procedure TfrmENAct2TransportShow.actEditExecute(Sender: TObject);
Var TempENAct2Transport: ENAct2TransportControllerSoapPort;
begin
 TempENAct2Transport := HTTPRIOENAct2Transport as ENAct2TransportControllerSoapPort;
   try
     ENAct2TransportObj := TempENAct2Transport.getObject(StrToInt(sgENAct2Transport.Cells[0,sgENAct2Transport.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAct2TransportEdit:=TfrmENAct2TransportEdit.Create(Application, dsEdit);
  try
    if frmENAct2TransportEdit.ShowModal= mrOk then
      begin
        //TempENAct2Transport.save(ENAct2TransportObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAct2TransportEdit.Free;
    frmENAct2TransportEdit:=nil;
  end;
end;

procedure TfrmENAct2TransportShow.actDeleteExecute(Sender: TObject);
Var TempENAct2Transport: ENAct2TransportControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAct2Transport := HTTPRIOENAct2Transport as ENAct2TransportControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAct2Transport.Cells[0,sgENAct2Transport.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (строки акта - транспорт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAct2Transport.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAct2TransportShow.actInsertExecute(Sender: TObject);
Var TempENAct2Transport: ENAct2TransportControllerSoapPort;
begin
  TempENAct2Transport := HTTPRIOENAct2Transport as ENAct2TransportControllerSoapPort;
  ENAct2TransportObj:=ENAct2Transport.Create;

   ENAct2TransportObj.expense:= TXSDecimal.Create;
   ENAct2TransportObj.depreciationMonth:= TXSDecimal.Create;
   ENAct2TransportObj.depreciationHours:= TXSDecimal.Create;
   ENAct2TransportObj.timeWork:= TXSDecimal.Create;
   ENAct2TransportObj.paysWork:= TXSDecimal.Create;


  try
    frmENAct2TransportEdit:=TfrmENAct2TransportEdit.Create(Application, dsInsert);
    try
      if frmENAct2TransportEdit.ShowModal = mrOk then
      begin
        if ENAct2TransportObj<>nil then
            //TempENAct2Transport.add(ENAct2TransportObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAct2TransportEdit.Free;
      frmENAct2TransportEdit:=nil;
    end;
  finally
    ENAct2TransportObj.Free;
  end;
end;

procedure TfrmENAct2TransportShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAct2TransportShow.actFilterExecute(Sender: TObject);
begin
{frmENAct2TransportFilterEdit:=TfrmENAct2TransportFilterEdit.Create(Application, dsEdit);
  try
    ENAct2TransportFilterObj := ENAct2TransportFilter.Create;
    SetNullIntProps(ENAct2TransportFilterObj);
    SetNullXSProps(ENAct2TransportFilterObj);

    if frmENAct2TransportFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAct2TransportFilter.Create;
      FilterObject := ENAct2TransportFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAct2TransportFilterEdit.Free;
    frmENAct2TransportFilterEdit:=nil;
  end;}
end;

procedure TfrmENAct2TransportShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.