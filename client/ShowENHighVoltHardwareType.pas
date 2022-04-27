
unit ShowENHighVoltHardwareType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENHighVoltHardwareTypeController, AdvObj ;


type
    TfrmENHighVoltHardwareTypeShow = class(TChildForm)  
    HTTPRIOENHighVoltHardwareType: THTTPRIO;
    ImageList1: TImageList;
    sgENHighVoltHardwareType: TAdvStringGrid;
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
    HTTPRIOENElementType: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENHighVoltHardwareTypeTopLeftChanged(Sender: TObject);
    procedure sgENHighVoltHardwareTypeDblClick(Sender: TObject);
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
   elementTypeCode: Integer;
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENHighVoltHardwareTypeShort; stdcall; static;
 end;


var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  
  
implementation

uses Main, EditENHighVoltHardwareType, EditENHighVoltHardwareTypeFilter
  , Globals
  , ENElementTypeController
;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENHighVoltHardwareTypeHeaders: array [1..4] of String =
        ( 'Код'
          ,'Назва'
          ,'Морально застарілий'
          ,'Тип обладнання'
        );
   
class function TfrmENHighVoltHardwareTypeShow.chooseFromList : ENHighVoltHardwareTypeShort;
var
  f1 : ENHighVoltHardwareTypeFilter;
  frmENHighVoltHardwareTypeShow : TfrmENHighVoltHardwareTypeShow;
  selected : ENHighVoltHardwareTypeShort;
