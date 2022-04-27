
unit ShowENGPSTracker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENGPSTrackerController, AdvObj ;


type
    TfrmENGPSTrackerShow = class(TChildForm)  
    HTTPRIOENGPSTracker: THTTPRIO;
    ImageList1: TImageList;
    sgENGPSTracker: TAdvStringGrid;
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
    procedure sgENGPSTrackerTopLeftChanged(Sender: TObject);
    procedure sgENGPSTrackerDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgENGPSTrackerColumnSizing(Sender: TObject; ACol,
      ColumnSize: Integer);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENGPSTrackerShort; stdcall; static;
 end;


var
  frmENGPSTrackerShow: TfrmENGPSTrackerShow;
  
  
implementation

uses Main, EditENGPSTracker, EditENGPSTrackerFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENGPSTrackerHeaders: array [1..9] of String =
        ( 'Код'
          ,'Рестраційний номер трекеру'
          ,'Найменування транспортного засобу'
          ,'Держ.номер транспортного засобу'
          ,'Інвентарний номер транспортного засобу'
          ,'Номер телефону SIM-карти'
          ,'код  SIM-карти'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   
class function TfrmENGPSTrackerShow.chooseFromList : ENGPSTrackerShort;
var
  f1 : ENGPSTrackerFilter;
  frmENGPSTrackerShow : TfrmENGPSTrackerShow;
  selected : ENGPSTrackerShort;
begin
  inherited;
     selected := nil;
     f1 := ENGPSTrackerFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENGPSTrackerShow := TfrmENGPSTrackerShow.Create(Application, fmNormal, f1);
       try
          with frmENGPSTrackerShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGPSTrackerShort(sgENGPSTracker.Objects[0, sgENGPSTracker.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENGPSTrackerShow.Free;
       end;
end;

procedure TfrmENGPSTrackerShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENGPSTrackerShow:=nil;
  inherited;
end;


procedure TfrmENGPSTrackerShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENGPSTrackerShow.FormShow(Sender: TObject);
var
  TempENGPSTracker: ENGPSTrackerControllerSoapPort;
  i: Integer;
  ENGPSTrackerList: ENGPSTrackerShortList;
begin
  SetGridHeaders(ENGPSTrackerHeaders, sgENGPSTracker.ColumnHeaders);
  ColCount:=100;
  TempENGPSTracker :=  HTTPRIOENGPSTracker as ENGPSTrackerControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENGPSTrackerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENGPSTrackerList := TempENGPSTracker.getScrollableFilteredList(ENGPSTrackerFilter(FilterObject),0,ColCount);
  LastCount:=High(ENGPSTrackerList.list);

  if LastCount > -1 then
     sgENGPSTracker.RowCount:=LastCount+2
  else
     sgENGPSTracker.RowCount:=2;

   with sgENGPSTracker do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENGPSTrackerList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENGPSTrackerList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENGPSTrackerList.list[i].reg_id;

        Cells[2,i+1] := ENGPSTrackerList.list[i].realTransportName;
        Cells[3,i+1] := ENGPSTrackerList.list[i].realTransportGosNumber;
        Cells[4,i+1] := ENGPSTrackerList.list[i].realTransportInvNumber;

        Cells[5,i+1] := ENGPSTrackerList.list[i].phoneNumber;

        Cells[6,i+1] := ENGPSTrackerList.list[i].cardNumber;

        Cells[7,i+1] := ENGPSTrackerList.list[i].userGen;

        if ENGPSTrackerList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDateTimeWithDate2String(ENGPSTrackerList.list[i].dateEdit);
        Objects[0, i+1] := ENGPSTrackerList.list[i];
        LastRow:=i+1;
        sgENGPSTracker.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENGPSTracker.Row:=1;
    sgENGPSTracker.AutoSizeRows(True);
   
    if selectedRow <> 0 then
    begin
    if sgENGPSTracker.RowCount > selectedRow then
      sgENGPSTracker.Row := selectedRow
    else
      sgENGPSTracker.Row := sgENGPSTracker.RowCount - 1;
    end
    else
      sgENGPSTracker.Row:=1;   
end;


procedure TfrmENGPSTrackerShow.sgENGPSTrackerTopLeftChanged(Sender: TObject);
var
  TempENGPSTracker: ENGPSTrackerControllerSoapPort;
  i,CurrentRow: Integer;
  ENGPSTrackerList: ENGPSTrackerShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENGPSTracker.TopRow + sgENGPSTracker.VisibleRowCount) = ColCount
  then
    begin
      TempENGPSTracker :=  HTTPRIOENGPSTracker as ENGPSTrackerControllerSoapPort;
      CurrentRow:=sgENGPSTracker.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENGPSTrackerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENGPSTrackerList := TempENGPSTracker.getScrollableFilteredList(ENGPSTrackerFilter(FilterObject),ColCount-1, 100);


  sgENGPSTracker.RowCount:=sgENGPSTracker.RowCount+100;
  LastCount:=High(ENGPSTrackerList.list);
  with sgENGPSTracker do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENGPSTrackerList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENGPSTrackerList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENGPSTrackerList.list[i].reg_id;

        Cells[2,i+CurrentRow] := ENGPSTrackerList.list[i].realTransportName;
        Cells[3,i+CurrentRow] := ENGPSTrackerList.list[i].realTransportGosNumber;
        Cells[4,i+CurrentRow] := ENGPSTrackerList.list[i].realTransportInvNumber;

        Cells[5,i+CurrentRow] := ENGPSTrackerList.list[i].phoneNumber;

        Cells[6,i+CurrentRow] := ENGPSTrackerList.list[i].cardNumber;

        Cells[7,i+CurrentRow] := ENGPSTrackerList.list[i].userGen;

        if ENGPSTrackerList.list[i].dateEdit = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDateTimeWithDate2String(ENGPSTrackerList.list[i].dateEdit);
        Objects[0, i+CurrentRow] := ENGPSTrackerList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENGPSTracker.Row:=CurrentRow-5;
   sgENGPSTracker.RowCount:=LastRow+1;
   sgENGPSTracker.AutoSizeRows(True);
  end;
end;

procedure TfrmENGPSTrackerShow.sgENGPSTrackerColumnSizing(Sender: TObject; ACol,
  ColumnSize: Integer);
begin
  inherited;
   sgENGPSTracker.AutoSizeRows(True);
end;

procedure TfrmENGPSTrackerShow.sgENGPSTrackerDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENGPSTracker,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENGPSTrackerShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENGPSTracker.RowCount-1 do
   for j:=0 to sgENGPSTracker.ColCount-1 do
     sgENGPSTracker.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENGPSTrackerShow.actViewExecute(Sender: TObject);
var 
  TempENGPSTracker: ENGPSTrackerControllerSoapPort;
begin
  TempENGPSTracker := HTTPRIOENGPSTracker as ENGPSTrackerControllerSoapPort;
  try
    ENGPSTrackerObj := TempENGPSTracker.getObject(StrToInt(sgENGPSTracker.Cells[0, sgENGPSTracker.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENGPSTrackerEdit := TfrmENGPSTrackerEdit.Create(Application, dsView);
  try
    frmENGPSTrackerEdit.ShowModal;
  finally
    frmENGPSTrackerEdit.Free;
    frmENGPSTrackerEdit := nil;
  end;
end;


procedure TfrmENGPSTrackerShow.actEditExecute(Sender: TObject);
var 
  TempENGPSTracker: ENGPSTrackerControllerSoapPort;
begin
  TempENGPSTracker := HTTPRIOENGPSTracker as ENGPSTrackerControllerSoapPort;
  try
    ENGPSTrackerObj := TempENGPSTracker.getObject(StrToInt(sgENGPSTracker.Cells[0,sgENGPSTracker.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENGPSTracker.Row;
  frmENGPSTrackerEdit:=TfrmENGPSTrackerEdit.Create(Application, dsEdit);
  
  try
    if frmENGPSTrackerEdit.ShowModal= mrOk then
      begin
        //TempENGPSTracker.save(ENGPSTrackerObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENGPSTrackerEdit.Free;
    frmENGPSTrackerEdit:=nil;
  end;

  if sgENGPSTracker.RowCount > selectedRow then
    sgENGPSTracker.Row := selectedRow
  else
    sgENGPSTracker.Row := sgENGPSTracker.RowCount - 1;
  
end;


procedure TfrmENGPSTrackerShow.actDeleteExecute(Sender: TObject);
Var TempENGPSTracker: ENGPSTrackerControllerSoapPort;
  ObjCode: Integer;
begin
 TempENGPSTracker := HTTPRIOENGPSTracker as ENGPSTrackerControllerSoapPort;
   try
     ObjCode := StrToInt(sgENGPSTracker.Cells[0,sgENGPSTracker.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Трекер GPS)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENGPSTracker.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENGPSTrackerShow.actInsertExecute(Sender: TObject);
// Var TempENGPSTracker: ENGPSTrackerControllerSoapPort; 
begin
  // TempENGPSTracker := HTTPRIOENGPSTracker as ENGPSTrackerControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENGPSTrackerObj:=ENGPSTracker.Create;
  SetNullIntProps(ENGPSTrackerObj);
  SetNullXSProps(ENGPSTrackerObj);

   //ENGPSTrackerObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENGPSTrackerEdit:=TfrmENGPSTrackerEdit.Create(Application, dsInsert);
    try
      if frmENGPSTrackerEdit.ShowModal = mrOk then
      begin
        if ENGPSTrackerObj<>nil then
            //TempENGPSTracker.add(ENGPSTrackerObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENGPSTrackerEdit.Free;
      frmENGPSTrackerEdit:=nil;
    end;
  finally
    ENGPSTrackerObj.Free;
  end;
end;


procedure TfrmENGPSTrackerShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENGPSTrackerShow.actFilterExecute(Sender: TObject);
begin
frmENGPSTrackerFilterEdit:=TfrmENGPSTrackerFilterEdit.Create(Application, dsInsert);
  try
    ENGPSTrackerFilterObj := ENGPSTrackerFilter.Create;
    SetNullIntProps(ENGPSTrackerFilterObj);
    SetNullXSProps(ENGPSTrackerFilterObj);

    if frmENGPSTrackerFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENGPSTrackerFilter.Create;
      FilterObject := ENGPSTrackerFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENGPSTrackerFilterEdit.Free;
    frmENGPSTrackerFilterEdit:=nil;
  end;
end;


procedure TfrmENGPSTrackerShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.