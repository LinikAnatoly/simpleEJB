
unit ShowENDocAttachmentType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENDocAttachmentTypeController, AdvObj ;


type
    TfrmENDocAttachmentTypeShow = class(TChildForm)  
    HTTPRIOENDocAttachmentType: THTTPRIO;
    ImageList1: TImageList;
    sgENDocAttachmentType: TAdvStringGrid;
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
    procedure sgENDocAttachmentTypeTopLeftChanged(Sender: TObject);
    procedure sgENDocAttachmentTypeDblClick(Sender: TObject);
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
   class function chooseFromList : ENDocAttachmentTypeShort; stdcall; static;
 end;


var
  frmENDocAttachmentTypeShow: TfrmENDocAttachmentTypeShow;
  
  
implementation

uses Main, EditENDocAttachmentType, EditENDocAttachmentTypeFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDocAttachmentTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   
class function TfrmENDocAttachmentTypeShow.chooseFromList : ENDocAttachmentTypeShort;
var
  f1 : ENDocAttachmentTypeFilter;
  frmENDocAttachmentTypeShow : TfrmENDocAttachmentTypeShow;
  selected : ENDocAttachmentTypeShort;
begin
  inherited;
     selected := nil;
     f1 := ENDocAttachmentTypeFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENDocAttachmentTypeShow := TfrmENDocAttachmentTypeShow.Create(Application, fmNormal, f1);
       try
          with frmENDocAttachmentTypeShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENDocAttachmentTypeShort(sgENDocAttachmentType.Objects[0, sgENDocAttachmentType.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENDocAttachmentTypeShow.Free;
       end;
end;

procedure TfrmENDocAttachmentTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENDocAttachmentTypeShow:=nil;
  inherited;
end;


procedure TfrmENDocAttachmentTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENDocAttachmentTypeShow.FormShow(Sender: TObject);
var
  TempENDocAttachmentType: ENDocAttachmentTypeControllerSoapPort;
  i: Integer;
  ENDocAttachmentTypeList: ENDocAttachmentTypeShortList;
begin
  SetGridHeaders(ENDocAttachmentTypeHeaders, sgENDocAttachmentType.ColumnHeaders);
  ColCount:=100;
  TempENDocAttachmentType :=  HTTPRIOENDocAttachmentType as ENDocAttachmentTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDocAttachmentTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDocAttachmentTypeList := TempENDocAttachmentType.getScrollableFilteredList(ENDocAttachmentTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENDocAttachmentTypeList.list);

  if LastCount > -1 then
     sgENDocAttachmentType.RowCount:=LastCount+2
  else
     sgENDocAttachmentType.RowCount:=2;

   with sgENDocAttachmentType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDocAttachmentTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDocAttachmentTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDocAttachmentTypeList.list[i].name;
        Objects[0, i+1] := ENDocAttachmentTypeList.list[i];
        LastRow:=i+1;
        sgENDocAttachmentType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENDocAttachmentType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENDocAttachmentType.RowCount > selectedRow then
      sgENDocAttachmentType.Row := selectedRow
    else
      sgENDocAttachmentType.Row := sgENDocAttachmentType.RowCount - 1;
    end
    else
      sgENDocAttachmentType.Row:=1;   
end;


procedure TfrmENDocAttachmentTypeShow.sgENDocAttachmentTypeTopLeftChanged(Sender: TObject);
var
  TempENDocAttachmentType: ENDocAttachmentTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENDocAttachmentTypeList: ENDocAttachmentTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDocAttachmentType.TopRow + sgENDocAttachmentType.VisibleRowCount) = ColCount
  then
    begin
      TempENDocAttachmentType :=  HTTPRIOENDocAttachmentType as ENDocAttachmentTypeControllerSoapPort;
      CurrentRow:=sgENDocAttachmentType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDocAttachmentTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDocAttachmentTypeList := TempENDocAttachmentType.getScrollableFilteredList(ENDocAttachmentTypeFilter(FilterObject),ColCount-1, 100);


  sgENDocAttachmentType.RowCount:=sgENDocAttachmentType.RowCount+100;
  LastCount:=High(ENDocAttachmentTypeList.list);
  with sgENDocAttachmentType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDocAttachmentTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDocAttachmentTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDocAttachmentTypeList.list[i].name;
        Objects[0, i+CurrentRow] := ENDocAttachmentTypeList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDocAttachmentType.Row:=CurrentRow-5;
   sgENDocAttachmentType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDocAttachmentTypeShow.sgENDocAttachmentTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDocAttachmentType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENDocAttachmentTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENDocAttachmentType.RowCount-1 do
   for j:=0 to sgENDocAttachmentType.ColCount-1 do
     sgENDocAttachmentType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENDocAttachmentTypeShow.actViewExecute(Sender: TObject);
var 
  TempENDocAttachmentType: ENDocAttachmentTypeControllerSoapPort;
begin
  TempENDocAttachmentType := HTTPRIOENDocAttachmentType as ENDocAttachmentTypeControllerSoapPort;
  try
    ENDocAttachmentTypeObj := TempENDocAttachmentType.getObject(StrToInt(sgENDocAttachmentType.Cells[0, sgENDocAttachmentType.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENDocAttachmentTypeEdit := TfrmENDocAttachmentTypeEdit.Create(Application, dsView);
  try
    frmENDocAttachmentTypeEdit.ShowModal;
  finally
    frmENDocAttachmentTypeEdit.Free;
    frmENDocAttachmentTypeEdit := nil;
  end;
end;


procedure TfrmENDocAttachmentTypeShow.actEditExecute(Sender: TObject);
var 
  TempENDocAttachmentType: ENDocAttachmentTypeControllerSoapPort;
begin
  TempENDocAttachmentType := HTTPRIOENDocAttachmentType as ENDocAttachmentTypeControllerSoapPort;
  try
    ENDocAttachmentTypeObj := TempENDocAttachmentType.getObject(StrToInt(sgENDocAttachmentType.Cells[0,sgENDocAttachmentType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENDocAttachmentType.Row;
  frmENDocAttachmentTypeEdit:=TfrmENDocAttachmentTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENDocAttachmentTypeEdit.ShowModal= mrOk then
      begin
        //TempENDocAttachmentType.save(ENDocAttachmentTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDocAttachmentTypeEdit.Free;
    frmENDocAttachmentTypeEdit:=nil;
  end;

  if sgENDocAttachmentType.RowCount > selectedRow then
    sgENDocAttachmentType.Row := selectedRow
  else
    sgENDocAttachmentType.Row := sgENDocAttachmentType.RowCount - 1;
  
end;


procedure TfrmENDocAttachmentTypeShow.actDeleteExecute(Sender: TObject);
Var TempENDocAttachmentType: ENDocAttachmentTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDocAttachmentType := HTTPRIOENDocAttachmentType as ENDocAttachmentTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDocAttachmentType.Cells[0,sgENDocAttachmentType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Тип вкладення)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDocAttachmentType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDocAttachmentTypeShow.actInsertExecute(Sender: TObject);
// Var TempENDocAttachmentType: ENDocAttachmentTypeControllerSoapPort; 
begin
  // TempENDocAttachmentType := HTTPRIOENDocAttachmentType as ENDocAttachmentTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDocAttachmentTypeObj:=ENDocAttachmentType.Create;
  SetNullIntProps(ENDocAttachmentTypeObj);
  SetNullXSProps(ENDocAttachmentTypeObj);



  try
    frmENDocAttachmentTypeEdit:=TfrmENDocAttachmentTypeEdit.Create(Application, dsInsert);
    try
      if frmENDocAttachmentTypeEdit.ShowModal = mrOk then
      begin
        if ENDocAttachmentTypeObj<>nil then
            //TempENDocAttachmentType.add(ENDocAttachmentTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDocAttachmentTypeEdit.Free;
      frmENDocAttachmentTypeEdit:=nil;
    end;
  finally
    ENDocAttachmentTypeObj.Free;
  end;
end;


procedure TfrmENDocAttachmentTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENDocAttachmentTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENDocAttachmentTypeFilterEdit:=TfrmENDocAttachmentTypeFilterEdit.Create(Application, dsInsert);
  try
    ENDocAttachmentTypeFilterObj := ENDocAttachmentTypeFilter.Create;
    SetNullIntProps(ENDocAttachmentTypeFilterObj);
    SetNullXSProps(ENDocAttachmentTypeFilterObj);

    if frmENDocAttachmentTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENDocAttachmentTypeFilter.Create;
      FilterObject := ENDocAttachmentTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDocAttachmentTypeFilterEdit.Free;
    frmENDocAttachmentTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENDocAttachmentTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.