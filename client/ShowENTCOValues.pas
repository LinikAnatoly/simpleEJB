
unit ShowENTCOValues;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENTCOValuesController ;


type
    TfrmENTCOValuesShow = class(TChildForm)  
    HTTPRIOENTCOValues: THTTPRIO;
    ImageList1: TImageList;
    sgENTCOValues: TAdvStringGrid;
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
    procedure sgENTCOValuesTopLeftChanged(Sender: TObject);
    procedure sgENTCOValuesDblClick(Sender: TObject);
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
  frmENTCOValuesShow: TfrmENTCOValuesShow;
  
  
implementation

uses Main, EditENTCOValues, EditENTCOValuesFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTCOValuesHeaders: array [1..2] of String =
        ( 'Код'
          ,'Опис(найменование)'
        );
   

procedure TfrmENTCOValuesShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENTCOValuesShow:=nil;
  inherited;
end;


procedure TfrmENTCOValuesShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENTCOValuesShow.FormShow(Sender: TObject);
var
  TempENTCOValues: ENTCOValuesControllerSoapPort;
  i: Integer;
  ENTCOValuesList: ENTCOValuesShortList;
begin
  SetGridHeaders(ENTCOValuesHeaders, sgENTCOValues.ColumnHeaders);
  ColCount:=100;
  TempENTCOValues :=  HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTCOValuesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTCOValuesList := TempENTCOValues.getScrollableFilteredList(ENTCOValuesFilter(FilterObject),0,ColCount);
  LastCount:=High(ENTCOValuesList.list);

  if LastCount > -1 then
     sgENTCOValues.RowCount:=LastCount+2
  else
     sgENTCOValues.RowCount:=2;

   with sgENTCOValues do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTCOValuesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTCOValuesList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTCOValuesList.list[i].description;
        LastRow:=i+1;
        sgENTCOValues.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENTCOValues.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENTCOValues.RowCount > selectedRow then
      sgENTCOValues.Row := selectedRow
    else
      sgENTCOValues.Row := sgENTCOValues.RowCount - 1;
    end
    else
      sgENTCOValues.Row:=1;   
end;


procedure TfrmENTCOValuesShow.sgENTCOValuesTopLeftChanged(Sender: TObject);
var
  TempENTCOValues: ENTCOValuesControllerSoapPort;
  i,CurrentRow: Integer;
  ENTCOValuesList: ENTCOValuesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTCOValues.TopRow + sgENTCOValues.VisibleRowCount) = ColCount
  then
    begin
      TempENTCOValues :=  HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;
      CurrentRow:=sgENTCOValues.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTCOValuesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTCOValuesList := TempENTCOValues.getScrollableFilteredList(ENTCOValuesFilter(FilterObject),ColCount-1, 100);


  sgENTCOValues.RowCount:=sgENTCOValues.RowCount+100;
  LastCount:=High(ENTCOValuesList.list);
  with sgENTCOValues do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTCOValuesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTCOValuesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTCOValuesList.list[i].description;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTCOValues.Row:=CurrentRow-5;
   sgENTCOValues.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTCOValuesShow.sgENTCOValuesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTCOValues,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENTCOValuesShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENTCOValues.RowCount-1 do
   for j:=0 to sgENTCOValues.ColCount-1 do
     sgENTCOValues.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENTCOValuesShow.actViewExecute(Sender: TObject);
var 
  TempENTCOValues: ENTCOValuesControllerSoapPort;
begin
  TempENTCOValues := HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;
  try
    ENTCOValuesObj := TempENTCOValues.getObject(StrToInt(sgENTCOValues.Cells[0,sgENTCOValues.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENTCOValues.Row;
  frmENTCOValuesEdit:=TfrmENTCOValuesEdit.Create(Application, dsView);
  
  try
    frmENTCOValuesEdit.ShowModal;
  finally
    frmENTCOValuesEdit.Free;
    frmENTCOValuesEdit:=nil;
  end;

  if sgENTCOValues.RowCount > selectedRow then
    sgENTCOValues.Row := selectedRow
  else
    sgENTCOValues.Row := sgENTCOValues.RowCount - 1;
  
end;


procedure TfrmENTCOValuesShow.actEditExecute(Sender: TObject);
var 
  TempENTCOValues: ENTCOValuesControllerSoapPort;
begin
  TempENTCOValues := HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;
  try
    ENTCOValuesObj := TempENTCOValues.getObject(StrToInt(sgENTCOValues.Cells[0,sgENTCOValues.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENTCOValues.Row;
  frmENTCOValuesEdit:=TfrmENTCOValuesEdit.Create(Application, dsEdit);
  
  try
    if frmENTCOValuesEdit.ShowModal= mrOk then
      begin
        //TempENTCOValues.save(ENTCOValuesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTCOValuesEdit.Free;
    frmENTCOValuesEdit:=nil;
  end;

  if sgENTCOValues.RowCount > selectedRow then
    sgENTCOValues.Row := selectedRow
  else
    sgENTCOValues.Row := sgENTCOValues.RowCount - 1;
  
end;


procedure TfrmENTCOValuesShow.actDeleteExecute(Sender: TObject);
Var TempENTCOValues: ENTCOValuesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTCOValues := HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTCOValues.Cells[0,sgENTCOValues.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Значения для TechConditionsObjects)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTCOValues.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTCOValuesShow.actInsertExecute(Sender: TObject);
// Var TempENTCOValues: ENTCOValuesControllerSoapPort; 
begin
  // TempENTCOValues := HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENTCOValuesObj:=ENTCOValues.Create;
  SetNullIntProps(ENTCOValuesObj);
  SetNullXSProps(ENTCOValuesObj);



  try
    frmENTCOValuesEdit:=TfrmENTCOValuesEdit.Create(Application, dsInsert);
    try
      if frmENTCOValuesEdit.ShowModal = mrOk then
      begin
        if ENTCOValuesObj<>nil then
            //TempENTCOValues.add(ENTCOValuesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTCOValuesEdit.Free;
      frmENTCOValuesEdit:=nil;
    end;
  finally
    ENTCOValuesObj.Free;
  end;
end;


procedure TfrmENTCOValuesShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENTCOValuesShow.actFilterExecute(Sender: TObject);
begin
{frmENTCOValuesFilterEdit:=TfrmENTCOValuesFilterEdit.Create(Application, dsInsert);
  try
    ENTCOValuesFilterObj := ENTCOValuesFilter.Create;
    SetNullIntProps(ENTCOValuesFilterObj);
    SetNullXSProps(ENTCOValuesFilterObj);

    if frmENTCOValuesFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENTCOValuesFilter.Create;
      FilterObject := ENTCOValuesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTCOValuesFilterEdit.Free;
    frmENTCOValuesFilterEdit:=nil;
  end;}
end;


procedure TfrmENTCOValuesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.