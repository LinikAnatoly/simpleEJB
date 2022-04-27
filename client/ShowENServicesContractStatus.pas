unit ShowENServicesContractStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENServicesContractStatusController, AdvObj ;


type
  TfrmENServicesContractStatusShow = class(TChildForm)  
  HTTPRIOENServicesContractStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENServicesContractStatus: TAdvStringGrid;
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
procedure sgENServicesContractStatusTopLeftChanged(Sender: TObject);
procedure sgENServicesContractStatusDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENServicesContractStatusObj: ENServicesContractStatus;
 // ENServicesContractStatusFilterObj: ENServicesContractStatusFilter;

var frmENServicesContractStatusShow : TfrmENServicesContractStatusShow;

implementation

uses Main, EditENServicesContractStatus, EditENServicesContractStatusFilter;


{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServicesContractStatusHeaders: array [1..2] of String =
    ( 'Код', 'Статус договора по услугам на сторону');
   

procedure TfrmENServicesContractStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENServicesContractStatusShow:=nil;
    inherited;
  end;


procedure TfrmENServicesContractStatusShow.FormShow(Sender: TObject);
var TempENServicesContractStatus: ENServicesContractStatusControllerSoapPort;
  i: Integer;
  ENServicesContractStatusList: ENServicesContractStatusShortList;
begin
  SetGridHeaders(
    ENServicesContractStatusHeaders, sgENServicesContractStatus.ColumnHeaders);

  ColCount := 100;
  try
    TempENServicesContractStatus := HTTPRIOENServicesContractStatus
      as ENServicesContractStatusControllerSoapPort;
    if FilterObject = nil then
      begin
        FilterObject := ENServicesContractStatusFilter.Create;
        SetNullIntProps(FilterObject);
        SetNullXSProps(FilterObject);
      end;
    ENServicesContractStatusList :=
      TempENServicesContractStatus.getScrollableFilteredList(
        ENServicesContractStatusFilter(FilterObject), 0, ColCount);

    LastCount := High(ENServicesContractStatusList.list);

    if LastCount > -1 then
       sgENServicesContractStatus.RowCount := LastCount+2
    else
       sgENServicesContractStatus.RowCount := 2;

     with sgENServicesContractStatus do
      for i := 0 to LastCount do
        begin
          Application.ProcessMessages;
          if ENServicesContractStatusList.list[i].code <> Low(Integer) then
            Cells[0, i + 1] := IntToStr(ENServicesContractStatusList.list[i].code)
          else
            Cells[0, i + 1] := '';
          Cells[1, i + 1] := ENServicesContractStatusList.list[i].name;
          LastRow := i + 1;
          sgENServicesContractStatus.RowCount := LastRow+1;
        end;
     ColCount := ColCount + 1;
  except //SUPP-33452. Заполнение списка статусов услуг значениями как в
    with sgENServicesContractStatus do //таблице net.enservicescontractstts,
      begin //пока на сервере приложений нет контроллеров *.java, таких как
        RowCount := 12; //ENServicesContractStatusControllerEJBGen.java,
        Cells[0, 1] := '1'; //ENServicesContractStatusController.java
        Cells[1, 1] := 'Чорновий'; //ENServicesContractStatusControllerEJB.java,
        Cells[0, 2] := '2'; //ENServicesContractStatusControllerHome.java
        Cells[1, 2] := 'Відмінений';
        Cells[0, 3] := '3';
        Cells[1, 3] := 'Кошторис затверджений';
        Cells[0, 4] := '4';
        Cells[1, 4] := 'Підписаний';
        Cells[0, 5] := '5';
        Cells[1, 5] := 'Сплачений';
        Cells[0, 6] := '6';
        Cells[1, 6] := 'Акт прийому підписаний';
        Cells[0, 7] := '7';
        Cells[1, 7] := 'Роботи виконані';
        Cells[0, 8] := '8';
        Cells[1, 8] := 'Скасований';
        Cells[0, 9] := '9';
        Cells[1, 9] := 'Сплачено попередній рахунок';
        Cells[0, 10] := '10';
        Cells[1, 10] := 'Відмова замовника від послуг';
        Cells[0, 11] := '11';
        Cells[1, 11] := 'Закритий';
      end; //with sgENServicesContractStatus do
  end;
  sgENServicesContractStatus.Row := 1;
end; //procedure TfrmENServicesContractStatusShow.FormShow(Sender: TObject);

procedure TfrmENServicesContractStatusShow.sgENServicesContractStatusTopLeftChanged(Sender: TObject);
var
  TempENServicesContractStatus: ENServicesContractStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENServicesContractStatusList: ENServicesContractStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENServicesContractStatus.TopRow + sgENServicesContractStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENServicesContractStatus :=  HTTPRIOENServicesContractStatus as ENServicesContractStatusControllerSoapPort;
      CurrentRow:=sgENServicesContractStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesContractStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServicesContractStatusList := TempENServicesContractStatus.getScrollableFilteredList(ENServicesContractStatusFilter(FilterObject),ColCount-1, 100);



  sgENServicesContractStatus.RowCount:=sgENServicesContractStatus.RowCount+100;
  LastCount:=High(ENServicesContractStatusList.list);
  with sgENServicesContractStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesContractStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENServicesContractStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENServicesContractStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENServicesContractStatus.Row:=CurrentRow-5;
   sgENServicesContractStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENServicesContractStatusShow.sgENServicesContractStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENServicesContractStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENServicesContractStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENServicesContractStatus.RowCount-1 do
   for j:=0 to sgENServicesContractStatus.ColCount-1 do
     sgENServicesContractStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENServicesContractStatusShow.actViewExecute(Sender: TObject);
Var TempENServicesContractStatus: ENServicesContractStatusControllerSoapPort;
begin
 TempENServicesContractStatus := HTTPRIOENServicesContractStatus as ENServicesContractStatusControllerSoapPort;
   try
     ENServicesContractStatusObj := TempENServicesContractStatus.getObject(StrToInt(sgENServicesContractStatus.Cells[0,sgENServicesContractStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENServicesContractStatusEdit:=TfrmENServicesContractStatusEdit.Create(Application, dsView);
  try
    frmENServicesContractStatusEdit.ShowModal;
  finally
    frmENServicesContractStatusEdit.Free;
    frmENServicesContractStatusEdit:=nil;
  end;
end;

procedure TfrmENServicesContractStatusShow.actEditExecute(Sender: TObject);
Var TempENServicesContractStatus: ENServicesContractStatusControllerSoapPort;
begin
 TempENServicesContractStatus := HTTPRIOENServicesContractStatus as ENServicesContractStatusControllerSoapPort;
   try
     ENServicesContractStatusObj := TempENServicesContractStatus.getObject(StrToInt(sgENServicesContractStatus.Cells[0,sgENServicesContractStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENServicesContractStatusEdit:=TfrmENServicesContractStatusEdit.Create(Application, dsEdit);
  try
    if frmENServicesContractStatusEdit.ShowModal= mrOk then
      begin
        //TempENServicesContractStatus.save(ENServicesContractStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENServicesContractStatusEdit.Free;
    frmENServicesContractStatusEdit:=nil;
  end;
end;

procedure TfrmENServicesContractStatusShow.actDeleteExecute(Sender: TObject);
Var TempENServicesContractStatus: ENServicesContractStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENServicesContractStatus := HTTPRIOENServicesContractStatus as ENServicesContractStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENServicesContractStatus.Cells[0,sgENServicesContractStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус договора по услугам на сторону) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENServicesContractStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesContractStatusShow.actInsertExecute(Sender: TObject);
// Var TempENServicesContractStatus: ENServicesContractStatusControllerSoapPort; 
begin
  // TempENServicesContractStatus := HTTPRIOENServicesContractStatus as ENServicesContractStatusControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENServicesContractStatusObj:=ENServicesContractStatus.Create;



  try
    frmENServicesContractStatusEdit:=TfrmENServicesContractStatusEdit.Create(Application, dsInsert);
    try
      if frmENServicesContractStatusEdit.ShowModal = mrOk then
      begin
        if ENServicesContractStatusObj<>nil then
            //TempENServicesContractStatus.add(ENServicesContractStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENServicesContractStatusEdit.Free;
      frmENServicesContractStatusEdit:=nil;
    end;
  finally
    ENServicesContractStatusObj.Free;
  end;
end;

procedure TfrmENServicesContractStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENServicesContractStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENServicesContractStatusFilterEdit:=TfrmENServicesContractStatusFilterEdit.Create(Application, dsInsert);
  try
    ENServicesContractStatusFilterObj := ENServicesContractStatusFilter.Create;
    SetNullIntProps(ENServicesContractStatusFilterObj);
    SetNullXSProps(ENServicesContractStatusFilterObj);

    if frmENServicesContractStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENServicesContractStatusFilter.Create;
      FilterObject := ENServicesContractStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENServicesContractStatusFilterEdit.Free;
    frmENServicesContractStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENServicesContractStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.