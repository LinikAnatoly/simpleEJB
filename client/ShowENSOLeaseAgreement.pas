
unit ShowENSOLeaseAgreement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSOLeaseAgreementController ;


type
    TfrmENSOLeaseAgreementShow = class(TChildForm)  
    HTTPRIOENSOLeaseAgreement: THTTPRIO;
    ImageList1: TImageList;
    sgENSOLeaseAgreement: TAdvStringGrid;
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
    procedure sgENSOLeaseAgreementTopLeftChanged(Sender: TObject);
    procedure sgENSOLeaseAgreementDblClick(Sender: TObject);
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
  frmENSOLeaseAgreementShow: TfrmENSOLeaseAgreementShow;
  
  
implementation

uses Main, EditENSOLeaseAgreement, EditENSOLeaseAgreementFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSOLeaseAgreementHeaders: array [1..5] of String =
        ( 'Код'
          ,'Номер договору'
          ,'Дата договору'
          ,'Найменування партнера'
          ,'PK договору у фін.кол.'
        );
   

procedure TfrmENSOLeaseAgreementShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSOLeaseAgreementShow:=nil;
  inherited;
end;


procedure TfrmENSOLeaseAgreementShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSOLeaseAgreementShow.FormShow(Sender: TObject);
var
  TempENSOLeaseAgreement: ENSOLeaseAgreementControllerSoapPort;
  i: Integer;
  ENSOLeaseAgreementList: ENSOLeaseAgreementShortList;
begin
  SetGridHeaders(ENSOLeaseAgreementHeaders, sgENSOLeaseAgreement.ColumnHeaders);
  ColCount:=100;
  TempENSOLeaseAgreement :=  HTTPRIOENSOLeaseAgreement as ENSOLeaseAgreementControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSOLeaseAgreementFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOLeaseAgreementList := TempENSOLeaseAgreement.getScrollableFilteredList(ENSOLeaseAgreementFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSOLeaseAgreementList.list);

  if LastCount > -1 then
     sgENSOLeaseAgreement.RowCount:=LastCount+2
  else
     sgENSOLeaseAgreement.RowCount:=2;

   with sgENSOLeaseAgreement do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOLeaseAgreementList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOLeaseAgreementList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSOLeaseAgreementList.list[i].numContract;
        if ENSOLeaseAgreementList.list[i].dateContract = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENSOLeaseAgreementList.list[i].dateContract);
        Cells[3,i+1] := ENSOLeaseAgreementList.list[i].namePartner;
        if ENSOLeaseAgreementList.list[i].finDocID = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(ENSOLeaseAgreementList.list[i].finDocID);
        LastRow:=i+1;
        sgENSOLeaseAgreement.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSOLeaseAgreement.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSOLeaseAgreement.RowCount > selectedRow then
      sgENSOLeaseAgreement.Row := selectedRow
    else
      sgENSOLeaseAgreement.Row := sgENSOLeaseAgreement.RowCount - 1;
    end
    else
      sgENSOLeaseAgreement.Row:=1;   
end;


procedure TfrmENSOLeaseAgreementShow.sgENSOLeaseAgreementTopLeftChanged(Sender: TObject);
var
  TempENSOLeaseAgreement: ENSOLeaseAgreementControllerSoapPort;
  i,CurrentRow: Integer;
  ENSOLeaseAgreementList: ENSOLeaseAgreementShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSOLeaseAgreement.TopRow + sgENSOLeaseAgreement.VisibleRowCount) = ColCount
  then
    begin
      TempENSOLeaseAgreement :=  HTTPRIOENSOLeaseAgreement as ENSOLeaseAgreementControllerSoapPort;
      CurrentRow:=sgENSOLeaseAgreement.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSOLeaseAgreementFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOLeaseAgreementList := TempENSOLeaseAgreement.getScrollableFilteredList(ENSOLeaseAgreementFilter(FilterObject),ColCount-1, 100);


  sgENSOLeaseAgreement.RowCount:=sgENSOLeaseAgreement.RowCount+100;
  LastCount:=High(ENSOLeaseAgreementList.list);
  with sgENSOLeaseAgreement do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOLeaseAgreementList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSOLeaseAgreementList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSOLeaseAgreementList.list[i].numContract;
        if ENSOLeaseAgreementList.list[i].dateContract = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENSOLeaseAgreementList.list[i].dateContract);
        Cells[3,i+CurrentRow] := ENSOLeaseAgreementList.list[i].namePartner;
        if ENSOLeaseAgreementList.list[i].finDocID = Low(Integer) then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := IntToStr(ENSOLeaseAgreementList.list[i].finDocID);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSOLeaseAgreement.Row:=CurrentRow-5;
   sgENSOLeaseAgreement.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSOLeaseAgreementShow.sgENSOLeaseAgreementDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSOLeaseAgreement,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSOLeaseAgreementShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSOLeaseAgreement.RowCount-1 do
   for j:=0 to sgENSOLeaseAgreement.ColCount-1 do
     sgENSOLeaseAgreement.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSOLeaseAgreementShow.actViewExecute(Sender: TObject);
