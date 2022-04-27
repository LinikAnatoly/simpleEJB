
unit ShowENSOValues;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSOValuesController, AdvObj ;


type
    TfrmENSOValuesShow = class(TChildForm)  
    HTTPRIOENSOValues: THTTPRIO;
    ImageList1: TImageList;
    sgENSOValues: TAdvStringGrid;
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
    procedure sgENSOValuesTopLeftChanged(Sender: TObject);
    procedure sgENSOValuesDblClick(Sender: TObject);
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
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENSOValuesObj: ENSOValues;
 // ENSOValuesFilterObj: ENSOValuesFilter;
  
  
implementation

uses Main, EditENSOValues, EditENSOValuesFilter;


{$R *.dfm}

var
  frmENSOValuesShow : TfrmENSOValuesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSOValuesHeaders: array [1..5] of String =
        ( 'Код'
          ,'Дата'
          ,'Текстове значення'
          ,'Користувач, який змінив запис'
          ,'Дата зміни'
        );
   

procedure TfrmENSOValuesShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSOValuesShow:=nil;
  inherited;
end;


procedure TfrmENSOValuesShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSOValuesShow.FormShow(Sender: TObject);
var
  TempENSOValues: ENSOValuesControllerSoapPort;
  i: Integer;
  ENSOValuesList: ENSOValuesShortList;
begin
  SetGridHeaders(ENSOValuesHeaders, sgENSOValues.ColumnHeaders);
  ColCount:=100;
  TempENSOValues :=  HTTPRIOENSOValues as ENSOValuesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSOValuesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOValuesList := TempENSOValues.getScrollableFilteredList(ENSOValuesFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSOValuesList.list);

  if LastCount > -1 then
     sgENSOValues.RowCount:=LastCount+2
  else
     sgENSOValues.RowCount:=2;

   with sgENSOValues do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOValuesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOValuesList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENSOValuesList.list[i].dateVal = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDateTimeWithDate2String(ENSOValuesList.list[i].dateVal);
        Cells[2,i+1] := ENSOValuesList.list[i].strVal;
        Cells[3,i+1] := ENSOValuesList.list[i].userGen;
        if ENSOValuesList.list[i].dateEdit = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENSOValuesList.list[i].dateEdit);
        LastRow:=i+1;
        sgENSOValues.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSOValues.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSOValues.RowCount > selectedRow then
      sgENSOValues.Row := selectedRow
    else
      sgENSOValues.Row := sgENSOValues.RowCount - 1;
    end
    else
      sgENSOValues.Row:=1;   
end;


