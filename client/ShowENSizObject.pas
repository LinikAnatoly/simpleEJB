
unit ShowENSizObject;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, AdvGrid,
    ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,
    XSBuiltIns, DialogFormUnit, DlgUnit, GridHeadersUnit, Globals,
    EnergyProController, EnergyProController2, ENSizObjectController, AdvObj;


type
    TfrmENSizObjectShow = class(TChildForm)
    HTTPRIOENSizObject: THTTPRIO;
    ImageList1: TImageList;
    sgENSizObject: TAdvStringGrid;
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
    procedure sgENSizObjectTopLeftChanged(Sender: TObject);
    procedure sgENSizObjectDblClick(Sender: TObject);
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
 end;


var
  frmENSizObjectShow: TfrmENSizObjectShow;

  
implementation


uses Main, EditENSizObject, EditENSizObjectFilter, DMReportsUnit,
     ENDepartmentController;


{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSizObjectHeaders: array [1..8] of String =
        ( 'Код'
          ,'Табельний номер'
          ,'П.І.Б. співробітника'
          ,'Посада'
          ,'Код групи ЗІЗ'
          ,'Район'
          ,'Підрозділ'
          ,'Ознака працює/звільнено'
        );



procedure TfrmENSizObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSizObjectShow:=nil;
    inherited;
  end;


procedure TfrmENSizObjectShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSizObjectShow.FormShow(Sender: TObject);
var
  TempENSizObject: ENSizObjectControllerSoapPort;
  i: Integer;
  ENSizObjectList: ENSizObjectShortList;
  depShort : ENDepartmentShort;
begin
  ClearGrid(sgENSizObject);
  SetGridHeaders(ENSizObjectHeaders, sgENSizObject.ColumnHeaders);
  ColCount:=100;
  TempENSizObject := HTTPRIOENSizObject as ENSizObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSizObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     ENSizObjectFilter(FilterObject).statusCode := NO;
  end;

  ENSizObjectList := TempENSizObject.getScrollableFilteredList(ENSizObjectFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSizObjectList.list);

  if LastCount > -1 then
     sgENSizObject.RowCount:=LastCount+2
  else
     sgENSizObject.RowCount:=2;

   with sgENSizObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSizObjectList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENSizObjectList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENSizObjectList.list[i].tabNumber;
        Cells[2,i+1] := ENSizObjectList.list[i].fio;
        Cells[3,i+1] := ENSizObjectList.list[i].profesion;

        if ENSizObjectList.list[i].sizCode = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(ENSizObjectList.list[i].sizCode);

        Cells[5,i+1] := ENSizObjectList.list[i].renName;
        Cells[6,i+1] := ENSizObjectList.list[i].departmentRefShortName;

        if  ENSizObjectList.list[i].statusCode = NO then
          Cells[7,i+1] := 'Працює'
        else
          Cells[7,i+1] := 'Звільнено';

        LastRow:=i+1;
        sgENSizObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSizObject.Row:=1;
end;


procedure TfrmENSizObjectShow.sgENSizObjectTopLeftChanged(Sender: TObject);
var
  TempENSizObject: ENSizObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENSizObjectList: ENSizObjectShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENSizObject.TopRow + sgENSizObject.VisibleRowCount) = ColCount
  then
  begin
    TempENSizObject :=  HTTPRIOENSizObject as ENSizObjectControllerSoapPort;
    CurrentRow:=sgENSizObject.RowCount;

    if FilterObject = nil then
    begin
      FilterObject := ENSizObjectFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

    ENSizObjectList := TempENSizObject.getScrollableFilteredList(ENSizObjectFilter(FilterObject),ColCount-1, 100);

    sgENSizObject.RowCount:=sgENSizObject.RowCount+100;
    LastCount:=High(ENSizObjectList.list);

    with sgENSizObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSizObjectList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENSizObjectList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENSizObjectList.list[i].tabNumber;
        Cells[2,i+CurrentRow] := ENSizObjectList.list[i].fio;
        Cells[3,i+CurrentRow] := ENSizObjectList.list[i].profesion;

        if ENSizObjectList.list[i].sizCode = Low(Integer) then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := IntToStr(ENSizObjectList.list[i].sizCode);

        Cells[5,i+CurrentRow] := ENSizObjectList.list[i].renName;
        Cells[6,i+CurrentRow] := ENSizObjectList.list[i].departmentRefShortName;

        if  ENSizObjectList.list[i].statusCode = NO then
             Cells[7,i+CurrentRow] := 'Працює'
         else
             Cells[7,i+CurrentRow] := 'Звільнено';

        LastRow:=i+CurrentRow;
      end;

   ColCount:=ColCount+100;
   sgENSizObject.Row:=CurrentRow-5;
   sgENSizObject.RowCount:=LastRow+1;
  end;
