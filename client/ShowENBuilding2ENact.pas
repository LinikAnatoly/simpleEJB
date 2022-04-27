
unit ShowENBuilding2ENact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENBuilding2ENactController ;


type
    TfrmENBuilding2ENactShow = class(TChildForm)  
    HTTPRIOENBuilding2ENact: THTTPRIO;
    ImageList1: TImageList;
    sgENBuilding2ENact: TAdvStringGrid;
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
    procedure sgENBuilding2ENactTopLeftChanged(Sender: TObject);
    procedure sgENBuilding2ENactDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;


var
  frmENBuilding2ENactShow: TfrmENBuilding2ENactShow;
  
  
implementation

uses Main, EditENBuilding2ENact, EditENBuilding2ENactFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBuilding2ENactHeaders: array [1..11] of String =
        ( 'Код'
          ,'сума по расходному акту'
          ,'НДС по расходному акту'
          ,'Признак  учитывать или нет даты по наряд заданиям для документа Нове будівництво(0/1)'
          ,'Номер договору ФИН'
          ,'Дата додговору фин'
          ,'Найменування організації'
          ,'код організації'
          ,'true-акт с EnergyNET false - акт ручной'
          ,'№ акта '
          ,'Дата акта'
        );
   

procedure TfrmENBuilding2ENactShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENBuilding2ENactShow:=nil;
  inherited;
end;


procedure TfrmENBuilding2ENactShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENBuilding2ENactShow.FormShow(Sender: TObject);
var
  TempENBuilding2ENact: ENBuilding2ENactControllerSoapPort;
  i: Integer;
  ENBuilding2ENactList: ENBuilding2ENactShortList;
begin
  SetGridHeaders(ENBuilding2ENactHeaders, sgENBuilding2ENact.ColumnHeaders);
  ColCount:=100;
  TempENBuilding2ENact :=  HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBuilding2ENactFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuilding2ENactList := TempENBuilding2ENact.getScrollableFilteredList(ENBuilding2ENactFilter(FilterObject),0,ColCount);
  LastCount:=High(ENBuilding2ENactList.list);

  if LastCount > -1 then
     sgENBuilding2ENact.RowCount:=LastCount+2
  else
     sgENBuilding2ENact.RowCount:=2;

   with sgENBuilding2ENact do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuilding2ENactList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuilding2ENactList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENBuilding2ENactList.list[i].sumGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENBuilding2ENactList.list[i].sumGen.DecimalString;
        if ENBuilding2ENactList.list[i].sumNds = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENBuilding2ENactList.list[i].sumNds.DecimalString;
        if ENBuilding2ENactList.list[i].isCalculationDate = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENBuilding2ENactList.list[i].isCalculationDate);
        Cells[4,i+1] := ENBuilding2ENactList.list[i].finContractNumber;
        if ENBuilding2ENactList.list[i].finContractDate = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENBuilding2ENactList.list[i].finContractDate);
        Cells[6,i+1] := ENBuilding2ENactList.list[i].partnerName;
        Cells[7,i+1] := ENBuilding2ENactList.list[i].partnerCode;
        if ENBuilding2ENactList.list[i].isActFromEnergyNET = nil then
          Cells[8,i+1] := ''
        else
          if ENBuilding2ENactList.list[i].isActFromEnergyNET.AsBoolean = true then Cells[8,i+1] := 'Так' else Cells[8,i+1] := 'Ні';
        Cells[9,i+1] := ENBuilding2ENactList.list[i].actNumber;
        if ENBuilding2ENactList.list[i].actDate = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDateTimeWithDate2String(ENBuilding2ENactList.list[i].actDate);
        LastRow:=i+1;
        sgENBuilding2ENact.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENBuilding2ENact.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENBuilding2ENact.RowCount > selectedRow then
      sgENBuilding2ENact.Row := selectedRow
    else
      sgENBuilding2ENact.Row := sgENBuilding2ENact.RowCount - 1;
    end
    else
      sgENBuilding2ENact.Row:=1;   
end;


procedure TfrmENBuilding2ENactShow.sgENBuilding2ENactTopLeftChanged(Sender: TObject);
var
  TempENBuilding2ENact: ENBuilding2ENactControllerSoapPort;
  i,CurrentRow: Integer;
  ENBuilding2ENactList: ENBuilding2ENactShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBuilding2ENact.TopRow + sgENBuilding2ENact.VisibleRowCount) = ColCount
  then
    begin
      TempENBuilding2ENact :=  HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;
      CurrentRow:=sgENBuilding2ENact.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBuilding2ENactFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuilding2ENactList := TempENBuilding2ENact.getScrollableFilteredList(ENBuilding2ENactFilter(FilterObject),ColCount-1, 100);


  sgENBuilding2ENact.RowCount:=sgENBuilding2ENact.RowCount+100;
  LastCount:=High(ENBuilding2ENactList.list);
  with sgENBuilding2ENact do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuilding2ENactList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBuilding2ENactList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENBuilding2ENactList.list[i].sumGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENBuilding2ENactList.list[i].sumGen.DecimalString;
        if ENBuilding2ENactList.list[i].sumNds = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENBuilding2ENactList.list[i].sumNds.DecimalString;
        if ENBuilding2ENactList.list[i].isCalculationDate = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENBuilding2ENactList.list[i].isCalculationDate);
        Cells[4,i+CurrentRow] := ENBuilding2ENactList.list[i].finContractNumber;
        if ENBuilding2ENactList.list[i].finContractDate = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDate2String(ENBuilding2ENactList.list[i].finContractDate);
        Cells[6,i+CurrentRow] := ENBuilding2ENactList.list[i].partnerName;
        Cells[7,i+CurrentRow] := ENBuilding2ENactList.list[i].partnerCode;
        if ENBuilding2ENactList.list[i].isActFromEnergyNET = nil then
          Cells[8,i+1] := ''
        else
          if ENBuilding2ENactList.list[i].isActFromEnergyNET.AsBoolean = true then Cells[8,i+1] := 'Так' else Cells[8,i+1] := 'Ні';
        Cells[9,i+CurrentRow] := ENBuilding2ENactList.list[i].actNumber;
        if ENBuilding2ENactList.list[i].actDate = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := XSDateTimeWithDate2String(ENBuilding2ENactList.list[i].actDate);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBuilding2ENact.Row:=CurrentRow-5;
   sgENBuilding2ENact.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBuilding2ENactShow.sgENBuilding2ENactDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBuilding2ENact,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENBuilding2ENactShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENBuilding2ENact.RowCount-1 do
   for j:=0 to sgENBuilding2ENact.ColCount-1 do
     sgENBuilding2ENact.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENBuilding2ENactShow.actViewExecute(Sender: TObject);
