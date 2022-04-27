
unit ShowENReportAdditionZbytMetrology;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENReportAdditionZbytMetrologyController, AdvObj ;


type
    TfrmENReportAdditionZbytMetrologyShow = class(TChildForm)  
    HTTPRIOENReportAdditionZbytMetrology: THTTPRIO;
    ImageList1: TImageList;
    sgENReportAdditionZbytMetrology: TAdvStringGrid;
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
    procedure sgENReportAdditionZbytMetrologyTopLeftChanged(Sender: TObject);
    procedure sgENReportAdditionZbytMetrologyDblClick(Sender: TObject);
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
   class function chooseFromList : ENReportAdditionZbytMetrologyShort; stdcall; static;
 end;


var
  frmENReportAdditionZbytMetrologyShow: TfrmENReportAdditionZbytMetrologyShow;
  
  
implementation

uses Main, EditENReportAdditionZbytMetrology, EditENReportAdditionZbytMetrologyFilter;


{$R *.dfm}

const
  ZBYT: String = 'zbyt';
  METROLOGY: String = 'metrology';

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENReportAdditionZbytMetrologyHeaders: array [1..6] of String =
        ( 'Код'
          ,'Найменування додатка'
          ,'Послуги (так/ні)'
          ,'Призначення додатка (Енергозбут/Метрологія)'
          ,'Дата початку дії додатка'
          ,'Дата завершення дії додатка'
        );
   
class function TfrmENReportAdditionZbytMetrologyShow.chooseFromList : ENReportAdditionZbytMetrologyShort;
var
  f1 : ENReportAdditionZbytMetrologyFilter;
  frmENReportAdditionZbytMetrologyShow : TfrmENReportAdditionZbytMetrologyShow;
  selected : ENReportAdditionZbytMetrologyShort;
