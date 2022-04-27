
unit ShowENTransformer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransformerController, AdvObj ;


type
  TfrmENTransformerShow = class(TChildForm)  
  HTTPRIOENTransformer: THTTPRIO;
    ImageList1: TImageList;
    sgENTransformer: TAdvStringGrid;
    ActionListTransformer: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenuTransformer: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBarTramsformer: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    HTTPRIOENSubstation04: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENTransformerTopLeftChanged(Sender: TObject);
procedure sgENTransformerDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure sgENTransformerMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
  frmENTransformerShow : TfrmENTransformerShow;
  transformerCode: Integer;
  trMat, trType, trInvNumber, trConnectGroup, trAntsapfRefName: String;
  trNominalPower, trUkz, trHighVoltage, trHighCurrent, trLowVoltage,
  trLowCurrent: Real;

 // ENTransformerObj: ENTransformer;
 // ENTransformerFilterObj: ENTransformerFilter;

implementation

uses Main, EditENTransformer, EditENTransformerFilter, ENSubstation04Controller;

{$R *.dfm}

var
  //frmENTransformerShow : TfrmENTransformerShow;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransformerHeaders: array [1..15] of String = (
    'Код',
    'Назва',
    'Потужність, кВА',
    'Тип тр-ра',
    'Інв. номер',
    'Підстанція',
    'Підрозділ',
    'Матеріал',
    'Ек. проц.',
    'U, В ВН',
    'I, А ВН',
    'U, В НН',
    'I, А НН',
    'Група приєднання',
    'ПБЗ');

procedure TfrmENTransformerShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransformerShow:=nil;
    inherited;
  end;


procedure TfrmENTransformerShow.FormShow(Sender: TObject);
var
  TempENTransformer: ENTransformerControllerSoapPort;
  i: Integer;
  ENTransformerList: ENTransformerShortList;

  TempENSubstation04: ENSubstation04ControllerSoapPort;
  ENSubstation04Obj: ENSubstation04;
begin
  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENTransformerHeaders, sgENTransformer.ColumnHeaders);
  ColCount := 100;
  TempENTransformer :=  HTTPRIOENTransformer as ENTransformerControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransformerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransformerList :=
    TempENTransformer.getScrollableFilteredList(
      ENTransformerFilter(FilterObject), 0, ColCount);

  LastCount := High(ENTransformerList.list);

  if LastCount > -1 then
     sgENTransformer.RowCount := LastCount + 2
  else
     sgENTransformer.RowCount := 2;

  TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;

  with sgENTransformer do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransformerList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENTransformerList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENTransformerList.List[i].name;
        if ENTransformerList.List[i].nominalPower = nil then
          Cells[2, i + 1] := ''
        else
          Cells[2, i + 1] := ENTransformerList.list[i].nominalPower.DecimalString;
        Cells[3, i + 1] := ENTransformerList.list[i].transformerTypeName;
        Cells[4, i + 1] := ENTransformerList.list[i].invNumber;
        Cells[5, i + 1] := '';
        Cells[6, i + 1] := '';
        ENSubstation04Obj := TempENSubstation04.getObject(
          ENTransformerList.list[i].substation04RefCode);
        try
          if ENSubstation04Obj <> nil then
            begin
              Cells[5, i + 1] := ENSubstation04Obj.name;
              Cells[6, i + 1] := ENSubstation04Obj.element.renRef.name;
            end;
        finally
          ENSubstation04Obj.Free;
        end;

        Cells[7, i + 1] := ENTransformerList.list[i].materialRefName;
        Cells[8, i + 1] := ENTransformerList.list[i].ukz.DecimalString;
        Cells[9, i + 1] := ENTransformerList.list[i].highVoltage.DecimalString;
        Cells[10, i + 1] := ENTransformerList.list[i].highCurrent.DecimalString;
        Cells[11, i + 1] := ENTransformerList.list[i].lowVoltage.DecimalString;
        Cells[12, i + 1] := ENTransformerList.list[i].lowCurrent.DecimalString;
        Cells[13, i + 1] := ENTransformerList.list[i].connectGroup;
        Cells[14, i + 1] := ENTransformerList.list[i].antsapfRefName;

        LastRow := i + 1;
        sgENTransformer.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENTransformer.Row := 1;
