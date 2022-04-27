
unit ShowENSO2SecObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSO2SecObjectController, AdvObj ;


type
    TfrmENSO2SecObjectShow = class(TChildForm)  
    HTTPRIOENSO2SecObject: THTTPRIO;
    ImageList1: TImageList;
    sgENSO2SecObject: TAdvStringGrid;
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
    procedure sgENSO2SecObjectTopLeftChanged(Sender: TObject);
    procedure sgENSO2SecObjectDblClick(Sender: TObject);
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
 // ENSO2SecObjectObj: ENSO2SecObject;
 // ENSO2SecObjectFilterObj: ENSO2SecObjectFilter;
  
  
implementation

uses Main, EditENSO2SecObject, EditENSO2SecObjectFilter;


{$R *.dfm}

var
  //frmENSO2SecObjectShow : TfrmENSO2SecObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSO2SecObjectHeaders: array [1..7] of String =
        ( 'Код'
          ,'Найменування об''єкту охорони'
          ,'Адреса об''єкту охорони'
          ,'Період охорони (годин на добу)'
          ,'Кількість постів охорони'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENSO2SecObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSO2SecObjectShow:=nil;
  inherited;
end;


procedure TfrmENSO2SecObjectShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSO2SecObjectShow.FormShow(Sender: TObject);
var
  TempENSO2SecObject: ENSO2SecObjectControllerSoapPort;
  i: Integer;
  ENSO2SecObjectList: ENSO2SecObjectShortList;
begin
  SetGridHeaders(ENSO2SecObjectHeaders, sgENSO2SecObject.ColumnHeaders);
  ColCount:=100;
  TempENSO2SecObject :=  HTTPRIOENSO2SecObject as ENSO2SecObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSO2SecObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSO2SecObjectList := TempENSO2SecObject.getScrollableFilteredList(ENSO2SecObjectFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSO2SecObjectList.list);

  if LastCount > -1 then
     sgENSO2SecObject.RowCount:=LastCount+2
  else
     sgENSO2SecObject.RowCount:=2;

   with sgENSO2SecObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSO2SecObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2SecObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSO2SecObjectList.list[i].securityObj;
        Cells[2,i+1] := ENSO2SecObjectList.list[i].securityObjAddress;
    if ENSO2SecObjectList.list[i].securityPeriod = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENSO2SecObjectList.list[i].securityPeriod.DecimalString;
        if ENSO2SecObjectList.list[i].guardPost = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(ENSO2SecObjectList.list[i].guardPost);
        Cells[5,i+1] := ENSO2SecObjectList.list[i].userGen;
        if ENSO2SecObjectList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENSO2SecObjectList.list[i].dateEdit);
        LastRow:=i+1;
        sgENSO2SecObject.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSO2SecObject.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSO2SecObject.RowCount > selectedRow then
      sgENSO2SecObject.Row := selectedRow
    else
      sgENSO2SecObject.Row := sgENSO2SecObject.RowCount - 1;
    end
    else
      sgENSO2SecObject.Row:=1;   
end;


procedure TfrmENSO2SecObjectShow.sgENSO2SecObjectTopLeftChanged(Sender: TObject);
var
  TempENSO2SecObject: ENSO2SecObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENSO2SecObjectList: ENSO2SecObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSO2SecObject.TopRow + sgENSO2SecObject.VisibleRowCount) = ColCount
  then
    begin
      TempENSO2SecObject :=  HTTPRIOENSO2SecObject as ENSO2SecObjectControllerSoapPort;
      CurrentRow:=sgENSO2SecObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSO2SecObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSO2SecObjectList := TempENSO2SecObject.getScrollableFilteredList(ENSO2SecObjectFilter(FilterObject),ColCount-1, 100);


  sgENSO2SecObject.RowCount:=sgENSO2SecObject.RowCount+100;
  LastCount:=High(ENSO2SecObjectList.list);
  with sgENSO2SecObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSO2SecObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSO2SecObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSO2SecObjectList.list[i].securityObj;
        Cells[2,i+CurrentRow] := ENSO2SecObjectList.list[i].securityObjAddress;
        if ENSO2SecObjectList.list[i].securityPeriod = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENSO2SecObjectList.list[i].securityPeriod.DecimalString;
        if ENSO2SecObjectList.list[i].guardPost = Low(Integer) then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := IntToStr(ENSO2SecObjectList.list[i].guardPost);
        Cells[5,i+CurrentRow] := ENSO2SecObjectList.list[i].userGen;
        if ENSO2SecObjectList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENSO2SecObjectList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSO2SecObject.Row:=CurrentRow-5;
   sgENSO2SecObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSO2SecObjectShow.sgENSO2SecObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSO2SecObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSO2SecObjectShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSO2SecObject.RowCount-1 do
   for j:=0 to sgENSO2SecObject.ColCount-1 do
     sgENSO2SecObject.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSO2SecObjectShow.actViewExecute(Sender: TObject);
