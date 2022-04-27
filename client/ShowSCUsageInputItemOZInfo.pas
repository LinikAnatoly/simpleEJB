
unit ShowSCUsageInputItemOZInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  SCUsageInputItemOZInfoController, AdvObj ;


type
  TfrmSCUsageInputItemOZInfoShow = class(TChildForm)  
  HTTPRIOSCUsageInputItemOZInfo: THTTPRIO;
    ImageList1: TImageList;
    sgSCUsageInputItemOZInfo: TAdvStringGrid;
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
procedure sgSCUsageInputItemOZInfoTopLeftChanged(Sender: TObject);
procedure sgSCUsageInputItemOZInfoDblClick(Sender: TObject);
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
 frmSCUsageInputItemOZInfoShow : TfrmSCUsageInputItemOZInfoShow;
 // SCUsageInputItemOZInfoObj: SCUsageInputItemOZInfo;
 // SCUsageInputItemOZInfoFilterObj: SCUsageInputItemOZInfoFilter;
  
  
implementation

uses Main, EditSCUsageInputItemOZInfo, EditSCUsageInputItemOZInfoFilter;


{$R *.dfm}

var
  //frmSCUsageInputItemOZInfoShow : TfrmSCUsageInputItemOZInfoShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  SCUsageInputItemOZInfoHeaders: array [1..7] of String =
        ( 'Код'
          ,'код істочника (вид.оп)'
          ,'счет'
          ,'код витрат'
          ,'вартість з ПДВ'
          ,'ПДВ'
          ,'Бух. вартість'
        );
   

procedure TfrmSCUsageInputItemOZInfoShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmSCUsageInputItemOZInfoShow:=nil;
    inherited;
  end;


procedure TfrmSCUsageInputItemOZInfoShow.FormShow(Sender: TObject);
var
  TempSCUsageInputItemOZInfo: SCUsageInputItemOZInfoControllerSoapPort;
  i: Integer;
  SCUsageInputItemOZInfoList: SCUsageInputItemOZInfoShortList;
  begin
  SetGridHeaders(SCUsageInputItemOZInfoHeaders, sgSCUsageInputItemOZInfo.ColumnHeaders);
  ColCount:=100;
  TempSCUsageInputItemOZInfo :=  HTTPRIOSCUsageInputItemOZInfo as SCUsageInputItemOZInfoControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := SCUsageInputItemOZInfoFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCUsageInputItemOZInfoList := TempSCUsageInputItemOZInfo.getScrollableFilteredList(SCUsageInputItemOZInfoFilter(FilterObject),0,ColCount);


  LastCount:=High(SCUsageInputItemOZInfoList.list);

  if LastCount > -1 then
     sgSCUsageInputItemOZInfo.RowCount:=LastCount+2
  else
     sgSCUsageInputItemOZInfo.RowCount:=2;

   with sgSCUsageInputItemOZInfo do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCUsageInputItemOZInfoList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCUsageInputItemOZInfoList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := SCUsageInputItemOZInfoList.list[i].sourceCode;
        Cells[2,i+1] := SCUsageInputItemOZInfoList.list[i].account;
        Cells[3,i+1] := SCUsageInputItemOZInfoList.list[i].expensesCode;
        if SCUsageInputItemOZInfoList.list[i].sumWithNds = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := SCUsageInputItemOZInfoList.list[i].sumWithNds.DecimalString;
        if SCUsageInputItemOZInfoList.list[i].sumNds = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := SCUsageInputItemOZInfoList.list[i].sumNds.DecimalString;
        if SCUsageInputItemOZInfoList.list[i].sumGen = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := SCUsageInputItemOZInfoList.list[i].sumGen.DecimalString;
        LastRow:=i+1;
        sgSCUsageInputItemOZInfo.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgSCUsageInputItemOZInfo.Row:=1;
end;