procedure TfrmENSOValuesShow.sgENSOValuesTopLeftChanged(Sender: TObject);
var
  TempENSOValues: ENSOValuesControllerSoapPort;
  i,CurrentRow: Integer;
  ENSOValuesList: ENSOValuesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSOValues.TopRow + sgENSOValues.VisibleRowCount) = ColCount
  then
    begin
      TempENSOValues :=  HTTPRIOENSOValues as ENSOValuesControllerSoapPort;
      CurrentRow:=sgENSOValues.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSOValuesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOValuesList := TempENSOValues.getScrollableFilteredList(ENSOValuesFilter(FilterObject),ColCount-1, 100);


  sgENSOValues.RowCount:=sgENSOValues.RowCount+100;
  LastCount:=High(ENSOValuesList.list);
  with sgENSOValues do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOValuesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSOValuesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENSOValuesList.list[i].dateVal = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDateTimeWithDate2String(ENSOValuesList.list[i].dateVal);
        Cells[2,i+CurrentRow] := ENSOValuesList.list[i].strVal;
        Cells[3,i+CurrentRow] := ENSOValuesList.list[i].userGen;
        if ENSOValuesList.list[i].dateEdit = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(ENSOValuesList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSOValues.Row:=CurrentRow-5;
   sgENSOValues.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSOValuesShow.sgENSOValuesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSOValues,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSOValuesShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSOValues.RowCount-1 do
   for j:=0 to sgENSOValues.ColCount-1 do
     sgENSOValues.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSOValuesShow.actViewExecute(Sender: TObject);
var 
  TempENSOValues: ENSOValuesControllerSoapPort;
begin
  TempENSOValues := HTTPRIOENSOValues as ENSOValuesControllerSoapPort;
  try
    ENSOValuesObj := TempENSOValues.getObject(StrToInt(sgENSOValues.Cells[0,sgENSOValues.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSOValues.Row;
  frmENSOValuesEdit:=TfrmENSOValuesEdit.Create(Application, dsView);
  
  try
    frmENSOValuesEdit.ShowModal;
  finally
    frmENSOValuesEdit.Free;
    frmENSOValuesEdit:=nil;
  end;

  if sgENSOValues.RowCount > selectedRow then
    sgENSOValues.Row := selectedRow
  else
    sgENSOValues.Row := sgENSOValues.RowCount - 1;
  
end;


procedure TfrmENSOValuesShow.actEditExecute(Sender: TObject);
var 
  TempENSOValues: ENSOValuesControllerSoapPort;
begin
  TempENSOValues := HTTPRIOENSOValues as ENSOValuesControllerSoapPort;
  try
    ENSOValuesObj := TempENSOValues.getObject(StrToInt(sgENSOValues.Cells[0,sgENSOValues.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSOValues.Row;
  frmENSOValuesEdit:=TfrmENSOValuesEdit.Create(Application, dsEdit);
  
  try
    if frmENSOValuesEdit.ShowModal= mrOk then
      begin
        //TempENSOValues.save(ENSOValuesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSOValuesEdit.Free;
    frmENSOValuesEdit:=nil;
  end;

  if sgENSOValues.RowCount > selectedRow then
    sgENSOValues.Row := selectedRow
  else
    sgENSOValues.Row := sgENSOValues.RowCount - 1;
  
end;


procedure TfrmENSOValuesShow.actDeleteExecute(Sender: TObject);
Var TempENSOValues: ENSOValuesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSOValues := HTTPRIOENSOValues as ENSOValuesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSOValues.Cells[0,sgENSOValues.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Значения для ServicesObject) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSOValues.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSOValuesShow.actInsertExecute(Sender: TObject);
// Var TempENSOValues: ENSOValuesControllerSoapPort; 
begin
  // TempENSOValues := HTTPRIOENSOValues as ENSOValuesControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSOValuesObj:=ENSOValues.Create;
  SetNullIntProps(ENSOValuesObj);
  SetNullXSProps(ENSOValuesObj);

   //ENSOValuesObj.dateVal:= TXSDateTime.Create;
   
   //ENSOValuesObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENSOValuesEdit:=TfrmENSOValuesEdit.Create(Application, dsInsert);
    try
      if frmENSOValuesEdit.ShowModal = mrOk then
      begin
        if ENSOValuesObj<>nil then
            //TempENSOValues.add(ENSOValuesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSOValuesEdit.Free;
      frmENSOValuesEdit:=nil;
    end;
  finally
    ENSOValuesObj.Free;
  end;
end;


procedure TfrmENSOValuesShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSOValuesShow.actFilterExecute(Sender: TObject);
begin
{frmENSOValuesFilterEdit:=TfrmENSOValuesFilterEdit.Create(Application, dsInsert);
  try
    ENSOValuesFilterObj := ENSOValuesFilter.Create;
    SetNullIntProps(ENSOValuesFilterObj);
    SetNullXSProps(ENSOValuesFilterObj);

    if frmENSOValuesFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSOValuesFilter.Create;
      FilterObject := ENSOValuesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSOValuesFilterEdit.Free;
    frmENSOValuesFilterEdit:=nil;
  end;}
end;


procedure TfrmENSOValuesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.