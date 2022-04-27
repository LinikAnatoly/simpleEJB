
unit ShowENSO2SecObjectResp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSO2SecObjectRespController, AdvObj ;


type
    TfrmENSO2SecObjectRespShow = class(TChildForm)  
    HTTPRIOENSO2SecObjectResp: THTTPRIO;
    ImageList1: TImageList;
    sgENSO2SecObjectResp: TAdvStringGrid;
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
    procedure sgENSO2SecObjectRespTopLeftChanged(Sender: TObject);
    procedure sgENSO2SecObjectRespDblClick(Sender: TObject);
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
 // ENSO2SecObjectRespObj: ENSO2SecObjectResp;
 // ENSO2SecObjectRespFilterObj: ENSO2SecObjectRespFilter;
  
  
implementation

uses Main, EditENSO2SecObjectResp, EditENSO2SecObjectRespFilter;


{$R *.dfm}

var
  //frmENSO2SecObjectRespShow : TfrmENSO2SecObjectRespShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSO2SecObjectRespHeaders: array [1..6] of String =
        ( 'Код'
          ,'ПІП відвідального'
          ,'посада відвідального'
          ,'контактна інформація відвідального'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENSO2SecObjectRespShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSO2SecObjectRespShow:=nil;
  inherited;
end;


procedure TfrmENSO2SecObjectRespShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSO2SecObjectRespShow.FormShow(Sender: TObject);
var
  TempENSO2SecObjectResp: ENSO2SecObjectRespControllerSoapPort;
  i: Integer;
  ENSO2SecObjectRespList: ENSO2SecObjectRespShortList;
begin
  SetGridHeaders(ENSO2SecObjectRespHeaders, sgENSO2SecObjectResp.ColumnHeaders);
  ColCount:=100;
  TempENSO2SecObjectResp :=  HTTPRIOENSO2SecObjectResp as ENSO2SecObjectRespControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSO2SecObjectRespFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSO2SecObjectRespList := TempENSO2SecObjectResp.getScrollableFilteredList(ENSO2SecObjectRespFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSO2SecObjectRespList.list);

  if LastCount > -1 then
     sgENSO2SecObjectResp.RowCount:=LastCount+2
  else
     sgENSO2SecObjectResp.RowCount:=2;

   with sgENSO2SecObjectResp do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSO2SecObjectRespList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2SecObjectRespList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSO2SecObjectRespList.list[i].responsibleName;
        Cells[2,i+1] := ENSO2SecObjectRespList.list[i].responsiblePosition;
        Cells[3,i+1] := ENSO2SecObjectRespList.list[i].responsibleContactInfo;
        Cells[4,i+1] := ENSO2SecObjectRespList.list[i].userGen;
        if ENSO2SecObjectRespList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENSO2SecObjectRespList.list[i].dateEdit);
        LastRow:=i+1;
        sgENSO2SecObjectResp.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSO2SecObjectResp.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSO2SecObjectResp.RowCount > selectedRow then
      sgENSO2SecObjectResp.Row := selectedRow
    else
      sgENSO2SecObjectResp.Row := sgENSO2SecObjectResp.RowCount - 1;
    end
    else
      sgENSO2SecObjectResp.Row:=1;   
end;