end;


procedure TfrmENSizObjectShow.sgENSizObjectDblClick(Sender: TObject);
var
  temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSizObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSizObjectShow.UpdateGrid(Sender: TObject);
var
  i, j: Integer;
begin
 for i:=1 to sgENSizObject.RowCount-1 do
   for j:=0 to sgENSizObject.ColCount-1 do
     sgENSizObject.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSizObjectShow.actViewExecute(Sender: TObject);
var
  TempENSizObject: ENSizObjectControllerSoapPort;
begin
  TempENSizObject := HTTPRIOENSizObject as ENSizObjectControllerSoapPort;
  try
    ENSizObjectObj := TempENSizObject.getObject(StrToInt(sgENSizObject.Cells[0,sgENSizObject.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENSizObjectEdit := TfrmENSizObjectEdit.Create(Application, dsView);
  try
    frmENSizObjectEdit.ShowModal;
  finally
    frmENSizObjectEdit.Free;
    frmENSizObjectEdit:=nil;
  end;
end;


procedure TfrmENSizObjectShow.actEditExecute(Sender: TObject);
var
  TempENSizObject: ENSizObjectControllerSoapPort;
begin
  TempENSizObject := HTTPRIOENSizObject as ENSizObjectControllerSoapPort;
  try
    ENSizObjectObj := TempENSizObject.getObject(StrToInt(sgENSizObject.Cells[0,sgENSizObject.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENSizObject.Row;
  frmENSizObjectEdit:=TfrmENSizObjectEdit.Create(Application, dsEdit);

  try
    if frmENSizObjectEdit.ShowModal= mrOk then
      begin
        //TempENSizObject.save(ENSizObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSizObjectEdit.Free;
    frmENSizObjectEdit:=nil;
  end;

  if sgENSizObject.RowCount > selectedRow then
    sgENSizObject.Row := selectedRow
  else
    sgENSizObject.Row := sgENSizObject.RowCount - 1;
end;


procedure TfrmENSizObjectShow.actDeleteExecute(Sender: TObject);
var
  TempENSizObject: ENSizObjectControllerSoapPort;
  ObjCode: Integer;
begin
  TempENSizObject := HTTPRIOENSizObject as ENSizObjectControllerSoapPort;
  try
     ObjCode := StrToInt(sgENSizObject.Cells[0,sgENSizObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Обьекти для замовлення ЗІЗ)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSizObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;


procedure TfrmENSizObjectShow.actInsertExecute(Sender: TObject);
begin
  ENSizObjectObj := ENSizObject.Create;
  SetNullIntProps(ENSizObjectObj);
  SetNullXSProps(ENSizObjectObj);

  try
    frmENSizObjectEdit:=TfrmENSizObjectEdit.Create(Application, dsInsert);
    try
      if frmENSizObjectEdit.ShowModal = mrOk then
      begin
        if ENSizObjectObj<>nil then
            //TempENSizObject.add(ENSizObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSizObjectEdit.Free;
      frmENSizObjectEdit:=nil;
    end;
  finally
    ENSizObjectObj.Free;
  end;
end;


procedure TfrmENSizObjectShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSizObjectShow.actFilterExecute(Sender: TObject);
begin
  frmENSizObjectFilterEdit := TfrmENSizObjectFilterEdit.Create(Application, dsInsert);
  try
    ENSizObjectFilterObj := ENSizObjectFilter.Create;
    SetNullIntProps(ENSizObjectFilterObj);
    SetNullXSProps(ENSizObjectFilterObj);

    if frmENSizObjectFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      FilterObject := ENSizObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSizObjectFilterEdit.Free;
    frmENSizObjectFilterEdit:=nil;
  end;
end;


procedure TfrmENSizObjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;


end.