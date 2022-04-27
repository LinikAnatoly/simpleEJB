
unit ShowENSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSettingsController, AdvObj ;


type
    TfrmENSettingsShow = class(TChildForm)  
    HTTPRIOENSettings: THTTPRIO;
    imlENSettings: TImageList;
    sgENSettings: TAdvStringGrid;
    alENSettings: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    pmENSettings: TPopupMenu;
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
    procedure sgENSettingsTopLeftChanged(Sender: TObject);
    procedure sgENSettingsDblClick(Sender: TObject);
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
 // ENSettingsObj: ENSettings;
 // ENSettingsFilterObj: ENSettingsFilter;
  
  
implementation

uses Main, EditENSettings, EditENSettingsFilter;


{$R *.dfm}

var
  //frmENSettingsShow : TfrmENSettingsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSettingsHeaders: array [1..4] of String =
        ( 'Код'
          ,'Унікальний ключ налаштування'
          ,'Коментар до налаштування'
          , 'Поточне значення'
        );
   

procedure TfrmENSettingsShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSettingsShow:=nil;
  inherited;
end;


procedure TfrmENSettingsShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSettingsShow.FormShow(Sender: TObject);
var
  TempENSettings: ENSettingsControllerSoapPort;
  i: Integer;
  ENSettingsList: ENSettingsShortList;
begin
  SetGridHeaders(ENSettingsHeaders, sgENSettings.ColumnHeaders);
  ColCount:=100;
  TempENSettings :=  HTTPRIOENSettings as ENSettingsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSettingsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSettingsFilter(FilterObject).orderBySQL := 'ENSETTINGS.KEY ASC';
  ENSettingsList := TempENSettings.getScrollableFilteredList(ENSettingsFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSettingsList.list);

  if LastCount > -1 then
     sgENSettings.RowCount:=LastCount+2
  else
     sgENSettings.RowCount:=2;

   with sgENSettings do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSettingsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSettingsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSettingsList.list[i].key;
        Cells[2,i+1] := ENSettingsList.list[i].comment;
        Cells[3,i+1] := ENSettingsList.list[i].currentValue;
        LastRow:=i+1;
        sgENSettings.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSettings.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSettings.RowCount > selectedRow then
      sgENSettings.Row := selectedRow
    else
      sgENSettings.Row := sgENSettings.RowCount - 1;
    end
    else
      sgENSettings.Row:=1;   
end;


procedure TfrmENSettingsShow.sgENSettingsTopLeftChanged(Sender: TObject);
var
  TempENSettings: ENSettingsControllerSoapPort;
  i,CurrentRow: Integer;
  ENSettingsList: ENSettingsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSettings.TopRow + sgENSettings.VisibleRowCount) = ColCount
  then
    begin
      TempENSettings :=  HTTPRIOENSettings as ENSettingsControllerSoapPort;
      CurrentRow:=sgENSettings.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSettingsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSettingsFilter(FilterObject).orderBySQL := 'ENSETTINGS.KEY ASC';
  ENSettingsList := TempENSettings.getScrollableFilteredList(ENSettingsFilter(FilterObject),ColCount-1, 100);


  sgENSettings.RowCount:=sgENSettings.RowCount+100;
  LastCount:=High(ENSettingsList.list);
  with sgENSettings do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSettingsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSettingsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSettingsList.list[i].key;
        Cells[2,i+CurrentRow] := ENSettingsList.list[i].comment;
        Cells[3,i+CurrentRow] := ENSettingsList.list[i].currentValue;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSettings.Row:=CurrentRow-5;
   sgENSettings.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSettingsShow.sgENSettingsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSettings,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSettingsShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSettings.RowCount-1 do
   for j:=0 to sgENSettings.ColCount-1 do
     sgENSettings.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSettingsShow.actViewExecute(Sender: TObject);
var 
  TempENSettings: ENSettingsControllerSoapPort;
begin
  TempENSettings := HTTPRIOENSettings as ENSettingsControllerSoapPort;
  try
    ENSettingsObj := TempENSettings.getObject(StrToInt(sgENSettings.Cells[0,sgENSettings.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSettings.Row;
  frmENSettingsEdit:=TfrmENSettingsEdit.Create(Application, dsView);
  
  try
    frmENSettingsEdit.ShowModal;
  finally
    frmENSettingsEdit.Free;
    frmENSettingsEdit:=nil;
  end;

  if sgENSettings.RowCount > selectedRow then
    sgENSettings.Row := selectedRow
  else
    sgENSettings.Row := sgENSettings.RowCount - 1;
  
end;


procedure TfrmENSettingsShow.actEditExecute(Sender: TObject);
var 
  TempENSettings: ENSettingsControllerSoapPort;
begin
  TempENSettings := HTTPRIOENSettings as ENSettingsControllerSoapPort;
  try
    ENSettingsObj := TempENSettings.getObject(StrToInt(sgENSettings.Cells[0,sgENSettings.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSettings.Row;
  frmENSettingsEdit:=TfrmENSettingsEdit.Create(Application, dsEdit);
  
  try
    if frmENSettingsEdit.ShowModal= mrOk then
      begin
        //TempENSettings.save(ENSettingsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSettingsEdit.Free;
    frmENSettingsEdit:=nil;
  end;

  if sgENSettings.RowCount > selectedRow then
    sgENSettings.Row := selectedRow
  else
    sgENSettings.Row := sgENSettings.RowCount - 1;
  
end;


procedure TfrmENSettingsShow.actDeleteExecute(Sender: TObject);
Var TempENSettings: ENSettingsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSettings := HTTPRIOENSettings as ENSettingsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSettings.Cells[0,sgENSettings.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Налаштування) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSettings.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSettingsShow.actInsertExecute(Sender: TObject);
// Var TempENSettings: ENSettingsControllerSoapPort; 
begin
  // TempENSettings := HTTPRIOENSettings as ENSettingsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSettingsObj:=ENSettings.Create;
  SetNullIntProps(ENSettingsObj);
  SetNullXSProps(ENSettingsObj);



  try
    frmENSettingsEdit:=TfrmENSettingsEdit.Create(Application, dsInsert);
    try
      if frmENSettingsEdit.ShowModal = mrOk then
      begin
        if ENSettingsObj<>nil then
            //TempENSettings.add(ENSettingsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSettingsEdit.Free;
      frmENSettingsEdit:=nil;
    end;
  finally
    ENSettingsObj.Free;
  end;
end;


procedure TfrmENSettingsShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSettingsShow.actFilterExecute(Sender: TObject);
begin
frmENSettingsFilterEdit:=TfrmENSettingsFilterEdit.Create(Application, dsInsert);
  try
    ENSettingsFilterObj := ENSettingsFilter.Create;
    SetNullIntProps(ENSettingsFilterObj);
    SetNullXSProps(ENSettingsFilterObj);

    if frmENSettingsFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSettingsFilter.Create;
      FilterObject := ENSettingsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSettingsFilterEdit.Free;
    frmENSettingsFilterEdit:=nil;
  end;
end;


procedure TfrmENSettingsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.