procedure TfrmENSO2SecObjectRespShow.sgENSO2SecObjectRespTopLeftChanged(Sender: TObject);
var
  TempENSO2SecObjectResp: ENSO2SecObjectRespControllerSoapPort;
  i,CurrentRow: Integer;
  ENSO2SecObjectRespList: ENSO2SecObjectRespShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSO2SecObjectResp.TopRow + sgENSO2SecObjectResp.VisibleRowCount) = ColCount
  then
    begin
      TempENSO2SecObjectResp :=  HTTPRIOENSO2SecObjectResp as ENSO2SecObjectRespControllerSoapPort;
      CurrentRow:=sgENSO2SecObjectResp.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSO2SecObjectRespFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSO2SecObjectRespList := TempENSO2SecObjectResp.getScrollableFilteredList(ENSO2SecObjectRespFilter(FilterObject),ColCount-1, 100);


  sgENSO2SecObjectResp.RowCount:=sgENSO2SecObjectResp.RowCount+100;
  LastCount:=High(ENSO2SecObjectRespList.list);
  with sgENSO2SecObjectResp do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSO2SecObjectRespList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSO2SecObjectRespList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSO2SecObjectRespList.list[i].responsibleName;
        Cells[2,i+CurrentRow] := ENSO2SecObjectRespList.list[i].responsiblePosition;
        Cells[3,i+CurrentRow] := ENSO2SecObjectRespList.list[i].responsibleContactInfo;
        Cells[4,i+CurrentRow] := ENSO2SecObjectRespList.list[i].userGen;
        if ENSO2SecObjectRespList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(ENSO2SecObjectRespList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSO2SecObjectResp.Row:=CurrentRow-5;
   sgENSO2SecObjectResp.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSO2SecObjectRespShow.sgENSO2SecObjectRespDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSO2SecObjectResp,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSO2SecObjectRespShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSO2SecObjectResp.RowCount-1 do
   for j:=0 to sgENSO2SecObjectResp.ColCount-1 do
     sgENSO2SecObjectResp.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSO2SecObjectRespShow.actViewExecute(Sender: TObject);
var 
  TempENSO2SecObjectResp: ENSO2SecObjectRespControllerSoapPort;
begin
  TempENSO2SecObjectResp := HTTPRIOENSO2SecObjectResp as ENSO2SecObjectRespControllerSoapPort;
  try
    ENSO2SecObjectRespObj := TempENSO2SecObjectResp.getObject(StrToInt(sgENSO2SecObjectResp.Cells[0,sgENSO2SecObjectResp.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSO2SecObjectResp.Row;
  frmENSO2SecObjectRespEdit:=TfrmENSO2SecObjectRespEdit.Create(Application, dsView);
  
  try
    frmENSO2SecObjectRespEdit.ShowModal;
  finally
    frmENSO2SecObjectRespEdit.Free;
    frmENSO2SecObjectRespEdit:=nil;
  end;

  if sgENSO2SecObjectResp.RowCount > selectedRow then
    sgENSO2SecObjectResp.Row := selectedRow
  else
    sgENSO2SecObjectResp.Row := sgENSO2SecObjectResp.RowCount - 1;
  
end;


procedure TfrmENSO2SecObjectRespShow.actEditExecute(Sender: TObject);
var 
  TempENSO2SecObjectResp: ENSO2SecObjectRespControllerSoapPort;
begin
  TempENSO2SecObjectResp := HTTPRIOENSO2SecObjectResp as ENSO2SecObjectRespControllerSoapPort;
  try
    ENSO2SecObjectRespObj := TempENSO2SecObjectResp.getObject(StrToInt(sgENSO2SecObjectResp.Cells[0,sgENSO2SecObjectResp.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSO2SecObjectResp.Row;
  frmENSO2SecObjectRespEdit:=TfrmENSO2SecObjectRespEdit.Create(Application, dsEdit);
  
  try
    if frmENSO2SecObjectRespEdit.ShowModal= mrOk then
      begin
        //TempENSO2SecObjectResp.save(ENSO2SecObjectRespObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSO2SecObjectRespEdit.Free;
    frmENSO2SecObjectRespEdit:=nil;
  end;

  if sgENSO2SecObjectResp.RowCount > selectedRow then
    sgENSO2SecObjectResp.Row := selectedRow
  else
    sgENSO2SecObjectResp.Row := sgENSO2SecObjectResp.RowCount - 1;
  
end;


procedure TfrmENSO2SecObjectRespShow.actDeleteExecute(Sender: TObject);
Var TempENSO2SecObjectResp: ENSO2SecObjectRespControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSO2SecObjectResp := HTTPRIOENSO2SecObjectResp as ENSO2SecObjectRespControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSO2SecObjectResp.Cells[0,sgENSO2SecObjectResp.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Ответственные лица объектов охраны для услуг на сторону) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSO2SecObjectResp.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSO2SecObjectRespShow.actInsertExecute(Sender: TObject);
// Var TempENSO2SecObjectResp: ENSO2SecObjectRespControllerSoapPort; 
begin
  // TempENSO2SecObjectResp := HTTPRIOENSO2SecObjectResp as ENSO2SecObjectRespControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSO2SecObjectRespObj:=ENSO2SecObjectResp.Create;
  SetNullIntProps(ENSO2SecObjectRespObj);
  SetNullXSProps(ENSO2SecObjectRespObj);

   //ENSO2SecObjectRespObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENSO2SecObjectRespEdit:=TfrmENSO2SecObjectRespEdit.Create(Application, dsInsert);
    try
      if frmENSO2SecObjectRespEdit.ShowModal = mrOk then
      begin
        if ENSO2SecObjectRespObj<>nil then
            //TempENSO2SecObjectResp.add(ENSO2SecObjectRespObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSO2SecObjectRespEdit.Free;
      frmENSO2SecObjectRespEdit:=nil;
    end;
  finally
    ENSO2SecObjectRespObj.Free;
  end;
end;


procedure TfrmENSO2SecObjectRespShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSO2SecObjectRespShow.actFilterExecute(Sender: TObject);
begin
{frmENSO2SecObjectRespFilterEdit:=TfrmENSO2SecObjectRespFilterEdit.Create(Application, dsInsert);
  try
    ENSO2SecObjectRespFilterObj := ENSO2SecObjectRespFilter.Create;
    SetNullIntProps(ENSO2SecObjectRespFilterObj);
    SetNullXSProps(ENSO2SecObjectRespFilterObj);

    if frmENSO2SecObjectRespFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSO2SecObjectRespFilter.Create;
      FilterObject := ENSO2SecObjectRespFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSO2SecObjectRespFilterEdit.Free;
    frmENSO2SecObjectRespFilterEdit:=nil;
  end;}
end;


procedure TfrmENSO2SecObjectRespShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.