
unit ShowRQFKOrderType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  RQFKOrderTypeController, AdvObj ;


type
    TfrmRQFKOrderTypeShow = class(TChildForm)  
    HTTPRIORQFKOrderType: THTTPRIO;
    ImageList1: TImageList;
    sgRQFKOrderType: TAdvStringGrid;
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
    procedure sgRQFKOrderTypeTopLeftChanged(Sender: TObject);
    procedure sgRQFKOrderTypeDblClick(Sender: TObject);
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
   class function chooseFromList : RQFKOrderTypeShort; stdcall; static;
 end;


var
  frmRQFKOrderTypeShow: TfrmRQFKOrderTypeShow;
  
  
implementation

uses Main, EditRQFKOrderType, EditRQFKOrderTypeFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQFKOrderTypeHeaders: array [1..3] of String =
        ( 'Код'
          ,'Тип ордеру'
          ,'Розшифровка'
        );
   
class function TfrmRQFKOrderTypeShow.chooseFromList : RQFKOrderTypeShort;
var
  f1 : RQFKOrderTypeFilter;
  frmRQFKOrderTypeShow : TfrmRQFKOrderTypeShow;
  selected : RQFKOrderTypeShort;
begin
  inherited;
     selected := nil;
     f1 := RQFKOrderTypeFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmRQFKOrderTypeShow := TfrmRQFKOrderTypeShow.Create(Application, fmNormal, f1);
       try
          with frmRQFKOrderTypeShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := RQFKOrderTypeShort(sgRQFKOrderType.Objects[0, sgRQFKOrderType.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmRQFKOrderTypeShow.Free;
       end;
end;

procedure TfrmRQFKOrderTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmRQFKOrderTypeShow:=nil;
  inherited;
end;


procedure TfrmRQFKOrderTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmRQFKOrderTypeShow.FormShow(Sender: TObject);
var
  TempRQFKOrderType: RQFKOrderTypeControllerSoapPort;
  i: Integer;
  RQFKOrderTypeList: RQFKOrderTypeShortList;
begin
  SetGridHeaders(RQFKOrderTypeHeaders, sgRQFKOrderType.ColumnHeaders);
  ColCount:=100;
  TempRQFKOrderType :=  HTTPRIORQFKOrderType as RQFKOrderTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderTypeList := TempRQFKOrderType.getScrollableFilteredList(RQFKOrderTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(RQFKOrderTypeList.list);

  if LastCount > -1 then
     sgRQFKOrderType.RowCount:=LastCount+2
  else
     sgRQFKOrderType.RowCount:=2;

   with sgRQFKOrderType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQFKOrderTypeList.list[i].name;
        Objects[0, i+1] := RQFKOrderTypeList.list[i];
        Cells[2,i+1] := RQFKOrderTypeList.list[i].txtGen;
        Objects[0, i+1] := RQFKOrderTypeList.list[i];
        LastRow:=i+1;
        sgRQFKOrderType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgRQFKOrderType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgRQFKOrderType.RowCount > selectedRow then
      sgRQFKOrderType.Row := selectedRow
    else
      sgRQFKOrderType.Row := sgRQFKOrderType.RowCount - 1;
    end
    else
      sgRQFKOrderType.Row:=1;   
end;


procedure TfrmRQFKOrderTypeShow.sgRQFKOrderTypeTopLeftChanged(Sender: TObject);
var
  TempRQFKOrderType: RQFKOrderTypeControllerSoapPort;
  i,CurrentRow: Integer;
  RQFKOrderTypeList: RQFKOrderTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQFKOrderType.TopRow + sgRQFKOrderType.VisibleRowCount) = ColCount
  then
    begin
      TempRQFKOrderType :=  HTTPRIORQFKOrderType as RQFKOrderTypeControllerSoapPort;
      CurrentRow:=sgRQFKOrderType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderTypeList := TempRQFKOrderType.getScrollableFilteredList(RQFKOrderTypeFilter(FilterObject),ColCount-1, 100);


  sgRQFKOrderType.RowCount:=sgRQFKOrderType.RowCount+100;
  LastCount:=High(RQFKOrderTypeList.list);
  with sgRQFKOrderType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQFKOrderTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQFKOrderTypeList.list[i].name;
        Objects[0, i+CurrentRow] := RQFKOrderTypeList.list[i];
        Cells[2,i+CurrentRow] := RQFKOrderTypeList.list[i].txtGen;
        Objects[0, i+CurrentRow] := RQFKOrderTypeList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQFKOrderType.Row:=CurrentRow-5;
   sgRQFKOrderType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQFKOrderTypeShow.sgRQFKOrderTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQFKOrderType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmRQFKOrderTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgRQFKOrderType.RowCount-1 do
   for j:=0 to sgRQFKOrderType.ColCount-1 do
     sgRQFKOrderType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmRQFKOrderTypeShow.actViewExecute(Sender: TObject);
var 
  TempRQFKOrderType: RQFKOrderTypeControllerSoapPort;
begin
  TempRQFKOrderType := HTTPRIORQFKOrderType as RQFKOrderTypeControllerSoapPort;
  try
    RQFKOrderTypeObj := TempRQFKOrderType.getObject(StrToInt(sgRQFKOrderType.Cells[0, sgRQFKOrderType.Row]));
  except
    on EConvertError do Exit;
  end;

  frmRQFKOrderTypeEdit := TfrmRQFKOrderTypeEdit.Create(Application, dsView);
  try
    frmRQFKOrderTypeEdit.ShowModal;
  finally
    frmRQFKOrderTypeEdit.Free;
    frmRQFKOrderTypeEdit := nil;
  end;
end;


procedure TfrmRQFKOrderTypeShow.actEditExecute(Sender: TObject);
var 
  TempRQFKOrderType: RQFKOrderTypeControllerSoapPort;
begin
  TempRQFKOrderType := HTTPRIORQFKOrderType as RQFKOrderTypeControllerSoapPort;
  try
    RQFKOrderTypeObj := TempRQFKOrderType.getObject(StrToInt(sgRQFKOrderType.Cells[0,sgRQFKOrderType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgRQFKOrderType.Row;
  frmRQFKOrderTypeEdit:=TfrmRQFKOrderTypeEdit.Create(Application, dsEdit);
  
  try
    if frmRQFKOrderTypeEdit.ShowModal= mrOk then
      begin
        //TempRQFKOrderType.save(RQFKOrderTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQFKOrderTypeEdit.Free;
    frmRQFKOrderTypeEdit:=nil;
  end;

  if sgRQFKOrderType.RowCount > selectedRow then
    sgRQFKOrderType.Row := selectedRow
  else
    sgRQFKOrderType.Row := sgRQFKOrderType.RowCount - 1;
  
end;


procedure TfrmRQFKOrderTypeShow.actDeleteExecute(Sender: TObject);
Var TempRQFKOrderType: RQFKOrderTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQFKOrderType := HTTPRIORQFKOrderType as RQFKOrderTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQFKOrderType.Cells[0,sgRQFKOrderType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Тип ордеру )?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQFKOrderType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQFKOrderTypeShow.actInsertExecute(Sender: TObject);
// Var TempRQFKOrderType: RQFKOrderTypeControllerSoapPort; 
begin
  // TempRQFKOrderType := HTTPRIORQFKOrderType as RQFKOrderTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQFKOrderTypeObj:=RQFKOrderType.Create;
  SetNullIntProps(RQFKOrderTypeObj);
  SetNullXSProps(RQFKOrderTypeObj);



  try
    frmRQFKOrderTypeEdit:=TfrmRQFKOrderTypeEdit.Create(Application, dsInsert);
    try
      if frmRQFKOrderTypeEdit.ShowModal = mrOk then
      begin
        if RQFKOrderTypeObj<>nil then
            //TempRQFKOrderType.add(RQFKOrderTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQFKOrderTypeEdit.Free;
      frmRQFKOrderTypeEdit:=nil;
    end;
  finally
    RQFKOrderTypeObj.Free;
  end;
end;


procedure TfrmRQFKOrderTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmRQFKOrderTypeShow.actFilterExecute(Sender: TObject);
begin
{frmRQFKOrderTypeFilterEdit:=TfrmRQFKOrderTypeFilterEdit.Create(Application, dsInsert);
  try
    RQFKOrderTypeFilterObj := RQFKOrderTypeFilter.Create;
    SetNullIntProps(RQFKOrderTypeFilterObj);
    SetNullXSProps(RQFKOrderTypeFilterObj);

    if frmRQFKOrderTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := RQFKOrderTypeFilter.Create;
      FilterObject := RQFKOrderTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQFKOrderTypeFilterEdit.Free;
    frmRQFKOrderTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmRQFKOrderTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.