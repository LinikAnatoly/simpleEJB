
unit ShowFINCurrency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  FINCurrencyController, AdvObj ;


type
    TfrmFINCurrencyShow = class(TChildForm)  
    HTTPRIOFINCurrency: THTTPRIO;
    ImageList1: TImageList;
    sgFINCurrency: TAdvStringGrid;
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
    procedure sgFINCurrencyTopLeftChanged(Sender: TObject);
    procedure sgFINCurrencyDblClick(Sender: TObject);
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
 // FINCurrencyObj: FINCurrency;
 // FINCurrencyFilterObj: FINCurrencyFilter;
  
  
implementation

uses Main, EditFINCurrency, EditFINCurrencyFilter;


{$R *.dfm}

var
  //frmFINCurrencyShow : TfrmFINCurrencyShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINCurrencyHeaders: array [1..6] of String =
        ( 'Код'
          ,'Найменування'
          ,'Скорочення'
          ,'літерний код-ISO'
          ,'цифровий код-ISO'
          ,'знак'
        );
   

procedure TfrmFINCurrencyShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmFINCurrencyShow:=nil;
  inherited;
end;


procedure TfrmFINCurrencyShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmFINCurrencyShow.FormShow(Sender: TObject);
var
  TempFINCurrency: FINCurrencyControllerSoapPort;
  i: Integer;
  FINCurrencyList: FINCurrencyShortList;
begin
  SetGridHeaders(FINCurrencyHeaders, sgFINCurrency.ColumnHeaders);
  ColCount:=100;
  TempFINCurrency :=  HTTPRIOFINCurrency as FINCurrencyControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINCurrencyFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINCurrencyList := TempFINCurrency.getScrollableFilteredList(FINCurrencyFilter(FilterObject),0,ColCount);
  LastCount:=High(FINCurrencyList.list);

  if LastCount > -1 then
     sgFINCurrency.RowCount:=LastCount+2
  else
     sgFINCurrency.RowCount:=2;

   with sgFINCurrency do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINCurrencyList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINCurrencyList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINCurrencyList.list[i].name;
        Cells[2,i+1] := FINCurrencyList.list[i].shortName;
        Cells[3,i+1] := FINCurrencyList.list[i].isoAlphabeticCode;
        Cells[4,i+1] := FINCurrencyList.list[i].isoNumericCode;
        Cells[5,i+1] := FINCurrencyList.list[i].sign;
        LastRow:=i+1;
        sgFINCurrency.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgFINCurrency.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgFINCurrency.RowCount > selectedRow then
      sgFINCurrency.Row := selectedRow
    else
      sgFINCurrency.Row := sgFINCurrency.RowCount - 1;
    end
    else
      sgFINCurrency.Row:=1;   
end;


procedure TfrmFINCurrencyShow.sgFINCurrencyTopLeftChanged(Sender: TObject);
var
  TempFINCurrency: FINCurrencyControllerSoapPort;
  i,CurrentRow: Integer;
  FINCurrencyList: FINCurrencyShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINCurrency.TopRow + sgFINCurrency.VisibleRowCount) = ColCount
  then
    begin
      TempFINCurrency :=  HTTPRIOFINCurrency as FINCurrencyControllerSoapPort;
      CurrentRow:=sgFINCurrency.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINCurrencyFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINCurrencyList := TempFINCurrency.getScrollableFilteredList(FINCurrencyFilter(FilterObject),ColCount-1, 100);


  sgFINCurrency.RowCount:=sgFINCurrency.RowCount+100;
  LastCount:=High(FINCurrencyList.list);
  with sgFINCurrency do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINCurrencyList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINCurrencyList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := FINCurrencyList.list[i].name;
        Cells[2,i+CurrentRow] := FINCurrencyList.list[i].shortName;
        Cells[3,i+CurrentRow] := FINCurrencyList.list[i].isoAlphabeticCode;
        Cells[4,i+CurrentRow] := FINCurrencyList.list[i].isoNumericCode;
        Cells[5,i+CurrentRow] := FINCurrencyList.list[i].sign;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINCurrency.Row:=CurrentRow-5;
   sgFINCurrency.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINCurrencyShow.sgFINCurrencyDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINCurrency,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmFINCurrencyShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgFINCurrency.RowCount-1 do
   for j:=0 to sgFINCurrency.ColCount-1 do
     sgFINCurrency.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmFINCurrencyShow.actViewExecute(Sender: TObject);