end;

procedure TfrmENTransformerShow.sgENTransformerTopLeftChanged(Sender: TObject);
var
  TempENTransformer: ENTransformerControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransformerList: ENTransformerShortList;

  TempENSubstation04: ENSubstation04ControllerSoapPort;
  ENSubstation04Obj: ENSubstation04;

begin
  if LastCount < 99 then Exit;
  if (sgENTransformer.TopRow + sgENTransformer.VisibleRowCount) = ColCount
  then
    begin
      TempENTransformer :=  HTTPRIOENTransformer as ENTransformerControllerSoapPort;
      CurrentRow:=sgENTransformer.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransformerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;
  ENTransformerList := TempENTransformer.getScrollableFilteredList(
    ENTransformerFilter(FilterObject), ColCount - 1, 100);
  sgENTransformer.RowCount := sgENTransformer.RowCount + 100;
  LastCount := High(ENTransformerList.list);
  TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
  with sgENTransformer do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransformerList.list[i].code <> Low(Integer) then
          Cells[0, i + CurrentRow] := IntToStr(ENTransformerList.list[i].code)
        else
          Cells[0, i + CurrentRow] := '';
        Cells[1, i + CurrentRow] := ENTransformerList.List[i].name;
        if ENTransformerList.list[i].nominalPower = nil then
          Cells[2, i + CurrentRow] := ''
        else
          Cells[2, i + CurrentRow] :=
            ENTransformerList.list[i].nominalPower.DecimalString;
        Cells[3, i + CurrentRow] := ENTransformerList.list[i].transformerTypeName;
        Cells[4, i + CurrentRow] := ENTransformerList.list[i].invNumber;

        Cells[5, i + CurrentRow] := '';
        Cells[6, i + CurrentRow] := '';
        ENSubstation04Obj := TempENSubstation04.getObject(
          ENTransformerList.list[i].substation04RefCode);
        try
          Cells[5, i + CurrentRow] := ENSubstation04Obj.name;
          Cells[6, i + CurrentRow] := ENSubstation04Obj.element.renRef.name;
        finally
          ENSubstation04Obj.Free;
        end;

        Cells[7, i + CurrentRow] := ENTransformerList.list[i].materialRefName;
        Cells[8, i + CurrentRow] := ENTransformerList.list[i].ukz.DecimalString;
        Cells[9, i + CurrentRow] := ENTransformerList.list[i].highVoltage.DecimalString;
        Cells[10, i + CurrentRow] := ENTransformerList.list[i].highCurrent.DecimalString;
        Cells[11, i + CurrentRow] := ENTransformerList.list[i].lowVoltage.DecimalString;
        Cells[12, i + CurrentRow] := ENTransformerList.list[i].lowCurrent.DecimalString;
        Cells[13, i + CurrentRow] := ENTransformerList.list[i].connectGroup;
        Cells[14, i + CurrentRow] := ENTransformerList.list[i].antsapfRefName;

        LastRow := i + CurrentRow;
      end;
   ColCount := ColCount + 100;
   sgENTransformer.Row := CurrentRow - 5;
   sgENTransformer.RowCount := LastRow + 1;
  end;
end;