var 
  TempENSO2SecObject: ENSO2SecObjectControllerSoapPort;
begin
  TempENSO2SecObject := HTTPRIOENSO2SecObject as ENSO2SecObjectControllerSoapPort;
  try
    ENSO2SecObjectObj := TempENSO2SecObject.getObject(StrToInt(sgENSO2SecObject.Cells[0,sgENSO2SecObject.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSO2SecObject.Row;
  frmENSO2SecObjectEdit:=TfrmENSO2SecObjectEdit.Create(Application, dsView);
  
  try
    frmENSO2SecObjectEdit.ShowModal;
  finally
    frmENSO2SecObjectEdit.Free;
    frmENSO2SecObjectEdit:=nil;
  end;

  if sgENSO2SecObject.RowCount > selectedRow then
    sgENSO2SecObject.Row := selectedRow
  else
    sgENSO2SecObject.Row := sgENSO2SecObject.RowCount - 1;
  
end;


procedure TfrmENSO2SecObjectShow.actEditExecute(Sender: TObject);
var 
  TempENSO2SecObject: ENSO2SecObjectControllerSoapPort;
begin
  TempENSO2SecObject := HTTPRIOENSO2SecObject as ENSO2SecObjectControllerSoapPort;
  try
    ENSO2SecObjectObj := TempENSO2SecObject.getObject(StrToInt(sgENSO2SecObject.Cells[0,sgENSO2SecObject.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSO2SecObject.Row;
  frmENSO2SecObjectEdit:=TfrmENSO2SecObjectEdit.Create(Application, dsEdit);
  
  try
    if frmENSO2SecObjectEdit.ShowModal= mrOk then
      begin
        //TempENSO2SecObject.save(ENSO2SecObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSO2SecObjectEdit.Free;
    frmENSO2SecObjectEdit:=nil;
  end;

  if sgENSO2SecObject.RowCount > selectedRow then
    sgENSO2SecObject.Row := selectedRow
  else
    sgENSO2SecObject.Row := sgENSO2SecObject.RowCount - 1;
  
end;


procedure TfrmENSO2SecObjectShow.actDeleteExecute(Sender: TObject);
Var TempENSO2SecObject: ENSO2SecObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSO2SecObject := HTTPRIOENSO2SecObject as ENSO2SecObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSO2SecObject.Cells[0,sgENSO2SecObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Объекты охраны для услуг на сторону) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSO2SecObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSO2SecObjectShow.actInsertExecute(Sender: TObject);
// Var TempENSO2SecObject: ENSO2SecObjectControllerSoapPort; 
begin
  // TempENSO2SecObject := HTTPRIOENSO2SecObject as ENSO2SecObjectControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSO2SecObjectObj:=ENSO2SecObject.Create;
  SetNullIntProps(ENSO2SecObjectObj);
  SetNullXSProps(ENSO2SecObjectObj);

   //ENSO2SecObjectObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENSO2SecObjectEdit:=TfrmENSO2SecObjectEdit.Create(Application, dsInsert);
    try
      if frmENSO2SecObjectEdit.ShowModal = mrOk then
      begin
        if ENSO2SecObjectObj<>nil then
            //TempENSO2SecObject.add(ENSO2SecObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSO2SecObjectEdit.Free;
      frmENSO2SecObjectEdit:=nil;
    end;
  finally
    ENSO2SecObjectObj.Free;
  end;
end;


procedure TfrmENSO2SecObjectShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSO2SecObjectShow.actFilterExecute(Sender: TObject);
begin
{frmENSO2SecObjectFilterEdit:=TfrmENSO2SecObjectFilterEdit.Create(Application, dsInsert);
  try
    ENSO2SecObjectFilterObj := ENSO2SecObjectFilter.Create;
    SetNullIntProps(ENSO2SecObjectFilterObj);
    SetNullXSProps(ENSO2SecObjectFilterObj);

    if frmENSO2SecObjectFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSO2SecObjectFilter.Create;
      FilterObject := ENSO2SecObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSO2SecObjectFilterEdit.Free;
    frmENSO2SecObjectFilterEdit:=nil;
  end;}
end;


procedure TfrmENSO2SecObjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.