var 
  TempFINCurrency: FINCurrencyControllerSoapPort;
begin
  TempFINCurrency := HTTPRIOFINCurrency as FINCurrencyControllerSoapPort;
  try
    FINCurrencyObj := TempFINCurrency.getObject(StrToInt(sgFINCurrency.Cells[0,sgFINCurrency.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgFINCurrency.Row;
  frmFINCurrencyEdit:=TfrmFINCurrencyEdit.Create(Application, dsView);
  
  try
    frmFINCurrencyEdit.ShowModal;
  finally
    frmFINCurrencyEdit.Free;
    frmFINCurrencyEdit:=nil;
  end;

  if sgFINCurrency.RowCount > selectedRow then
    sgFINCurrency.Row := selectedRow
  else
    sgFINCurrency.Row := sgFINCurrency.RowCount - 1;
  
end;


procedure TfrmFINCurrencyShow.actEditExecute(Sender: TObject);
var 
  TempFINCurrency: FINCurrencyControllerSoapPort;
begin
  TempFINCurrency := HTTPRIOFINCurrency as FINCurrencyControllerSoapPort;
  try
    FINCurrencyObj := TempFINCurrency.getObject(StrToInt(sgFINCurrency.Cells[0,sgFINCurrency.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgFINCurrency.Row;
  frmFINCurrencyEdit:=TfrmFINCurrencyEdit.Create(Application, dsEdit);
  
  try
    if frmFINCurrencyEdit.ShowModal= mrOk then
      begin
        //TempFINCurrency.save(FINCurrencyObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINCurrencyEdit.Free;
    frmFINCurrencyEdit:=nil;
  end;

  if sgFINCurrency.RowCount > selectedRow then
    sgFINCurrency.Row := selectedRow
  else
    sgFINCurrency.Row := sgFINCurrency.RowCount - 1;
  
end;


procedure TfrmFINCurrencyShow.actDeleteExecute(Sender: TObject);
Var TempFINCurrency: FINCurrencyControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINCurrency := HTTPRIOFINCurrency as FINCurrencyControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINCurrency.Cells[0,sgFINCurrency.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Валюти) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINCurrency.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINCurrencyShow.actInsertExecute(Sender: TObject);
// Var TempFINCurrency: FINCurrencyControllerSoapPort; 
begin
  // TempFINCurrency := HTTPRIOFINCurrency as FINCurrencyControllerSoapPort;  /// Это здесь уже лишнее!!!
  FINCurrencyObj:=FINCurrency.Create;
  SetNullIntProps(FINCurrencyObj);
  SetNullXSProps(FINCurrencyObj);



  try
    frmFINCurrencyEdit:=TfrmFINCurrencyEdit.Create(Application, dsInsert);
    try
      if frmFINCurrencyEdit.ShowModal = mrOk then
      begin
        if FINCurrencyObj<>nil then
            //TempFINCurrency.add(FINCurrencyObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINCurrencyEdit.Free;
      frmFINCurrencyEdit:=nil;
    end;
  finally
    FINCurrencyObj.Free;
  end;
end;


procedure TfrmFINCurrencyShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmFINCurrencyShow.actFilterExecute(Sender: TObject);
begin
frmFINCurrencyFilterEdit:=TfrmFINCurrencyFilterEdit.Create(Application, dsInsert);
  try
    FINCurrencyFilterObj := FINCurrencyFilter.Create;
    SetNullIntProps(FINCurrencyFilterObj);
    SetNullXSProps(FINCurrencyFilterObj);

    if frmFINCurrencyFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := FINCurrencyFilter.Create;
      FilterObject := FINCurrencyFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINCurrencyFilterEdit.Free;
    frmFINCurrencyFilterEdit:=nil;
  end;
end;


procedure TfrmFINCurrencyShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.