begin
  inherited;
     selected := nil;
     f1 := ENHighVoltHardwareTypeFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, f1);
       try
          with frmENHighVoltHardwareTypeShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENHighVoltHardwareTypeShort(sgENHighVoltHardwareType.Objects[0, sgENHighVoltHardwareType.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENHighVoltHardwareTypeShow.Free;
       end;
end;

procedure TfrmENHighVoltHardwareTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENHighVoltHardwareTypeShow:=nil;
  inherited;
end;


procedure TfrmENHighVoltHardwareTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
  elementTypeCode := Low(Integer);
end;


procedure TfrmENHighVoltHardwareTypeShow.FormShow(Sender: TObject);
var
  TempENHighVoltHardwareType: ENHighVoltHardwareTypeControllerSoapPort;
  i: Integer;
  ENHighVoltHardwareTypeList: ENHighVoltHardwareTypeShortList;
begin
  SetGridHeaders(ENHighVoltHardwareTypeHeaders, sgENHighVoltHardwareType.ColumnHeaders);
  ColCount:=100;
  TempENHighVoltHardwareType :=  HTTPRIOENHighVoltHardwareType as ENHighVoltHardwareTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENHighVoltHardwareTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHighVoltHardwareTypeList := TempENHighVoltHardwareType.getScrollableFilteredList(ENHighVoltHardwareTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENHighVoltHardwareTypeList.list);

  if LastCount > -1 then
     sgENHighVoltHardwareType.RowCount:=LastCount+2
  else
     sgENHighVoltHardwareType.RowCount:=2;

   with sgENHighVoltHardwareType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHighVoltHardwareTypeList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENHighVoltHardwareTypeList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENHighVoltHardwareTypeList.list[i].name;
        Objects[0, i+1] := ENHighVoltHardwareTypeList.list[i];

        if ENHighVoltHardwareTypeList.list[i].isObsolete = Low(Integer) then
          Cells[2,i+1] := ''
        else if ENHighVoltHardwareTypeList.list[i].isObsolete = NO then
          Cells[2,i+1] := 'ні'
        else
          Cells[2,i+1] := 'так';
        Objects[0, i+1] := ENHighVoltHardwareTypeList.list[i];

        Cells[3,i+1] := ENHighVoltHardwareTypeList.list[i].elementTypeRefName;


        LastRow:=i+1;
        sgENHighVoltHardwareType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENHighVoltHardwareType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENHighVoltHardwareType.RowCount > selectedRow then
      sgENHighVoltHardwareType.Row := selectedRow
    else
      sgENHighVoltHardwareType.Row := sgENHighVoltHardwareType.RowCount - 1;
    end
    else
      sgENHighVoltHardwareType.Row:=1;   
end;


procedure TfrmENHighVoltHardwareTypeShow.sgENHighVoltHardwareTypeTopLeftChanged(Sender: TObject);
var
  TempENHighVoltHardwareType: ENHighVoltHardwareTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENHighVoltHardwareTypeList: ENHighVoltHardwareTypeShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENHighVoltHardwareType.TopRow + sgENHighVoltHardwareType.VisibleRowCount) = ColCount
  then
  begin
    TempENHighVoltHardwareType := HTTPRIOENHighVoltHardwareType as ENHighVoltHardwareTypeControllerSoapPort;
    CurrentRow:=sgENHighVoltHardwareType.RowCount;

    if FilterObject = nil then
    begin
      FilterObject := ENHighVoltHardwareTypeFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

    ENHighVoltHardwareTypeList := TempENHighVoltHardwareType.getScrollableFilteredList(ENHighVoltHardwareTypeFilter(FilterObject),ColCount-1, 100);


    sgENHighVoltHardwareType.RowCount:=sgENHighVoltHardwareType.RowCount+100;
    LastCount:=High(ENHighVoltHardwareTypeList.list);
    with sgENHighVoltHardwareType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHighVoltHardwareTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENHighVoltHardwareTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENHighVoltHardwareTypeList.list[i].name;
        Objects[0, i+CurrentRow] := ENHighVoltHardwareTypeList.list[i];

        if ENHighVoltHardwareTypeList.list[i].isObsolete = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else if ENHighVoltHardwareTypeList.list[i].isObsolete = NO then
          Cells[2,i+CurrentRow] := 'ні'
        else
          Cells[2,i+CurrentRow] := 'так';
        Objects[0, i+CurrentRow] := ENHighVoltHardwareTypeList.list[i];

        Cells[3,i+CurrentRow] := ENHighVoltHardwareTypeList.list[i].elementTypeRefName;

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENHighVoltHardwareType.Row:=CurrentRow-5;
   sgENHighVoltHardwareType.RowCount:=LastRow+1;
  end;
end;


procedure TfrmENHighVoltHardwareTypeShow.sgENHighVoltHardwareTypeDblClick(Sender: TObject);
var
  temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENHighVoltHardwareTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENHighVoltHardwareType.RowCount-1 do
   for j:=0 to sgENHighVoltHardwareType.ColCount-1 do
     sgENHighVoltHardwareType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENHighVoltHardwareTypeShow.actViewExecute(Sender: TObject);
var 
  TempENHighVoltHardwareType: ENHighVoltHardwareTypeControllerSoapPort;
begin
  TempENHighVoltHardwareType := HTTPRIOENHighVoltHardwareType as ENHighVoltHardwareTypeControllerSoapPort;
  try
    ENHighVoltHardwareTypeObj := TempENHighVoltHardwareType.getObject(StrToInt(sgENHighVoltHardwareType.Cells[0, sgENHighVoltHardwareType.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENHighVoltHardwareTypeEdit := TfrmENHighVoltHardwareTypeEdit.Create(Application, dsView);
  try
    frmENHighVoltHardwareTypeEdit.ShowModal;
  finally
    frmENHighVoltHardwareTypeEdit.Free;
    frmENHighVoltHardwareTypeEdit := nil;
  end;
end;


procedure TfrmENHighVoltHardwareTypeShow.actEditExecute(Sender: TObject);
var 
  TempENHighVoltHardwareType: ENHighVoltHardwareTypeControllerSoapPort;
begin
  TempENHighVoltHardwareType := HTTPRIOENHighVoltHardwareType as ENHighVoltHardwareTypeControllerSoapPort;
  try
    ENHighVoltHardwareTypeObj := TempENHighVoltHardwareType.getObject(StrToInt(sgENHighVoltHardwareType.Cells[0,sgENHighVoltHardwareType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENHighVoltHardwareType.Row;
  frmENHighVoltHardwareTypeEdit:=TfrmENHighVoltHardwareTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENHighVoltHardwareTypeEdit.ShowModal= mrOk then
      begin
        //TempENHighVoltHardwareType.save(ENHighVoltHardwareTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENHighVoltHardwareTypeEdit.Free;
    frmENHighVoltHardwareTypeEdit:=nil;
  end;

  if sgENHighVoltHardwareType.RowCount > selectedRow then
    sgENHighVoltHardwareType.Row := selectedRow
  else
    sgENHighVoltHardwareType.Row := sgENHighVoltHardwareType.RowCount - 1;
  
end;


procedure TfrmENHighVoltHardwareTypeShow.actDeleteExecute(Sender: TObject);
var
  TempENHighVoltHardwareType: ENHighVoltHardwareTypeControllerSoapPort;
  ObjCode: Integer;
begin
  TempENHighVoltHardwareType := HTTPRIOENHighVoltHardwareType as ENHighVoltHardwareTypeControllerSoapPort;
  try
    ObjCode := StrToInt(sgENHighVoltHardwareType.Cells[0,sgENHighVoltHardwareType.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Тип високовольтного обладнання)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENHighVoltHardwareType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;


procedure TfrmENHighVoltHardwareTypeShow.actInsertExecute(Sender: TObject);
var
  TempENElementType: ENElementTypeControllerSoapPort;
  elementType: ENElementType;
begin

  if elementTypeCode = Low(Integer) then
    if FilterObject <> nil then
      if ENHighVoltHardwareTypeFilter(FilterObject).elementTypeRef <> nil then
        if ENHighVoltHardwareTypeFilter(FilterObject).elementTypeRef.code <> Low(Integer) then
          elementTypeCode := ENHighVoltHardwareTypeFilter(FilterObject).elementTypeRef.code;

  if elementTypeCode = Low(Integer) then Exit;

  TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  elementType := TempENElementType.getObject(elementTypeCode);

  ENHighVoltHardwareTypeObj := ENHighVoltHardwareType.Create;
  SetNullIntProps(ENHighVoltHardwareTypeObj);
  SetNullXSProps(ENHighVoltHardwareTypeObj);
  ENHighVoltHardwareTypeObj.elementTypeRef := ENElementTypeRef.Create;
  ENHighVoltHardwareTypeObj.elementTypeRef.code := elementTypeCode;

  try
    frmENHighVoltHardwareTypeEdit := TfrmENHighVoltHardwareTypeEdit.Create(Application, dsInsert);
    frmENHighVoltHardwareTypeEdit.edtElementTypeName.Text := elementType.name;
    try
      if frmENHighVoltHardwareTypeEdit.ShowModal = mrOk then
      begin
        if ENHighVoltHardwareTypeObj<>nil then
            //TempENHighVoltHardwareType.add(ENHighVoltHardwareTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENHighVoltHardwareTypeEdit.Free;
      frmENHighVoltHardwareTypeEdit:=nil;
    end;
  finally
    ENHighVoltHardwareTypeObj.Free;
  end;
end;


procedure TfrmENHighVoltHardwareTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENHighVoltHardwareTypeShow.actFilterExecute(Sender: TObject);
begin
  frmENHighVoltHardwareTypeFilterEdit := TfrmENHighVoltHardwareTypeFilterEdit.Create(Application, dsInsert);
  try

    if FilterObject <> nil then
      if ENHighVoltHardwareTypeFilter(FilterObject).elementTypeRef <> nil then
        if ENHighVoltHardwareTypeFilter(FilterObject).elementTypeRef.code <> Low(Integer) then
          elementTypeCode := ENHighVoltHardwareTypeFilter(FilterObject).elementTypeRef.code;

    ENHighVoltHardwareTypeFilterObj := ENHighVoltHardwareTypeFilter.Create;
    SetNullIntProps(ENHighVoltHardwareTypeFilterObj);
    SetNullXSProps(ENHighVoltHardwareTypeFilterObj);

    if elementTypeCode <> Low(Integer) then
    begin
      ENHighVoltHardwareTypeFilterObj.elementTypeRef := ENElementTypeRef.Create;
      ENHighVoltHardwareTypeFilterObj.elementTypeRef.code := elementTypeCode;
    end;

    if frmENHighVoltHardwareTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENHighVoltHardwareTypeFilter.Create;
      FilterObject := ENHighVoltHardwareTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENHighVoltHardwareTypeFilterEdit.Free;
    frmENHighVoltHardwareTypeFilterEdit:=nil;
  end;
end;


procedure TfrmENHighVoltHardwareTypeShow.actNoFilterExecute(Sender: TObject);
begin

  if FilterObject <> nil then
    if ENHighVoltHardwareTypeFilter(FilterObject).elementTypeRef <> nil then
      if ENHighVoltHardwareTypeFilter(FilterObject).elementTypeRef.code <> Low(Integer) then
        elementTypeCode := ENHighVoltHardwareTypeFilter(FilterObject).elementTypeRef.code;

  FilterObject.Free;
  FilterObject := nil;

  if elementTypeCode <> Low(Integer) then
  begin
    FilterObject := ENHighVoltHardwareTypeFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
    ENHighVoltHardwareTypeFilter(FilterObject).elementTypeRef := ENElementTypeRef.Create;
    ENHighVoltHardwareTypeFilter(FilterObject).elementTypeRef.code := elementTypeCode;
  end;


  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.