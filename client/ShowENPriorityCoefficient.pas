
unit ShowENPriorityCoefficient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENPriorityCoefficientController, AdvObj ;


type
    TfrmENPriorityCoefficientShow = class(TChildForm)  
    HTTPRIOENPriorityCoefficient: THTTPRIO;
    ImageList1: TImageList;
    sgENPriorityCoefficient: TAdvStringGrid;
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
    procedure sgENPriorityCoefficientTopLeftChanged(Sender: TObject);
    procedure sgENPriorityCoefficientDblClick(Sender: TObject);
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
   coeffTypeCode: Integer;
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENPriorityCoefficientShort; stdcall; static;
 end;


var
  frmENPriorityCoefficientShow: TfrmENPriorityCoefficientShow;
  
  
implementation

uses Main, EditENPriorityCoefficient, EditENPriorityCoefficientFilter
  , ENPriorityCoeffTypeController
  , ENConsts
;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPriorityCoefficientHeaders: array [1..7] of String =
        ( 'Код'
          ,'Тип обладнання'
          ,'Вага обладнання 6кВ'
          ,'Вага обладнання 35кВ'
          ,'Вага обладнання 150кВ'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );


class function TfrmENPriorityCoefficientShow.chooseFromList : ENPriorityCoefficientShort;
var
  f1 : ENPriorityCoefficientFilter;
  frmENPriorityCoefficientShow : TfrmENPriorityCoefficientShow;
  selected : ENPriorityCoefficientShort;
begin
  inherited;
     selected := nil;
     f1 := ENPriorityCoefficientFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENPriorityCoefficientShow := TfrmENPriorityCoefficientShow.Create(Application, fmNormal, f1);
       try
          with frmENPriorityCoefficientShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENPriorityCoefficientShort(sgENPriorityCoefficient.Objects[0, sgENPriorityCoefficient.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENPriorityCoefficientShow.Free;
       end;
end;

procedure TfrmENPriorityCoefficientShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENPriorityCoefficientShow:=nil;
  inherited;
end;


procedure TfrmENPriorityCoefficientShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
  coeffTypeCode := Low(Integer);
end;


procedure TfrmENPriorityCoefficientShow.FormShow(Sender: TObject);
var
  TempENPriorityCoefficient: ENPriorityCoefficientControllerSoapPort;
  i: Integer;
  ENPriorityCoefficientList: ENPriorityCoefficientShortList;
begin
  SetGridHeaders(ENPriorityCoefficientHeaders, sgENPriorityCoefficient.ColumnHeaders);
  ColCount:=100;
  TempENPriorityCoefficient :=  HTTPRIOENPriorityCoefficient as ENPriorityCoefficientControllerSoapPort;

  if FilterObject = nil then
  begin
    FilterObject := ENPriorityCoefficientFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
  end;

  ENPriorityCoefficientList := TempENPriorityCoefficient.getScrollableFilteredList(ENPriorityCoefficientFilter(FilterObject),0,ColCount);
  LastCount:=High(ENPriorityCoefficientList.list);

  if LastCount > -1 then
     sgENPriorityCoefficient.RowCount:=LastCount+2
  else
     sgENPriorityCoefficient.RowCount:=2;

   with sgENPriorityCoefficient do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPriorityCoefficientList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENPriorityCoefficientList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENPriorityCoefficientList.list[i].elementTypeRefName;
        Objects[0, i+1] := ENPriorityCoefficientList.list[i];

        if ENPriorityCoefficientList.list[i].value6 = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENPriorityCoefficientList.list[i].value6.DecimalString;
        Objects[0, i+1] := ENPriorityCoefficientList.list[i];

        if ENPriorityCoefficientList.list[i].value35 = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENPriorityCoefficientList.list[i].value35.DecimalString;
        Objects[0, i+1] := ENPriorityCoefficientList.list[i];

        if ENPriorityCoefficientList.list[i].value150 = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENPriorityCoefficientList.list[i].value150.DecimalString;
        Objects[0, i+1] := ENPriorityCoefficientList.list[i];

        Cells[5,i+1] := ENPriorityCoefficientList.list[i].userGen;
        Objects[0, i+1] := ENPriorityCoefficientList.list[i];

        if ENPriorityCoefficientList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENPriorityCoefficientList.list[i].dateEdit);
        Objects[0, i+1] := ENPriorityCoefficientList.list[i];

        LastRow:=i+1;
        sgENPriorityCoefficient.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENPriorityCoefficient.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENPriorityCoefficient.RowCount > selectedRow then
      sgENPriorityCoefficient.Row := selectedRow
    else
      sgENPriorityCoefficient.Row := sgENPriorityCoefficient.RowCount - 1;
    end
    else
      sgENPriorityCoefficient.Row:=1;   
end;


procedure TfrmENPriorityCoefficientShow.sgENPriorityCoefficientTopLeftChanged(Sender: TObject);
var
  TempENPriorityCoefficient: ENPriorityCoefficientControllerSoapPort;
  i,CurrentRow: Integer;
  ENPriorityCoefficientList: ENPriorityCoefficientShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENPriorityCoefficient.TopRow + sgENPriorityCoefficient.VisibleRowCount) = ColCount
  then
  begin
    TempENPriorityCoefficient :=  HTTPRIOENPriorityCoefficient as ENPriorityCoefficientControllerSoapPort;
    CurrentRow:=sgENPriorityCoefficient.RowCount;

    if FilterObject = nil then
    begin
      FilterObject := ENPriorityCoefficientFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

    ENPriorityCoefficientList := TempENPriorityCoefficient.getScrollableFilteredList(ENPriorityCoefficientFilter(FilterObject),ColCount-1, 100);

    sgENPriorityCoefficient.RowCount:=sgENPriorityCoefficient.RowCount+100;
    LastCount:=High(ENPriorityCoefficientList.list);
    with sgENPriorityCoefficient do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENPriorityCoefficientList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENPriorityCoefficientList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENPriorityCoefficientList.list[i].elementTypeRefName;
        Objects[0, i+CurrentRow] := ENPriorityCoefficientList.list[i];

        if ENPriorityCoefficientList.list[i].value6 = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENPriorityCoefficientList.list[i].value6.DecimalString;
        Objects[0, i+CurrentRow] := ENPriorityCoefficientList.list[i];

        if ENPriorityCoefficientList.list[i].value35 = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENPriorityCoefficientList.list[i].value35.DecimalString;
        Objects[0, i+CurrentRow] := ENPriorityCoefficientList.list[i];

        if ENPriorityCoefficientList.list[i].value150 = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENPriorityCoefficientList.list[i].value150.DecimalString;
        Objects[0, i+CurrentRow] := ENPriorityCoefficientList.list[i];

        Cells[5,i+CurrentRow] := ENPriorityCoefficientList.list[i].userGen;
        Objects[0, i+CurrentRow] := ENPriorityCoefficientList.list[i];

        if ENPriorityCoefficientList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENPriorityCoefficientList.list[i].dateEdit);
        Objects[0, i+CurrentRow] := ENPriorityCoefficientList.list[i];

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPriorityCoefficient.Row:=CurrentRow-5;
   sgENPriorityCoefficient.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPriorityCoefficientShow.sgENPriorityCoefficientDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPriorityCoefficient,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENPriorityCoefficientShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENPriorityCoefficient.RowCount-1 do
   for j:=0 to sgENPriorityCoefficient.ColCount-1 do
     sgENPriorityCoefficient.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENPriorityCoefficientShow.actViewExecute(Sender: TObject);
