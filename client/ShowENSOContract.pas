
unit ShowENSOContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSOContractController ;


type
    TfrmENSOContractShow = class(TChildForm)  
    HTTPRIOENSOContract: THTTPRIO;
    ImageList1: TImageList;
    sgENSOContract: TAdvStringGrid;
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
    procedure sgENSOContractTopLeftChanged(Sender: TObject);
    procedure sgENSOContractDblClick(Sender: TObject);
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
  frmENSOContractShow: TfrmENSOContractShow;
  
  
implementation

uses Main, EditENSOContract, EditENSOContractFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSOContractHeaders: array [1..6] of String =
        ( 'Код'
          ,'Номер договору у фін.кол.'
          ,'Дата договору у фін.кол.'
          ,'Найменування партнера у фін.кол.'
          ,'Примітка договору у фін.кол.'
          ,'PK договору у фін.кол.'
        );
   

procedure TfrmENSOContractShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSOContractShow:=nil;
  inherited;
end;


procedure TfrmENSOContractShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSOContractShow.FormShow(Sender: TObject);
var
  TempENSOContract: ENSOContractControllerSoapPort;
  i: Integer;
  ENSOContractList: ENSOContractShortList;
begin
  SetGridHeaders(ENSOContractHeaders, sgENSOContract.ColumnHeaders);
  ColCount:=100;
  TempENSOContract :=  HTTPRIOENSOContract as ENSOContractControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSOContractFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOContractList := TempENSOContract.getScrollableFilteredList(ENSOContractFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSOContractList.list);

  if LastCount > -1 then
     sgENSOContract.RowCount:=LastCount+2
  else
     sgENSOContract.RowCount:=2;

   with sgENSOContract do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOContractList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOContractList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSOContractList.list[i].numContractFinCol;
        if ENSOContractList.list[i].dateContractFinCol = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENSOContractList.list[i].dateContractFinCol);
        Cells[3,i+1] := ENSOContractList.list[i].namePartnerFinCol;
        Cells[4,i+1] := ENSOContractList.list[i].noteContrcatFinCol;
        if ENSOContractList.list[i].finDocID = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(ENSOContractList.list[i].finDocID);
        LastRow:=i+1;
        sgENSOContract.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSOContract.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSOContract.RowCount > selectedRow then
      sgENSOContract.Row := selectedRow
    else
      sgENSOContract.Row := sgENSOContract.RowCount - 1;
    end
    else
      sgENSOContract.Row:=1;   
end;


procedure TfrmENSOContractShow.sgENSOContractTopLeftChanged(Sender: TObject);
var
  TempENSOContract: ENSOContractControllerSoapPort;
  i,CurrentRow: Integer;
  ENSOContractList: ENSOContractShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSOContract.TopRow + sgENSOContract.VisibleRowCount) = ColCount
  then
    begin
      TempENSOContract :=  HTTPRIOENSOContract as ENSOContractControllerSoapPort;
      CurrentRow:=sgENSOContract.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSOContractFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOContractList := TempENSOContract.getScrollableFilteredList(ENSOContractFilter(FilterObject),ColCount-1, 100);


  sgENSOContract.RowCount:=sgENSOContract.RowCount+100;
  LastCount:=High(ENSOContractList.list);
  with sgENSOContract do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOContractList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSOContractList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSOContractList.list[i].numContractFinCol;
        if ENSOContractList.list[i].dateContractFinCol = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENSOContractList.list[i].dateContractFinCol);
        Cells[3,i+CurrentRow] := ENSOContractList.list[i].namePartnerFinCol;
        Cells[4,i+CurrentRow] := ENSOContractList.list[i].noteContrcatFinCol;
        if ENSOContractList.list[i].finDocID = Low(Integer) then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := IntToStr(ENSOContractList.list[i].finDocID);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSOContract.Row:=CurrentRow-5;
   sgENSOContract.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSOContractShow.sgENSOContractDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSOContract,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSOContractShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSOContract.RowCount-1 do
   for j:=0 to sgENSOContract.ColCount-1 do
     sgENSOContract.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSOContractShow.actViewExecute(Sender: TObject);
var 
  TempENSOContract: ENSOContractControllerSoapPort;
begin
  TempENSOContract := HTTPRIOENSOContract as ENSOContractControllerSoapPort;
  try
    ENSOContractObj := TempENSOContract.getObject(StrToInt(sgENSOContract.Cells[0,sgENSOContract.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSOContract.Row;
  frmENSOContractEdit:=TfrmENSOContractEdit.Create(Application, dsView);
  
  try
    frmENSOContractEdit.ShowModal;
  finally
    frmENSOContractEdit.Free;
    frmENSOContractEdit:=nil;
  end;

  if sgENSOContract.RowCount > selectedRow then
    sgENSOContract.Row := selectedRow
  else
    sgENSOContract.Row := sgENSOContract.RowCount - 1;
  
end;


procedure TfrmENSOContractShow.actEditExecute(Sender: TObject);
var 
  TempENSOContract: ENSOContractControllerSoapPort;
begin
  TempENSOContract := HTTPRIOENSOContract as ENSOContractControllerSoapPort;
  try
    ENSOContractObj := TempENSOContract.getObject(StrToInt(sgENSOContract.Cells[0,sgENSOContract.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSOContract.Row;
  frmENSOContractEdit:=TfrmENSOContractEdit.Create(Application, dsEdit);
  
  try
    if frmENSOContractEdit.ShowModal= mrOk then
      begin
        //TempENSOContract.save(ENSOContractObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSOContractEdit.Free;
    frmENSOContractEdit:=nil;
  end;

  if sgENSOContract.RowCount > selectedRow then
    sgENSOContract.Row := selectedRow
  else
    sgENSOContract.Row := sgENSOContract.RowCount - 1;
  
end;


procedure TfrmENSOContractShow.actDeleteExecute(Sender: TObject);
Var TempENSOContract: ENSOContractControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSOContract := HTTPRIOENSOContract as ENSOContractControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSOContract.Cells[0,sgENSOContract.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Договори підряду для приєднання)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSOContract.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSOContractShow.actInsertExecute(Sender: TObject);
// Var TempENSOContract: ENSOContractControllerSoapPort; 
begin
  // TempENSOContract := HTTPRIOENSOContract as ENSOContractControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSOContractObj:=ENSOContract.Create;
  SetNullIntProps(ENSOContractObj);
  SetNullXSProps(ENSOContractObj);

   //ENSOContractObj.dateContractFinCol:= TXSDate.Create;


  try
    frmENSOContractEdit:=TfrmENSOContractEdit.Create(Application, dsInsert);
    try
      if frmENSOContractEdit.ShowModal = mrOk then
      begin
        if ENSOContractObj<>nil then
            //TempENSOContract.add(ENSOContractObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSOContractEdit.Free;
      frmENSOContractEdit:=nil;
    end;
  finally
    ENSOContractObj.Free;
  end;
end;


procedure TfrmENSOContractShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSOContractShow.actFilterExecute(Sender: TObject);
begin
{frmENSOContractFilterEdit:=TfrmENSOContractFilterEdit.Create(Application, dsInsert);
  try
    ENSOContractFilterObj := ENSOContractFilter.Create;
    SetNullIntProps(ENSOContractFilterObj);
    SetNullXSProps(ENSOContractFilterObj);

    if frmENSOContractFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSOContractFilter.Create;
      FilterObject := ENSOContractFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSOContractFilterEdit.Free;
    frmENSOContractFilterEdit:=nil;
  end;}
end;


procedure TfrmENSOContractShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.