begin
  inherited;
     selected := nil;
     f1 := ENReportAdditionZbytMetrologyFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENReportAdditionZbytMetrologyShow := TfrmENReportAdditionZbytMetrologyShow.Create(Application, fmNormal, f1);
       try
          with frmENReportAdditionZbytMetrologyShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENReportAdditionZbytMetrologyShort(sgENReportAdditionZbytMetrology.Objects[0, sgENReportAdditionZbytMetrology.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENReportAdditionZbytMetrologyShow.Free;
       end;
end;

procedure TfrmENReportAdditionZbytMetrologyShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENReportAdditionZbytMetrologyShow:=nil;
  inherited;
end;


procedure TfrmENReportAdditionZbytMetrologyShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENReportAdditionZbytMetrologyShow.FormShow(Sender: TObject);
var
  TempENReportAdditionZbytMetrology: ENReportAdditionZbytMetrologyControllerSoapPort;
  i: Integer;
  ENReportAdditionZbytMetrologyList: ENReportAdditionZbytMetrologyShortList;
begin
  SetGridHeaders(ENReportAdditionZbytMetrologyHeaders, sgENReportAdditionZbytMetrology.ColumnHeaders);
  ColCount:=100;
  TempENReportAdditionZbytMetrology :=  HTTPRIOENReportAdditionZbytMetrology as ENReportAdditionZbytMetrologyControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENReportAdditionZbytMetrologyFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENReportAdditionZbytMetrologyList := TempENReportAdditionZbytMetrology.getScrollableFilteredList(ENReportAdditionZbytMetrologyFilter(FilterObject),0,ColCount);
  LastCount:=High(ENReportAdditionZbytMetrologyList.list);

  if LastCount > -1 then
     sgENReportAdditionZbytMetrology.RowCount:=LastCount+2
  else
     sgENReportAdditionZbytMetrology.RowCount:=2;

   with sgENReportAdditionZbytMetrology do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENReportAdditionZbytMetrologyList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENReportAdditionZbytMetrologyList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENReportAdditionZbytMetrologyList.list[i].name;

        if ENReportAdditionZbytMetrologyList.list[i].isServices = 1 then
          Cells[2,i+1] := 'так'
        else if ENReportAdditionZbytMetrologyList.list[i].isServices = 0 then
          Cells[2,i+1] := 'ні'
        else
          Cells[2,i+1] := '';

        if ENReportAdditionZbytMetrologyList.list[i].zbytOrmetrology = ZBYT then
          Cells[3,i+1] := 'Енергозбут'
        else if ENReportAdditionZbytMetrologyList.list[i].zbytOrmetrology = METROLOGY then
          Cells[3,i+1] := 'Метрологія'
        else
          Cells[3,i+1] := '';

        if ENReportAdditionZbytMetrologyList.list[i].dateStart = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeOnlyDate2String(ENReportAdditionZbytMetrologyList.list[i].dateStart);
        if ENReportAdditionZbytMetrologyList.list[i].dateFinal = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeOnlyDate2String(ENReportAdditionZbytMetrologyList.list[i].dateFinal);

        Objects[0, i+1] := ENReportAdditionZbytMetrologyList.list[i];

        LastRow:=i+1;
        sgENReportAdditionZbytMetrology.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENReportAdditionZbytMetrology.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENReportAdditionZbytMetrology.RowCount > selectedRow then
      sgENReportAdditionZbytMetrology.Row := selectedRow
    else
      sgENReportAdditionZbytMetrology.Row := sgENReportAdditionZbytMetrology.RowCount - 1;
    end
    else
      sgENReportAdditionZbytMetrology.Row:=1;   
end;


procedure TfrmENReportAdditionZbytMetrologyShow.sgENReportAdditionZbytMetrologyTopLeftChanged(Sender: TObject);
var
  TempENReportAdditionZbytMetrology: ENReportAdditionZbytMetrologyControllerSoapPort;
  i,CurrentRow: Integer;
  ENReportAdditionZbytMetrologyList: ENReportAdditionZbytMetrologyShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENReportAdditionZbytMetrology.TopRow + sgENReportAdditionZbytMetrology.VisibleRowCount) = ColCount
  then
    begin
      TempENReportAdditionZbytMetrology :=  HTTPRIOENReportAdditionZbytMetrology as ENReportAdditionZbytMetrologyControllerSoapPort;
      CurrentRow:=sgENReportAdditionZbytMetrology.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENReportAdditionZbytMetrologyFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENReportAdditionZbytMetrologyList := TempENReportAdditionZbytMetrology.getScrollableFilteredList(ENReportAdditionZbytMetrologyFilter(FilterObject),ColCount-1, 100);


  sgENReportAdditionZbytMetrology.RowCount:=sgENReportAdditionZbytMetrology.RowCount+100;
  LastCount:=High(ENReportAdditionZbytMetrologyList.list);
  with sgENReportAdditionZbytMetrology do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENReportAdditionZbytMetrologyList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENReportAdditionZbytMetrologyList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENReportAdditionZbytMetrologyList.list[i].name;

        if ENReportAdditionZbytMetrologyList.list[i].isServices = 1 then
          Cells[2,i+CurrentRow] := 'так'
        else if ENReportAdditionZbytMetrologyList.list[i].isServices = 0 then
          Cells[2,i+CurrentRow] := 'ні'
        else
          Cells[2,i+CurrentRow] := '';

        if ENReportAdditionZbytMetrologyList.list[i].zbytOrmetrology = ZBYT then
          Cells[3,i+CurrentRow] := 'Енергозбут'
        else if ENReportAdditionZbytMetrologyList.list[i].zbytOrmetrology = METROLOGY then
          Cells[3,i+CurrentRow] := 'Метрологія'
        else
          Cells[3,i+CurrentRow] := '';

        if ENReportAdditionZbytMetrologyList.list[i].dateStart = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeOnlyDate2String(ENReportAdditionZbytMetrologyList.list[i].dateStart);
        if ENReportAdditionZbytMetrologyList.list[i].dateFinal = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeOnlyDate2String(ENReportAdditionZbytMetrologyList.list[i].dateFinal);

        Objects[0, i+CurrentRow] := ENReportAdditionZbytMetrologyList.list[i];

       LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENReportAdditionZbytMetrology.Row:=CurrentRow-5;
   sgENReportAdditionZbytMetrology.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENReportAdditionZbytMetrologyShow.sgENReportAdditionZbytMetrologyDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENReportAdditionZbytMetrology,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENReportAdditionZbytMetrologyShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENReportAdditionZbytMetrology.RowCount-1 do
   for j:=0 to sgENReportAdditionZbytMetrology.ColCount-1 do
     sgENReportAdditionZbytMetrology.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENReportAdditionZbytMetrologyShow.actViewExecute(Sender: TObject);
var 
  TempENReportAdditionZbytMetrology: ENReportAdditionZbytMetrologyControllerSoapPort;
begin
  TempENReportAdditionZbytMetrology := HTTPRIOENReportAdditionZbytMetrology as ENReportAdditionZbytMetrologyControllerSoapPort;
  try
    ENReportAdditionZbytMetrologyObj := TempENReportAdditionZbytMetrology.getObject(StrToInt(sgENReportAdditionZbytMetrology.Cells[0, sgENReportAdditionZbytMetrology.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENReportAdditionZbytMetrologyEdit := TfrmENReportAdditionZbytMetrologyEdit.Create(Application, dsView);
  try
    frmENReportAdditionZbytMetrologyEdit.ShowModal;
  finally
    frmENReportAdditionZbytMetrologyEdit.Free;
    frmENReportAdditionZbytMetrologyEdit := nil;
  end;
end;


procedure TfrmENReportAdditionZbytMetrologyShow.actEditExecute(Sender: TObject);
var 
  TempENReportAdditionZbytMetrology: ENReportAdditionZbytMetrologyControllerSoapPort;
begin
  TempENReportAdditionZbytMetrology := HTTPRIOENReportAdditionZbytMetrology as ENReportAdditionZbytMetrologyControllerSoapPort;
  try
    ENReportAdditionZbytMetrologyObj := TempENReportAdditionZbytMetrology.getObject(StrToInt(sgENReportAdditionZbytMetrology.Cells[0,sgENReportAdditionZbytMetrology.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENReportAdditionZbytMetrology.Row;
  frmENReportAdditionZbytMetrologyEdit:=TfrmENReportAdditionZbytMetrologyEdit.Create(Application, dsEdit);
  
  try
    if frmENReportAdditionZbytMetrologyEdit.ShowModal= mrOk then
      begin
        //TempENReportAdditionZbytMetrology.save(ENReportAdditionZbytMetrologyObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENReportAdditionZbytMetrologyEdit.Free;
    frmENReportAdditionZbytMetrologyEdit:=nil;
  end;

  if sgENReportAdditionZbytMetrology.RowCount > selectedRow then
    sgENReportAdditionZbytMetrology.Row := selectedRow
  else
    sgENReportAdditionZbytMetrology.Row := sgENReportAdditionZbytMetrology.RowCount - 1;
  
end;


procedure TfrmENReportAdditionZbytMetrologyShow.actDeleteExecute(Sender: TObject);
Var TempENReportAdditionZbytMetrology: ENReportAdditionZbytMetrologyControllerSoapPort;
  ObjCode: Integer;
begin
 TempENReportAdditionZbytMetrology := HTTPRIOENReportAdditionZbytMetrology as ENReportAdditionZbytMetrologyControllerSoapPort;
   try
     ObjCode := StrToInt(sgENReportAdditionZbytMetrology.Cells[0,sgENReportAdditionZbytMetrology.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENReportAdditionZbytMetrology.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENReportAdditionZbytMetrologyShow.actInsertExecute(Sender: TObject);
// Var TempENReportAdditionZbytMetrology: ENReportAdditionZbytMetrologyControllerSoapPort; 
begin
  // TempENReportAdditionZbytMetrology := HTTPRIOENReportAdditionZbytMetrology as ENReportAdditionZbytMetrologyControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENReportAdditionZbytMetrologyObj:=ENReportAdditionZbytMetrology.Create;
  SetNullIntProps(ENReportAdditionZbytMetrologyObj);
  SetNullXSProps(ENReportAdditionZbytMetrologyObj);

   //ENReportAdditionZbytMetrologyObj.dateStart:= TXSDateTime.Create;
   
   //ENReportAdditionZbytMetrologyObj.dateFinal:= TXSDateTime.Create;
   


  try
    frmENReportAdditionZbytMetrologyEdit:=TfrmENReportAdditionZbytMetrologyEdit.Create(Application, dsInsert);
    try
      if frmENReportAdditionZbytMetrologyEdit.ShowModal = mrOk then
      begin
        if ENReportAdditionZbytMetrologyObj<>nil then
            //TempENReportAdditionZbytMetrology.add(ENReportAdditionZbytMetrologyObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENReportAdditionZbytMetrologyEdit.Free;
      frmENReportAdditionZbytMetrologyEdit:=nil;
    end;
  finally
    ENReportAdditionZbytMetrologyObj.Free;
  end;
end;


procedure TfrmENReportAdditionZbytMetrologyShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENReportAdditionZbytMetrologyShow.actFilterExecute(Sender: TObject);
begin
{frmENReportAdditionZbytMetrologyFilterEdit:=TfrmENReportAdditionZbytMetrologyFilterEdit.Create(Application, dsInsert);
  try
    ENReportAdditionZbytMetrologyFilterObj := ENReportAdditionZbytMetrologyFilter.Create;
    SetNullIntProps(ENReportAdditionZbytMetrologyFilterObj);
    SetNullXSProps(ENReportAdditionZbytMetrologyFilterObj);

    if frmENReportAdditionZbytMetrologyFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENReportAdditionZbytMetrologyFilter.Create;
      FilterObject := ENReportAdditionZbytMetrologyFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENReportAdditionZbytMetrologyFilterEdit.Free;
    frmENReportAdditionZbytMetrologyFilterEdit:=nil;
  end;}
end;


procedure TfrmENReportAdditionZbytMetrologyShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.