var 
  TempENPriorityCoefficient: ENPriorityCoefficientControllerSoapPort;
begin
  TempENPriorityCoefficient := HTTPRIOENPriorityCoefficient as ENPriorityCoefficientControllerSoapPort;
  try
    ENPriorityCoefficientObj := TempENPriorityCoefficient.getObject(StrToInt(sgENPriorityCoefficient.Cells[0, sgENPriorityCoefficient.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENPriorityCoefficientEdit := TfrmENPriorityCoefficientEdit.Create(Application, dsView);
  try
    frmENPriorityCoefficientEdit.ShowModal;
  finally
    frmENPriorityCoefficientEdit.Free;
    frmENPriorityCoefficientEdit := nil;
  end;
end;


procedure TfrmENPriorityCoefficientShow.actEditExecute(Sender: TObject);
var 
  TempENPriorityCoefficient: ENPriorityCoefficientControllerSoapPort;
begin
  TempENPriorityCoefficient := HTTPRIOENPriorityCoefficient as ENPriorityCoefficientControllerSoapPort;
  try
    ENPriorityCoefficientObj := TempENPriorityCoefficient.getObject(StrToInt(sgENPriorityCoefficient.Cells[0,sgENPriorityCoefficient.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPriorityCoefficient.Row;
  frmENPriorityCoefficientEdit:=TfrmENPriorityCoefficientEdit.Create(Application, dsEdit);
  
  try
    if frmENPriorityCoefficientEdit.ShowModal= mrOk then
      begin
        //TempENPriorityCoefficient.save(ENPriorityCoefficientObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPriorityCoefficientEdit.Free;
    frmENPriorityCoefficientEdit:=nil;
  end;

  if sgENPriorityCoefficient.RowCount > selectedRow then
    sgENPriorityCoefficient.Row := selectedRow
  else
    sgENPriorityCoefficient.Row := sgENPriorityCoefficient.RowCount - 1;
end;


procedure TfrmENPriorityCoefficientShow.actDeleteExecute(Sender: TObject);
var
  TempENPriorityCoefficient: ENPriorityCoefficientControllerSoapPort;
  ObjCode: Integer;
begin
  TempENPriorityCoefficient := HTTPRIOENPriorityCoefficient as ENPriorityCoefficientControllerSoapPort;
  try
    ObjCode := StrToInt(sgENPriorityCoefficient.Cells[0,sgENPriorityCoefficient.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Коефіцієнт визначення пріоритету)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPriorityCoefficient.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;


procedure TfrmENPriorityCoefficientShow.actInsertExecute(Sender: TObject);
begin
  if coeffTypeCode = Low(Integer) then Exit;
  
  ENPriorityCoefficientObj := ENPriorityCoefficient.Create;
  SetNullIntProps(ENPriorityCoefficientObj);
  SetNullXSProps(ENPriorityCoefficientObj);
  ENPriorityCoefficientObj.coeffTypeRef := ENPriorityCoeffTypeRef.Create;
  ENPriorityCoefficientObj.coeffTypeRef.code := coeffTypeCode;

  try
    frmENPriorityCoefficientEdit := TfrmENPriorityCoefficientEdit.Create(Application, dsInsert);

    if coeffTypeCode = ITEM_WEIGHT then
      frmENPriorityCoefficientEdit.Caption := 'Вага елементу'
    else
     frmENPriorityCoefficientEdit.Caption := 'Вага конструкції';

    try
      if frmENPriorityCoefficientEdit.ShowModal = mrOk then
      begin
        if ENPriorityCoefficientObj<>nil then
            //TempENPriorityCoefficient.add(ENPriorityCoefficientObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPriorityCoefficientEdit.Free;
      frmENPriorityCoefficientEdit:=nil;
    end;
  finally
    ENPriorityCoefficientObj.Free;
  end;
end;


procedure TfrmENPriorityCoefficientShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENPriorityCoefficientShow.actFilterExecute(Sender: TObject);
begin
  frmENPriorityCoefficientFilterEdit:=TfrmENPriorityCoefficientFilterEdit.Create(Application, dsInsert);
  try

    if FilterObject <> nil then
      if ENPriorityCoefficientFilter(FilterObject).coeffTypeRef <> nil then
        if ENPriorityCoefficientFilter(FilterObject).coeffTypeRef.code <> Low(Integer) then
          coeffTypeCode := ENPriorityCoefficientFilter(FilterObject).coeffTypeRef.code;

    ENPriorityCoefficientFilterObj := ENPriorityCoefficientFilter.Create;
    SetNullIntProps(ENPriorityCoefficientFilterObj);
    SetNullXSProps(ENPriorityCoefficientFilterObj);

    if coeffTypeCode <> Low(Integer) then
    begin
      ENPriorityCoefficientFilterObj.coeffTypeRef := ENPriorityCoeffTypeRef.Create;
      ENPriorityCoefficientFilterObj.coeffTypeRef.code := coeffTypeCode;
    end;

    if frmENPriorityCoefficientFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      FilterObject := ENPriorityCoefficientFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPriorityCoefficientFilterEdit.Free;
    frmENPriorityCoefficientFilterEdit:=nil;
  end;
end;


procedure TfrmENPriorityCoefficientShow.actNoFilterExecute(Sender: TObject);
begin

  if FilterObject <> nil then
    if ENPriorityCoefficientFilter(FilterObject).coeffTypeRef <> nil then
      if ENPriorityCoefficientFilter(FilterObject).coeffTypeRef.code <> Low(Integer) then
        coeffTypeCode := ENPriorityCoefficientFilter(FilterObject).coeffTypeRef.code;

  FilterObject.Free;
  FilterObject := nil;

  if coeffTypeCode <> Low(Integer) then
  begin
    FilterObject := ENPriorityCoefficientFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
    ENPriorityCoefficientFilter(FilterObject).coeffTypeRef := ENPriorityCoeffTypeRef.Create;
    ENPriorityCoefficientFilter(FilterObject).coeffTypeRef.code := coeffTypeCode;
  end;

  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.