procedure TfrmENTransformerShow.sgENTransformerDblClick(Sender: TObject);
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try
      transformerCode := StrToInt(GetReturnValue(sgENTransformer, 0));
      trType := GetReturnValue(sgENTransformer, 3);
      trInvNumber := GetReturnValue(sgENTransformer, 4);
      trMat := GetReturnValue(sgENTransformer, 7);
      trUkz := StrToFloat(GetReturnValue(sgENTransformer, 8));
      trHighVoltage := StrToFloat(GetReturnValue(sgENTransformer, 9));
      trHighCurrent := StrToFloat(GetReturnValue(sgENTransformer, 10));
      trLowVoltage := StrToFloat(GetReturnValue(sgENTransformer, 11));
      trLowCurrent := StrToFloat(GetReturnValue(sgENTransformer, 12));
      trConnectGroup := GetReturnValue(sgENTransformer, 13);
      trAntsapfRefName := GetReturnValue(sgENTransformer, 14);
    except
      on EConvertError do Exit;
    end;
    ModalResult := mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransformerShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransformer.RowCount-1 do
   for j:=0 to sgENTransformer.ColCount-1 do
     sgENTransformer.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransformerShow.actViewExecute(Sender: TObject);
Var TempENTransformer: ENTransformerControllerSoapPort;
begin
 TempENTransformer := HTTPRIOENTransformer as ENTransformerControllerSoapPort;
   try
     ENTransformerObj := TempENTransformer.getObject(StrToInt(sgENTransformer.Cells[0,sgENTransformer.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransformerEdit:=TfrmENTransformerEdit.Create(Application, dsView);
  try
    frmENTransformerEdit.ShowModal;
  finally
    frmENTransformerEdit.Free;
    frmENTransformerEdit:=nil;
  end;
end;

procedure TfrmENTransformerShow.actEditExecute(Sender: TObject);
Var TempENTransformer: ENTransformerControllerSoapPort;
begin
 TempENTransformer := HTTPRIOENTransformer as ENTransformerControllerSoapPort;
   try
     ENTransformerObj := TempENTransformer.getObject(StrToInt(sgENTransformer.Cells[0,sgENTransformer.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransformerEdit:=TfrmENTransformerEdit.Create(Application, dsEdit);
  try
    if frmENTransformerEdit.ShowModal= mrOk then
      begin
        //TempENTransformer.save(ENTransformerObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransformerEdit.Free;
    frmENTransformerEdit:=nil;
  end;
end;

procedure TfrmENTransformerShow.actDeleteExecute(Sender: TObject);
Var TempENTransformer: ENTransformerControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransformer := HTTPRIOENTransformer as ENTransformerControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransformer.Cells[0,sgENTransformer.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Силовий трансформатор) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransformer.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransformerShow.actInsertExecute(Sender: TObject);
Var TempENTransformer: ENTransformerControllerSoapPort;
begin
  TempENTransformer := HTTPRIOENTransformer as ENTransformerControllerSoapPort;
  ENTransformerObj:=ENTransformer.Create;

   ENTransformerObj.nominalPower:= TXSDecimal.Create;


  try
    frmENTransformerEdit:=TfrmENTransformerEdit.Create(Application, dsInsert);
    try
      if frmENTransformerEdit.ShowModal = mrOk then
      begin
        if ENTransformerObj<>nil then
            //TempENTransformer.add(ENTransformerObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransformerEdit.Free;
      frmENTransformerEdit:=nil;
    end;
  finally
    ENTransformerObj.Free;
  end;
end;

procedure TfrmENTransformerShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransformerShow.actFilterExecute(Sender: TObject);
begin
  frmENTransformerFilterEdit := TfrmENTransformerFilterEdit.Create(Application, dsEdit);
  try
    ENTransformerFilterObj := ENTransformerFilter.Create;
    SetNullIntProps(ENTransformerFilterObj);
    SetNullXSProps(ENTransformerFilterObj);

    if frmENTransformerFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTransformerFilter.Create;
      FilterObject := ENTransformerFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransformerFilterEdit.Free;
    frmENTransformerFilterEdit := nil;
  end;
end;

procedure TfrmENTransformerShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENTransformerShow.sgENTransformerMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crArrow;
end;

end.