
unit ShowENBus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBusController, AdvObj ;


type
  TfrmENBusShow = class(TChildForm)  
  HTTPRIOENBus: THTTPRIO;
    ImageList1: TImageList;
    sgENBus: TAdvStringGrid;
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
procedure sgENBusTopLeftChanged(Sender: TObject);
procedure sgENBusDblClick(Sender: TObject);
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

var
 frmENBusShow : TfrmENBusShow;
 // ENBusObj: ENBus;
 // ENBusFilterObj: ENBusFilter;
  
  
implementation

uses Main, EditENBus, EditENBusFilter;


{$R *.dfm}

var
  //frmENBusShow : TfrmENBusShow;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBusHeaders: array [1..6] of String =
    ('Код'
    ,'Марка электрической шины'
    ,'Диспетчерское название'
    ,'Классификатор изолятора'
    ,'Количество изоляторов, шт.'
    ,'Длина шины, м');

procedure TfrmENBusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBusShow:=nil;
    inherited;
  end;

procedure TfrmENBusShow.FormShow(Sender: TObject);
var TempENBus: ENBusControllerSoapPort;
  i: Integer;
  ENBusList: ENBusShortList;
begin
  SetGridHeaders(ENBusHeaders, sgENBus.ColumnHeaders);
  ColCount := 100;
  TempENBus := HTTPRIOENBus as ENBusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBusList :=
    TempENBus.getScrollableFilteredList(ENBusFilter(FilterObject), 0, ColCount);

  LastCount := High(ENBusList.list);

  if LastCount > -1 then
    sgENBus.RowCount := LastCount + 2
  else
    sgENBus.RowCount := 2;

  with sgENBus do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBusList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENBusList.list[i].code)
        else //Код Шины электрической
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENBusList.list[i].materialRefName; //Марка шины электрической из Нормативных материалов
        Cells[2, i + 1] := ENBusList.list[i].name; //Диспетчерское название шины электрической
        Cells[3, i + 1] := ENBusList.list[i].matInsulatorRefName; //Классификатор изолятора из Нормативных материалов
        if ENBusList.list[i].insulatornumberGen = nil then
          Cells[4, i + 1] := ''
        else //Количество изоляторов, шт.
          Cells[4, i + 1] := ENBusList.list[i].insulatornumberGen.DecimalString;
        if ENBusList.list[i].length = nil then
          Cells[5, i + 1] := ''
        else //Длина шины, м
          Cells[5, i + 1] := ENBusList.list[i].length.DecimalString;
        //Cells[6, i + 1] := ENBusList.list[i].locationScheme; //Схема расположения шины
        LastRow := i + 1;
        sgENBus.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENBus.Row := 1;
end;

procedure TfrmENBusShow.sgENBusTopLeftChanged(Sender: TObject);
var
  TempENBus: ENBusControllerSoapPort;
  i,CurrentRow: Integer;
  ENBusList: ENBusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBus.TopRow + sgENBus.VisibleRowCount) = ColCount
  then
    begin
      TempENBus :=  HTTPRIOENBus as ENBusControllerSoapPort;
      CurrentRow:=sgENBus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBusList := TempENBus.getScrollableFilteredList(ENBusFilter(FilterObject),ColCount-1, 100);



  sgENBus.RowCount:=sgENBus.RowCount+100;
  LastCount:=High(ENBusList.list);
  with sgENBus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENBusList.list[i].insulatornumberGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENBusList.list[i].insulatornumberGen.DecimalString;
        if ENBusList.list[i].length = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENBusList.list[i].length.DecimalString;
        Cells[3,i+CurrentRow] := ENBusList.list[i].locationScheme;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBus.Row:=CurrentRow-5;
   sgENBus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBusShow.sgENBusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBus.RowCount-1 do
   for j:=0 to sgENBus.ColCount-1 do
     sgENBus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBusShow.actViewExecute(Sender: TObject);
Var TempENBus: ENBusControllerSoapPort;
begin
 TempENBus := HTTPRIOENBus as ENBusControllerSoapPort;
   try
     ENBusObj := TempENBus.getObject(StrToInt(sgENBus.Cells[0,sgENBus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBusEdit:=TfrmENBusEdit.Create(Application, dsView);
  try
    frmENBusEdit.ShowModal;
  finally
    frmENBusEdit.Free;
    frmENBusEdit:=nil;
  end;
end;

procedure TfrmENBusShow.actEditExecute(Sender: TObject);
Var TempENBus: ENBusControllerSoapPort;
begin
 TempENBus := HTTPRIOENBus as ENBusControllerSoapPort;
   try
     ENBusObj := TempENBus.getObject(StrToInt(sgENBus.Cells[0,sgENBus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBusEdit:=TfrmENBusEdit.Create(Application, dsEdit);
  try
    if frmENBusEdit.ShowModal= mrOk then
      begin
        //TempENBus.save(ENBusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBusEdit.Free;
    frmENBusEdit:=nil;
  end;
end;

procedure TfrmENBusShow.actDeleteExecute(Sender: TObject);
Var TempENBus: ENBusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBus := HTTPRIOENBus as ENBusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBus.Cells[0,sgENBus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Шины) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBusShow.actInsertExecute(Sender: TObject);
Var TempENBus: ENBusControllerSoapPort;
begin
  TempENBus := HTTPRIOENBus as ENBusControllerSoapPort;
  ENBusObj:=ENBus.Create;

   //ENBusObj.insulatornumberGen:= TXSDecimal.Create;
   //ENBusObj.length:= TXSDecimal.Create;


  try
    frmENBusEdit:=TfrmENBusEdit.Create(Application, dsInsert);
    try
      if frmENBusEdit.ShowModal = mrOk then
      begin
        if ENBusObj<>nil then
            //TempENBus.add(ENBusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBusEdit.Free;
      frmENBusEdit:=nil;
    end;
  finally
    ENBusObj.Free;
  end;
end;

procedure TfrmENBusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBusShow.actFilterExecute(Sender: TObject);
begin
{frmENBusFilterEdit:=TfrmENBusFilterEdit.Create(Application, dsInsert);
  try
    ENBusFilterObj := ENBusFilter.Create;
    SetNullIntProps(ENBusFilterObj);
    SetNullXSProps(ENBusFilterObj);

    if frmENBusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBusFilter.Create;
      FilterObject := ENBusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBusFilterEdit.Free;
    frmENBusFilterEdit:=nil;
  end;}
end;

procedure TfrmENBusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.