var 
  TempENSOLeaseAgreement: ENSOLeaseAgreementControllerSoapPort;
begin
  TempENSOLeaseAgreement := HTTPRIOENSOLeaseAgreement as ENSOLeaseAgreementControllerSoapPort;
  try
    ENSOLeaseAgreementObj := TempENSOLeaseAgreement.getObject(StrToInt(sgENSOLeaseAgreement.Cells[0,sgENSOLeaseAgreement.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSOLeaseAgreement.Row;
  frmENSOLeaseAgreementEdit:=TfrmENSOLeaseAgreementEdit.Create(Application, dsView);
  
  try
    frmENSOLeaseAgreementEdit.ShowModal;
  finally
    frmENSOLeaseAgreementEdit.Free;
    frmENSOLeaseAgreementEdit:=nil;
  end;

  if sgENSOLeaseAgreement.RowCount > selectedRow then
    sgENSOLeaseAgreement.Row := selectedRow
  else
    sgENSOLeaseAgreement.Row := sgENSOLeaseAgreement.RowCount - 1;
  
end;


procedure TfrmENSOLeaseAgreementShow.actEditExecute(Sender: TObject);
var 
  TempENSOLeaseAgreement: ENSOLeaseAgreementControllerSoapPort;
begin
  TempENSOLeaseAgreement := HTTPRIOENSOLeaseAgreement as ENSOLeaseAgreementControllerSoapPort;
  try
    ENSOLeaseAgreementObj := TempENSOLeaseAgreement.getObject(StrToInt(sgENSOLeaseAgreement.Cells[0,sgENSOLeaseAgreement.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSOLeaseAgreement.Row;
  frmENSOLeaseAgreementEdit:=TfrmENSOLeaseAgreementEdit.Create(Application, dsEdit);
  
  try
    if frmENSOLeaseAgreementEdit.ShowModal= mrOk then
      begin
        //TempENSOLeaseAgreement.save(ENSOLeaseAgreementObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSOLeaseAgreementEdit.Free;
    frmENSOLeaseAgreementEdit:=nil;
  end;

  if sgENSOLeaseAgreement.RowCount > selectedRow then
    sgENSOLeaseAgreement.Row := selectedRow
  else
    sgENSOLeaseAgreement.Row := sgENSOLeaseAgreement.RowCount - 1;
  
end;


procedure TfrmENSOLeaseAgreementShow.actDeleteExecute(Sender: TObject);
Var TempENSOLeaseAgreement: ENSOLeaseAgreementControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSOLeaseAgreement := HTTPRIOENSOLeaseAgreement as ENSOLeaseAgreementControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSOLeaseAgreement.Cells[0,sgENSOLeaseAgreement.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Договір оренди для Приєднання -> Землі (SO) )?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSOLeaseAgreement.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSOLeaseAgreementShow.actInsertExecute(Sender: TObject);
// Var TempENSOLeaseAgreement: ENSOLeaseAgreementControllerSoapPort; 
begin
  // TempENSOLeaseAgreement := HTTPRIOENSOLeaseAgreement as ENSOLeaseAgreementControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSOLeaseAgreementObj:=ENSOLeaseAgreement.Create;
  SetNullIntProps(ENSOLeaseAgreementObj);
  SetNullXSProps(ENSOLeaseAgreementObj);

   //ENSOLeaseAgreementObj.dateContract:= TXSDate.Create;


  try
    frmENSOLeaseAgreementEdit:=TfrmENSOLeaseAgreementEdit.Create(Application, dsInsert);
    try
      if frmENSOLeaseAgreementEdit.ShowModal = mrOk then
      begin
        if ENSOLeaseAgreementObj<>nil then
            //TempENSOLeaseAgreement.add(ENSOLeaseAgreementObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSOLeaseAgreementEdit.Free;
      frmENSOLeaseAgreementEdit:=nil;
    end;
  finally
    ENSOLeaseAgreementObj.Free;
  end;
end;


procedure TfrmENSOLeaseAgreementShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSOLeaseAgreementShow.actFilterExecute(Sender: TObject);
begin
{frmENSOLeaseAgreementFilterEdit:=TfrmENSOLeaseAgreementFilterEdit.Create(Application, dsInsert);
  try
    ENSOLeaseAgreementFilterObj := ENSOLeaseAgreementFilter.Create;
    SetNullIntProps(ENSOLeaseAgreementFilterObj);
    SetNullXSProps(ENSOLeaseAgreementFilterObj);

    if frmENSOLeaseAgreementFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSOLeaseAgreementFilter.Create;
      FilterObject := ENSOLeaseAgreementFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSOLeaseAgreementFilterEdit.Free;
    frmENSOLeaseAgreementFilterEdit:=nil;
  end;}
end;


procedure TfrmENSOLeaseAgreementShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.