var 
  TempENBuilding2ENact: ENBuilding2ENactControllerSoapPort;
begin
  TempENBuilding2ENact := HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;
  try
    ENBuilding2ENactObj := TempENBuilding2ENact.getObject(StrToInt(sgENBuilding2ENact.Cells[0,sgENBuilding2ENact.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBuilding2ENact.Row;
  frmENBuilding2ENactEdit:=TfrmENBuilding2ENactEdit.Create(Application, dsView);
  
  try
    frmENBuilding2ENactEdit.ShowModal;
  finally
    frmENBuilding2ENactEdit.Free;
    frmENBuilding2ENactEdit:=nil;
  end;

  if sgENBuilding2ENact.RowCount > selectedRow then
    sgENBuilding2ENact.Row := selectedRow
  else
    sgENBuilding2ENact.Row := sgENBuilding2ENact.RowCount - 1;
  
end;


procedure TfrmENBuilding2ENactShow.actEditExecute(Sender: TObject);
var 
  TempENBuilding2ENact: ENBuilding2ENactControllerSoapPort;
begin
  TempENBuilding2ENact := HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;
  try
    ENBuilding2ENactObj := TempENBuilding2ENact.getObject(StrToInt(sgENBuilding2ENact.Cells[0,sgENBuilding2ENact.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBuilding2ENact.Row;
  frmENBuilding2ENactEdit:=TfrmENBuilding2ENactEdit.Create(Application, dsEdit);
  
  try
    if frmENBuilding2ENactEdit.ShowModal= mrOk then
      begin
        //TempENBuilding2ENact.save(ENBuilding2ENactObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBuilding2ENactEdit.Free;
    frmENBuilding2ENactEdit:=nil;
  end;

  if sgENBuilding2ENact.RowCount > selectedRow then
    sgENBuilding2ENact.Row := selectedRow
  else
    sgENBuilding2ENact.Row := sgENBuilding2ENact.RowCount - 1;
  
end;


procedure TfrmENBuilding2ENactShow.actDeleteExecute(Sender: TObject);
Var TempENBuilding2ENact: ENBuilding2ENactControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBuilding2ENact := HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBuilding2ENact.Cells[0,sgENBuilding2ENact.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (связка Нове будівництво к актам выполненых работ)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBuilding2ENact.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBuilding2ENactShow.actInsertExecute(Sender: TObject);
// Var TempENBuilding2ENact: ENBuilding2ENactControllerSoapPort; 
begin
  // TempENBuilding2ENact := HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBuilding2ENactObj:=ENBuilding2ENact.Create;
  SetNullIntProps(ENBuilding2ENactObj);
  SetNullXSProps(ENBuilding2ENactObj);

   //ENBuilding2ENactObj.sumGen:= TXSDecimal.Create;
   //ENBuilding2ENactObj.sumNds:= TXSDecimal.Create;
   //ENBuilding2ENactObj.finContractDate:= TXSDate.Create;
   //ENBuilding2ENactObj.actDate:= TXSDateTime.Create;
   


  try
    frmENBuilding2ENactEdit:=TfrmENBuilding2ENactEdit.Create(Application, dsInsert);
    try
      if frmENBuilding2ENactEdit.ShowModal = mrOk then
      begin
        if ENBuilding2ENactObj<>nil then
            //TempENBuilding2ENact.add(ENBuilding2ENactObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBuilding2ENactEdit.Free;
      frmENBuilding2ENactEdit:=nil;
    end;
  finally
    ENBuilding2ENactObj.Free;
  end;
end;


procedure TfrmENBuilding2ENactShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENBuilding2ENactShow.actFilterExecute(Sender: TObject);
begin
{frmENBuilding2ENactFilterEdit:=TfrmENBuilding2ENactFilterEdit.Create(Application, dsInsert);
  try
    ENBuilding2ENactFilterObj := ENBuilding2ENactFilter.Create;
    SetNullIntProps(ENBuilding2ENactFilterObj);
    SetNullXSProps(ENBuilding2ENactFilterObj);

    if frmENBuilding2ENactFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENBuilding2ENactFilter.Create;
      FilterObject := ENBuilding2ENactFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBuilding2ENactFilterEdit.Free;
    frmENBuilding2ENactFilterEdit:=nil;
  end;}
end;


procedure TfrmENBuilding2ENactShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.