procedure TfrmSCUsageInputItemOZInfoShow.sgSCUsageInputItemOZInfoTopLeftChanged(Sender: TObject);
var
  TempSCUsageInputItemOZInfo: SCUsageInputItemOZInfoControllerSoapPort;
  i,CurrentRow: Integer;
  SCUsageInputItemOZInfoList: SCUsageInputItemOZInfoShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgSCUsageInputItemOZInfo.TopRow + sgSCUsageInputItemOZInfo.VisibleRowCount) = ColCount
  then
    begin
      TempSCUsageInputItemOZInfo :=  HTTPRIOSCUsageInputItemOZInfo as SCUsageInputItemOZInfoControllerSoapPort;
      CurrentRow:=sgSCUsageInputItemOZInfo.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := SCUsageInputItemOZInfoFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCUsageInputItemOZInfoList := TempSCUsageInputItemOZInfo.getScrollableFilteredList(SCUsageInputItemOZInfoFilter(FilterObject),ColCount-1, 100);



  sgSCUsageInputItemOZInfo.RowCount:=sgSCUsageInputItemOZInfo.RowCount+100;
  LastCount:=High(SCUsageInputItemOZInfoList.list);
  with sgSCUsageInputItemOZInfo do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCUsageInputItemOZInfoList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(SCUsageInputItemOZInfoList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := SCUsageInputItemOZInfoList.list[i].sourceCode;
        Cells[2,i+CurrentRow] := SCUsageInputItemOZInfoList.list[i].account;
        Cells[3,i+CurrentRow] := SCUsageInputItemOZInfoList.list[i].expensesCode;
        if SCUsageInputItemOZInfoList.list[i].sumWithNds = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := SCUsageInputItemOZInfoList.list[i].sumWithNds.DecimalString;
        if SCUsageInputItemOZInfoList.list[i].sumNds = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := SCUsageInputItemOZInfoList.list[i].sumNds.DecimalString;
        if SCUsageInputItemOZInfoList.list[i].sumGen = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := SCUsageInputItemOZInfoList.list[i].sumGen.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgSCUsageInputItemOZInfo.Row:=CurrentRow-5;
   sgSCUsageInputItemOZInfo.RowCount:=LastRow+1;
  end;
end;

procedure TfrmSCUsageInputItemOZInfoShow.sgSCUsageInputItemOZInfoDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgSCUsageInputItemOZInfo,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmSCUsageInputItemOZInfoShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgSCUsageInputItemOZInfo.RowCount-1 do
   for j:=0 to sgSCUsageInputItemOZInfo.ColCount-1 do
     sgSCUsageInputItemOZInfo.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmSCUsageInputItemOZInfoShow.actViewExecute(Sender: TObject);
Var TempSCUsageInputItemOZInfo: SCUsageInputItemOZInfoControllerSoapPort;
begin
 TempSCUsageInputItemOZInfo := HTTPRIOSCUsageInputItemOZInfo as SCUsageInputItemOZInfoControllerSoapPort;
   try
     SCUsageInputItemOZInfoObj := TempSCUsageInputItemOZInfo.getObject(StrToInt(sgSCUsageInputItemOZInfo.Cells[0,sgSCUsageInputItemOZInfo.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCUsageInputItemOZInfoEdit:=TfrmSCUsageInputItemOZInfoEdit.Create(Application, dsView);
  try
    frmSCUsageInputItemOZInfoEdit.ShowModal;
  finally
    frmSCUsageInputItemOZInfoEdit.Free;
    frmSCUsageInputItemOZInfoEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputItemOZInfoShow.actEditExecute(Sender: TObject);
Var TempSCUsageInputItemOZInfo: SCUsageInputItemOZInfoControllerSoapPort;
begin
 TempSCUsageInputItemOZInfo := HTTPRIOSCUsageInputItemOZInfo as SCUsageInputItemOZInfoControllerSoapPort;
   try
     SCUsageInputItemOZInfoObj := TempSCUsageInputItemOZInfo.getObject(StrToInt(sgSCUsageInputItemOZInfo.Cells[0,sgSCUsageInputItemOZInfo.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCUsageInputItemOZInfoEdit:=TfrmSCUsageInputItemOZInfoEdit.Create(Application, dsEdit);
  try
    if frmSCUsageInputItemOZInfoEdit.ShowModal= mrOk then
      begin
        //TempSCUsageInputItemOZInfo.save(SCUsageInputItemOZInfoObj);
        UpdateGrid(Sender);
      end;
  finally
    frmSCUsageInputItemOZInfoEdit.Free;
    frmSCUsageInputItemOZInfoEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputItemOZInfoShow.actDeleteExecute(Sender: TObject);
Var TempSCUsageInputItemOZInfo: SCUsageInputItemOZInfoControllerSoapPort;
  ObjCode: Integer;
begin
 TempSCUsageInputItemOZInfo := HTTPRIOSCUsageInputItemOZInfo as SCUsageInputItemOZInfoControllerSoapPort;
   try
     ObjCode := StrToInt(sgSCUsageInputItemOZInfo.Cells[0,sgSCUsageInputItemOZInfo.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Додаткова інформація для ОЗ-1 (безоплатна передача від абонента)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempSCUsageInputItemOZInfo.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmSCUsageInputItemOZInfoShow.actInsertExecute(Sender: TObject);
Var TempSCUsageInputItemOZInfo: SCUsageInputItemOZInfoControllerSoapPort;
begin
  TempSCUsageInputItemOZInfo := HTTPRIOSCUsageInputItemOZInfo as SCUsageInputItemOZInfoControllerSoapPort;
  SCUsageInputItemOZInfoObj:=SCUsageInputItemOZInfo.Create;

   //SCUsageInputItemOZInfoObj.sumWithNds:= TXSDecimal.Create;
   //SCUsageInputItemOZInfoObj.sumNds:= TXSDecimal.Create;
   //SCUsageInputItemOZInfoObj.sumGen:= TXSDecimal.Create;


  try
    frmSCUsageInputItemOZInfoEdit:=TfrmSCUsageInputItemOZInfoEdit.Create(Application, dsInsert);
    try
      if frmSCUsageInputItemOZInfoEdit.ShowModal = mrOk then
      begin
        if SCUsageInputItemOZInfoObj<>nil then
            //TempSCUsageInputItemOZInfo.add(SCUsageInputItemOZInfoObj);
            UpdateGrid(Sender);
      end;
    finally
      frmSCUsageInputItemOZInfoEdit.Free;
      frmSCUsageInputItemOZInfoEdit:=nil;
    end;
  finally
    SCUsageInputItemOZInfoObj.Free;
  end;
end;

procedure TfrmSCUsageInputItemOZInfoShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmSCUsageInputItemOZInfoShow.actFilterExecute(Sender: TObject);
begin
{frmSCUsageInputItemOZInfoFilterEdit:=TfrmSCUsageInputItemOZInfoFilterEdit.Create(Application, dsInsert);
  try
    SCUsageInputItemOZInfoFilterObj := SCUsageInputItemOZInfoFilter.Create;
    SetNullIntProps(SCUsageInputItemOZInfoFilterObj);
    SetNullXSProps(SCUsageInputItemOZInfoFilterObj);

    if frmSCUsageInputItemOZInfoFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := SCUsageInputItemOZInfoFilter.Create;
      FilterObject := SCUsageInputItemOZInfoFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmSCUsageInputItemOZInfoFilterEdit.Free;
    frmSCUsageInputItemOZInfoFilterEdit:=nil;
  end;}
end;

procedure TfrmSCUsageInputItemOZInfoShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.